//
// Created by Hongbo Tang on 2018/7/5.
//

#include "signupeoseos.hpp"

void signupeoseos::transfer(account_name from, account_name to, asset quantity, string memo) {
    if (from == _self || to != _self) {
        return;
    }
    eosio_assert(quantity.symbol == CORE_SYMBOL, "signupeoseos only accepts CORE for signup eos account");
    eosio_assert(quantity.is_valid(), "Invalid token transfer");
    eosio_assert(quantity.amount > 0, "Quantity must be positive");

    memo.erase(memo.begin(), find_if(memo.begin(), memo.end(), [](int ch) {
        return !isspace(ch);
    }));
    memo.erase(find_if(memo.rbegin(), memo.rend(), [](int ch) {
        return !isspace(ch);
    }).base(), memo.end());

    auto separator_pos = memo.find(' ');
    if (separator_pos == string::npos) {
        separator_pos = memo.find('-');
    }
    eosio_assert(separator_pos != string::npos, "Account name and other command must be separated with space or minuses");

    string account_name_str = memo.substr(0, separator_pos);
    eosio_assert(account_name_str.length() == 12, "Length of account name should be 12");
    account_name new_account_name = string_to_name(account_name_str.c_str());

    string public_key_str = memo.substr(separator_pos + 1);
    eosio_assert(public_key_str.length() == 53, "Length of publik key should be 53");

    string pubkey_prefix("EOS");
    auto result = mismatch(pubkey_prefix.begin(), pubkey_prefix.end(), public_key_str.begin());
    eosio_assert(result.first == pubkey_prefix.end(), "Public key should be prefix with EOS");
    auto base58substr = public_key_str.substr(pubkey_prefix.length());

    vector<unsigned char> vch;
    eosio_assert(decode_base58(base58substr, vch), "Decode pubkey failed");
    eosio_assert(vch.size() == 37, "Invalid public key");

    array<unsigned char,33> pubkey_data;
    copy_n(vch.begin(), 33, pubkey_data.begin());

    checksum160 check_pubkey;
    ripemd160(reinterpret_cast<char *>(pubkey_data.data()), 33, &check_pubkey);
    eosio_assert(memcmp(&check_pubkey.hash, &vch.end()[-4], 4) == 0, "invalid public key");

    asset stake_net(1000, CORE_SYMBOL);
    asset stake_cpu(1000, CORE_SYMBOL);
    asset buy_ram = quantity - stake_net - stake_cpu;
    eosio_assert(buy_ram.amount > 0, "Not enough balance to buy ram");

    signup_public_key pubkey = {
        .type = 0,
        .data = pubkey_data,
    };
    key_weight pubkey_weight = {
        .key = pubkey,
        .weight = 1,
    };
    authority owner = authority{
        .threshold = 1,
        .keys = {pubkey_weight},
        .accounts = {},
        .waits = {}
    };
    authority active = authority{
        .threshold = 1,
        .keys = {pubkey_weight},
        .accounts = {},
        .waits = {}
    };
    newaccount new_account = newaccount{
        .creator = _self,
        .name = new_account_name,
        .owner = owner,
        .active = active
    };

    action(
            permission_level{ _self, N(active) },
            N(eosio),
            N(newaccount),
            new_account
    ).send();

    action(
            permission_level{ _self, N(active)},
            N(eosio),
            N(buyram),
            make_tuple(_self, new_account_name, buy_ram)
    ).send();

    action(
            permission_level{ _self, N(active)},
            N(eosio),
            N(delegatebw),
            make_tuple(_self, new_account_name, stake_net, stake_cpu, true)
    ).send();
}