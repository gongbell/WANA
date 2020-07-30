#pragma once

using namespace eosio;

namespace owdin {
    //@abi table amount i64
    struct amount {
        account_name account;
        uint8_t      resource;  // resource type
        uint64_t     staking;   // total size staking resource or bandwidth
        asset        balance;
        time         updated;   // last update time

        uint8_t primary_key()const { return resource; }

        EOSLIB_SERIALIZE( amount, (account)(resource)(staking)(balance)(updated) )
    };
}
