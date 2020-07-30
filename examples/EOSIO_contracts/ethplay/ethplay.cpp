#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>

using namespace eosio;

using std::string;
using std::vector;

/**
 * We are playing with contracts from ethereum
 * this example has horrible performance compared to
 * default eosio.token because we are utilizing vector
 * just to simulate what eth has in their contracts
 * The correct structure would be create another table
 * for balance and persist the token on the account
 * owner scope
 * @author Leo Ribeiro
 */
class ethplay : public eosio::contract {
public:
    ethplay( account_name self)
            :eosio::contract(self),
             tokens(_self,_self)
            {}

    void hi(account_name user) {
        require_recipient(user);
        print("Hello, ", name{user});
    }

    void createtoken(asset initial_supply, string name, account_name creator) {
        require_auth(creator);

        auto existing_token = tokens.find(initial_supply.symbol.name());
        eosio_assert(existing_token == tokens.end(), "token already exists");

        print("Creating token: ", name.c_str(),
              " - Initial Supply: ", initial_supply);

        tokens.emplace(_self, [&](auto& r) {
           r.supply = initial_supply;
           r.token_name = name;
           r.balances = {{ creator, initial_supply }};
        });
    }

    void transfer(account_name from, account_name to, asset amount, string memo) {
        require_auth(from);

        require_recipient( from );
        require_recipient( to );

        eosio_assert(amount.is_valid(), "invalid amount");
        eosio_assert(amount.amount > 0, "quantity must be greater than zero");

        sub_balance(from, amount);
        add_balance(to, amount, from);

    }

private:

    struct accbalance {
        account_name account;
        asset        balance;
    };

    // @abi table tokens i64
    struct tokens {
        asset supply;
        string token_name;
        vector<accbalance> balances;

        uint64_t primary_key() const { return supply.symbol.name(); }
    };

    typedef eosio::multi_index<N(tokens), tokens> tb_tokens;

    tb_tokens tokens;

    void sub_balance(account_name const &from, asset const &amount) {
        require_auth(from);

        auto token = tokens.find(amount.symbol.name());
        eosio_assert(token != tokens.end(), "invalid token");

        tokens.modify(token, from, [&](auto &r) {
            for (auto &ab : r.balances ) {
                if(ab.account == from) {
                    eosio_assert(ab.balance >= amount, "insufficient funds");
                    ab.balance -= amount;
                    break;
                }
            }
        });
    }

    void add_balance(account_name const &to, asset const &amount, account_name const &payer) {
        require_auth(payer);

        auto token = tokens.find(amount.symbol.name());
        eosio_assert(token != tokens.end(), "invalid token");

        tokens.modify(token, payer, [&](auto &r) {
            bool balance_found = false;

            for (auto &ab : r.balances ) {
                if(ab.account == to) {
                    ab.balance += amount;
                    balance_found = true;
                    break;
                }
            }

            if(!balance_found) {
                r.balances.push_back({to, amount});
            }
        });
    }

};

EOSIO_ABI(ethplay, (hi)(createtoken)(transfer))
