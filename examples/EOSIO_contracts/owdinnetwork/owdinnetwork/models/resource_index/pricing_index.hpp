#pragma once

using namespace eosio;

namespace owdin {
    //@abi table pricing i64
    struct pricing {
        uint8_t  resource; // resource type
        asset    price;    // resource price
        uint64_t volume;   // resource volume per price
        time     updated;  // last update time

        uint8_t primary_key()const { return resource; }

        EOSLIB_SERIALIZE( pricing, (resource)(price)(updated) )
    };
}
