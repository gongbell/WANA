#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>

#include <string>

namespace ebt {

   using namespace eosio;
   using std::string;

   class eos_button : public contract {

      //Standard token members - Start

      public:
         eos_button( account_name self ):contract(self){}

/*
         //@abi action
         void create( account_name issuer,
                      asset        maximum_supply);

         //@abi action
         void issue( account_name to, asset quantity, string memo );

         //@abi action
         void transfer( account_name from,
                        account_name to,
                        asset        quantity,
                        string       memo );
      
      
         inline asset get_supply( symbol_name sym )const;
         
         inline asset get_balance( account_name owner, symbol_name sym )const;
*/

      private:
         //@abi table accounts i64
         struct account {
            asset    balance;

            uint64_t primary_key()const { return balance.symbol.name(); }
         };

         //@abi table stat i64
         struct cur_stats { //The struct name is edited, so that abi can be generated
            asset          supply;
            asset          max_supply;
            account_name   issuer;

            uint64_t primary_key()const { return supply.symbol.name(); }
         };

         typedef eosio::multi_index<N(accounts), account> accounts;
         typedef eosio::multi_index<N(stat), cur_stats> stats;

         void sub_balance( account_name owner, asset value );
         void add_balance( account_name owner, asset value, account_name ram_payer );

/*
      public:
         struct transfer_args {
            account_name  from;
            account_name  to;
            asset         quantity;
            string        memo;
         };
*/

      //Standard token members - End

      //Game members - Start

      public:
         //Note that all shares are 10000 times larger. i.e. "10000 shares" means 1 actual share.
         /*
      "ricardian_contract": "The intent of this action is to press the game button. The rule of the game is described on https://eosbutton.io."
         */
         //@abi action
         void ebtpress( account_name account, asset quantity, bool protection, account_name referrer);
         /*
      "ricardian_contract": "The intent of this action is to press the game button. The rule of the game is described on https://eosbutton.io."
         */
         /*
         //@abi action
         void eospress( account_name account, asset quantity, bool protection, account_name referrer);
         */

      private:
         template <typename games_table_type, typename players_table_type>
         void handle_press( account_name account, asset quantity, bool protection, account_name referrer);

         //Note that all shares are 10000 times larger. i.e. "10000 shares" means 1 actual share.
         //@abi table ebtgames i64
         struct ebtgame {
            uint64_t id;
            uint64_t round;
            uint64_t last_full_press_shares;
            uint64_t shares;
            uint64_t total_shares;
            asset pot;
            asset final_prize; //Currently unused. Final prize is currently calculated in a different way.
            asset token_reserved_for_next_round;
            asset dev_fee;
            account_name last_full_press_player;
            time start_time;
            time last_full_press_time;
            time last_full_press_remaining_time;

            uint64_t primary_key()const { return id; }

            EOSLIB_SERIALIZE( ebtgame, 
              (id)
              (round)
              (last_full_press_shares)
              (shares)
              (total_shares)
              (pot)
              (final_prize)
              (token_reserved_for_next_round)
              (dev_fee)
              (last_full_press_player)
              (start_time)
              (last_full_press_time)
              (last_full_press_remaining_time)
            )
         };

         //@abi table eosgames i64
         struct eosgame {
            uint64_t id;
            uint64_t round;
            uint64_t last_full_press_shares;
            uint64_t shares;
            uint64_t total_shares;
            asset pot;
            asset final_prize; //Currently unused. Final prize is currently calculated in a different way.
            asset token_reserved_for_next_round;
            asset dev_fee;
            account_name last_full_press_player;
            time start_time;
            time last_full_press_time;
            time last_full_press_remaining_time;

            uint64_t primary_key()const { return id; }

            EOSLIB_SERIALIZE( eosgame, 
              (id)
              (round)
              (last_full_press_shares)
              (shares)
              (total_shares)
              (pot)
              (final_prize)
              (token_reserved_for_next_round)
              (dev_fee)
              (last_full_press_player)
              (start_time)
              (last_full_press_time)
              (last_full_press_remaining_time)
            )
         };

         //@abi table ebtplayers i64
         struct ebtplayer {
            account_name account;
            uint64_t shares;
            uint64_t last_press_shares;
            //Save last press info.
                //0: No info
                //1: Not started
                //2: First press of a round
                //3: Normal press
                //4: Protected
            uint64_t last_press_info;
            time last_press_remaining_time;

            uint64_t primary_key()const { return account; }

            EOSLIB_SERIALIZE( ebtplayer, 
              (account)
              (shares)
              (last_press_shares)
              (last_press_info)
              (last_press_remaining_time)
            )
         };

