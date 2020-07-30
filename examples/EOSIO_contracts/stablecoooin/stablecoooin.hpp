/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <string>

using namespace eosio;
using std::string;

CONTRACT stablecoooin : public contract {
public:
      using contract::contract;
      ACTION create( name issuer, asset maximum_supply );
      ACTION issue( name to, asset quantity, string memo );
      ACTION transfer( name from, name to, asset quantity, string memo );
      ACTION burn( asset quantity, string memo );
      ACTION pause();
      ACTION unpause();
      ACTION blacklist( name account, string memo );
      ACTION unblacklist( name account );

      static asset get_supply( name token_contract_account,  symbol_code sym ) {
            stats statstable( token_contract_account, sym.raw() );
            const auto& st = statstable.get( sym.raw() );
            return st.supply;
      }

      static asset get_balance( name token_contract_account,  name owner, symbol_code sym ) {
            accounts accountstable( token_contract_account, owner.value );
            const auto& ac = accountstable.get( sym.raw() );
            return ac.balance;
      }

private:
      TABLE account {
            asset       balance;
            uint64_t primary_key()const { return balance.symbol.code().raw(); }
      };

      TABLE currency_stats {
            asset       supply;
            asset       max_supply;
            name        issuer;
            uint64_t primary_key()const { return supply.symbol.code().raw(); }
      };

      TABLE blacklist_table {
            name      account;
            auto primary_key() const {  return account.value;  }
      };

      TABLE pause_table {
            uint64_t            id;
            bool                paused;
            auto primary_key() const {  return id;  }
      };

      typedef eosio::multi_index< "accounts"_n, account > accounts;
      typedef eosio::multi_index< "stat"_n, currency_stats > stats;
      typedef eosio::multi_index< "blacklists"_n, blacklist_table > blacklists;
      typedef eosio::multi_index< "pausetable"_n, pause_table > pausetable;

      void sub_balance( name owner, asset value );
      void add_balance( name owner, asset value, name ram_payer );
      bool is_paused();

};
