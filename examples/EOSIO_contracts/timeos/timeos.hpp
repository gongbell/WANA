#include <eosiolib/eosio.hpp>

namespace timeos {

   class timeos : public eosio::contract {
      public:
         timeos(account_name contract_name) : eosio::contract(contract_name) {}

         //@abi action
         void createts(const account_name owner, const std::string& data);
         //@abi action
         void removets(const account_name owner, const uint64_t pkey);
         //@abi action
         void getts(const account_name owner);

         //@abi table timestamp i64
         struct timestamp {
            uint64_t pkey;
            time time;
            //TODO: is this the best choice for type?
            std::string data;

            uint64_t primary_key() const {
               return pkey;
            }

            uint64_t get_reverse_order() const {
               //TODO: check if order is right
               return ~(static_cast<uint64_t>(time));
               return ~pkey;
            }

            EOSLIB_SERIALIZE(timestamp, (pkey)(time)(data))
         };

         typedef eosio::multi_index< N(timestamp), timestamp, eosio::indexed_by<
            N(reverse),
            eosio::const_mem_fun<timestamp, uint64_t, &timestamp::get_reverse_order>
         > > timestamps;
   };

}

