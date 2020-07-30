/**
 *  
 *  Created By @yashbhavsar007
 */
#pragma once
 
#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>

#include <string>

namespace eosiosystem {
   class system_contract;
}

namespace eosio {

   using std::string;

   class token : public contract {
      public:
         // declaring methods which is defined in tokentime.cpp
         token( account_name self ):contract(self){}

         void create( account_name issuer,
                      asset        maximum_supply);

         void issue( account_name to, asset quantity, string memo );

         void transfer( account_name from,
                        account_name to,
                        asset        quantity,
                        string       memo );
      
         void validate( account_name name,account_name to);
         inline asset get_supply( symbol_name sym )const;
         
         inline asset get_balance( account_name owner, symbol_name sym )const;

      private:
         // declaring structures to be used in tokentime.cpp
         // @abi table accounts i64
         struct account {
            asset    balance;

            uint64_t primary_key()const { return balance.symbol.name(); }
         };
         /// @abi table userstats i64
         struct userstats{
               account_name account;
               uint32_t time_limit;
               
               uintmax_t primary_key() const { return account; }
               EOSLIB_SERIALIZE( userstats , (account) (time_limit) );

         };

          // @abi table stat i64
         struct cstats {
            asset          supply;
            asset          max_supply;
            account_name   issuer;

            uint64_t primary_key()const { return supply.symbol.name(); }
         };
 
         typedef eosio::multi_index<N(accounts), account> accounts;
         typedef eosio::multi_index<N(stat), cstats> stats;
         typedef eosio::multi_index<N(userstats), userstats> usertable;


         void sub_balance( account_name owner, asset value );
         void add_balance( account_name owner, asset value, account_name ram_payer );

      public:
         struct transfer_args {
            account_name  from;
            account_name  to;
            asset         quantity;
            string        memo;
         };
   };

   asset token::get_supply( symbol_name sym )const
   {
      stats statstable( _self, sym );
      const auto& st = statstable.get( sym );
      return st.supply;
   }

   asset token::get_balance( account_name owner, symbol_name sym )const
   {
      accounts accountstable( _self, owner );
      const auto& ac = accountstable.get( sym );
      return ac.balance;
   }

} /// namespace eosio
