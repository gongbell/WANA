#include <eosiolib/eosio.hpp>
#include <eosiolib/contract.hpp>

using eosio::multi_index;
using eosio::indexed_by;
using eosio::const_mem_fun;
using eosio::print;
using eosio::name;

class autoservice : public eosio::contract {

public:

  autoservice(account_name self)
  :eosio::contract(self)
  {}

  // @abi action
  void newservice(account_name mechanic, account_name customer,
    uint32_t service_date, uint32_t odometer) {

    print("New service to ", name{mechanic}, " for ", name{customer});

    service_table_type service_table(_self, mechanic);
    service_table.emplace(mechanic, [&](auto& i) {
      i.pkey = service_table.available_primary_key();
      i.customer = customer;
      i.service_date = service_date;
      i.odometer = odometer;
    });
  }



private:

  // @abi table
  struct service {
    uint64_t     pkey;
    account_name customer;
    uint32_t     service_date;
    uint32_t     odometer;

    uint64_t      primary_key()  const { return pkey; }
    account_name  get_customer() const { return customer; }

    EOSLIB_SERIALIZE(service, (pkey)(customer)(service_date)(odometer))
  };

  typedef multi_index<N(service), service,
    indexed_by<N(bycustomer), const_mem_fun<service, account_name,  &service::get_customer>>> service_table_type;

  // @abi table
  struct customer {
    account_name account;
    uint64_t     last_service_date;
    uint32_t     odometer_at_last_service;
    uint32_t     latest_odometer;

    uint64_t primary_key() const { return account; }

    uint64_t get_last_service_date() const {
      return last_service_date;
    }

    uint64_t get_miles_since_service() const {
      return (latest_odometer - odometer_at_last_service);
    }

    EOSLIB_SERIALIZE(customer, (account)(last_service_date)(odometer_at_last_service)(latest_odometer))
  };

  typedef multi_index<N(customer), customer,
    indexed_by<N(bydate), const_mem_fun<customer, uint64_t,  &customer::get_last_service_date>>,
    indexed_by<N(bymiles), const_mem_fun<customer, uint64_t,  &customer::get_miles_since_service>>
    > customer_table_type;

};

EOSIO_ABI(autoservice, (newservice))
