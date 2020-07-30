#pragma once

using namespace std;
using namespace eosio;

namespace owdin {
    //@abi table configs i64
    struct configs {
        account_name owner;
        account_name ipfs_receiver;
        account_name proc_receiver;
        account_name sys_receiver;
        account_name net_receiver;
        account_name sec_receiver;
        string       ipfs_conf;
        string       proc_conf;
        string       sys_conf;
        string       net_conf;
        string       sec_conf;
        string       ipfs_hash;
        string       proc_hash;
        string       sys_hash;
        string       net_hash;
        string       sec_hash;
        string       ipfs_status;
        string       proc_status;
        string       sys_status;
        string       net_status;
        string       sec_status;
        time         ipfs_update;
        time         proc_update;
        time         sys_update;
        time         net_update;
        time         sec_update;
        time         created;

        uint64_t primary_key() const {
            return owner;
        }

        EOSLIB_SERIALIZE( configs,
            (owner)
            (ipfs_receiver)
            (proc_receiver)
            (sys_receiver)
            (net_receiver)
            (sec_receiver)
            (ipfs_conf)
            (proc_conf)
            (sys_conf)
            (net_conf)
            (sec_conf)
            (ipfs_hash)
            (proc_hash)
            (sys_hash)
            (net_hash)
            (sec_hash)
            (ipfs_status)
            (proc_status)
            (sys_status)
            (net_status)
            (sec_status)
            (ipfs_update)
            (proc_update)
            (sys_update)
            (net_update)
            (sec_update)
            (created)
        )
    };

    typedef multi_index<N(configs), configs> configsIndex;
}
