#include "shine.hpp"

/**
 * SmartContract C entrypoint using a macro based on the list of action in the.
 * For each of defined action, a switch branch is added
 * automatically unpacking the data into the action's structure and dispatching
 * a method call to `action` define in this SmartContract.
 *
 * Each time a new action is added, EOSIO_API definition should be expanded with the
 * new action handler's method name.
 */
/* extern "C" {
void apply(uint64_t receiver, uint64_t code, uint64_t action) {
  auto self = receiver;
  if (code == self) {
    // Don't rename `thiscontract`, it's being use verbatim in `EOSIO_API` macro
    shine thiscontract(self);
    switch (action) { EOSIO_API(shine, (post)(vote)(reset)) }

    eosio_exit(0);
  }

  if (shine::is_token_transfer(code, action)) {
    eosio::token_transfer action = unpack_action_data<eosio::token_transfer>();

    // Only pass notification to shine if transfer `to` is shine contract account and `quantity` are EOS tokens
    if (action.to == self && action.quantity.symbol == EOS_SYMBOL) {
      shine(self).transfer(action.quantity);
    }

    eosio_exit(0);
  }
}
}
 */
///
//// Actions
///

void shine::post(const name from, const name to, const string& memo) {
  require_active_auth(from);

  auto post_itr = posts.emplace(_self, [&](auto& post) {
    post.id = posts.available_primary_key();
    post.from = from;
    post.to = to;
    post.memo = memo;
  });

  update_member_stat(from, [](auto& stat) { stat.post_count += 1; });
  update_member_stat(to, [](auto& stat) { stat.vote_received_implicit += 1; });
}

void shine::vote(const name voter, const post_id post_id) {
  require_active_auth(voter);

  auto post_itr = posts.find(post_id);
  check(post_itr != posts.end(), "post with this id does not exist.");

  votes.emplace(_self, [&](auto& vote) {
    vote.id = votes.available_primary_key();
    vote.voter = voter;
    vote.post_id = post_id;
  });

  update_member_stat(voter, [](auto& stat) { stat.vote_given_explicit += 1; });
  update_member_stat(post_itr->to, [](auto& stat) { stat.vote_received_explicit += 1; });
  update_member_stat(post_itr->from, [](auto& stat) { stat.post_vote_received += 1; });
}

/**
 * Reset statistics for posts, votes, stats and rewards. Mapping between
 * member and account will be kept.
 */
void shine::reset(const uint64_t any) {
  require_active_auth(_self);

  table_clear(posts);
  table_clear(votes);
  table_clear(stats);
  table_clear(rewards);
}

///
//// Notifications
///

/**
 * Transfer the actual pot into rewards to all members.
 */
void shine::on_transfer(const name from, const name to, const asset quantity, const string& memo) {
  compute_rewards(quantity);
  check(has_rewards(), "Cannot transfer pot without any rewards.");

  struct token_transfer {
    name from;
    name to;
    asset quantity;
    string memo;
  };

  for_each(rewards.begin(), rewards.end(), [&](auto& reward) {
    token_transfer transfer{_self, reward.account, reward.amount_total, "Shine on you!"};
    eosio::action(permission_level{_self, "active"_n}, "eosio.token"_n, "transfer"_n, transfer).send();
  });
}

/**
 * The calculation of rewards follow a simple algorithm using as raw input
 * for each member:
 *  + The amount of vote received
 *  + The amount of vote given
 *  + The amount of post posted
 *
 * Base on these three values, a weight is computed for each of them:
 *  + Vote received -> Proportional to total vote count (explicit + implicit)
 *  + Vote given -> Proportional to total of vote given weight (1 vote -> 1/3, 2 votes -> 2/3, 2+ votes -> 3/3)
 *  + post posted -> Propotional to total explicite vote count.
 *
 * The algorithm first loop through all member stats to compute global
 * stats (total vote, total post, etc).
 *
 * Then, it computes the rewards for each member that has a bound EOS account.
 * The amount of distributed tokens is also being accumulated. When all member
 * has been processed, the undistributed pot is computed by doing `pot - distributed_pot`.
 *
 * If the undistributed pot is 0, the rewards computation stops here.
 *
 * If the undistributed pot is above 0, then there is two possibilites.
 *
 * First, if there is only one person to distribute the balance to if
 * it's impossible to divise further the undistributed pot to all bound
 * members, the balance is simply awarded to the first member.
 *
 * Else, the undistributed pot is spread evenly through all bound members,
 * if the undistributed pot cannot be split evenly, the last member receives
 * the remainder.
 */
