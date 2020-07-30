#pragma once

using namespace eosio;

namespace owdin {
    //@abi table stake i64
    struct stake {
        uint64_t     key;
        account_name from;
        account_name to;
        uint8_t      resource; // resource type
        asset        balance;
        uint64_t     volume;
        time         created;

        uint64_t primary_key()const { return key; }
        
        EOSLIB_SERIALIZE( stake, (key)(from)(to)(resource)(balance)(volume)(created) )
    };
}
