#include <eosiolib/eosio.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/asset.hpp>


#define GYTZ_SYMBOL S(4,GYTZ)


namespace eosio {

const account_name TOKEN_ACCOUNT = N(mytokenaccnt);
const account_name TOKEN_ACTION_TRANSFER = N(transfer);


/**
 * FIXME:
 * The actual `eosio.token` transfer struct definition until its definition is accesible
 * from an actual `eosio.token.hpp` file. Until then, we define it ourself so
 * we can unpack the actual action data when a token transfer occurs inside
 * the `eosio.token` contract to this contract's account.
 */
struct token_transfer {
  account_name from;
  account_name to;
  asset quantity;
  std::string memo;
};


class myprofile : public contract {
public:

   explicit myprofile( account_name self )
            : contract( self ),
              blacklist( _self, _self ) {}

   /** ACTIONS **/

   /// @abi action
   void hi( account_name user ) {
      print( "Hello, ", name{user} );
   }

   // @abi action
   void blacklistadd( account_name account ) {
      require_auth( _self );

      auto blacklist_itr = blacklist.find( account );

      eosio_assert( blacklist_itr == blacklist.end(),
                   " account alreaded blacklisted");

      blacklist.emplace( _self, [&](auto& bl) {
         bl.account = account;
      });
   }

   // @abi action
   void blacklistrm( account_name account ) {
      require_auth( _self );

      auto blacklist_itr = blacklist.find( account );

      eosio_assert( blacklist_itr != blacklist.end(),
                    " account not on blacklist");

      const auto& blacklisted_account = *blacklist_itr;

      blacklist.erase( blacklisted_account );
   }

   /** CALLBACKS **/

   void cb_transfer() {
      token_transfer action = unpack_action_data<eosio::token_transfer>();

      auto blacklist_itr = blacklist.find( action.from );

      eosio_assert( blacklist_itr == blacklist.end(), " sender blacklisted");

      if (action.to == _self && action.quantity.symbol == GYTZ_SYMBOL) {
         print("You got ", action.quantity, " tokens!");
      }
   }

   /** NOTIFCATION **/

   static bool is_token_transfer(uint64_t code, uint64_t action) {
      return code == TOKEN_ACCOUNT && action == TOKEN_ACTION_TRANSFER;
   }

private:

   /// @abi table blacklist i64
   struct blacklist_row {
      account_name account;

      uint64_t primary_key() const { return account; }
   };

   typedef multi_index<N(blacklist), blacklist_row> blacklist_index;

   blacklist_index blacklist;

};


/**
 * SmartContract C entrypoint using a macro based on the list of action in the.
 * For each of defined action, a switch branch is added
 * automatically unpacking the data into the action's structure and dispatching
 * a method call to `action` define in this SmartContract.
 *
 * Each time a new action is added, EOSIO_API definition should be expanded with the
 * new action handler's method name.
 */
extern "C" {
void apply(uint64_t receiver, uint64_t code, uint64_t action) {
   auto self = receiver;
   if (code == self) {
      // Don't rename `thiscontract`, it's being use verbatim in `EOSIO_API` macro
      myprofile thiscontract(self);
      switch (action) { EOSIO_API(myprofile, (hi)(blacklistadd)(blacklistrm)) }

      eosio_exit(0);
   }

   if ( myprofile::is_token_transfer(code, action) ) {
      myprofile(self).cb_transfer();
      eosio_exit(0);
   }
}
}


}  /// namespace eosio
