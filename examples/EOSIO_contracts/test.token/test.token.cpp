/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include "test.token.hpp"

namespace eosio {

void token::create( account_name issuer,
                    asset        maximum_supply )
{
    require_auth( issuer );

    auto sym = maximum_supply.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( maximum_supply.is_valid(), "invalid supply");
    eosio_assert( maximum_supply.amount > 0, "max-supply must be positive");

    TokenStats tokentable( _self, _self );
    auto existing_token = tokentable.find( sym.name() );

    eosio_assert( existing_token == tokentable.end(), "token with symbol already exists" );

    tokentable.emplace( _self, [&]( auto& token ) {
       token.supply.symbol = maximum_supply.symbol;
       token.max_supply    = maximum_supply;
       token.issuer        = issuer;
    });
}


void token::issue( account_name to, asset quantity, string memo )
{
    auto sym = quantity.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );

    //auto sym_name = sym.name();
    TokenStats tokentable( _self, _self );
    auto existing_token = tokentable.find( sym.name() );

    eosio_assert( existing_token != tokentable.end(),
                  "token with symbol does not exist, create token before issue" );
    //const auto& st = *existing_token;

    require_auth( existing_token->issuer );
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must issue positive quantity" );

    eosio_assert( quantity.symbol == existing_token->supply.symbol, "symbol precision mismatch" );
    eosio_assert( quantity.amount <= existing_token->max_supply.amount - existing_token->supply.amount,
                  "quantity exceeds available supply");

    tokentable.modify( existing_token, 0, [&]( auto& t ) {
       t.supply += quantity;
    });

    add_balance( existing_token->issuer, quantity, existing_token->issuer );

    if( to != existing_token->issuer ) {
       SEND_INLINE_ACTION( *this, transfer, {existing_token->issuer,N(active)},
                                            {existing_token->issuer, to, quantity, memo} );
    }
}

void token::transfer( account_name from,
                      account_name to,
                      asset        quantity,
                      string       memo )
{
    eosio_assert( from != to, "cannot transfer to self" );
    require_auth( from );
    eosio_assert( is_account( to ), "to account does not exist");
    //auto sym = quantity.symbol.name();

    TokenStats tokentable( _self, _self );
    const auto& token_stat = tokentable.get( quantity.symbol.name() );

    require_recipient( from );
    require_recipient( to );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
    eosio_assert( quantity.symbol == token_stat.supply.symbol, "symbol precision mismatch" );


    sub_balance( from, quantity );
    add_balance( to, quantity, from );

    print("Memo:  ", memo.c_str());
}

void token::sub_balance( account_name owner, asset value ) {
   Accounts from_accounts( _self, owner );
   const auto& from = from_accounts.get( value.symbol.name() );

   eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );

   if( from.balance.amount == value.amount ) {
      from_accounts.erase( from );  // frees the storage
   } else {
      from_accounts.modify( from, 0, [&]( auto& a ) {
          a.balance -= value;
      });
   }
}

void token::add_balance( account_name owner, asset value, account_name ram_payer )
{
   Accounts to_accounts( _self, owner );
   auto to = to_accounts.find( value.symbol.name() );

   if( to == to_accounts.end() ) {
      to_accounts.emplace( ram_payer, [&]( auto& a ){
        a.balance = value;
      });
   } else {
      to_accounts.modify( to, 0, [&]( auto& a ) {
        a.balance += value;
      });
   }
}

} /// namespace eosio

EOSIO_ABI( eosio::token, (create)(issue)(transfer) )
