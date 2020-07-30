#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/crypto.h>
#include <eosiolib/currency.hpp>

using namespace eosio;

class lottery10 : public eosio::contract
{
public:
  using contract::contract;

  /// @abi action
  void join(account_name user)
  {
  }

  /// @abi action
  void refundinit(int64_t amount)
  {
      require_auth(_self);

      balances balancetable(_self, _self);
      games gametable(_self, _self);

      auto existing = gametable.find(amount);
      if (existing != gametable.end())
      {
       int8_t i = (existing->count == 0 ? 1 : existing->count);

       for(int64_t pos = 1; pos <= i; pos++){

          auto onebalance = balancetable.find(pos + amount);
          if (onebalance != balancetable.end())
          {
              withdraw(onebalance->holder, (amount - 1), "refund sorry. rule change. 100 -> 10 participants. visit https://lottery100.io/");
              balancetable.erase(onebalance);
          }
       }
          gametable.erase(existing);
      }

  }

  void transferact(uint64_t receiver, uint64_t code)
  {
    eosio_assert(code == N(eosio.token), "I reject your non-eosio.token deposit");
    auto data = unpack_action_data<currency::transfer>();
    if (data.from == _self || data.to != _self)
      return;
    eosio_assert(data.quantity.symbol == string_to_symbol(4, "EOS"), "I think you're looking for another contract");
    eosio_assert(data.quantity.is_valid(), "Are you trying to corrupt me?");
    eosio_assert(data.quantity.amount > 0, "When pigs fly");

    int64_t amount = data.quantity.amount;

    if (amount == 1000 || amount == 10000 || amount == 100000 || amount == 1000000 || amount == 10000000)
    {
      balances balancetable(_self, _self);
      games gametable(_self, _self);
      historys historytable(_self, _self);

      auto existing = gametable.find(amount);
      if (existing != gametable.end())
      {
         auto existing = gametable.find(amount);
        gametable.modify(existing, 0, [&](auto &onegame) {
          onegame.count = onegame.count + 1;
        });
      }
      else
      {
        gametable.emplace(_self, [&](auto &bal) {
          bal.amount = amount;
          bal.count = 1;
        });
      }

      int8_t i = (existing->count == 0 ? 1 : existing->count);

      auto onebalance = balancetable.find(i + amount);
      if (onebalance == balancetable.end())
      {

        balancetable.emplace(_self, [&](auto &bal) {
          bal.num = (i + amount);
          bal.holder = data.from;
        });

        withdraw(data.from, 1, "(" + std::to_string(i) + "/10) joined lottery100. good luck");

        if (i == 10)
        {
          uint8_t rand1 = rand();
          int64_t pos = rand1 + amount;
          auto onebalance = balancetable.find(pos);

          if (onebalance != balancetable.end())
          {
            withdraw(onebalance->holder, 9.9 * amount, "celebration, earn 10 times");

            withdraw(N(lottery1ooba), ((0.1 * amount) - 10), "fee 1%");

            for (int64_t i = 1; i <= 10; i++)
            {
              auto existing = balancetable.find(i + amount);
              balancetable.erase(existing);
            }

            auto existing1 = gametable.find(amount);
            gametable.erase(existing1);

            historytable.emplace(_self, [&](auto &bal) {
              bal.seq = historytable.available_primary_key();
              bal.amount = amount;
              bal.holder = onebalance->holder;
              bal.count = rand1;
            });
          }
        }
      }
    }
  };

  void withdraw(const account_name to, int64_t amount, string msg)
  {
    asset prize(amount, CORE_SYMBOL);
    action(
        permission_level{_self, N(active)},
        N(eosio.token), N(transfer),
        std::make_tuple(_self, to, prize, std::string(msg)))
        .send();
  }

  uint8_t rand()
  {
    checksum256 result;
    auto mixedBlock = tapos_block_prefix() * tapos_block_num();
    const char *mixedChar = reinterpret_cast<const char *>(&mixedBlock);
    sha256((char *)mixedChar, sizeof(mixedChar), &result);
    const char *p64 = reinterpret_cast<const char *>(&result);
    uint8_t r = (abs((int8_t)p64[0]) % (10)) + 1;
    return r;
  }

  /// @abi table balance i64
  struct balance
  {
    int64_t num;
    account_name holder;
    int64_t primary_key() const { return num; }
    EOSLIB_SERIALIZE(balance, (num)(holder));
  };

  /// @abi table game i64
  struct game
  {
    int64_t amount;
    int8_t count;
    int64_t primary_key() const { return amount; }
    EOSLIB_SERIALIZE(game, (amount)(count));
  };

  /// @abi table history i64
  struct history
  {
    int64_t seq;
    account_name holder;
    int64_t amount;
    int8_t count;
    int64_t primary_key() const { return seq; }
    EOSLIB_SERIALIZE(history, (seq)(holder)(amount)(count));
  };

  typedef multi_index<N(balance), balance> balances;
  typedef multi_index<N(game), game> games;
  typedef multi_index<N(history), history> historys;
};

#define EOSIO_ABI2(TYPE, MEMBERS)                                                                                        \
  extern "C"                                                                                                             \
  {                                                                                                                      \
    void apply(uint64_t receiver, uint64_t code, uint64_t action)                                                        \
    {                                                                                                                    \
      auto self = receiver;                                                                                              \
      if (action == N(onerror))                                                                                          \
      {                                                                                                                  \
        /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
        eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account");             \
      }                                                                                                                  \
      if (code == self || action == N(onerror))                                                                          \
      {                                                                                                                  \
        TYPE thiscontract(self);                                                                                         \
        switch (action)                                                                                                  \
        {                                                                                                                \
          EOSIO_API(TYPE, MEMBERS)                                                                                       \
        }                                                                                                                \
        /* does not allow destructor of thiscontract to run: eosio_exit(0); */                                           \
      }                                                                                                                  \
      else                                                                                                               \
      {                                                                                                                  \
        TYPE thiscontract(self);                                                                                         \
        switch (action)                                                                                                  \
        {                                                                                                                \
        case N(transfer):                                                                                                \
          return thiscontract.transferact(receiver, code);                                                               \
        }                                                                                                                \
        /* does not allow destructor of thiscontract to run: eosio_exit(0); */                                           \
      }                                                                                                                  \
    }                                                                                                                    \
  }

EOSIO_ABI2(lottery10, (join) (refundinit))
