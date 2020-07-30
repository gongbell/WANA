#include "keepscore.hpp"

void keepscore::init(account_name app_owner) {
        require_auth(_self);
        require_auth(app_owner);

        eosio_assert(!AppSettings(code,_self).exists(),
                     "App already exists");

        // construct new singleton data type AppConfig
        AppSettings(code,_self).set(AppConfig{app_owner}, _self);
        print("App created with account: ", name{app_owner});
}

void keepscore::scored(string&             username,
                       const account_name  account,
                       uint64_t            new_score) {
    require_auth(appOwner());
    require_auth(account);

    uuid keyid = hashStr(username);

    Users users(_self, _self);

    auto itr = users.find(keyid);

    if (itr ==  users.end()) {
        print("Creating new user ", username.c_str());

        users.emplace(/* billed to */account, [&](auto& u) {
            u.keyid    = keyid;
            u.username = username;
            u.account  = account;
            u.score    = new_score;
        });
    }
    else if (itr != users.end()) {
        print("Updating ", username.c_str(), "'s score");

        users.modify(itr, 0, [&](auto& u) {
            u.score = new_score;
        });
    }

}

void keepscore::remove(string& username, account_name account) {
    require_auth(appOwner());
    require_auth(account);

    uuid keyid = hashStr(username);

    Users users(_self, _self);

    auto itr = users.find(keyid);

    eosio_assert(itr != users.end(), "User name does not exist!");
    users.erase(itr);
}

EOSIO_ABI(keepscore, (init)(scored)(remove))