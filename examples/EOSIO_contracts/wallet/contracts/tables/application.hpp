#pragma once

#include <eosiolib/eosio.hpp>

using namespace eosio;

/// @abi table applications
struct application
{
    uint64_t application_id;
    uint64_t department_id;
    uint64_t from_allowance;
    uint64_t to_allowance;
    uint8_t status;

    auto primary_key() const
    {
        return application_id;
    }
};