#pragma once

using namespace eosio;

namespace owdin {
    //@abi table accounts i64
    struct account {
        asset balance;

        uint64_t primary_key()const { return balance.symbol.name(); }
    };
}