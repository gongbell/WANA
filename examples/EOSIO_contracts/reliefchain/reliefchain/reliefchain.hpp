#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/print.hpp>

#include <string>

using namespace eosio;
using eosio::asset;
using std::string;

class reliefchain: public contract {
public:
  reliefchain(account_name self) : contract (self) {}

  // @abi action addngo
  void addngo (const account_name    account,
                   const asset&         balancev,
                   const string&         ngo_name,
                   uint32_t              totalvolunteers,
                   uint32_t              activevolunteers);

  // @abi action addcitizen
  void addcitizen (const account_name    account,
                   const asset&         balancev,
                   const string&         citizen_name,
                   bool              isvolunteer,
                   const string&         statusLiving,
                   const string&         biometrichash);

  // @abi action adddisaster
  void adddisaster (const account_name    account,
                   const asset&         balancev,
                   const string&         disaster_name,
                   uint32_t              ufood,
                   uint32_t              ucloth,
                   uint32_t              uwater,
                   uint32_t              umed,
                   uint32_t              activevolunteers,
                   uint32_t              reliefedcitizens);
  
  // @abi action verifycits
  void verifycits (const account_name    citizen_account,
                   const account_name    disaster_account,
                   uint32_t              ufood,
                   uint32_t              ucloth,
                   uint32_t              uwater,
                   uint32_t              umed,
                   const string&        statusLiving);

private:

    // @abi table ngo i64
    struct ngo {
      account_name    account;
      asset           balancev;
      string          ngo_name;
      uint32_t        totalvolunteers;
      uint32_t        activevolunteers;

      account_name primary_key() const { return account; }

      EOSLIB_SERIALIZE(ngo, (account)(balancev)(ngo_name)(totalvolunteers)(activevolunteers))
    };

    typedef eosio::multi_index<N(ngo), ngo> ngo_table;

    // @abi table citizen i64
    struct citizen {
      account_name    account;
      asset           balancev;
      string          citizen_name;
      bool        isvolunteer;
      string        statusLiving;
      string        biometrichash;

      account_name primary_key() const { return account; }

      EOSLIB_SERIALIZE(citizen, (account)(balancev)(citizen_name)(isvolunteer)(statusLiving)(biometrichash))
    };

    typedef eosio::multi_index<N(citizen), citizen> citizen_table;

    // @abi table disaster i64
    struct disaster {
      account_name    account;
      asset           balancev;
      string          disaster_name;
      uint32_t        ufood;
      uint32_t        ucloth;
      uint32_t        uwater;
      uint32_t        umed;
      uint32_t        activevolunteers;
      uint32_t        reliefedcitizens;

      account_name primary_key() const { return account; }

      EOSLIB_SERIALIZE(disaster, (account)(balancev)(disaster_name)(ufood)(ucloth)(uwater)(umed)(activevolunteers)(reliefedcitizens))
    };

    typedef eosio::multi_index<N(disaster), disaster> disaster_table;
};

EOSIO_ABI(reliefchain, (addngo)(addcitizen)(adddisaster)(verifycits))
