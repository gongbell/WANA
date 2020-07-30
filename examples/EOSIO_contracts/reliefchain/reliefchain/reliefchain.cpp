#include <reliefchain.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/action.hpp>
#include <iostream>
#include <stdio.h>      /* printf, scanf, puts, NULL */
#include <time.h>       /* time */

using namespace std;
using namespace eosio;
using eosio::permission_level;

/* ADD a NGO */
void reliefchain::addngo (const account_name    account,
                   const asset&         balancev,
                   const string&         ngo_name,
                   uint32_t              totalvolunteers,
                   uint32_t              activevolunteers) {

  require_auth (account);

  ngo_table ngo(_self, account);

  auto itr = ngo.find(account);
  eosio_assert(itr == ngo.end(), "ngo already exists");

  ngo.emplace(account, [&]( auto& t) {
    t.account         = account;
    t.balancev        = balancev;
    t.ngo_name        = ngo_name;
    t.totalvolunteers        = totalvolunteers;
    t.activevolunteers       = activevolunteers;
  });

  print (name{account}, " ngo created.");
}

/* ADD a CITIZEN */
void reliefchain::addcitizen (const account_name    account,
                   const asset&         balancev,
                   const string&         citizen_name,
                   bool              isvolunteer,
                   const string&        statusLiving,
                   const string&        biometrichash) {

  require_auth (account);

  citizen_table citizen(_self, account);

  auto itr = citizen.find(account);
  eosio_assert(itr == citizen.end(), "citizen already exists");

  citizen.emplace(account, [&](auto& t) {
    t.account         = account;
    t.balancev        = balancev;
    t.citizen_name        = citizen_name;
    t.isvolunteer        = isvolunteer;
    t.statusLiving        = statusLiving;
    t.biometrichash        = biometrichash;
  });

  print (name{account}, " citizen created.");
}

/* ADD a DISASTER */
void reliefchain::adddisaster (const account_name    account,
                   const asset&         balancev,
                   const string&         disaster_name,
                   uint32_t              ufood,
                   uint32_t              ucloth,
                   uint32_t              uwater,
                   uint32_t              umed,
                   uint32_t              activevolunteers,
                   uint32_t              reliefedcitizens) {

  require_auth (account);

  disaster_table disaster(_self, account);

  auto itr = disaster.find(account);
  eosio_assert(itr == disaster.end(), "disaster event already exists");

  disaster.emplace(account, [&](auto& t) {
    t.account         = account;
    t.balancev        = balancev;
    t.disaster_name        = disaster_name;
    t.ufood        = ufood;
    t.ucloth        = ucloth;
    t.uwater        = uwater;
    t.umed        = umed;
    t.activevolunteers        = activevolunteers;
    t.reliefedcitizens        = reliefedcitizens;
  });

  print (name{account}, " disaster event created.");
}

/* Verify a citizen */
void reliefchain::verifycits (const account_name    citizen_account,
                   const account_name    disaster_account,
                   uint32_t              ufood,
                   uint32_t              ucloth,
                   uint32_t              uwater,
                   uint32_t              umed,
                   const string&        statusLiving) {

  require_auth (disaster_account);

  //Check if disaster exists
  disaster_table disaster(_self, disaster_account);
  auto itr = disaster.find(disaster_account);
  eosio_assert(itr != disaster.end(), "disaster not found");

  //Check if citizen exists
  citizen_table citizen(_self, citizen_account);
  auto itr2 = citizen.find(citizen_account);
  eosio_assert(itr2 != citizen.end(), "citizen not found");

  disaster.modify(itr, disaster_account, [&](auto& t) {
    t.account         = disaster_account;
    t.ufood        = ufood;
    t.ucloth        = ucloth;
    t.uwater        = uwater;
    t.umed    = umed;
  });

  citizen.modify(itr2, citizen_account, [&](auto& t) {
    t.account         = citizen_account;
    t.statusLiving         = statusLiving;
  });

  print (name{disaster_account}, " disaster updated.");
  print (name{citizen_account}, " citizen status updated.");

}

