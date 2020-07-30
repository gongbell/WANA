#pragma once

#include <algorithm>
#include <string>
#include <cmath>

#include <eosio/eosio.hpp>
#include <eosio/time.hpp>
#include <eosio/system.hpp>
#include <eosio/asset.hpp>

using eosio::asset;
using eosio::check;
using eosio::const_mem_fun;
using eosio::current_time_point;
using eosio::datastream;
using eosio::indexed_by;
using eosio::name;
using eosio::time_point_sec;
using eosio::permission_level;
using std::function;
using std::string;


#include "asset.hpp"
#include "table.hpp"

// Configurable values
#define REWARD_post_count_WEIGHT 0.07
#define REWARD_VOTE_RECEIVED_WEIGHT 0.9
#define REWARD_VOTE_GIVEN_WEIGHT 0.03

// Typedefs
typedef uint64_t post_id;

class [[eosio::contract("shine")]] shine : public eosio::contract {
 public:
  shine(name receiver, name code, datastream<const char*> ds)
        :eosio::contract(receiver, code, ds),
        posts(code, code.value),
        votes(code, code.value),
        stats(code, code.value),
        rewards(code, code.value)
        {}

  // Actions
  [[eosio::action]]
  void post(const name from, const name to, const string& memo);
  [[eosio::action]]
  void vote(const name voter, const post_id post_id);
  [[eosio::action]]
  void reset(const uint64_t any);

  [[eosio::on_notify("eosio.token::transfer")]]
  void on_transfer(const name from, const name to, const asset quantity, const string& memo);

 private:
  struct [[eosio::table]] post_row {
    uint64_t id;
    name from;
    name to;
    string memo;

    uint64_t primary_key() const { return id; }

    void print() const { eosio::print("Post (", eosio::name{id}, ")"); }

    EOSLIB_SERIALIZE(post_row, (id)(from)(to)(memo))
  };

  typedef eosio::multi_index<"posts"_n, post_row> posts_index;

  struct [[eosio::table]] vote_row {
    uint64_t id;
    name voter;
    post_id post_id;

    uint64_t primary_key() const { return id; }

    void print() const { eosio::print("Vote (", eosio::name{id}, ")"); }

    EOSLIB_SERIALIZE(vote_row, (id)(voter)(post_id))
  };

  typedef eosio::multi_index<"votes"_n, vote_row> votes_index;

  /**
   * post_count - The post count posted by the member
   * post_vote_received - The amount of vote received for all post posted by the member
   * vote_given_explicit - The amout of vote the member did on other member posts
   * vote_received_implicit - The amount of implicit vote (vote by the author of the post) received
   * vote_received_explicit - The amount of explicit vote (voty by other members than author of post) received
   */
  struct [[eosio::table]] member_stat_row {
    name account;
    uint64_t post_count;
    uint64_t post_vote_received;
    uint64_t vote_given_explicit;
    uint64_t vote_received_implicit;
    uint64_t vote_received_explicit;

    member_stat_row()
        : post_count(0),
          post_vote_received(0),
          vote_given_explicit(0),
          vote_received_implicit(0),
          vote_received_explicit(0) {}

    uint64_t primary_key() const { return account.value; }

    void print() const { eosio::print("Member stat (", eosio::name{account}, ")"); }

    EOSLIB_SERIALIZE(member_stat_row, (account)(post_count)(post_vote_received)(vote_given_explicit)(
                                          vote_received_implicit)(vote_received_explicit))
  };

  typedef eosio::multi_index<"memberstats"_n, member_stat_row> member_stats_index;

  struct [[eosio::table]] reward_row {
    name account;
    asset amount_post_count;
    asset amount_vote_received;
    asset amount_vote_given;
    asset amount_total;

    uint64_t primary_key() const { return account.value; }

    void print() const { eosio::print("Reward (", eosio::name{account}, ")"); }

    EOSLIB_SERIALIZE(reward_row, (account)(amount_post_count)(amount_vote_received)(amount_vote_given)(amount_total))
  };

  typedef eosio::multi_index<"rewards"_n, reward_row> rewards_index;

  struct distribution_stat {
    uint64_t vote_explicit;
    uint64_t vote_total;
    double vote_given_weighted_total;

    asset distributed_pot;

    distribution_stat()
        : vote_explicit(0), vote_total(0), vote_given_weighted_total(0), distributed_pot(0, EOS_SYMBOL) {}
  };

  static double compute_vote_given_weight(uint64_t vote_given) {
    if (vote_given <= 0) return 0;
    if (vote_given <= 1) return 1 / 3.0;
    if (vote_given <= 2) return 2 / 3.0;

    return 1.0;
  }

  void compute_rewards(const asset& pot);
  void compute_global_stats(distribution_stat& distribution);
  void distribute_rewards(const asset& pot, distribution_stat& distribution);

  member_stats_index::const_iterator find_last_stats_member_itr() { return stats.end()--; }

  bool has_rewards() const { return rewards.begin() != rewards.end(); }
  void require_active_auth(const name account) const { require_auth(permission_level{account, "active"_n}); }
  void update_member_stat(const name account, const function<void(member_stat_row&)> updater);
  void update_reward_for_member(const name account, const function<void(reward_row&)> updater);

  posts_index posts;
  votes_index votes;
  member_stats_index stats;
  rewards_index rewards;
};
