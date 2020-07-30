#pragma once

#include <eosiolib/eosio.hpp>

#include <string>

using namespace std;
using namespace eosio;

/// @abi table expenses
struct expense
{
    uint64_t id;
    uint64_t department_id;
    uint64_t expenditure_id;
    uint32_t time;
    uint64_t amount;
    string memo;

    auto primary_key() const
    {
        return id;
    }
};