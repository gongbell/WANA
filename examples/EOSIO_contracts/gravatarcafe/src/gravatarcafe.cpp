/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */

#include "gravatarcafe.hpp"

namespace eosio {

void gravatarcafe::addgravatar( const account_name account_name,
                            const string display_name,
                            const string image_url,
                            const string telegram )
{
    // Ensure authorized to change gravatar of account provided
    require_auth( account_name );

    eosio_assert( image_url.size() > 0,    "Image URL must not be empty" );
    eosio_assert( image_url.size() < 128,  "Image URL must be shorter than 128 characters" );
    eosio_assert( display_name.size() < 32, "Custom name must be shorter than 32 characters" );
    eosio_assert( telegram.size() < 128,   "Telegram link must be shorter than 128 characters" );

    // Initialize table and find user's gravatar
    gravatars gravatars_table( _self, _self );
    auto existing = gravatars_table.find( account_name );


    if (existing == gravatars_table.end()) {
        // Gravatar does not exist, create it
        gravatars_table.emplace( account_name, [&]( auto& g ) {
            g.account_name = account_name;
            g.display_name = display_name;
            g.image_url = image_url;
            g.telegram = telegram;
        });
    } else {
        // If account already exists, overwrite it
        gravatars_table.modify( existing, account_name, [&]( auto& g ) {
            g.account_name = account_name;
            g.display_name = display_name;
            g.image_url = image_url;
            g.telegram = telegram;
        });
    }
}

void gravatarcafe::rmvgravatar( const account_name account_name )
{
    // Ensure authorized to change gravatar of account provided
    require_auth( account_name );

    // Initialize table and find user's gravatar
    gravatars gravatars_table( _self, _self );
    auto existing = gravatars_table.find( account_name );

    eosio_assert(existing != gravatars_table.end(), "Gravatar does not exist for this user");

    // Gravatar exists, delete it
    gravatars_table.erase( existing );
}


} /// namespace eosio

EOSIO_ABI( eosio::gravatarcafe, (addgravatar)(rmvgravatar) )
