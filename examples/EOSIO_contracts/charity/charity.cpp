
#include "charity.hpp"

namespace eosio
{


/// @abi action
void charity::hi(account_name user)
{
    print("Hello, ", name{user});
}

void charity::transfer(account_name from, account_name to, asset quantity, std::string memo)
{
    print("Receiving transfer message: from ", name{from}, " to ", name{to}, "\n");

    // only if charity receive EOS donation
    if(from != N(charity) && to == N(charity) && quantity.symbol == S(4, EOS) ) 
    {
        // define the table
        records trans_table(_self, from);

        // save the record.
        trans_table.emplace(_self, [&](auto &s) {
            s.id = trans_table.available_primary_key();
            s.from = from;
            s.to = to;
            s.quantity = quantity;
            s.memo = memo;
        });

        print("Issue some CHC token to ", name{from});

        // the quantity is 10 times of donation.
        asset quant{quantity.amount * 10, S(4, CHC)};

        // you should add eosio.code permission first, and then can send action to eosio.token contract.
        // $ cleos set account permission charity active '{"threshold": 1,"keys": [{"key": "EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4","weight": 1}],"accounts": [{"permission":{"actor":"charity","permission":"eosio.code"},"weight":1}]}' owner -p charity
        action(
            permission_level{ N(charity), N(active) },
            N(eosio.token), N(issue),
            std::make_tuple(from, quant, std::string("issue CHC"))
        ).send();
    }

}

} // namespace eosio


// modify form EOSIO_ABI
#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      auto self = receiver; \
      if( action == N(onerror)) { \
         /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
         eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account"); \
      } \
      if( ((code == self && action != N(transfer) ) || (code == N(eosio.token) && action == N(transfer)) || action == N(onerror)) ) { \
         TYPE thiscontract( self ); \
         switch( action ) { \
            EOSIO_API( TYPE, MEMBERS ) \
         } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
      } \
   } \
}

EOSIO_ABI_EX(eosio::charity, (hi)(transfer))
