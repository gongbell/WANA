#pragma once

using namespace std;
using namespace eosio;

namespace owdin {
    //@abi table version i64
    struct version {
        account_name account; // index key
        uint8_t      type;    // process type
        uint64_t     ver;     // device version
        string       url;     // download url
        string       hash;    // upgrade binary's hash
        time         updated; // update time

        uint8_t primary_key() const { return type; }

        EOSLIB_SERIALIZE( version, (account)(type)(ver)(url)(hash)(updated) )
    };

    typedef multi_index<N(version), version> versionIndex;
}


