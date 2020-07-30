#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/asset.hpp>
#include <string>
#include <stdio.h>

#include "timelock.hpp"

using namespace eosio;
using namespace std;

using eosio::print;

class timelock : public eosio::contract {
  public:
      using contract::contract;

      /// @abi action 
      void transfer(name from,
                      name to,
                      asset quantity,
                      string memo ) {

          require_auth( _self );

          if ( from != _self){
              // only transfers from this account
              return;
          }

          auto size = transaction_size();
          char* buffer = (char*)( 512 < size ? malloc(size) : alloca(size) );
          uint32_t read = read_transaction( buffer, size );
          eosio_assert( size == read, "read_transaction failed");

          transaction trx = eosio::unpack<transaction>(buffer, size);

          unsigned_int delay_sec = trx.delay_sec;
          unsigned_int required_delay = UINT32_MAX;
          // check that the delay satisfies the conditions

          delaylimit_table limits(_self, _self);
          auto lim = limits.begin();
          eosio_assert( lim != limits.end() , "No delays configured");

          while ( lim != limits.end() ){
              if ( quantity.amount >= lim->minimum.amount  && quantity.symbol == lim->minimum.symbol){
                  required_delay = lim->required_delay;
                  break;
              }
              lim++;
          }

          eosio_assert( (unsigned int)required_delay < UINT32_MAX, "Required delay not found for this token");

          char* dbg_buffer = (char*) alloca(100);
          int n;
          n = sprintf (dbg_buffer, "Delay was %d require %d\n", delay_sec, required_delay);
          eosio_assert( n < 100, "Debug print alloc fail" );

          print_f((const char *)dbg_buffer);

          eosio_assert( delay_sec >= required_delay, "Delay is not satisfied" );

          print("Delay was satisfied, tokens sent\n");
      }

      /*
       * Adds a new entry to the limits table, each row is evaluated in order of idx
       */
        void update( uint64_t idx, asset minimum, uint32_t required_delay ) {
            require_auth2( _self, N(owner) );

          delaylimit_table limits(_self, _self);


          auto lim = limits.find(idx);

          if ( lim == limits.end() ){
              limits.emplace(_self, [&](delaylimit &d) {
                  d.idx = idx;
                  d.minimum = minimum;
                  d.required_delay = required_delay;
              });
          }
          else {
              limits.modify(lim, _self, [&](delaylimit &d) {
                  d.minimum = minimum;
                  d.required_delay = required_delay;
              });
          }


        }

        /*
         * Resets the limits table, until new entries are added, all transfers will be blocked
         */
        void start(  ) {
            require_auth2( _self, N(owner) );

            delaylimit_table limits(_self, _self);

            auto it = limits.begin();
            while (it != limits.end()) {
                it = limits.erase(it);
            }
        }
};

#define EOSIO_ABI_EX(TYPE, MEMBERS) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      if( action == N(onerror)) { \
         /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
         eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account"); \
      } \
      auto self = receiver; \
      if( code == self || action == N(transfer) ) { \
         TYPE thiscontract( self ); \
         switch( action ) { \
            EOSIO_API( TYPE, MEMBERS ) \
         } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
      } \
   } \
}

EOSIO_ABI_EX(timelock,
        (transfer)
        (update)
        (start)
)
