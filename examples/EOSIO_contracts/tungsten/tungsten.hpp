#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/crypto.h>
#include <eosiolib/eosio.hpp>

using namespace eosio;
using std::string;

namespace models {
    //@abi table bonds i64
    struct bond_type {
        account_name name;
        account_name creator;
        asset deposit;
        string ricardian;
        uint64_t expiration;
        account_name arbitrator;
        uint32_t active_claims = 0;

        uint64_t primary_key() const { return name; }
    };

    typedef eosio::multi_index<N(bonds), bond_type> bonds_table;

    //@abi table claims i64
    struct claim_type {
        account_name name;
        account_name claimer;
        account_name bond_name;
        asset amount;
        string details;
        string language;
        uint64_t expiration;

        uint64_t primary_key() const { return name; }
    };

    typedef eosio::multi_index<N(claims), claim_type> claims_table;
}

using namespace models;

class tungsten : public contract {
  public:
    using contract::contract;

    const uint64_t claim_expiration = 7 * 24 * 60 * 60;
    const uint64_t claim_expiration_extension = 24 * 60 * 60;
    const float claim_security_deposit = 0.1;
    const float arbitrator_fee = 0.2;

    void createbond(account_name creator, account_name bond_name, asset deposit,
                    string ricardian, uint64_t expiration, account_name arbitrator);
    void renewbond(account_name bond_name, uint64_t expiration);
    void closebond(account_name bond_name);
    void createclaim(account_name claimer, account_name bond_name,
                     account_name claim_name, asset amount, string details, string language);
    void delayclaim(account_name claim_name);
    void ruleclaim(account_name claim_name, bool authorize, string details);
    void closeclaim(account_name claim_name);
};

EOSIO_ABI(tungsten, (createbond)(renewbond)(closebond)(createclaim)(delayclaim)(ruleclaim)(closeclaim))
