/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosiolib/eosio.hpp>
#include <eosiolib/symbol.hpp>

using namespace eosio;

struct delaylimit {
    uint64_t idx = 0;
    asset minimum;
    uint32_t required_delay = 0;

    uint64_t primary_key() const { return idx; }

    EOSLIB_SERIALIZE(delaylimit, (idx)(minimum)(required_delay))
};

typedef multi_index<N(delimits), delaylimit> delaylimit_table;
