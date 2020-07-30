#include <eosiolib/eosio.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/crypto.h>

using namespace std;
using namespace eosio;


class keepscore : public contract {
public:
    keepscore(account_name self) : contract(self) {}

    void init(account_name app_owner);

    void scored(string&             username,
                const account_name  account,
                uint64_t            new_score);

    void remove(string& username, account_name account);

    static constexpr uint64_t code = N(keepscore);

private:
    typedef uint64_t uuid;

    /* Use this to make your app sign transactions */
    account_name appOwner() {
        return AppSettings(code, _self).get().app_owner;
    }

    inline static uint64_t hashStr( const string& strkey ){
        return hash<string>{}(strkey);
    }

    // @abi table users i64
    struct User {
        uint64_t     keyid;
        string       username;
        account_name account;
        uint64_t     score;

        uuid primary_key() const { return keyid; }
        EOSLIB_SERIALIZE(User, (keyid)(username)(account)(score))
    };

    struct AppConfig {
        account_name app_owner;

        account_name primary_key() const { return app_owner; }
        EOSLIB_SERIALIZE(AppConfig, (app_owner))
    };

    typedef singleton<N(appconfig), AppConfig>  AppSettings;
    typedef multi_index<N(users), User>         Users;

};