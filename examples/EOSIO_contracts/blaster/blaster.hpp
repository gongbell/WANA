#include <eosiolib/eosio.hpp>
#include <eosiolib/multi_index.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>

using namespace eosio;
using namespace std;


class [[eosio::contract("blaster")]] blaster : public contract {

    private:

    public:

        using contract::contract;

        [[eosio::action]]
        void blast( uint64_t blast_time, uint32_t start, uint32_t iterations );
};
