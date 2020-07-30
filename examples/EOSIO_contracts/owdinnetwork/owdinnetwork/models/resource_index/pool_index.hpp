#pragma once

using namespace eosio;

namespace owdin {
    //@abi table pool i64
    struct pool {
        account_name account;  // resource account
        uint64_t     shared;   // shared size
        time         updated;  // last update time

        uint64_t primary_key()const { return account; }

        EOSLIB_SERIALIZE( pool, (account)(shared)(updated) )
    };
}
