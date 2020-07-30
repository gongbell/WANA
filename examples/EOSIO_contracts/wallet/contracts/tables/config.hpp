#pragma once

#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>

using namespace eosio;

/// @abi table configs
struct config
{
    account_name executor;
    extended_symbol token;

    uint64_t system_monthly_limit = 0;
    uint64_t system_limit_used = 0;
    uint32_t last_spend_time = 0;
};