#pragma once

#include "owdinnetwork.hpp"

namespace owdin {
    void owdinnetwork::regpool( account_name account, uint8_t resource, uint64_t volume ) {
        require_auth( account );

        time current_time = now();

        poolIndex resourcepool( _self, resource );
        auto itr = resourcepool.find( account );

        if ( itr != resourcepool.end() ) {
            add_total_volume( resource, volume, itr->shared );

            resourcepool.modify( itr, _self, [&]( auto& s ) {
                s.shared = volume;
                s.updated = current_time;
            });
        } else {
            add_total_volume( resource, volume, 0);

            resourcepool.emplace( _self, [&]( auto& s ) {
                s.account = account;
                s.shared = volume;
                s.updated = current_time;
            });
        }
    }

    void owdinnetwork::add_total_volume( uint8_t resource, uint64_t volume, uint64_t u_volume ) {
        volume -= u_volume;

        totalIndex totalresource( _self, resource );
        auto itr = totalresource.find( resource );

        if ( itr != totalresource.end() ) {
            totalresource.modify( itr, _self, [&]( auto& s ) {
                s.t_volume += volume;
            });
        } else {
            totalresource.emplace( _self, [&]( auto& s ) {
                s.t_resource = resource;
                s.t_volume = volume;
            });
        }
    }
}
