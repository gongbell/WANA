#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

#include <string>

using namespace eosio;
using std::string;

class newapp1 : public contract {
public:
    newapp1(account_name self) : contract(self) {}

    // @abi action
    void hello(account_name account);

    // @abi action
    void create(const account_name account,
                const string&      username,
                const string&      bio,
                uint32_t           age);

    // @abi action
    void update(const account_name account,
                const string&      username,
                const string&      bio,
                uint32_t           age);

    // @abi action
    void remove(const account_name account);

    // @abi action
    void get(const account_name);

    // @abi action
    void byage(uint32_t age);

    // @abi action
    void rangeage(uint32_t younger, uint32_t older);

private:

    // @abi table profiles i64
    struct profile {
        account_name account;
        string       username;
        string       bio;
        uint32_t     age;

        account_name primary_key() const { return account; }
        uint64_t     by_age() const { return age; }
        EOSLIB_SERIALIZE(profile, (account)(username)(bio)(age))
    };

    typedef eosio::multi_index<N(profiles), profile,
        indexed_by< N(age),
            const_mem_fun<profile, uint64_t, &profile::by_age>
        >
    > profile_table;
};

EOSIO_ABI(newapp1, (hello)(create)(update)(remove)(get)(byage)(rangeage))