#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>

#include <string>
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/types.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/crypto.h>
#include <cstring>
#include <functional>

using namespace eosio;
using namespace std;
using std::string;

class eoscomm : public contract
{

  public:
    eoscomm(account_name self) : contract(self) {}

    void apply(const account_name contract, const account_name act);
    void transferReceived(const currency::transfer &transfer, const account_name code);
    // @abi action
    void addpartner(const account_name partner,
                    const uint32_t weightx100);
    // @abi action
    void setconfig(const account_name _token_contract,
                   const string _symbol,
                   const uint8_t _symbol_precision);
    // @abi action
    void close();

  private:
    // @abi table partners i64
    struct partner
    {
        uint32_t weightx100;
        account_name partner_acct;
        uint32_t issued_time;

        uint64_t primary_key() const { return partner_acct; }
        EOSLIB_SERIALIZE(partner, (weightx100)(partner_acct)(issued_time));
    };

    typedef eosio::multi_index<N(partners), partner> partner_table;

    // @abi table configs i64
    struct config
    {
        uint64_t config_id;
        account_name token_contract;
        symbol_type payment_symbol;
        uint8_t settled;

        uint64_t primary_key() const { return config_id; }
        EOSLIB_SERIALIZE(config, (config_id)(token_contract)(payment_symbol)(settled));
    };typedef eosio::multi_index<N(configs), config> config_table;
    
    void paytoken(const account_name from,
                  const account_name to,
                  const asset token_amount,
                  const string memo)
    {

        config_table config(_self, _self);
        auto itr = config.begin();
        eosio_assert(itr != config.end(), "token contract is not set");

        print("---------- Transfer -----------\n");
        print("Token Contract   : ", name{itr->token_contract}, "\n");
        print("From             : ", name{from}, "\n");
        print("To               : ", name{to}, "\n");
        print("Amount           : ", token_amount, "\n");
        print("Memo             : ", memo, "\n");

        action(
            permission_level{from, N(active)},
            itr->token_contract, N(transfer),
            std::make_tuple(from, to, token_amount, memo))
            .send();

        print("---------- End Transfer -------\n");
    }
};
