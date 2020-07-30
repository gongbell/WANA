#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <stdio.h>

#include "tokenlock.hpp"

using namespace eosio;
using namespace std;

using eosio::print;

class tokenlock : public eosio::contract {
  public:
      using contract::contract;

       /// @abi action
       void transfer(name from,
                     name to,
                     asset quantity,
                     string memo ) {

            // Detect: vulnerability!
            require_auth( from );

            lockup_table locks(_self, from);

            auto lock = locks.find(quantity.symbol.name());
            if ( lock != locks.end() ){
                eosio_assert(!lock->locked, "Tokens are locked");
                eosio_assert(lock->unlock_time <= current_time(),
                        "Tokens have not finished their unlocking period");
            }
        }

      /// @abi action
      void lock(name user, asset tok, uint64_t time ) {
          require_auth( user );

          lockup_table locks(_self, user);

          auto lock = locks.find(tok.symbol.name());

          if ( lock == locks.end() ){
              locks.emplace(_self, [&](lockup &l) {
                  l.symbol = tok.symbol.name();
                  l.locked = 1;
                  l.unlock_time = 0;
                  l.unlock_delay = time;
              });
          }
          else {
              /* Prevent someone re-locking with a shorter unlock time and then unlocking */
              if (lock->locked){
                  eosio_assert(time > lock->unlock_delay,
                        "Cannot decrease the lock time while locked, unlock first");
              }

              locks.modify(lock, _self, [&](lockup &l) {
                  l.locked = 1;
                  l.unlock_time = 0;
                  l.unlock_delay = time;
              });
          }
      }
      /// @abi action
      void unlock(name user, asset tok) {
          require_auth( user );

          lockup_table locks(_self, user);

          auto lock = locks.find(tok.symbol.name());
          eosio_assert(lock != locks.end(), "Token is not managed");
          eosio_assert(lock->locked, "Token is not locked, cannot unlock");

          locks.modify(lock, _self, [&](lockup &l) {
              l.locked = 0;
              l.unlock_time = current_time() + l.unlock_delay * 1000000;
          } ) ;

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

EOSIO_ABI_EX(tokenlock,
        (transfer)
        (lock)
        (unlock)
)