         //@abi table eosplayers i64
         struct eosplayer {
            account_name account;
            uint64_t shares;
            uint64_t last_press_shares;
            //Save last press info.
                //0: No info
                //1: Not started
                //2: First press of a round
                //3: Normal press
                //4: Protected
            uint64_t last_press_info;
            time last_press_remaining_time;

            uint64_t primary_key()const { return account; }

            EOSLIB_SERIALIZE( eosplayer, 
              (account)
              (shares)
              (last_press_shares)
              (last_press_info)
              (last_press_remaining_time)
            )
         };

         typedef eosio::multi_index<N(ebtgames), ebtgame> ebtgames;
         typedef eosio::multi_index<N(eosgames), eosgame> eosgames;
         typedef eosio::multi_index<N(ebtplayers), ebtplayer> ebtplayers;
         typedef eosio::multi_index<N(eosplayers), eosplayer> eosplayers;

      //Game members - End

      //Asset management members - Start

      public:
         /*
         //@abi action
         void withdraw( account_name account, asset quantity );
         */

         /*
      "ricardian_contract": "The intent of this action is to claim EBT airdrop."
         */
         //@abi action
         void claimad( account_name account );

         //Deposit (triggered by transfer action from eosio.token)
         void deposit();

      private:
/*
         //Custom issue
         void cissue( account_name to, asset quantity, string memo );
         //Custom transfer
         void ctransfer( account_name from, account_name to, asset quantity, string memo, account_name ram_payer );
*/
         //Minimized custom transfer
         void mtransfer( account_name from, account_name to, asset quantity, account_name ram_payer );
         //Custom sub_balance
         void c_sub_balance( account_name owner, asset value );
         //Custom add_balance
         void c_add_balance( account_name owner, asset value, account_name ram_payer );

         //eosio.token transfer
         struct eosio_token_transfer {
             account_name from;
             account_name to;
             asset quantity;
             string memo;

             EOSLIB_SERIALIZE( eosio_token_transfer, (from)(to)(quantity)(memo) )
         };

         //@abi table accstates i64
         struct accstate {
            account_name account;
            time last_airdrop_claim_time;
            asset eos_balance;

            uint64_t primary_key()const { return account; }

            EOSLIB_SERIALIZE( accstate, 
              (account)
              (last_airdrop_claim_time)
              (eos_balance)
            )
         };

         typedef eosio::multi_index<N(accstates), accstate> accstates;

      //Asset management members - End

      //System management members - Start
/*
      public:
         //@abi action
         void configsystem( asset airdrop_available, asset airdrop_claim_quantity, time airdrop_claim_interval, time airdrop_start_time, time airdrop_end_time, uint64_t ebtgame_command, uint64_t eosgame_command );

         //@abi action
         void withdrawdf( account_name to );
*/

/*
      private:
         //@abi table systemstates i64
         struct systemstate {
            uint64_t id;
            asset airdrop_available;
            asset airdrop_claim_quantity;
            time airdrop_claim_interval;
            time airdrop_start_time;
            time airdrop_end_time;
            //Commands to the games.
                //0: No command
                //1: Pause after the current round is finished
                //2: Set next round number to 1
            uint64_t ebtgame_command;
            uint64_t eosgame_command;

            uint64_t primary_key()const { return id; }

            EOSLIB_SERIALIZE( systemstate, 
              (id)
              (airdrop_available)
              (airdrop_claim_quantity)
              (airdrop_claim_interval)
              (airdrop_start_time)
              (airdrop_end_time)
              (ebtgame_command)
              (eosgame_command)
            )
         };

         typedef eosio::multi_index<N(systemstates), systemstate> systemstates;
*/

      //System management members - End

      //Safe math - Start

      private:
         uint64_t s_add( uint64_t a, uint64_t b );
         uint64_t s_sub( uint64_t a, uint64_t b );
         uint64_t s_mul( uint64_t a, uint64_t b );
         uint64_t s_div( uint64_t a, uint64_t b );

      //Safe math - End
   };

   //Standard token getters - Start

   /*
   asset eos_button::get_supply( symbol_name sym )const
   {
      stats statstable( _self, sym );
      const auto& st = statstable.get( sym );
      return st.supply;
   }

   asset eos_button::get_balance( account_name owner, symbol_name sym )const
   {
      accounts accountstable( _self, owner );
      const auto& ac = accountstable.get( sym );
      return ac.balance;
   }
   */

   //Standard token getters - End

}
