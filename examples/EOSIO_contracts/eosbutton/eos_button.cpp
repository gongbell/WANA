/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */

#include "eos_button.hpp"

namespace ebt {

//Standard token members - Start

/*
void eos_button::create( account_name issuer,
                    asset        maximum_supply )
{
    require_auth( _self );

    auto sym = maximum_supply.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( maximum_supply.is_valid(), "invalid supply");
    eosio_assert( maximum_supply.amount > 0, "max-supply must be positive");

    stats statstable( _self, sym.name() );
    auto existing = statstable.find( sym.name() );
    eosio_assert( existing == statstable.end(), "token with symbol already exists" );

    statstable.emplace( _self, [&]( auto& s ) {
       s.supply.symbol = maximum_supply.symbol;
       s.max_supply    = maximum_supply;
       s.issuer        = issuer;
    });
}
*/

/*
void eos_button::issue( account_name to, asset quantity, string memo )
{
    auto sym = quantity.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    auto sym_name = sym.name();
    stats statstable( _self, sym_name );
    auto existing = statstable.find( sym_name );
    eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );
    const auto& st = *existing;

    require_auth( st.issuer );
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must issue positive quantity" );

    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( quantity.amount <= st.max_supply.amount - st.supply.amount, "quantity exceeds available supply");

    statstable.modify( st, 0, [&]( auto& s ) {
       s.supply += quantity;
    });

    add_balance( st.issuer, quantity, st.issuer );

    if( to != st.issuer ) {
       SEND_INLINE_ACTION( *this, transfer, {st.issuer,N(active)}, {st.issuer, to, quantity, memo} );
    }
}
*/

/*
void eos_button::transfer( account_name from,
                      account_name to,
                      asset        quantity,
                      string       memo )
{
    eosio_assert( from != to, "cannot transfer to self" );
    require_auth( from );
    eosio_assert( is_account( to ), "to account does not exist");
    auto sym = quantity.symbol.name();
    stats statstable( _self, sym );
    const auto& st = statstable.get( sym );

    require_recipient( from );
    require_recipient( to );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );


    sub_balance( from, quantity );
    add_balance( to, quantity, from );
}

void eos_button::sub_balance( account_name owner, asset value ) {
   accounts from_acnts( _self, owner );

   const auto& from = from_acnts.get( value.symbol.name(), "no balance object found" );
   eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );


   if( from.balance.amount == value.amount ) {
      from_acnts.erase( from );
   } else {
      from_acnts.modify( from, owner, [&]( auto& a ) {
          a.balance -= value;
      });
   }
}

void eos_button::add_balance( account_name owner, asset value, account_name ram_payer )
{
   accounts to_acnts( _self, owner );
   auto to = to_acnts.find( value.symbol.name() );
   if( to == to_acnts.end() ) {
      to_acnts.emplace( ram_payer, [&]( auto& a ){
        a.balance = value;
      });
   } else {
      to_acnts.modify( to, 0, [&]( auto& a ) {
        a.balance += value;
      });
   }
}
*/

//Standard token members - End

//Game members - Start

void eos_button::ebtpress( account_name account, asset quantity, bool protection, account_name referrer)
{
    eosio_assert( quantity.symbol == string_to_symbol(4, "EBT"), "unsupported symbol name" );
    handle_press<ebtgames, ebtplayers>(account, quantity, protection, referrer);
}

/*
void eos_button::eospress( account_name account, asset quantity, bool protection, account_name referrer)
{
    eosio_assert( quantity.symbol == string_to_symbol(4, "EOS"), "unsupported symbol name" );
    handle_press<eosgames, eosplayers>(account, quantity, protection, referrer);
}
*/

template <typename games_table_type, typename players_table_type>
void eos_button::handle_press( account_name account, asset quantity, bool protection, account_name referrer)
{
    //print("handle_press (", quantity, ") - Start |");

    /*
    //Erase records when required (for testing on testnet)
    if (quantity.amount == 0) {
        ebtgames table( _self, _self );
        auto itr = table.find(0);
        if ( itr != table.end() ) {
            table.erase(itr);
        }
    }
    if (quantity.amount == 0) {
        eosgames table( _self, _self );
        auto itr = table.find(0);
        if ( itr != table.end() ) {
            table.erase(itr);
        }
    }
    if (quantity.amount == 0) {
        ebtplayers table( _self, _self );
        for (auto itr = table.begin(); itr != table.end(); ) {
            itr = table.erase(itr);
        }
    }
    if (quantity.amount == 0) {
        eosplayers table( _self, _self );
        for (auto itr = table.begin(); itr != table.end(); ) {
            itr = table.erase(itr);
        }
    }
    return;
    */

    require_auth( account );

    const time countdown_cap = 120; //2 minutes countdown cap
    const time countdown_increase_step = 120; //Increase 2 minutes per share when pressed
    const time round_interval = 600; //10 minutes between each round
    const uint64_t shares_for_first_press = 10000; //10000 means 1 share
    const uint64_t referrer_percent = 5;
    const uint64_t referee_percent = 5;
    const uint64_t dev_fee_percent = 2;
    const uint64_t token_reserve_percent = 1;
    const uint64_t last_player_reward_percent = 5;
    const uint64_t start_protection_seconds = 5;
    const uint64_t protection_seconds = 0; //Protection is disabled for now
    const uint64_t protection_fee_percent = 50;

    //Check game_command
    /*
    uint64_t game_command;
    systemstates systemstates_table( _self, _self );
    auto systemstates_itr = systemstates_table.find(0);
    if ( systemstates_itr == systemstates_table.end() ) {
        game_command = 0;
    } else {
        if (quantity.symbol == string_to_symbol(4, "EBT")) {
            game_command = systemstates_itr->ebtgame_command;
        } else {
            game_command = systemstates_itr->eosgame_command;
        }
    }
    */

    //Check if referrer is valid
    bool referrer_is_valid = false;
    if (is_account(referrer) && referrer != account) {
        if (quantity.symbol == string_to_symbol(4, "EBT")) {
            accounts accounts_table( _self, referrer );
            auto accounts_itr = accounts_table.find(quantity.symbol.name());
            if (accounts_itr != accounts_table.end()) {
                if (accounts_itr->balance.amount > 0) {
                    referrer_is_valid = true;
                }
            }
        } else {
            accstates accstates_table( _self, _self );
            auto accstates_itr = accstates_table.find(referrer);
            if (accstates_itr != accstates_table.end()) {
                if (accstates_itr->eos_balance.amount > 0) {
                    referrer_is_valid = true;
                }
            }
        }
    }

    games_table_type games_table( _self, _self );
    auto games_itr = games_table.find(0);
    if ( games_itr == games_table.end() ) {
        games_itr = games_table.emplace(account, [&](auto& g){
            //It is important to initialize all asset type columns with the correct symbol, so that they can be used in future calculations
            g.pot = asset(0, quantity.symbol);
            g.final_prize = asset(0, quantity.symbol);
            g.token_reserved_for_next_round = asset(0, quantity.symbol);
            g.dev_fee = asset(0, quantity.symbol);
        });
    }
    players_table_type players_table( _self, _self );

    time remaining_time_right_after_last_full_press = std::min<time>(countdown_cap, s_add(games_itr->last_full_press_remaining_time, s_div(s_mul(countdown_increase_step, games_itr->last_full_press_shares), 10000)));
    //print("remaining_after_last_press: ", remaining_time_right_after_last_full_press, " |");

    if (now() >= s_add(games_itr->last_full_press_time, remaining_time_right_after_last_full_press)) {
        //print("Round ended or not started |");
        if (now() >= s_add(s_add(games_itr->last_full_press_time, remaining_time_right_after_last_full_press), round_interval)) {
            //print("Start a new round |");

            //Transfer rewards to players
            //Run this logic no matter the pot is 0 or not. If it is 0, it doesn't mean there is no player (if there is only one press last round, the pot is 0).
            for (
                auto itr = players_table.begin(); //Important to read the table again after adding shares to the last player
                itr != players_table.end();
            ) {
                //Calculate the reward. No need to use safe math, because the asset type will check for overflow/underflow. The order is important, the assets must be at the beginning. Make sure the uint64_t won't be rounded to 0.
                asset last_round_reward;
                //string ebt_transfer_memo;
                if (itr->account != games_itr->last_full_press_player) {
                    last_round_reward = games_itr->pot * (100 - last_player_reward_percent) / 100 * itr->shares / games_itr->shares;
                    //ebt_transfer_memo = string("eosbutton.io - Reward (") + std::to_string(itr->shares/10000) + string(" Share(s))");
                } else {
                    last_round_reward = games_itr->pot * (100 - last_player_reward_percent) / 100 * itr->shares / games_itr->shares + games_itr->pot * (last_player_reward_percent) / 100;
                    //ebt_transfer_memo = string("eosbutton.io - Reward (") + std::to_string(itr->shares/10000) + string(" Share(s) and the FINAL PRIZE)");
                }
                if (itr->account != _self && is_account(itr->account) && last_round_reward.amount > 0) {
                    if (quantity.symbol == string_to_symbol(4, "EBT")) {
                        //print("rewarding EBT |");
                        /*
                        ctransfer(
                            _self,
                            itr->account,
                            last_round_reward,
                            ebt_transfer_memo,
                            account
                        );
                        */
                        mtransfer(
                            _self,
                            itr->account,
                            last_round_reward,
                            account
                        );
                    } else {
                        //print("rewarding EOS |");
                        accstates accstates_table( _self, _self );
                        auto accstates_itr = accstates_table.find(itr->account);
                        if (accstates_itr == accstates_table.end()) {
                            accstates_table.emplace( account, [&]( auto& a ) {
                                a.account = itr->account;
                                a.eos_balance = last_round_reward;
                          });
                        } else {
                            accstates_table.modify( accstates_itr, 0, [&]( auto& a ) {
                                a.eos_balance = a.eos_balance + last_round_reward;
                            });
                        }
                    }
                    //print("Transfered last round reward ", last_round_reward, " to ", N(itr->account), " |");
                }
                itr = players_table.erase(itr);
            }

            /*
            if (game_command == 1) {
                return;
            }
            */
            if (now() < 1532167200) { //1532167200: July 21, 2018 10:00:00 AM UTC
                return;
            }

            //Emplace referrer's record (no need to check if it exists, because players have been erased previously)
            /*
            uint64_t additional_shares_for_referrer = 0;
            uint64_t additional_shares_for_referee = 0;
            if (referrer_is_valid) {
                additional_shares_for_referrer = s_div(s_mul(shares_for_first_press, referrer_percent), 100);
                additional_shares_for_referee = s_div(s_mul(shares_for_first_press, referee_percent), 100);
                players_table.emplace(account, [&](auto& p){
                    p.account = referrer;
                    p.shares = additional_shares_for_referrer;
                    p.last_press_shares = 0;
                    p.last_press_info = 0;
                    p.last_press_remaining_time = 0;
                });
            }
            */

            //Emplace player's record (no need to check if it exists, because players have been erased previously)
            players_table.emplace(account, [&](auto& p){
                p.account = account;
                /*
                p.shares = s_add(shares_for_first_press, additional_shares_for_referee);
                p.last_press_shares = s_add(shares_for_first_press, additional_shares_for_referee);
                */
                p.shares = shares_for_first_press;
                p.last_press_shares = shares_for_first_press;
                p.last_press_info = 2;
                p.last_press_remaining_time = 0;
            });

            //Set initial values for a new round
            games_table.modify(games_itr, account, [&](auto& g){
                /*
                if (game_command == 2) {
                    g.round = 1;
                } else {
                    g.round = s_add(g.round, 1);
                }
                */
                g.round = s_add(g.round, 1);
                /*
                g.last_full_press_shares = s_add(shares_for_first_press, additional_shares_for_referee);
                g.shares = s_add(s_add(shares_for_first_press, additional_shares_for_referrer), additional_shares_for_referee);
                g.total_shares = s_add(s_add(s_add(g.total_shares, shares_for_first_press), additional_shares_for_referrer), additional_shares_for_referee);
                */
                g.last_full_press_shares = shares_for_first_press;
                g.shares = shares_for_first_press;
                g.total_shares = s_add(g.total_shares, shares_for_first_press);
                g.pot = g.token_reserved_for_next_round;
                g.token_reserved_for_next_round = asset(0, quantity.symbol);
                //g.dev_fee = g.dev_fee; //The first press is free
                g.last_full_press_player = account;
                g.start_time = now();
                g.last_full_press_time = now();
                g.last_full_press_remaining_time = 0;
            });

        } else {
            //print("Wait before starting a new round |");
            /*
            auto players_itr = players_table.find(account);
            if( players_itr == players_table.end() ) {
                players_table.emplace(account, [&](auto& p){
                    p.account = account;
                    p.last_press_info = 1;
                });
            } else {
                players_table.modify(players_itr, account, [&](auto& p){
                    p.last_press_info = 1;
                });
            }
            */
            eosio_assert( false, "not started yet");
        }
    } else {
        //print("Round active |");

        time remaining = s_sub(remaining_time_right_after_last_full_press, s_sub(now(), games_itr->last_full_press_time));
        //print("remaining: ", remaining, " |");

        //Handle protection
        auto players_itr = players_table.find(account);
        if (
            (s_sub(now(), games_itr->start_time) <= start_protection_seconds && (s_sub(countdown_cap, remaining) <= start_protection_seconds)) || //Protect players for free at the beginning of a round.
            (protection && (s_sub(countdown_cap, remaining) <= protection_seconds))
        ) {
            if( players_itr == players_table.end() ) {
                players_table.emplace(account, [&](auto& p){
                    p.account = account;
                    p.last_press_info = 4;
                });
            } else {
                players_table.modify(players_itr, account, [&](auto& p){
                    p.last_press_info = 4;
                });
            }
            return;
        }

        //Calculate shares
        time timeElapsedSinceStart = s_sub(now(), games_itr->start_time);
        //print("remaining: ", remaining, " |");
        //shares = (1036800000 * quantity.amount) / ( (remaining^2 + 2280) * (timeElapsedSinceStart + 86400) )
        uint64_t shares = s_div(s_mul(1036800000, quantity.amount), s_mul(s_add(s_mul(remaining, remaining), 2280), s_add(timeElapsedSinceStart, 86400)));
        if (protection) {
            shares = s_div(s_mul(shares, 100), s_add(100, protection_fee_percent));
        }

        //Charge fee
        //No need to assert to check if the EBT balance is enough, because the sub_balance will do.
        //However, if SEND_INLINE_ACTION is used, I must assert here.
        if (quantity.symbol == string_to_symbol(4, "EBT")) {
            if ( account != _self ) {
                //print("charge EBT |");
                //ctransfer(account, _self, quantity, string("eosbutton.io - Press"), account);
                mtransfer(account, _self, quantity, account);
            }
        } else {
            //print("charge EOS |");
            accstates accstates_table( _self, _self );
            auto accstates_itr = accstates_table.find(account);
            eosio_assert(accstates_itr != accstates_table.end(), "unknown account");

            accstates_table.modify( accstates_itr, 0, [&]( auto& a ) {
                eosio_assert( a.eos_balance >= quantity, "insufficient balance" );
                a.eos_balance -= quantity;
            });
        }

        //Update referrer's record
        players_itr = players_table.find(referrer);
        uint64_t additional_shares_for_referrer = 0;
        uint64_t additional_shares_for_referee = 0;
        if (referrer_is_valid) {
            additional_shares_for_referrer = s_div(s_mul(shares, referrer_percent), 100);
            additional_shares_for_referee = s_div(s_mul(shares, referee_percent), 100);
            if( players_itr == players_table.end() ) {
                players_table.emplace(account, [&](auto& p){
                    p.account = referrer;
                    p.shares = additional_shares_for_referrer;
                    p.last_press_shares = 0;
                    p.last_press_info = 0;
                    p.last_press_remaining_time = 0;
                });
            } else {
                players_table.modify(players_itr, account, [&](auto& p){
                    p.shares = s_add(p.shares, additional_shares_for_referrer);
                });
            }
        }

        //Update shares and check if it is a full press
        shares = s_add(shares, additional_shares_for_referee);
        bool full_press = false;
        if (shares >= 10000) {
            full_press = true;
        }

        //Update players_table
        players_itr = players_table.find(account);
        if( players_itr == players_table.end() ) {
            players_table.emplace(account, [&](auto& p){
                p.account = account;
                p.shares = s_add(p.shares, shares);
                p.last_press_shares = shares;
                p.last_press_info = 3;
                p.last_press_remaining_time = remaining;
            });
        } else {
            players_table.modify(players_itr, account, [&](auto& p){
                p.shares = s_add(p.shares, shares);
                p.last_press_shares = shares;
                p.last_press_info = 3;
                p.last_press_remaining_time = remaining;
            });
        }

        //Update games_table
        //Calculate asset. No need to use safe math, because the asset type will check for overflow/underflow. The order is important, the assets must be at the beginning. Make sure the uint64_t won't be rounded to 0.
        asset token_reserved_for_next_round = quantity * token_reserve_percent / 100;
        asset dev_fee = quantity * dev_fee_percent / 100;
        games_table.modify(games_itr, account, [&](auto& g){
            g.shares = s_add(s_add(g.shares, shares), additional_shares_for_referrer);
            g.total_shares = s_add(s_add(g.total_shares, shares), additional_shares_for_referrer);
            g.pot = g.pot + quantity - token_reserved_for_next_round - dev_fee;
            g.token_reserved_for_next_round += token_reserved_for_next_round;
            g.dev_fee += dev_fee;
            if (full_press) {
                g.last_full_press_shares = shares;
                g.last_full_press_player = account;
                g.last_full_press_time = now();
                g.last_full_press_remaining_time = remaining;
            }
        });

    }

    //print("handle_press (", quantity, ") - End |");
}

//Game members - End

//Asset management members - Start

/*
void eos_button::withdraw( account_name account, asset quantity )
{
    //print("withdraw - Start |");

    require_auth( account );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must withdraw positive quantity" );

    accstates accstates_table( _self, _self );
    auto accstates_itr = accstates_table.find(account);
    eosio_assert(accstates_itr != accstates_table.end(), "unknown account");

    accstates_table.modify( accstates_itr, 0, [&]( auto& a ) {
        eosio_assert( a.eos_balance >= quantity, "insufficient balance" );
        a.eos_balance -= quantity;
    });

    action(
        permission_level{ _self, N(active) },
        N(eosio.token), N(transfer),
        std::make_tuple(_self, account, quantity, std::string("eosbutton.io - Withdraw"))
    ).send();

    if(
        accstates_itr != accstates_table.end() &&
        accstates_itr->eos_balance.amount <= 0 &&
        accstates_itr->last_airdrop_claim_time == 0
    ) {
        //print("accstates is empty |");
    }

    //print("withdraw - End |");
}
*/

void eos_button::claimad( account_name account )
{
    //print("claimad - Start |");
    require_auth( account );

    asset airdrop_claim_quantity = asset(500000000, string_to_symbol(4, "EBT"));
    time airdrop_claim_interval = 86400;
    time airdrop_start_time = 1531908000;
    time airdrop_end_time = 1533117600;

    accstates accstates_table( _self, _self );
    auto accstates_itr = accstates_table.find(account);
    /*
    systemstates systemstates_table( _self, _self );
    auto systemstates_itr = systemstates_table.find(0);

    eosio_assert(systemstates_itr != systemstates_table.end(), "No airdrop");
    eosio_assert(systemstates_itr->airdrop_available >= systemstates_itr->airdrop_claim_quantity, "Airdrop unavailable");
    eosio_assert(now() >= systemstates_itr->airdrop_start_time, "Airdrop has not started");
    eosio_assert(now() < systemstates_itr->airdrop_end_time, "Airdrop is ended");
    */
    eosio_assert(now() >= airdrop_start_time, "Airdrop has not started");
    eosio_assert(now() < airdrop_end_time, "Airdrop is ended");

    if(accstates_itr != accstates_table.end()) {
        //eosio_assert( now() >= accstates_itr->last_airdrop_claim_time + systemstates_itr->airdrop_claim_interval, "claim is too frequent");
        eosio_assert( now() >= accstates_itr->last_airdrop_claim_time + airdrop_claim_interval, "claim is too frequent");
    }

    //Update last_airdrop_claim_time
    if( accstates_itr == accstates_table.end() ) {
        //print("itr == end |");
        accstates_table.emplace(account, [&](auto& a){
            a.account = account;
            a.last_airdrop_claim_time = now();
            a.eos_balance = asset(0, string_to_symbol(4, "EOS"));
        });
    } else {
        //print("itr != end |");
        accstates_table.modify(accstates_itr, account, [&](auto& a){
            a.account = account;
            a.last_airdrop_claim_time = now();
        });
    }

    //Update available airdrop
    /*
    systemstates_table.modify(systemstates_itr, account, [&](auto& a){
        a.airdrop_available = a.airdrop_available - a.airdrop_claim_quantity;
    });
    */

    //Issue
    //cissue(account, systemstates_itr->airdrop_claim_quantity, "eosbutton.io - Airdrop");
    //Use mtransfer to replace cissue
    mtransfer(_self, account, airdrop_claim_quantity, account);

    //print("claimad - End |");
}

void eos_button::deposit()
{
    /*
    //print("deposit - Start |");

    auto transfer_data = unpack_action_data<eosio_token_transfer>();
    //Don't use assert, otherwise other eosio.token transfer actions not intended for deposit will be rejected.
    if (
      transfer_data.from == _self ||
      transfer_data.to != _self ||
      !transfer_data.quantity.is_valid() ||
      transfer_data.quantity.amount <= 0 ||
      transfer_data.quantity.symbol != string_to_symbol(4, "EOS") ||
      transfer_data.memo != "deposit"
    ) {
      return;
    }

    require_auth( transfer_data.from );

    accstates accstates_table( _self, _self );
    auto accstates_itr = accstates_table.find(transfer_data.from);
    if (accstates_itr == accstates_table.end()) {
        accstates_table.emplace( transfer_data.from, [&]( auto& a ) {
            a.account = transfer_data.from;
            a.eos_balance = transfer_data.quantity;
        });
    } else {
        accstates_table.modify( accstates_itr, 0, [&]( auto& a ) {
            a.eos_balance = a.eos_balance + transfer_data.quantity;
        });
    }

    //print(N(transfer_data.from), " deposited ", transfer_data.quantity, " |");

    //print("deposit - End |");
    */
}

/*
void eos_button::cissue( account_name to, asset quantity, string memo )
{
    auto sym = quantity.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    auto sym_name = sym.name();
    stats statstable( _self, sym_name );
    auto existing = statstable.find( sym_name );
    eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );
    const auto& st = *existing;

    //require_auth( st.issuer );
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must issue positive quantity" );

    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( quantity.amount <= st.max_supply.amount - st.supply.amount, "quantity exceeds available supply");

    statstable.modify( st, to, [&]( auto& s ) {
       s.supply += quantity;
    });

    c_add_balance( st.issuer, quantity, to );

    if( to != st.issuer ) {
       //SEND_INLINE_ACTION( *this, ctransfer, {st.issuer,N(active)}, {st.issuer, to, quantity, memo} );
       ctransfer(st.issuer, to, quantity, memo, to);
    }
}

void eos_button::ctransfer( account_name from,
                      account_name to,
                      asset        quantity,
                      string       memo,
                      account_name ram_payer )
{
    eosio_assert( from != to, "cannot transfer to self" );
    //require_auth( from );
    eosio_assert( is_account( to ), "to account does not exist");
    auto sym = quantity.symbol.name();
    stats statstable( _self, sym );
    const auto& st = statstable.get( sym );

    require_recipient( from );
    require_recipient( to );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );


    c_sub_balance( from, quantity );
    c_add_balance( to, quantity, ram_payer );
}
*/

void eos_button::mtransfer( account_name from, account_name to, asset quantity, account_name ram_payer )
{
    eosio_assert( is_account( to ), "to account does not exist");

    c_sub_balance( from, quantity );
    c_add_balance( to, quantity, ram_payer );
}

void eos_button::c_sub_balance( account_name owner, asset value ) {
   accounts from_acnts( _self, owner );

   const auto& from = from_acnts.get( value.symbol.name(), "no balance object found" );
   eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );

