#pragma once

#include "models/device_index/device_index.hpp"

using namespace std;
using namespace eosio;

namespace owdin {
    class owdin_device {
        private:
            account_name self;

        public:
            owdin_device( account_name _self ): self( _self ) { };

            void signup( account_name account, string pubkey, string uidx, string idx, uint64_t bandwidth, uint64_t cpu, uint64_t memory, uint64_t disk, uint8_t networktype, uint8_t usertype ) {
                time current_time = now();

                deviceIndex dix( self, account );

                dix.emplace( self, [&]( auto& s ) {
                    s.account = account;
                    s.uidx = uidx;
                    s.pubkey = pubkey;
                    s.idx = idx;
                    s.bandwidth = bandwidth;
                    s.memory = memory;
                    s.cpu = cpu;
                    s.disk = disk;
                    s.networktype = networktype;
                    s.usertype = usertype;
                    s.isactive = true;
                    s.created = current_time;
                    s.updated = current_time;
                });
            }

            void reset_account( account_name account, string pubkey, string uidx, string idx, uint64_t bandwidth, uint64_t cpu, uint64_t memory, uint64_t disk, uint8_t networktype, uint8_t usertype ) {
                time current_time = now();
                
                deviceIndex dix( self, account );

                auto itr = dix.find( account );
                eosio_assert( itr != dix.end(), "can not found account" );

                dix.modify( itr, self, [&]( auto& s ) {
                    s.uidx = uidx;
                    s.pubkey = pubkey;
                    s.idx = idx;
                    s.bandwidth = bandwidth;
                    s.memory = memory;
                    s.cpu = cpu;
                    s.disk = disk;
                    s.networktype = networktype;
                    s.usertype = usertype;
                    s.isactive = true;
                    s.updated = current_time;
                });
            }

            void change_activate( account_name account, bool isactive ) {
                time current_time = now();
                
                deviceIndex dix( self, account );

                auto itr = dix.find( account );
                eosio_assert( itr != dix.end(), "can not found account" );

                dix.modify( itr, self, [&]( auto& s ) {
                    s.isactive = isactive;
                    s.updated = current_time;
                });
            }

    };
}