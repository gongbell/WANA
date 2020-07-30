#include "unionramgame.hpp"

void unionramgame::transfer( account_name from, account_name to, asset quantity, string memo ) {
    if ( from == _self || to != _self ) {
        return;  // return if contract pay for this game
    }
    eosio_assert( quantity.symbol == S(4,EOS), "unionramgame only accepts EOS" );
    eosio_assert( quantity.is_valid(), "invalid token transfer" );
    eosio_assert( quantity.amount >= 2500, "quantity can not less than 0.25 EOS" );

    memo.erase(memo.begin(), find_if(memo.begin(), memo.end(), [](int ch) {
        return !isspace(ch);
    }));
    memo.erase(memo.begin(), find_if(memo.begin(), memo.end(), [](int ch) {
        return (ch != '0');
    }));
    memo.erase(find_if(memo.rbegin(), memo.rend(), [](int ch) {
        return !isspace(ch);
    }).base(), memo.end());

    eosio_assert( memo.length() <= 10, "invalid memo for unionramgame" );  // 1099999999
    uint64_t valid_price = atoi( memo.c_str() );
    eosio_assert( valid_price >= 1, "invalid ram price" );
    eosio_assert( valid_price <= 1099999999, "invalid price limit" );  // 0.000000001 EOS/KB ~ 10.999999999 EOS/KB

    uint64_t  now_time  = now();
    st_round  cur_round = get_round();
    eosio_assert( now_time >= cur_round.start_time, "this round is not started" );
    eosio_assert( now_time <  cur_round.start_time + seconds_per_round, "this round is ended" );

    _players.emplace( _self, [&]( auto& v ) {
        v.id          = _players.available_primary_key();
        v.owner       = from;
        v.tx_time     = now_time;
        v.tx_quantity = quantity;
        v.tx_ramprice = asset(valid_price, ramprice_symbol);
    });

    cur_round.gamepool += quantity;
    _round.set( cur_round, _self );
}

