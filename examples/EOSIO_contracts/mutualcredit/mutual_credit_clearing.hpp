#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <string>

using namespace eosio;

using std::string;

class mutual_credit_clearing : contract {
    using contract::contract;

    public:

        mutual_credit_clearing(account_name self) : contract(self) {}

        void create(account_name issuer, asset min_balance);

        void transfer(account_name from, account_name to, asset quantity, string memo);

    private:

        // tables

        struct stats {
            asset supply;
            asset min_balance;
            account_name issuer;

            uint64_t primary_key() const { return supply.symbol.name(); }
        };

        typedef eosio::multi_index<N(stats), stats> _stats;

        struct account {
            asset balance;

            uint64_t primary_key() const { return balance.symbol; }
        };

        typedef multi_index<N(accounts), account> accounts;

        // methods

        void add_balance( account_name owner, asset value, const stats& st, account_name payer );
        void sub_balance( account_name owner, asset value, const stats& st);

};