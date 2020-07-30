#pragma once

using namespace std;

//@abi table usaged i64
struct usaged {
    account_name account;      // device own user
    uint64_t     cpu;          // cpu usage
    uint64_t     memory;       // memory usage
    uint64_t     disk;         // disk usage
    uint64_t     bandwidth;    // network bandwidth usage
    uint64_t     fsused;       // file system usage
    uint16_t     statuscode;   // device status code
    string       status;       // device status
    string       message;      // transaction memo
    time         created;      // create time
    time         updated;      // updated time

    uint64_t primary_key() const { return account; }

    EOSLIB_SERIALIZE( usaged, (account)(cpu)(memory)(disk)(bandwidth)(fsused)(statuscode)(status)(message)(created)(updated) )
};

typedef eosio::multi_index<N(usaged), usaged> usagedIndex;

//@abi table log i64
struct log {
    uint64_t     key;
    account_name account;      // device own user
    uint64_t     cpu;          // cpu usage
    uint64_t     memory;       // memory usage
    uint64_t     disk;         // disk usage
    uint64_t     bandwidth;    // network bandwidth usage
    uint64_t     fsused;       // file system usage
    uint16_t     statuscode;   // device status code
    string       status;       // device status
    string       message;      // transaction memo
    time         created;      // create time

    uint64_t primary_key() const { return key; }
    //uint64_t primary_key() const { return account; }

    EOSLIB_SERIALIZE( log, (key)(account)(cpu)(memory)(disk)(bandwidth)(fsused)(statuscode)(status)(message)(created) )
};

typedef eosio::multi_index<N(log), log> logIndex;
