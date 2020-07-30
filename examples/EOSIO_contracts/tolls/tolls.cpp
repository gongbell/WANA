#include "tolls.hpp"

void tolls::createtg (const account_name account,
                      const string&         gatename,
                      uint32_t              latitude,
                      uint32_t              longitude,
                      const string&         highway_name,
                      uint32_t              highway_number,
                      const string&         direction,
                      uint32_t              tollamount) {

  require_auth (account);

  tg_table tg(_self, _self);

  auto itr = tg.find(account);
  eosio_assert(itr == tg.end(), "Tollgate (tg) already exists");

  tg.emplace(account, [&](auto& t) {
    t.account         = account;
    t.gatename        = gatename;
    t.latitude        = latitude;
    t.longitude       = longitude;
    t.highway_name    = highway_name;
    t.highway_number  = highway_number;
    t.direction       = direction;
    t.tollamount      = tollamount;
  });

  print (name{account}, " Tollgate (tg) created.");
}

void tolls::createtgu(const account_name account) {

  tgu_table tgu(_self, _self);
  auto itr = tgu.find(account);
  eosio_assert(itr == tgu.end(), "Tollgate User (tgu) already exists");

  tgu.emplace (account, [&](auto& t) {
    t.account      = account;
    t.balance      = 0;
    t.timein       = 0;
  });

  print (name{account}, " Tollgate User (tgu) created.");
}

void tolls::breachtg(   const uint32_t breachId,
                        const account_name tg,
                        const account_name vehicleacct)  {
  require_auth (tg);
  require_auth (vehicleacct);

  tg_table tg_t(_self, _self);
  auto tg_itr = tg_t.find(tg);
  eosio_assert(tg_itr != tg_t.end(), "Toll gate does not exist.");

  // add toll gate breach
  tgb_table tgb(_self, _self);
  tgb.emplace(vehicleacct, [&](auto& t) {
    t.pkey                = tgb.available_primary_key();
    t.breachId            = breachId;
    t.tg                  = tg;
    t.vehicle             = vehicleacct;
    t.timestamp           = now();
    t.tollamount          = tg_itr->tollamount;
  });

  //increment balance on the toll gate user table
  veh_table vehicle(_self, _self);
  tgu_table tgu_t(_self, _self);

  auto v_itr = vehicle.find(vehicleacct);
  eosio_assert(v_itr != vehicle.end(), "Vehicle does not exist");

  for (auto rider : v_itr->riders) {
    auto itr = tgu_t.find(rider);
    eosio_assert(itr != tgu_t.end(), "Tollgate User (tgu) does not exist.");
    tgu_t.modify(itr, rider, [&](auto& t) {
      // rider pays the total toll divided by # of riders
      t.balance = t.balance + (tg_itr->tollamount / v_itr->riders.size());
    });
  }

  print (name{tg}, " tollgate (tg) breached.");
}

void tolls::createveh (const account_name account,
                      const uint32_t hourly_rate) {

  require_auth(account);
  veh_table vehicle(_self, _self);
  auto itr = vehicle.find(account);
  eosio_assert(itr == vehicle.end(), "Vehicle already exists");

  vehicle.emplace (account, [&](auto& v) {
    v.account      = account;
    v.hourly_rate  = hourly_rate;
  });

  print (name{account}, " vehicle created.");
}

void tolls::addrider (const account_name vehaccount,
                      const account_name ridaccount) {
  require_auth(ridaccount);
  require_auth(vehaccount);
  veh_table vehicle(_self, _self);
  auto itr = vehicle.find(vehaccount);
  eosio_assert(itr != vehicle.end(), "Vehicle does not exist");

  vehicle.modify (itr, vehaccount, [&](auto& v) {
    v.riders.push_back (ridaccount);
  });

  tgu_table tgu_t(_self, _self);
  auto r_itr = tgu_t.find(ridaccount);
  eosio_assert(r_itr != tgu_t.end(), "Rider does not exist as a user.");
  eosio_assert(r_itr->timein == 0, "Rider is already in a vehicle.");

  tgu_t.modify(r_itr, ridaccount, [&](auto& t) {
    t.timein = now();
  });
}

void tolls::remrider (const account_name vehaccount,
                      const account_name ridaccount) {
  require_auth(ridaccount);
  require_auth(vehaccount);
  veh_table vehicle(_self, _self);
  auto v_itr = vehicle.find(vehaccount);
  eosio_assert(v_itr != vehicle.end(), "Vehicle does not exist");

  vehicle.modify (v_itr, vehaccount, [&](auto& v) {
    v.riders.erase(std::remove(v.riders.begin(), v.riders.end(), ridaccount), v.riders.end());
    print (name{ridaccount}, " checked out of vehicle ", name{vehaccount});
  });

  tgu_table tgu_t(_self, _self);
  auto r_itr = tgu_t.find(ridaccount);
  eosio_assert(r_itr != tgu_t.end(), "Rider does not exist as a user.");

  tgu_t.modify(r_itr, ridaccount, [&](auto& t) {
    t.balance = t.balance + (now() - t.timein) * (v_itr->hourly_rate / 60 / 60);
    t.timein = 0;
  });
}

void tolls::cleartgus (const account_name acct) {

  require_auth(acct);
  tgu_table tgu(_self, _self);
  int counter = 0;
  auto iterator = tgu.begin();
  while (iterator != tgu.end()) {
    iterator = tgu.erase(iterator);
    counter++;
  }
  print (counter, " toll gate user records erased.");
}

void tolls::cleartgs (const account_name acct) {

  require_auth(acct);
  tg_table tgs(_self, _self);
  int counter = 0;
  auto iterator = tgs.begin();
  while (iterator != tgs.end()) {
    iterator = tgs.erase(iterator);
    counter++;
  }
  print (counter, " toll gate records erased.");
}

void tolls::cleartgbs (const account_name acct) {

  require_auth(acct);
  tgb_table tgb(_self, _self);
  int counter = 0;
  auto iterator = tgb.begin();
  while (iterator != tgb.end()) {
    iterator = tgb.erase(iterator);
    counter++;
  }
  print (counter, " toll gate breach records erased.");
}

void tolls::clearall (const account_name acct) {
  cleartgbs(acct);
  cleartgs(acct);
  cleartgus(acct);
}

void tolls::byvehicle(account_name account) {
    tgb_table tgb(_self, _self);

    auto user_index = tgb.get_index<N(tgu)>();

    auto itr = user_index.lower_bound(account);

    for(; itr != user_index.end() && itr->vehicle == account; ++itr)
        print(name{itr->vehicle}, " breached ", itr->tg, " on ", itr->timestamp, "...");
}
