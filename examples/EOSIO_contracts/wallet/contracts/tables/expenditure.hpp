#pragma once

#include <eosiolib/eosio.hpp>

#include <string>

using namespace std;
using namespace eosio;

/// @abi table expenditures
struct expenditure
{
    uint64_t id;
    string name;
    account_name recipient;
    uint64_t monthly_allowance;

    uint32_t last_spend_time = 0;
    uint64_t allowance_used = 0;

    bool removed = false;

    auto primary_key() const
    {
        return id;
    }
};