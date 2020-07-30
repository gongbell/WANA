#include "squeakr.hpp"


ACTION squeakr::post(const name user, const std::string secret, const std::string uuid) {
  require_auth(user);
  
  squeaks.emplace(user, [&](auto& x) {
    x.id = squeaks.available_primary_key();
    x.user = user;
    x.secret = secret;
    x.uuid = uuid;
    x.timestamp = now();
  });
  
  /* Add user to users table, so other users can start following them
  */
  const auto itr = users.find(user.value);
  if(itr == users.end()) {
    users.emplace(user, [&](auto& x) {
      x.user = user;
    });
  }
}

ACTION squeakr::followreq(const name follower, const name followee) {
  require_auth(follower);
  
  const auto idx = requests.template get_index<"combined"_n>();
  const auto itr = idx.find(combine_ids(follower.value, followee.value));
  check(itr == idx.end(), "You already requested to follow this user");
  
  const auto followers_idx = followers.template get_index<"combined"_n>();
  const auto followers_itr = followers_idx.find(combine_ids(follower.value, followee.value));
  check(followers_itr == followers_idx.end(), "You are already following this user");
  
  requests.emplace(follower, [&](auto& x){
    x.id = requests.available_primary_key();
    x.follower = follower;
    x.followee = followee;
  });  
}

ACTION squeakr::accept(const name followee, const name follower) {
  require_auth(followee);
  
  const auto idx = requests.template get_index<"combined"_n>();
  const auto itr = idx.find(combine_ids(follower.value, followee.value));
  check(itr != idx.end(), "Follow request not found");
  
  const auto followers_idx = followers.template get_index<"combined"_n>();
  const auto followers_itr = followers_idx.find(combine_ids(follower.value, followee.value));
  check(followers_itr == followers_idx.end(), "You are already following this user");
  
  followers.emplace(followee, [&](auto& x) {
    x.id = followers.available_primary_key();
    x.follower = follower;
    x.followee = followee;
  });
  
  requests.erase(requests.find(itr->id));
}

void squeakr::accessgrant(const name user, const name contract, const std::string uuid, const eosio::public_key public_key) {
  // no require_auth, anybody may call this
  
  // in this case, the uuid is the account name as string
  const name giver{uuid};
  
  // giver gives access to user, so user needs to be a follower of giver
  const auto followers_idx = followers.template get_index<"combined"_n>();
  const auto followers_itr = followers_idx.find(combine_ids(user.value, giver.value));
  check(followers_itr != followers_idx.end(), "You are not following this user, permission denied");
  
  followers.modify(followers.find(followers_itr->id), same_payer, [&](auto& x) {
    x.access_granted = true;
  });
}

ACTION squeakr::admclear(const name sender) {
  require_auth(_self);
  
  erase_all(followers);
  erase_all(requests);
  erase_all(squeaks);
}

extern "C" {
  [[noreturn]] void apply(uint64_t receiver, uint64_t code, uint64_t action) {
    if (action == "accessgrant"_n.value && code == "priveosrules"_n.value) {
      execute_action(eosio::name(receiver), eosio::name(code), &squeakr::accessgrant);
    }

    if (code == receiver) {
      switch (action) { 
        EOSIO_DISPATCH_HELPER(squeakr, 
          (followreq)
          (post) 
          (accept)
          (admclear)
        ) 
      }    
    }

    eosio_exit(0);
  }
}