void shine::compute_rewards(const asset& pot) {
  check(pot.amount > 0, "Pot quantity must be higher than 0.");

  table_clear(rewards);

  distribution_stat distribution;

  compute_global_stats(distribution);
  distribute_rewards(pot, distribution);

  check(distribution.distributed_pot.amount == pot.amount,
        "Distributed pot should be equivalent to actual pot.");
}

void shine::compute_global_stats(distribution_stat& distribution) {
  for_each(stats.begin(), stats.end(), [&](auto& stat) {
    auto postd_posted = stat.post_count;
    auto vote_given = stat.vote_given_explicit;

    distribution.vote_explicit += vote_given;
    distribution.vote_total += postd_posted + vote_given;
    distribution.vote_given_weighted_total += vote_given * compute_vote_given_weight(vote_given);
  });
}

void shine::distribute_rewards(const asset& pot, distribution_stat& distribution) {
  auto pot_amount = asset_to_double(pot);
  auto balance = pot;

  auto last_member_itr = find_last_stats_member_itr();
  for (auto itr = stats.begin(); itr != stats.end(); itr = itr++) {
    auto& stat = *itr;

    auto vote_received = stat.vote_received_explicit + stat.vote_received_implicit;
    auto post_vote_received = stat.post_vote_received;
    auto vote_given = stat.vote_given_explicit;

    auto vote_given_weights = compute_vote_given_weight(vote_given);
    auto vote_given_weighted = vote_given * vote_given_weights;

    auto vote_received_weight = vote_received / (double)distribution.vote_total;
    auto post_count_weight = post_vote_received / (double)distribution.vote_explicit;
    auto vote_given_weight = vote_given_weighted / distribution.vote_given_weighted_total;

    auto vote_received_amount = double_to_asset(vote_received_weight * pot_amount * REWARD_VOTE_RECEIVED_WEIGHT);
    auto post_count_amount = double_to_asset(post_count_weight * pot_amount * REWARD_post_count_WEIGHT);
    auto vote_given_amount = double_to_asset(vote_given_weight * pot_amount * REWARD_VOTE_GIVEN_WEIGHT);
    auto amount_total = vote_received_amount + post_count_amount + vote_given_amount;

    balance -= amount_total;
    if (itr == last_member_itr) {
      amount_total += balance;
    }

    distribution.distributed_pot += amount_total;

    update_reward_for_member(stat.account, [&](auto& reward) {
      reward.amount_post_count = post_count_amount;
      reward.amount_vote_received = vote_received_amount;
      reward.amount_vote_given = vote_given_amount;
      reward.amount_total = amount_total;
    });
  }
}

///
//// Helpers
///

void shine::update_reward_for_member(const name account, const function<void(reward_row&)> updater) {
  auto reward_itr = rewards.find(account.value);
  if (reward_itr == rewards.end()) {
    rewards.emplace(_self, [&](auto& reward) {
      reward.account = account;
      updater(reward);
    });
  } else {
    rewards.modify(reward_itr, _self, [&](auto& reward) { updater(reward); });
  }
}

void shine::update_member_stat(const name account, const function<void(member_stat_row&)> updater) {
  auto stat_itr = stats.find(account.value);
  if (stat_itr == stats.end()) {
    stats.emplace(_self, [&](auto& stat) {
      stat.account = account;
      updater(stat);
    });
  } else {
    stats.modify(stat_itr, _self, [&](auto& stat) { updater(stat); });
  }
}
