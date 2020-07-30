#include <eoscomm.hpp>

#include <eosiolib/action.hpp>
#include <string>
#include <iostream>
#include <stdio.h>
#include <sstream>

using namespace std;
using namespace eosio;

void eoscomm::apply(const account_name contract, const account_name act)
{

    if (act == N(transfer))
        {
            transferReceived(unpack_action_data<currency::transfer>(), contract);
            return;
        }

        auto &thiscontract = *this;

        switch (act)
        {
            EOSIO_API(eoscomm, (addpartner)(setconfig)(close))
        };
}

void eoscomm::transferReceived(const currency::transfer &transfer, const account_name code)
{
    if (transfer.to != _self)
    {
        return;
    }

    print("Account Name     :   ", name{code}, "\n");
    print("From             :   ", name{transfer.from}, "\n");
    print("To               :   ", name{transfer.to}, "\n");
    print("Asset            :   ", transfer.quantity, "\n");
    print("Received Amount  :   ", transfer.quantity.amount, "\n");
    print("Received Symbol  :   ", transfer.quantity.symbol, "\n");
    print("Memo             :   ", transfer.memo, "\n");

    auto total_amount = transfer.quantity.amount;

    partner_table p_t(_self, _self);
    for (auto itr = p_t.cbegin(); itr != p_t.cend(); ++itr) {
        print(name{itr->partner_acct});
        auto partner_acct = itr->partner_acct;
        asset amount_dispatched  = transfer.quantity * itr->weightx100 / 100;
        //asset comm = transfer.quantity * c_itr->comm_x100 / 10000;
        paytoken(_self, partner_acct, amount_dispatched, transfer.memo);
    }

}

void eoscomm::addpartner( const account_name partner,
                          const uint32_t weightx100)
{
    require_auth(_self);
    config_table c_t (_self, _self);
    eosio_assert(c_t.begin() != c_t.end(), "Config is not set.");
    auto itr = c_t.find(0);
    eosio_assert(itr->settled != 1, "Contract is settled");

    partner_table p_t(_self, _self);


    p_t.emplace(_self, [&](auto &l) {
        l.partner_acct = partner;
        l.weightx100 = weightx100;
        l.issued_time = now();
    });
}

void eoscomm::close()
{
    require_auth(_self);
    config_table c_t (_self, _self);

    eosio_assert(c_t.begin() != c_t.end(), "Config is not set.");
    auto itr = c_t.find(0);

    c_t.modify (itr, _self, [&](auto& c) {
      c.settled      = 1;
    });
}

void eoscomm::setconfig(const account_name _token_contract,
                        const string _symbol,
                        const uint8_t _symbol_precision)
{
    require_auth(_self);

    config_table c_t(_self, _self);
    auto itr = c_t.begin();
    if (itr != c_t.end())
    {
        c_t.erase(itr);
    }

    c_t.emplace(_self, [&](auto &c) {
        c.config_id = c_t.available_primary_key();
        c.token_contract = _token_contract;
        c.payment_symbol = string_to_symbol(_symbol_precision, _symbol.c_str());
        c.settled = 0;
    });

}


extern "C"
{
    //using namespace bay;
    using namespace eosio;

    void apply(uint64_t receiver, uint64_t code, uint64_t action)
    {
        auto self = receiver;
        eoscomm contract(self);
        if( ((code == self  && action != N(transfer) ) || (action == N(transfer)) || action == N(onerror)) ) {
            contract.apply(code, action);
        }
        eosio_exit(0);
    }
}