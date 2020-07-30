#pragma once

#include "owdinnetwork.hpp"

namespace owdin {
    void owdinnetwork::unstaking( account_name from, account_name to, uint64_t key, uint8_t resource ) {
        require_auth( from );

        stakeIndex stake( _self, to );
        auto itr = stake.find( key );
        eosio_assert( itr != stake.end(), "stake index key mismatch");
        
        subamount( to, itr->resource, itr->balance, itr->volume );
        add_balance( to, itr->balance, from );
        stake.erase( itr );
    }

    void owdinnetwork::subamount( account_name account, uint8_t resource, asset balance, uint64_t staking ) {
        amountIndex amount( _self, account );
        auto itr = amount.find( resource );

        time current_time = now();

        eosio_assert( itr != amount.end(), "quantity exceeds available supply" );

        amount.modify( itr, _self, [&]( auto& s ) {
            s.staking -= staking;
            s.balance -= balance;
            s.updated = current_time;
        });
    }
}