void unionramgame::gamedraw( account_name owner ) {
    require_auth( owner );

    auto players_index_owner = _players.get_index<N(si_owner)>();
    auto itr_player = players_index_owner.find( owner );
    if ( players_index_owner.begin() != players_index_owner.end() && owner != _self ) {
        eosio_assert( itr_player != players_index_owner.end(), "user isn't the unionramgame player" );
    }
    uint64_t now_time  = now();
    st_round cur_round = get_round();
    eosio_assert( now_time >= cur_round.start_time + seconds_per_draw, "now is not time to game draw" );

    auto itr_rammarket = _rammarket.find(S(4,RAMCORE));
    uint64_t cur_ramprice_amount = ( 1.0 * itr_rammarket->quote.balance.amount / 10000/* S(4,EOS) */ ) / ( 1.0 + itr_rammarket->base.balance.amount / 1024.0 ) * 100000000/* S(8,EOS) */;

    uint64_t low_ramprice_gap = 0, up_ramprice_gap = 0;
    uint32_t eq_total_winners = 0, low_total_winners = 0, up_total_winners = 0;
    uint64_t eq_total_timegap = 0, low_total_timegap = 0, up_total_timegap = 0;
    asset eq_total_asset = asset(0,S(4,EOS)), low_total_asset = asset(0,S(4,EOS)), up_total_asset = asset(0,S(4,EOS));
    uint64_t round_end_time = cur_round.start_time + seconds_per_round;
    auto players_index_ramprice = _players.get_index<N(si_ramprice)>();
    auto itr_bound = players_index_ramprice.lower_bound(cur_ramprice_amount);

    auto eqpoint = players_index_ramprice.lower_bound(cur_ramprice_amount);
    if ( eqpoint != players_index_ramprice.end() ) {
        for ( ;; ) {
            if ( eqpoint->tx_ramprice.amount == cur_ramprice_amount ) {
                eq_total_winners++;
                eq_total_asset += eqpoint->tx_quantity;
                eq_total_timegap += ( round_end_time - eqpoint->tx_time );
                ++eqpoint;
            } else {
                if ( eq_total_winners ) { --eqpoint; }
                break;
            }

            if ( eqpoint == players_index_ramprice.end() ) {
                --eqpoint;
                break;
            }
        }
    }
    auto uppoint = players_index_ramprice.lower_bound(cur_ramprice_amount);
    if ( 0 == eq_total_winners && uppoint != players_index_ramprice.end() ) {
        up_ramprice_gap = uppoint->tx_ramprice.amount - cur_ramprice_amount;
        ++up_total_winners;
        up_total_asset += uppoint->tx_quantity;
        up_total_timegap += ( round_end_time - uppoint->tx_time );

        for ( ;; ) {
            ++uppoint;
            if ( uppoint == players_index_ramprice.end() || up_ramprice_gap != uppoint->tx_ramprice.amount - cur_ramprice_amount ) {
                --uppoint;
                break;
            } else {
                ++up_total_winners;
                up_total_asset += uppoint->tx_quantity;
                up_total_timegap += ( round_end_time - uppoint->tx_time );
            }
        }
    }
    auto lowpoint = players_index_ramprice.lower_bound(cur_ramprice_amount);
    if ( 0 == eq_total_winners && lowpoint != players_index_ramprice.begin() ) {
        --lowpoint;  // lower_bound means >=
        low_ramprice_gap = cur_ramprice_amount - lowpoint->tx_ramprice.amount;
        ++low_total_winners;
        low_total_asset += lowpoint->tx_quantity;
        low_total_timegap += ( round_end_time - lowpoint->tx_time );

        for ( ;lowpoint != players_index_ramprice.begin(); ) {
            --lowpoint;
            if ( low_ramprice_gap != cur_ramprice_amount - lowpoint->tx_ramprice.amount ) {
                ++lowpoint;
                break;
            } else {
                ++low_total_winners;
                low_total_asset += lowpoint->tx_quantity;
                low_total_timegap += ( round_end_time - lowpoint->tx_time );
            }
        }
    }

    for ( auto itr_winners_erase = _winners.begin(); itr_winners_erase != _winners.end(); itr_winners_erase = _winners.begin() ) {
        _winners.erase( itr_winners_erase );  // clean winners table
    }

    // game fee
    uint64_t contract_fee = 10 * cur_round.gamepool.amount / 100;
    asset contract_fee_asset(contract_fee, S(4,EOS));
    contractpay( contract_fee_account, contract_fee_asset, "" );
    if ( owner != _self ) {
        asset game_draw_asset(5000, S(4,EOS));
        contractpay( owner, game_draw_asset, "unionramgame draw pay" );
    }
    cur_round = get_round();  // round's gamepool maybe update after contractpay

    if ( eq_total_winners ) {
        for ( ;; ) {
            uint64_t winner_prize_amount = ( 50.0 * eqpoint->tx_quantity.amount / eq_total_asset.amount / 100  + \
                                             50.0 * (round_end_time - eqpoint->tx_time) / eq_total_timegap / 100 ) * cur_round.gamepool.amount;
            asset winner_prize_asset(winner_prize_amount, S(4,EOS));
            contractpay( eqpoint->owner, winner_prize_asset, "unionramgame prize pay" );
            _winners.emplace( _self, [&]( auto& v ) {
                v.id           = _winners.available_primary_key();
                v.owner        = eqpoint->owner;
                v.tx_time      = eqpoint->tx_time;
                v.tx_quantity  = eqpoint->tx_quantity;
                v.tx_ramprice  = eqpoint->tx_ramprice;
                v.win_quantity = winner_prize_asset;
            });

            if ( eqpoint == itr_bound ) {
                break;  // for this case itr_bound just include '=='
            } else {
                --eqpoint;
            }
        }
    } else if ( 0 != up_ramprice_gap && (0 == low_ramprice_gap || up_ramprice_gap < low_ramprice_gap) ) {
        for ( ;; ) {
            uint64_t winner_prize_amount = ( 50.0 * uppoint->tx_quantity.amount / up_total_asset.amount / 100 + \
                                             50.0 * (round_end_time - uppoint->tx_time) / up_total_timegap / 100 ) * cur_round.gamepool.amount;
            asset winner_prize_asset(winner_prize_amount, S(4,EOS));
            contractpay( uppoint->owner, winner_prize_asset, "unionramgame prize pay" );
            _winners.emplace( _self, [&]( auto& v ) {
                v.id           = _winners.available_primary_key();
                v.owner        = uppoint->owner;
                v.tx_time      = uppoint->tx_time;
                v.tx_quantity  = uppoint->tx_quantity;
                v.tx_ramprice  = uppoint->tx_ramprice;
                v.win_quantity = winner_prize_asset;
            });

            if ( uppoint == itr_bound ) {
                break;  // for this case itr_bound just include '>'
            } else {
                --uppoint;
            }
        }
    } else if ( 0 != low_ramprice_gap && (0 == up_ramprice_gap || low_ramprice_gap < up_ramprice_gap) ) {
        for ( ;; ) {
            uint64_t winner_prize_amount = ( 50.0 * lowpoint->tx_quantity.amount / low_total_asset.amount / 100 + \
                                             50.0 * (round_end_time - lowpoint->tx_time) / low_total_timegap / 100 ) * cur_round.gamepool.amount;
            asset winner_prize_asset(winner_prize_amount, S(4,EOS));
            contractpay( lowpoint->owner, winner_prize_asset, "unionramgame prize pay" );
            _winners.emplace( _self, [&]( auto& v ) {
                v.id           = _winners.available_primary_key();
                v.owner        = lowpoint->owner;
                v.tx_time      = lowpoint->tx_time;
                v.tx_quantity  = lowpoint->tx_quantity;
                v.tx_ramprice  = lowpoint->tx_ramprice;
                v.win_quantity = winner_prize_asset;
            });

            ++lowpoint;
            if ( lowpoint == itr_bound ) {
                break;
            }
        }
    } else if ( 0 != low_ramprice_gap && low_ramprice_gap == up_ramprice_gap ) {
        for ( ;; ) {
            uint64_t winner_prize_amount = ( 50.0 * lowpoint->tx_quantity.amount / (low_total_asset.amount + up_total_asset.amount) / 100 + \
                                             50.0 * (round_end_time - lowpoint->tx_time) / (low_total_timegap + up_total_timegap) / 100 ) * cur_round.gamepool.amount;
            asset winner_prize_asset(winner_prize_amount, S(4,EOS));
            contractpay( lowpoint->owner, winner_prize_asset, "unionramgame prize pay" );
            _winners.emplace( _self, [&]( auto& v ) {
                v.id           = _winners.available_primary_key();
                v.owner        = lowpoint->owner;
                v.tx_time      = lowpoint->tx_time;
                v.tx_quantity  = lowpoint->tx_quantity;
                v.tx_ramprice  = lowpoint->tx_ramprice;
                v.win_quantity = winner_prize_asset;
            });

            ++lowpoint;
            if ( lowpoint == itr_bound ) {
                break;
            }
        }
        for ( ;; ) {
            uint64_t winner_prize_amount = ( 50.0 * uppoint->tx_quantity.amount / (low_total_asset.amount + up_total_asset.amount) / 100 + \
                                             50.0 * (round_end_time - uppoint->tx_time) / (low_total_timegap + up_total_timegap) / 100 ) * cur_round.gamepool.amount;
            asset winner_prize_asset(winner_prize_amount, S(4,EOS));
            contractpay( uppoint->owner, winner_prize_asset, "unionramgame prize pay" );
            _winners.emplace( _self, [&]( auto& v ) {
                v.id           = _winners.available_primary_key();
                v.owner        = uppoint->owner;
                v.tx_time      = uppoint->tx_time;
                v.tx_quantity  = uppoint->tx_quantity;
                v.tx_ramprice  = uppoint->tx_ramprice;
                v.win_quantity = winner_prize_asset;
            });

            if ( uppoint == itr_bound ) {
                break;
            } else {
                --uppoint;
            }
        }
    }

    for ( auto itr_player_erase = _players.begin(); itr_player_erase != _players.end(); itr_player_erase = _players.begin() ) {
        _players.erase( itr_player_erase );  // clean players table
    }

    st_round next_round = get_round();
    next_round.roundth += 1;
    next_round.start_time = now_time + 5 * 60;  // game start 5 minutes later
    next_round.last_ramprice = asset(cur_ramprice_amount, ramprice_symbol);
    _round.set( next_round, _self );
}

void unionramgame::contractpay( account_name to, asset quantity, string memo ) {
    st_round cur_round = get_round();
    if ( quantity.amount > 0 && cur_round.gamepool >= quantity ) {
        action(
            permission_level{ _self, N(active) },
            N(eosio.token),
            N(transfer),
            make_tuple( _self, to, quantity, memo)
        ).send();
        cur_round.gamepool = cur_round.gamepool - quantity;
        _round.set( cur_round, _self );  // update !
    }
}

void unionramgame::genesisr() {
    require_auth( _self );

    uint64_t now_time = now();
    st_round genesis_round = st_round {
        .roundth = 0,
        .start_time = now_time + 5 * 60,  // game start 5 minutes later
        .gamepool = asset(0, S(4,EOS)),
        .last_ramprice = asset(0, ramprice_symbol),
    };
    _round.get_or_create( _self, genesis_round );
}
