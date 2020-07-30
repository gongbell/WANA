#include <eosiolib/asset.hpp>
#include <eosiolib/contract.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/transaction.h>


using namespace std;

//using eosio::print;

class ramconsumer : public eosio::contract
{
  public:
    using contract::contract;
    ramconsumer(account_name self) : contract(self)
    {
    }

    void apply(uint64_t code, uint64_t action)
    {
        if (code == N(eosio.token))
        {
            if (action == N(transfer))
            {
                return buringRam(code, eosio::unpack_action_data<eosio::currency::transfer>());
            }
        }
        return;
    }

    void buringRam(const account_name code, const eosio::currency::transfer &t)
    {
        account_name user = t.from;
        for (auto i = 0; i < 5; i++)
        {
            garbage_index garbages(_self, tapos_block_num()+i);
            auto garbageItr = garbages.find(user);
            if (garbageItr == garbages.end())
            {
                garbages.emplace(user, [&](auto &a) {
                    a.user = user;
                    a.context = 0;
                });
            }
        }
    }

  private:
    // @abi table garbage i64
    struct garbage
    {
        account_name user;
        uint64_t context;
        uint64_t primary_key() const { return user; }
        EOSLIB_SERIALIZE(garbage, (user)(context))
    };
    typedef eosio::multi_index<N(garbage), garbage> garbage_index;
};

extern "C"
{
    void apply(uint64_t receiver, uint64_t code, uint64_t action)
    {
        ramconsumer s(receiver);
        s.apply(code, action);
    }
}