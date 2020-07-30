#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>

#include "controller/config/owdin_config.hpp"
#include "controller/device/owdin_device.hpp"
#include "controller/logging/owdin_logging.hpp"

#include "models/account_index/account_index.hpp"
#include "models/device_index/version_index.hpp"
#include "models/economy_index/currency_index.hpp"
#include "models/resource_index/amount_index.hpp"
#include "models/resource_index/pool_index.hpp"
#include "models/resource_index/pricing_index.hpp"
#include "models/resource_index/stake_index.hpp"
#include "models/resource_index/total_index.hpp"

#include "define.hpp"

using namespace owdin;
using namespace eosio;
using namespace std;

namespace owdin {
    class owdinnetwork : public contract {
        private:
            using contract::contract;

            owdin_config  config_controller;
            owdin_logging logging_controller;
            owdin_device  device_controller;
        public:
            owdinnetwork( account_name self ) : contract( self )
            , config_controller( _self )
            , logging_controller( _self )
            , device_controller( _self ) { };

            //@abi action
            void debug( account_name account );

            //@abi action
            void create( asset maximum_supply );
            //@abi action
            void issue( asset quantity, string memo );
            //@abi action
            void transfer( account_name from, account_name to, asset quantity, string memo );
            //@abi action
            void reward( account_name account, asset quantity, string memo );
            //@abi action
            void burn( account_name account, asset quantity, string memo );

            inline asset get_supply( symbol_name sym )const;
            inline asset get_balance( account_name owner, symbol_name sym )const;

        private:
            typedef multi_index<N(accounts), account> accounts;
            typedef multi_index<N(stat), currency> stats;

            typedef multi_index<N(pool), pool> poolIndex;
            typedef multi_index<N(pricing), pricing> pricingIndex;

            typedef multi_index<N(stake), stake> stakeIndex;
            typedef multi_index<N(amount), amount> amountIndex;
            typedef multi_index<N(total), total> totalIndex;
            typedef multi_index<N(version), version> versionIndex;

            void auth( account_name account );
            void sub_balance( account_name owner, asset value );
            void add_balance( account_name owner, asset value, account_name ram_payer );
            void add_total_volume( uint8_t resource, uint64_t volume, uint64_t u_volume );

            uint64_t get_cap( uint8_t resource, asset quantity );
            uint64_t get_resource( uint8_t resource );
            void add_total_staking( uint8_t resource, uint64_t staking );
            void addstake( account_name from, account_name to, uint8_t resource, uint64_t staking, asset balance );
            void addamount( account_name account, uint8_t resource, uint64_t staking, asset balance );
            void subamount( account_name account, uint8_t resource, asset balance, uint64_t staking );

        public:
            //@abi action
            void signup( account_name account, string pubkey, string uidx, string idx, uint64_t bandwidth, uint64_t memory, uint64_t cpu, uint64_t disk, uint8_t networktype, uint8_t usertype ) {
                require_auth( account );
                device_controller.signup( account, pubkey, uidx, idx, bandwidth, cpu, memory, disk, networktype, usertype );
            }
            //@abi action
            void reset( account_name account, string pubkey, string uidx, string idx, uint64_t bandwidth, uint64_t memory, uint64_t cpu, uint64_t disk, uint8_t networktype, uint8_t usertype ) {
                require_auth( account );
                device_controller.reset_account( account, pubkey, uidx, idx, bandwidth, cpu, memory, disk, networktype, usertype );
            }
            //@abi action
            void activate( account_name account, bool isactive ) {
                require_auth( account );
                device_controller.change_activate( account, isactive );
            }

            //@abi action
            void set( account_name account, string playbook, string playhash, uint8_t object_type );
            //@abi action
            void remove( account_name account );
            //@abi action
            void initial( account_name account );
            //@abi action
            void clear( account_name account, uint8_t object_type );
            //@abi action
            void update( account_name account, uint8_t object_type, string stat );

            //@abi action
            void logging( account_name account, uint64_t cpu, uint64_t memory, uint64_t disk, uint64_t bandwidth, uint64_t fsused, uint16_t statuscode, string status, string message );

            //@abi action
            void regpool( account_name account, uint8_t resource, uint64_t volume );
            //@abi action
            void staking( account_name from, account_name to, uint8_t resource, asset quantity );
            //@abi action
            void unstaking( account_name from, account_name to, uint64_t key, uint8_t resource );
            //@abi action
            void price( uint8_t resource, asset price );

            //@abi action
            void upgrade( uint8_t type, uint64_t version, string url, string hash );
    };
}
