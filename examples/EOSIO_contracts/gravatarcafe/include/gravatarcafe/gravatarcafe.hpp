/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once

#include <eosiolib/eosio.hpp>
#include <string>

namespace eosio {

   using std::string;

   class gravatarcafe : public contract {
      public:
       gravatarcafe( account_name self ) : contract(self) {}

         void addgravatar( const account_name account_name,
                           const string display_name,
                           const string image_url,
                           const string telegram    );

         void rmvgravatar( const account_name account_name);

      private:
         struct gravatar {
            account_name account_name;
            string       display_name;
            string       image_url;
            string       telegram;

            uint64_t primary_key()const { return account_name; }
         };

         typedef eosio::multi_index<N(gravatars), gravatar> gravatars;
   };
} /// namespace eosio