   from_acnts.modify( from, 0, [&]( auto& a ) {
       a.balance -= value;
   });
}

void eos_button::c_add_balance( account_name owner, asset value, account_name ram_payer )
{
   accounts to_acnts( _self, owner );
   auto to = to_acnts.find( value.symbol.name() );
   if( to == to_acnts.end() ) {
      to_acnts.emplace( ram_payer, [&]( auto& a ){
        a.balance = value;
      });
   } else {
      to_acnts.modify( to, 0, [&]( auto& a ) {
        a.balance += value;
      });
   }
}

//Asset management members - End

//System management members - Start

/*
void eos_button::configsystem( asset airdrop_available, asset airdrop_claim_quantity, time airdrop_claim_interval, time airdrop_start_time, time airdrop_end_time, uint64_t ebtgame_command, uint64_t eosgame_command )
{
    print("configsystem - Start |");
    require_auth( _self );
    auto sym = airdrop_available.symbol;

    eosio_assert( sym == string_to_symbol(4, "EBT"), "unsupported symbol name" );

    systemstates systemstates_table( _self, _self );
    auto systemstates_itr = systemstates_table.find(0);
    if( systemstates_itr == systemstates_table.end() ) {
        print("itr == end |");
        systemstates_table.emplace(_self, [&](auto& a){
            if (airdrop_claim_quantity.amount > 0) {
                a.airdrop_available = airdrop_available;
                a.airdrop_claim_quantity = airdrop_claim_quantity;
                a.airdrop_claim_interval = airdrop_claim_interval;
                a.airdrop_start_time = airdrop_start_time;
                a.airdrop_end_time = airdrop_end_time;
            }
            a.ebtgame_command = ebtgame_command;
            a.eosgame_command = eosgame_command;
        });
    } else {
        print("itr != end |");
        systemstates_table.modify(systemstates_itr, _self, [&](auto& a){
            if (airdrop_claim_quantity.amount > 0) {
                a.airdrop_available = airdrop_available;
                a.airdrop_claim_quantity = airdrop_claim_quantity;
                a.airdrop_claim_interval = airdrop_claim_interval;
                a.airdrop_start_time = airdrop_start_time;
                a.airdrop_end_time = airdrop_end_time;
            }
            a.ebtgame_command = ebtgame_command;
            a.eosgame_command = eosgame_command;
        });

        if(airdrop_end_time == 999) {
            systemstates_table.erase(systemstates_itr);
        }
    }

    //Erase records when required (for testing on testnet)
    if (ebtgame_command == 999) {
        ebtgames table( _self, _self );
        auto itr = table.find(0);
        if ( itr != table.end() ) {
            table.erase(itr);
        }
    }
    if (eosgame_command == 999) {
        eosgames table( _self, _self );
        auto itr = table.find(0);
        if ( itr != table.end() ) {
            table.erase(itr);
        }
    }
    if (ebtgame_command == 99999) {
        ebtplayers table( _self, _self );
        for (auto itr = table.begin(); itr != table.end(); ) {
            itr = table.erase(itr);
        }
    }
    if (eosgame_command == 99999) {
        eosplayers table( _self, _self );
        for (auto itr = table.begin(); itr != table.end(); ) {
            itr = table.erase(itr);
        }
    }

    print("configsystem - End |");
}

void eos_button::withdrawdf( account_name to )
{
    require_auth( _self );
    print("withdrawdf - Start |");
    //withdraw all EBT and EOS dev fee

    //Withdraw EBT
    ebtgames ebtgames_table( _self, _self);
    auto ebtgames_itr = ebtgames_table.find(0);
    if (ebtgames_itr != ebtgames_table.end()) {
        asset ebt_quantity;

        ebtgames_table.modify( ebtgames_itr, 0, [&]( auto& g ) {
            ebt_quantity = g.dev_fee;
            g.dev_fee = asset(0, string_to_symbol(4, "EBT"));
        });

        if (ebt_quantity > asset(0, string_to_symbol(4, "EBT"))) {
            transfer(_self, to, ebt_quantity, "eosbutton.io - Withdrawdf");
        }
    }

    //Withdraw EOS
    eosgames eosgames_table( _self, _self);
    auto eosgames_itr = eosgames_table.find(0);
    if (eosgames_itr != eosgames_table.end()) {
        asset eos_quantity;

        eosgames_table.modify( eosgames_itr, 0, [&]( auto& g ) {
            eos_quantity = g.dev_fee;
            g.dev_fee = asset(0, string_to_symbol(4, "EOS"));
        });

        if (eos_quantity > asset(0, string_to_symbol(4, "EOS"))) {
            action(
                permission_level{ _self, N(active) },
                N(eosio.token), N(transfer),
                std::make_tuple(_self, to, eos_quantity, std::string("eosbutton.io - Withdrawdf"))
            ).send();
        }
    }

    print("withdrawdf - End |");
}
*/

