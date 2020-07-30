/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosiolib/eosio.hpp>
#include <eosiolib/symbol.hpp>

using namespace eosio;

struct lockup {
    uint64_t symbol;
    uint8_t locked = 0;
    uint64_t unlock_delay = 0;
    uint64_t unlock_time = 0;

    uint64_t primary_key() const { return symbol; }

    EOSLIB_SERIALIZE(lockup, (symbol)(locked)(unlock_delay)(unlock_time))
};

typedef multi_index<N(lockup), lockup> lockup_table;
