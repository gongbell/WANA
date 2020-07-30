#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

#include <string>

using namespace eosio;
using std::string;

/*
  Some helpful abbreviations / definitions:

  tg      = Toll Gate         (e.g. Garden State Pkwy Exit 6 Northbound)
  tgu     = Toll Gate User    (this would be like a rider / payer)
  tgb     = Toll Gate Breach  (when a vehicle breaches a toll gate)
  vehicle = Container of Toll Gate Users, Users enter / exit vehicles
  "rider" = when a user is in a vehicle, they are a rider

  tg, tgu, and vehicles are all accounts
  many activities require multisig:
    - vehicle + tg sign each breach
    - vehicle + tgu sign entering and existing vehicle

*/

class tolls: public contract {
public:
  tolls(account_name self) : contract (self) {}

  // @abi action
[[eosio::action]]
  void createtg (  const account_name    account,
                   const string&         gatename,
                   uint32_t              latitude,
                   uint32_t              longitude,
                   const string&         highway_name,
                   uint32_t              highway_number,
                   const string&         direction,
                   uint32_t              tollamount);//,

  // @abi action
[[eosio::action]]
  void createtgu ( const account_name   account);

  // @abi action
[[eosio::action]]
  void breachtg (  const uint32_t       breachId,
                   const account_name   tg,
                   const account_name   vehicleacct);

  // @abi action
[[eosio::action]]
  void createveh ( const account_name,
                   const uint32_t);

  // @abi action
[[eosio::action]]
  void addrider ( const account_name vehaccount,
                  const account_name ridaccout);

  // @abi action
[[eosio::action]]
  void remrider ( const account_name vehaccount,
                  const account_name ridaccout);

  // @abi action
[[eosio::action]]
  void cleartgbs (const account_name);

  // @abi action
[[eosio::action]]
  void cleartgus (const account_name);

  // @abi action
[[eosio::action]]
  void cleartgs (const account_name);

  // @abi action
[[eosio::action]]
  void clearall (const account_name);

  // @abi action
[[eosio::action]]
  void byvehicle (const account_name);

private:

    // @abi table tgs i64
    struct tg {
      account_name    account;
      string          gatename;
      uint32_t        latitude;
      uint32_t        longitude;
      string          highway_name;
      uint32_t        highway_number;
      string          direction;
      uint32_t        tollamount;

      account_name primary_key() const { return account; }

      EOSLIB_SERIALIZE(tg, (account)(gatename)(latitude)(longitude)(highway_name)(highway_number)(direction)(tollamount))
    };

    typedef eosio::multi_index<N(tgs), tg> tg_table;

    // @abi table tgbs i64
    struct tgb {
      // experimenting with Dapp-generated primary key
      // and blockchain generated primary key
      uint32_t        pkey;     // b-chain generated
      uint32_t        breachId; // dapp generated
      account_name    tg;
      account_name    vehicle;
      uint32_t        timestamp;
      uint32_t        tollamount;

      uint32_t primary_key() const { return  breachId; }
      account_name     by_vehicle() const { return vehicle; }
      EOSLIB_SERIALIZE(tgb, (pkey)(breachId)(tg)(vehicle)(timestamp)(tollamount));
    };

    typedef eosio::multi_index<N(tgbs), tgb,
            indexed_by< N(tgu),
                const_mem_fun<tgb, account_name, &tgb::by_vehicle>
            >
        > tgb_table;

    // @abi table tgus i64
    struct tgu {
      account_name    account;
      uint32_t        balance;
      uint32_t        timein;

      account_name primary_key() const {return account; }
      EOSLIB_SERIALIZE(tgu, (account)(balance)(timein));
    };

    typedef eosio::multi_index<N(tgus), tgu> tgu_table;

    // @abi table vehicles i64
    struct vehicle {
      account_name          account;
      uint32_t              hourly_rate;
      vector<account_name>  riders;

      account_name primary_key() const { return account; }
      EOSLIB_SERIALIZE(vehicle, (account)(hourly_rate)(riders));
    };

    typedef eosio::multi_index<N(vehicles), vehicle> veh_table;

};

EOSIO_ABI(tolls, (createtg)(createtgu)(createveh)(addrider)(remrider)(breachtg)(cleartgbs)(cleartgs)(cleartgus)(clearall)(byvehicle))