//System management members - End

//Safe math - Start

uint64_t eos_button::s_add( uint64_t a, uint64_t b )
{
  uint64_t c = a + b;
  eosio_assert(c >= a, "overflow/underflow");
  return c;
}

uint64_t eos_button::s_sub( uint64_t a, uint64_t b )
{
  eosio_assert(b <= a, "overflow/underflow");
  return a - b;
}

uint64_t eos_button::s_mul( uint64_t a, uint64_t b )
{
  if (a == 0) {
    return 0;
  }

  uint64_t c = a * b;
  eosio_assert(c / a == b, "overflow/underflow");
  return c;
}

uint64_t eos_button::s_div( uint64_t a, uint64_t b )
{
  eosio_assert(b > 0, "dividing by 0");
  return a / b;
}

//Safe math - End

}

#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      auto self = receiver; \
      if( action == N(onerror)) { \
         /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
         eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account"); \
      } \
      if( (code == self || action == N(onerror)) && action != N(deposit) ) { \
         TYPE thiscontract( self ); \
         switch( action ) { \
            EOSIO_API( TYPE, MEMBERS ) \
         } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
      } else if( code == N(eosio.token) && action == N(transfer) ) { \
         ebt::eos_button eb( receiver ); \
         eb.deposit(); \
      } \
   } \
}

EOSIO_ABI_EX(ebt::eos_button,
    //(create)
    //(issue)
    //(transfer)
    (ebtpress)
    //(eospress)
    //(withdraw)
    //(configsystem)
    (claimad)
    //(withdrawdf)
)
