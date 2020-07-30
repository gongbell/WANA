#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/contract.hpp>

using eosio::asset;
using eosio::multi_index;
using eosio::permission_level;
using eosio::action;
using eosio::print;
using eosio::name;

class dice : public eosio::contract {

public:

  const uint32_t FIVE_MINUTES = 5 * 60;

  dice(account_name self)
  :eosio::contract(self),
   accounts(_self, _self)
   {}

  // @abi action
  void deposit(const account_name from, const asset& quantity) {
    eosio_assert(quantity.is_valid(), "invalid quantity");
    eosio_assert(quantity.amount > 0, "must deposit positive quantity");

    auto itr = accounts.find(from);
    if (itr == accounts.end()) {
      // create an account
      itr = accounts.emplace(_self, [&](auto& r) {
        r.owner = from;
      });
    }

    action(
      permission_level{ from, N(active) },
      N(eosio.token), N(transfer),
      std::make_tuple(from, _self, quantity, std::string("dice deposit"))
    ).send();
  }

private:

  // @abi table
  struct account {
    account_name owner;
    asset eos_balance;
    uint32_t open_offers{0};
    uint32_t open_games{0};

    bool is_empty() const {
      return !(eos_balance.amount == 0 ||
        open_offers == 0 || open_games == 0);
    }

    uint64_t primary_key() const { return owner; }

    EOSLIB_SERIALIZE(account, (owner)(eos_balance)(open_offers)(open_games))
  };

  typedef multi_index<N(account), account> account_index;

  account_index accounts;

};

EOSIO_ABI(dice, (deposit))
