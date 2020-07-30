#pragma once

using namespace std;
using namespace eosio;

namespace owdin {
    //@abi table stat i64
    struct currency {
        asset        supply;
        asset        max_supply;
        account_name issuer;

        uint64_t primary_key()const { return supply.symbol.name(); }
    };
}
