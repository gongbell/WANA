#include <mutual_credit_clearing.hpp>

void mutual_credit_clearing::create(account_name issuer, asset min_balance) {
    require_auth(_self); // only application can create a token

    auto sym = min_balance.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name");
    eosio_assert( min_balance.amount < 0, "minimum balance must be negative" );

    _stats stats_table( _self, sym.name() );
    auto existing = stats_table.find( sym.name() );
    eosio_assert( existing == stats_table.end(), "token with symbol already exists" );

    stats_table.emplace( _self, [&]( auto& s ) {
        s.supply.symbol = min_balance.symbol;
        s.min_balance   = min_balance;
        s.issuer        = issuer;
    });

    print("created!");
}

void mutual_credit_clearing::transfer( account_name from,
                                       account_name to,
                                       asset quantity,
                                       string memo ) {

    print( "transfer from ", name{from}, " to ", name{to}, " - MEMO: ", memo.c_str() );
    require_auth( from );

    require_recipient( from );
    require_recipient( to );

    auto sym = quantity.symbol;
    _stats stats_table( _self, sym.name() );
    const auto& st = stats_table.get( sym.name() );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must transfer positive quantity" );

    sub_balance( from, quantity, st );
    add_balance( to, quantity, st, from );

}

void mutual_credit_clearing::add_balance(account_name owner,
                                         asset value,
                                         const stats& st,
                                         account_name payer) {
    accounts to_acc(_self, owner);

    auto to = to_acc.find(value.symbol);

    if (to == to_acc.end()) {
        to_acc.emplace(payer, [&](auto& a) {
            a.balance = value;
        });
    } else {
        to_acc.modify( to, 0, [&](auto& a) {
           a.balance.amount += value.amount;
        });
    }
}

void mutual_credit_clearing::sub_balance(account_name owner,
                                         asset value,
                                         const stats& st) {
    accounts from_acc(_self, owner);

    auto from = from_acc.find(value.symbol);

    if (from == from_acc.end()) {
        eosio_assert( (value.amount * -1) >= st.min_balance.amount, "overdrawn balance - passed min balance limit" );

        from_acc.emplace(owner, [&](auto& a) {
            a.balance = value;
            a.balance.amount *= -1;
        });
    } else {

        const auto& from_row = from_acc.get( value.symbol );

        auto new_balance = from_row.balance.amount - value.amount;
        eosio_assert( new_balance >= st.min_balance.amount, "overdrawn balance - passed min balance limit" );

        from_acc.modify( from, 0, [&](auto& a) {
            a.balance.amount -= value.amount;
        });
    }
}


EOSIO_ABI(mutual_credit_clearing, (create)(transfer))