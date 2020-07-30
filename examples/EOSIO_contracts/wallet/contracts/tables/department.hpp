#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>

#include <string>

using namespace std;
using namespace eosio;

/// @abi table departments
struct department
{
    uint64_t id;
    string name;
    account_name manager;
    bool enabled = true;
    uint64_t monthly_allowance = 0;
    uint64_t allowance_allocated = 0;

    uint32_t last_spend_time = 0;
    uint64_t allowance_used = 0;

    auto primary_key() const
    {
        return id;
    }
};