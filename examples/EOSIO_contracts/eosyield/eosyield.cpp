#include "eosyield.hpp"

using namespace std;

void eosyield::setowner(account_name new_owner)
{
    // Prevents typo: owner account must exist

    eosio_assert(is_account(new_owner), "Owner account does not exist");

    // Either the contract itself or the owner can set the new owner

    if (!has_auth(_self))
    {
        eosio_assert(yield.exists(), "Only contract itself can set the first owner");

        auto existingInfo = yield.get();
        require_auth(existingInfo.owner);
    }

    // Authentication done

    yield_info new_info{
        new_owner,
        time_point_sec(0)};
    yield.set(new_info, _self);
}

void eosyield::yieldcontrol(uint32_t yield_seconds)
{
    eosio_assert(yield.exists(), "Set contract owner before yielding control");

    // Only the owner can yield control

    auto info = yield.get();
    require_auth(info.owner);
    eosio_assert(info.expiration.utc_seconds == 0, "Contract control already yielded");
    info.expiration = time_point_sec(now() + yield_seconds);
    yield.set(info, _self);

    authority owner_active = authority{
        .threshold = 1,
        .keys = {},
        .accounts = {
            permission_level_weight{
                .permission = {_self, N(eosio.code)},
                .weight = 1}},
        .waits = {}};

    // Changes contract owner permission

    action(permission_level(_self, N(owner)), N(eosio), N(updateauth), updateauth_args{_self, N(active), N(owner), owner_active}).send();

    // Changes contract active permission

    action(permission_level(_self, N(owner)), N(eosio), N(updateauth), updateauth_args{_self, N(owner), 0, owner_active}).send();
}

void eosyield::extend(uint32_t new_yield_seconds)
{
    eosio_assert(yield.exists(), "Set contract owner first");

    // Only the owner can extend yield period

    auto info = yield.get();
    require_auth(info.owner);
    eosio_assert(info.expiration.utc_seconds != 0, "Contract control not yet yielded");

    // Can only extend forward

    time_point_sec new_expiration(now() + new_yield_seconds);
    eosio_assert(new_expiration.utc_seconds > info.expiration.utc_seconds, "The new expiration must be after the existing one");
    yield.set(info, _self);
}

void eosyield::regain()
{
    eosio_assert(yield.exists(), "Set contract owner first");

    // Only the owner can regain contract control

    auto info = yield.get();
    require_auth(info.owner);
    eosio_assert(info.expiration.utc_seconds != 0, "Contract control not yet yielded");
    eosio_assert(info.expiration.utc_seconds < now(), "Expiration not yet reached");
    info.expiration = time_point_sec(0);
    yield.set(info, _self);

    // Sort the permission

    permission_level_weight contract_permission{
        .permission = {_self, N(eosio.code)},
        .weight = 1};

    permission_level_weight owner_permission{
        .permission = {info.owner, N(active)},
        .weight = 1};

    vector<permission_level_weight> accounts;

    if (std::tie(contract_permission.permission.actor, contract_permission.permission.permission) < std::tie(owner_permission.permission.actor, owner_permission.permission.permission))
        accounts = {contract_permission, owner_permission};
    else
        accounts = {owner_permission, contract_permission};

    authority owner_active = authority{
        .threshold = 1,
        .keys = {},
        .accounts = accounts,
        .waits = {}};

    // Changes contract owner permission

    action(permission_level(_self, N(owner)), N(eosio), N(updateauth), updateauth_args{_self, N(active), N(owner), owner_active}).send();

    // Changes contract active permission

    action(permission_level(_self, N(owner)), N(eosio), N(updateauth), updateauth_args{_self, N(owner), 0, owner_active}).send();
}
