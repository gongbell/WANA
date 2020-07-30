#include "tungsten.hpp"

void tungsten::createbond(account_name creator, account_name bond_name, asset deposit,
                          string ricardian, uint64_t expiration, account_name arbitrator) {
    require_auth(creator);

    eosio_assert(bond_name != 0, "Bond name is required");
    eosio_assert(deposit.symbol == S(4, EOS), "Deposit must be in the system token and with the same precision");
    eosio_assert(deposit.amount > 0, "Deposit amount must be greater than zero");
    eosio_assert(ricardian.length() > 0, "Ricardian contract is required");
    eosio_assert(expiration > now(), "Expiration date must be in the future");
    eosio_assert(is_account(arbitrator), "Arbitrator must be a real account");

    bonds_table bonds(_self, _self);
    bonds.emplace(creator, [&](bond_type &bond) {
        bond.creator = creator;
        bond.name = bond_name;
        bond.deposit = deposit;
        bond.ricardian = ricardian;
        bond.expiration = expiration;
        bond.arbitrator = arbitrator;
    });

    action(permission_level{creator, N(active)},
           N(eosio.token), N(transfer),
           std::make_tuple(creator, _self, deposit,
                           string("Security deposit for bond ") + name{bond_name}.to_string()))
        .send();
}

void tungsten::renewbond(account_name bond_name, uint64_t expiration) {
    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(bond_name, "Unable to find bond with the provided name");

    require_auth(bond.creator);

    eosio_assert(expiration > bond.expiration, "New expiration time should be after the current one");

    bonds.modify(bond, 0, [&expiration](bond_type &bond) {
        bond.expiration = expiration;
    });
}

void tungsten::closebond(account_name bond_name) {
    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(bond_name, "Unable to find bond with the provided name");

    require_auth(bond.creator);

    eosio_assert(bond.active_claims == 0, "Cannot close a bond that still has active claims");
    eosio_assert(bond.expiration <= now() || bond.deposit.amount == 0,
                 "Bond has not expired yet and still has funds to claim");

    bonds.erase(bond);

    if (bond.deposit.amount != 0) {
        action(permission_level{_self, N(active)},
               N(eosio.token), N(transfer),
               std::make_tuple(_self, bond.creator, bond.deposit,
                               string("Close bond ") + name{bond_name}.to_string()))
            .send();
    }
}

void tungsten::createclaim(account_name claimer, account_name bond_name,
                           account_name claim_name, asset amount, string details, string language) {
    require_auth(claimer);

    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(bond_name, "Unable to find bond with the provided name");

    eosio_assert(claim_name != 0, "Claim name is required");
    eosio_assert(bond.deposit.amount > 0, "There are no funds remaining in the deposit of the bond");
    eosio_assert(details.length() > 0, "Must provide details of the claim");
    eosio_assert(language.length() > 0, "Must provide language of the details of the claim");

    eosio_assert(amount.symbol == S(4, EOS),
                 "Claimed amount must be in the system token and with the same precision");
    eosio_assert(amount.amount > 0, "Claim amount must be positive");
    int64_t deposit = amount.amount * this->claim_security_deposit;
    int64_t fee = deposit * this->arbitrator_fee;
    eosio_assert(deposit > 0 && fee > 0, "Claim amount is too small");

    bonds.modify(bond, 0, [&](bond_type &bond) {
        bond.active_claims++;
    });

    claims_table claims(_self, _self);
    claims.emplace(claimer, [&](claim_type &claim) {
        claim.name = claim_name;
        claim.claimer = claimer;
        claim.bond_name = bond_name;
        claim.amount = amount;
        claim.details = details;
        claim.language = language;
        claim.expiration = now() + this->claim_expiration;
    });

    action(permission_level{claimer, N(active)},
           N(eosio.token), N(transfer),
           std::make_tuple(claimer, _self, asset(deposit, S(4, EOS)),
                           string("Security deposit for claim ") + name{claim_name}.to_string()))
        .send();
}

void tungsten::delayclaim(account_name claim_name) {
    claims_table claims(_self, _self);
    auto &claim = claims.get(claim_name, "Unable to find claim with the provided name");
    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(claim.bond_name, "Unable to find bond associated with the claim");

    require_auth(bond.arbitrator);

    eosio_assert(claim.expiration > now(), "This claim has already expired");

    claims.modify(claim, 0, [this](claim_type &claim) {
        claim.expiration += this->claim_expiration_extension;
    });
}

void tungsten::ruleclaim(account_name claim_name, bool authorize, string details) {
    claims_table claims(_self, _self);
    auto &claim = claims.get(claim_name, "Unable to find claim with the provided name");
    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(claim.bond_name, "Unable to find bond associated with the claim");

    require_auth(bond.arbitrator);

    eosio_assert(claim.expiration > now(), "Claim has already expired");
    eosio_assert(bond.deposit.amount > 0, "Cannot rule a claim on a bond with a depleted deposit");

    asset balance = asset(claim.amount.amount * this->claim_security_deposit, S(4, EOS));
    asset arbitrator_fee = asset(balance.amount * this->arbitrator_fee, S(4, EOS));
    balance -= arbitrator_fee;

    action(permission_level{_self, N(active)},
           N(eosio.token), N(transfer),
           std::make_tuple(_self, bond.arbitrator, arbitrator_fee,
                           string("Arbitration fee for claim ") + name{claim_name}.to_string()))
        .send();

    if (authorize) {
        if (claim.amount <= bond.deposit) {
            balance += claim.amount;
            bonds.modify(bond, 0, [&](bond_type &bond) {
                bond.deposit -= claim.amount;
            });
        } else {
            balance += bond.deposit;
            bonds.modify(bond, 0, [&](bond_type &bond) {
                bond.deposit = asset(0, S(4, EOS));
            });
        }
        action(permission_level{_self, N(active)},
               N(eosio.token), N(transfer),
               std::make_tuple(_self, claim.claimer, balance,
                               string("Approved claim ") + name{claim_name}.to_string()))
            .send();
    } else {
        action(permission_level{_self, N(active)},
               N(eosio.token), N(transfer),
               std::make_tuple(_self, bond.creator, balance,
                               string("Compensation for rejected claim ") + name{claim_name}.to_string()))
            .send();
    }

    claims.erase(claim);
    bonds.modify(bond, 0, [](bond_type &bond) {
        bond.active_claims--;
    });
}

void tungsten::closeclaim(account_name claim_name) {
    claims_table claims(_self, _self);
    auto &claim = claims.get(claim_name, "Unable to find claim with the provided name");
    bonds_table bonds(_self, _self);
    auto &bond = bonds.get(claim.bond_name, "Unable to find bond associated with the claim");

    require_auth(claim.claimer);

    eosio_assert(now() >= claim.expiration || bond.deposit.amount == 0,
                 "Cannot close a claim that hasn't expired yet and still has funds to claim");

    action(permission_level{_self, N(active)},
           N(eosio.token), N(transfer),
           std::make_tuple(_self, claim.claimer,
                           asset(claim.amount.amount * this->claim_security_deposit, S(4, EOS)),
                           string("Closed claim ") + name{claim_name}.to_string()))
        .send();

    claims.erase(claim);
    bonds.modify(bond, 0, [](bond_type &bond) {
        bond.active_claims--;
    });
}
