#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/time.hpp>
#include <eosiolib/singleton.hpp>

using namespace std;
using namespace eosio;

class eosyield : public contract
{
  public:
    using contract::contract;

    eosyield(account_name self) : contract(self), yield(self, self) {}

    /* UPDATE AUTH ARGS */

    struct signup_public_key
    {
        uint8_t type;
        array<unsigned char, 33> data;
    };

    struct permission_level_weight
    {
        permission_level permission;
        weight_type weight;
    };

    struct key_weight
    {
        signup_public_key key;
        weight_type weight;
    };

    struct wait_weight
    {
        uint32_t wait_sec;
        weight_type weight;
    };

    struct authority
    {
        uint32_t threshold;
        vector<key_weight> keys;
        vector<permission_level_weight> accounts;
        vector<wait_weight> waits;
    };

    struct updateauth_args
    {
        account_name account;
        permission_name permission;
        permission_name parent;
        authority data;
    };

    /* UPDATE AUTH ARGS */

    /// @abi table yieldinfo
    struct yield_info
    {
        account_name owner;
        time_point_sec expiration;
    };
    typedef singleton<N(yieldinfo), yield_info> tbl_yield;
    tbl_yield yield;

    /// @abi action
[[eosio::action]]
    void setowner(account_name new_owner);
    /// @abi action
[[eosio::action]]
    void yieldcontrol(uint32_t yield_seconds);
    /// @abi action
[[eosio::action]]
    void extend(uint32_t new_yield_seconds);
    /// @abi action
[[eosio::action]]
    void regain();
};

extern "C"
{
    void apply(uint64_t receiver, uint64_t code, uint64_t action)
    {
        auto self = receiver;
        eosyield thiscontract(self);
        if (code == self)
        {
            switch (action)
            {
                EOSIO_API(eosyield, (setowner)(yieldcontrol)(extend)(regain))
            }
        }
    }
}
