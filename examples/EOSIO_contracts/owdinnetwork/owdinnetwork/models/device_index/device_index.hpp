#pragma once

using namespace std;
using namespace eosio;

namespace owdin {
    //@abi table device i64
    struct device {
        account_name account;      // eos account name
        string       uidx;         // unique device number
        string       pubkey;       // user public key ( encrypt owdin public key )
        string       idx;          // unique user index ( encrypt public ip address )
        uint128_t    bandwidth;    // network bandwidth ( user select data )
        uint128_t    cpu;          // device cpu speed
        uint128_t    memory;       // device memory size
        uint128_t    disk;         // device disk size
        uint8_t      networktype;  // device network type ( NAT or Public )
        uint8_t      usertype;     // user type ( public user or enterprise user )
        bool         isactive;     // activated user
        time         created;      // create time
        time         updated;      // update time

        uint64_t primary_key() const { return account; }

        EOSLIB_SERIALIZE( device, (account)(uidx)(pubkey)(idx)(bandwidth)(cpu)(memory)(disk)(networktype)(usertype)(isactive)(created)(updated) )
    };

    typedef multi_index<N(device), device> deviceIndex;
}


