#include <newapp1.hpp>

void newapp1::hello(account_name account) {
    print("Hello, ", name{account});
}

void newapp1::create(const account_name account,
                     const string&      username,
                     const string&      bio,
                     uint32_t           age) {
    require_auth(account);

    profile_table profile(_self,_self);

    auto itr = profile.find(account);

    eosio_assert(itr == profile.end(), "Account already has a profile");

    profile.emplace(account, [&](auto& p) {
        p.account  = account;
        p.username = username;
        p.bio      = bio;
        p.age      = age;
    });

    print(name{account}, " profile created");
}

void newapp1::update(const account_name account,
            const string&      username,
            const string&      bio,
            uint32_t           age) {
    require_auth(account);

    profile_table profile(_self,_self);

    auto itr = profile.find(account);

    eosio_assert(itr != profile.end(), "Account does not have a profile");

    profile.modify(itr, account, [&](auto& p) {
        p.username = username;
        p.bio      = bio;
        p.age      = age;
    });

    print(name{account}, " modified");
}

void newapp1::remove(const account_name account) {
    require_auth(account);

    profile_table profile(_self,_self);

    auto itr = profile.find(account);

    eosio_assert(itr != profile.end(), "Account does not have a profile");

    profile.erase(itr);
    print(name{account}, " profile removed");
}

void newapp1::get(const account_name account) {
    profile_table profile(_self,_self);

    auto itr = profile.find(account);

    eosio_assert(itr != profile.end(), "Account does not have a profile");

    print("Account: ",  name{itr->account},    " , ");
    print("Username: ", itr->username.c_str(), " , ");
    print("Bio: ",      itr->bio.c_str(),      " , ");
    print("Age: ",      itr->age);
}

void newapp1::byage(uint32_t age) {
    profile_table profile(_self, _self);

    auto age_index = profile.get_index<N(age)>();

    auto itr = age_index.lower_bound(age);

    for(; itr != age_index.end() && itr->age == age; ++itr)
        print(name{itr->account}, " is ", itr->age, " years old\n");
}

void newapp1::rangeage(uint32_t younger, uint32_t older) {
    profile_table profile(_self, _self);

    auto age_index = profile.get_index<N(age)>();

    auto begin = age_index.lower_bound(younger);
    auto end   = age_index.upper_bound(older);

    for_each(begin, end, [&](auto& p) {
        print(name{p.account}, " is ", p.age, " years old\n");
    });
}