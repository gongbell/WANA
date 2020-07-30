#include <string>
#include <eosiolib/eosio.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/time.hpp>
#include <eosiolib/system.h>

using namespace eosio;
using std::string;
template <uint64_t OraclizeName, uint32_t BestBeforeOffset, uint32_t UpdateOffset, typename T>
class oraclized
{
  struct data
  {
    uint32_t best_before;
    uint32_t update_after;
    T value;

    EOSLIB_SERIALIZE(data, (best_before)(update_after)(value))
  };

  constexpr static uint64_t pk_value = OraclizeName;
  struct row
  {
    data value;

    uint64_t primary_key() const { return pk_value; }

    EOSLIB_SERIALIZE(row, (value))
  };

  typedef eosio::multi_index<OraclizeName, row> table;

private:
  table _t;

public:
  oraclized(account_name code, scope_name scope) : _t(code, scope) {}

  bool exists()
  {
    return _t.find(pk_value) != _t.end();
  }

  bool fresh()
  {
    return exists() && get().best_before > now();
  }

  bool require_update()
  {
    return exists() && get().update_after < now();
  }

  T value()
  {
    return get().value;
  }

  data get()
  {
    auto itr = _t.find(pk_value);
    eosio_assert(itr != _t.end(), "singleton does not exist");
    return itr->value;
  }

  data get_or_default(const T &def = T())
  {
    auto itr = _t.find(pk_value);
    return itr != _t.end() ? itr->value : def;
  }

  data get_or_create(account_name bill_to_account, const T &def = T())
  {
    auto itr = _t.find(pk_value);
    return itr != _t.end() ? itr->value
                           : _t.emplace(bill_to_account, [&](row &r) { r.value = data{}; });
  }

  void set(const T &value, account_name bill_to_account)
  {
    auto itr = _t.find(pk_value);
    if (itr != _t.end())
    {
      _t.modify(itr, bill_to_account, [&](row &r) { r.value = data{now() + BestBeforeOffset, now() + UpdateOffset, value}; });
    }
    else
    {
      _t.emplace(bill_to_account, [&](row &r) { r.value = data{now() + BestBeforeOffset, now() + UpdateOffset, value}; });
    }
  }

  void remove()
  {
    auto itr = _t.find(pk_value);
    if (itr != _t.end())
    {
      _t.erase(itr);
    }
  }
};

// @abi table args i64
struct request_args
{
  bytes schema;
  bytes args;
};
// carbon-copy call structure
struct push_data
{
  account_name oracle;
  account_name contract;
  string task;
  string memo;
  bytes data;

  EOSLIB_SERIALIZE(push_data, (oracle)(contract)(task)(memo)(data))
};

struct price
{
  uint64_t value;
  uint8_t decimals;

  EOSLIB_SERIALIZE(price, (value)(decimals))
};

// @abi table ethbtc i64
struct ethbtc
{
  uint32_t best_before;
  uint32_t update_after;
  price value;

  EOSLIB_SERIALIZE(ethbtc, (best_before)(update_after)(value))
};

typedef oraclized<N(ethbtc), 11, 10, price> ethbtc_data;

typedef singleton<N(master), account_name> account_master;

class YOUR_CONTRACT_NAME : public eosio::contract
{
private:
  ethbtc_data ethbtc;

  account_name known_master;

public:
  using contract::contract;

  YOUR_CONTRACT_NAME(account_name s) : contract(s), ethbtc(_self, _self)
  {
    known_master = account_master(_self, _self).get_or_create(_self, N(undefined));
  }

  void receive(account_name self, account_name code)
  {
    eosio_assert(known_master != N(undefined), "Contract didn't setupped yet");
    eosio_assert(code == known_master, "Unkown master contract");
    auto payload = unpack_action_data<push_data>();

    if (strcmp(payload.task.c_str(), "c0fe86756e446503eed0d3c6a9be9e6276018fead3cd038932cf9cc2b661d9de") == 0)
    {
      price p = unpack<price>(payload.data);
      ethbtc.set(p, _self);
      return;
    }

    eosio_assert(true, "Unknown task received");
  }

  // @abi action
  void setup(account_name master)
  {
    require_auth(_self);
    account_master(_self, _self).set(master, _self);
    ask_data(_self, master, "c0fe86756e446503eed0d3c6a9be9e6276018fead3cd038932cf9cc2b661d9de", 10u,
             string(),
             pack(request_args{
                 bytes{},
                 bytes{}}));
  }

  void ask_data(account_name administrator,
                account_name registry,
                string data,
                uint32_t update_each,
                string memo,
                bytes args)
  {
    action(permission_level{administrator, N(active)},
           registry, N(ask),
           std::make_tuple(administrator, _self, data, update_each, memo, args))
        .send();
  }
};

extern "C" void apply(uint64_t receiver, uint64_t code, uint64_t action)
{
  uint64_t self = receiver;
  if (action == N(onerror))
  {
    /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */
    eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account");
  }

  YOUR_CONTRACT_NAME thiscontract(self);

  if (code == self || action == N(onerror))
  {
    switch (action)
    {
      // NB: Add custom method in bracets after (setup) to use them as endpoints
      EOSIO_API(YOUR_CONTRACT_NAME, (setup))
    }
  }

  if (code != N(self) && action == N(push))
  {
    thiscontract.receive(receiver, code);
  }
}