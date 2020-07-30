#pragma once

using namespace eosio;

namespace owdin {
    //@abi table total i64
    struct total {
        uint8_t  t_resource; // resource index
        asset    t_amount;   // total staking token
        uint64_t t_staking;  // total staking resource volume
        uint64_t t_volume;   // total capacity resource volume

        uint8_t primary_key()const { return t_resource; }
        
        EOSLIB_SERIALIZE( total, (t_resource)(t_amount)(t_staking)(t_volume) )
    };
}
