#pragma once

#include "owdinnetwork.hpp"

namespace owdin {
    uint64_t owdinnetwork::get_resource( uint8_t resource ) {
        totalIndex totalresource( _self, resource );
        auto itr = totalresource.find( resource );

        eosio_assert( itr != totalresource.end(), "resource tag mismatch" );

        return itr->t_volume;
    }

    uint64_t owdinnetwork::get_cap( uint8_t resource, asset quantity ) {
        pricingIndex pricetable( _self, _self );

        auto itr = pricetable.find( resource );
        eosio_assert( itr != pricetable.end(), "resource tag mismatch" );

        uint64_t cap = quantity.amount / itr->price.amount;

        return cap * itr->volume;
    }

    void owdinnetwork::staking( account_name from, account_name to, uint8_t resource, asset quantity ) {
        require_auth( from );

        auto sym = quantity.symbol.name();
        stats statstable( _self, sym );
        const auto& st = statstable.get( sym );

        accounts accountindex( _self, from );
        auto owner = accountindex.find( sym );

        eosio_assert( owner->balance >= quantity, "quantity exceeds available supply" );
        eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );

        uint64_t cap = get_cap( resource, quantity );
        uint64_t rsrc = get_resource( resource );
        eosio_assert( cap < rsrc, "not enough resource" );

        addstake( from, to, resource, cap, quantity );
        addamount( to, resource, cap, quantity );
        add_total_staking( resource, cap );
        sub_balance( from, quantity );
    }

    void owdinnetwork::addstake( account_name from, account_name to, uint8_t resource, uint64_t staking, asset balance ) {
        time current_time = now();

        stakeIndex stake( _self, to );

        stake.emplace( _self, [&]( auto& s ) {
            s.key = stake.available_primary_key();
            s.from = from;
            s.to = to;
            s.resource = resource;
            s.balance = balance;
            s.volume = staking;
            s.created = current_time;
        });
    }

    void owdinnetwork::addamount( account_name account, uint8_t resource, uint64_t staking, asset balance ) {
        amountIndex amount( _self, account );
        auto itr = amount.find( resource );

        time current_time = now();

        if ( itr != amount.end() ) {
            amount.modify( itr, _self, [&]( auto& s ) {
                s.staking += staking;
                s.balance += balance;
                s.updated = current_time;
            });
        } else {
            amount.emplace( _self, [&]( auto& s ) {
                s.account = account;
                s.resource = resource;
                s.staking = staking;
                s.balance = balance;
                s.updated = current_time;
            });
        }
    }

    void owdinnetwork::add_total_staking( uint8_t resource, uint64_t staking ) {
        totalIndex totalresource( _self, resource );
        auto itr = totalresource.find( resource );

        if ( itr != totalresource.end() ) {
            totalresource.modify( itr, _self, [&]( auto& s ) {
                s.t_staking += staking;
            });
        } else {
            totalresource.emplace( _self, [&]( auto& s ) {
                s.t_resource = resource;
                s.t_staking = staking;
            });
        }
    }

}
