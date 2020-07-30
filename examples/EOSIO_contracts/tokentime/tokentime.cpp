/**
 * Created By @yashbhavsar007
 * 
 */


#include "tokentime.hpp"

namespace eosio {

// Token creation method
void token::create( account_name issuer,
                    asset        maximum_supply )
{
    require_auth( _self );// requires authorization of contract owner
    usertable userstats(_self, _self);
    // adding account name to userstats table
    userstats.emplace(_self, [&](auto &p) {
            p.account = issuer;
            p.time_limit = 0;
            
    });
    auto sym = maximum_supply.symbol;
    // checking for validation
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( maximum_supply.is_valid(), "invalid supply");
    eosio_assert( maximum_supply.amount > 0, "max-supply must be positive");

    stats statstable( _self, sym.name() );
    auto existing = statstable.find( sym.name() );
    eosio_assert( existing == statstable.end(), "token with symbol already exists" );

    // adding currency record to stats table
    statstable.emplace( _self, [&]( auto& s ) {
       s.supply.symbol = maximum_supply.symbol;
       s.max_supply    = maximum_supply;
       s.issuer        = issuer;
    });
}

// issuing method
void token::issue( account_name to, asset quantity, string memo )
{
    auto sym = quantity.symbol;
    // validating asset
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    auto sym_name = sym.name();
    stats statstable( _self, sym_name );
    auto existing = statstable.find( sym_name );
    eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );
    const auto& st = *existing;

    require_auth( st.issuer ); // requires authorisation of issuer
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must issue positive quantity" );

    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( quantity.amount <= st.max_supply.amount - st.supply.amount, "quantity exceeds available supply");

    // modofying supply ammount
    statstable.modify( st, 0, [&]( auto& s ) {
       s.supply += quantity;
    });
     // adding balance 
    add_balance( st.issuer, quantity, st.issuer );

    // calling inline action to transfer token
    if( to != st.issuer ) {
       SEND_INLINE_ACTION( *this, transfer, {st.issuer,N(active)}, {st.issuer, to, quantity, memo} );
    }
}

// Function to validate user 
void token::validate( account_name name,account_name to)
{
    usertable userstats(_self, _self);
    auto itr = userstats.find(name);
    auto itr1 = userstats.find(to);
    // if user is admin then it just print hi admin
    if(name == _self ) 
    {
        print("hi admin!"); 
        if(itr1 == userstats.end())
        {
            userstats.emplace(_self, [&](auto &p) {
                p.account = to;
                p.time_limit = now() + 86400;
                
            });
        }
    }
    // if user is in not in our record then it adds user in recrd
    else if(name != _self && itr == userstats.end() )
    
    {
       
        userstats.emplace(_self, [&](auto &p) {
            p.account = name;
            p.time_limit = now() + 86400;
            
        });
        print("in validate");
    }
    else if(itr1 == userstats.end())
        {
            userstats.emplace(_self, [&](auto &p) {
                p.account = to;
                p.time_limit = 0;
                
            });
        }
    
}

// transfer function for users to transfer token between two accounts
void token::transfer( account_name from,
                      account_name to,
                      asset        quantity,
                      string       memo )
{  
    validate(from,to);
    usertable userstats(_self, _self); // using user stats table
    auto itr = userstats.find(from); 
    eosio_assert(itr != userstats.end(), "Account does not match with our records in transfer "); 

   
    
    // checking if current time is greater than user's time limit in our record 
    if(itr->time_limit < now())
    {
        // validating user
        eosio_assert( from != to, "cannot transfer to self" );
        require_auth( from );
        eosio_assert( is_account( to ), "to account does not exist");
        auto sym = quantity.symbol.name();
        stats statstable( _self, sym );
        const auto& st = statstable.get( sym );

        require_recipient( from );
        require_recipient( to );

        eosio_assert( quantity.is_valid(), "invalid quantity" );
        eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
        eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
        eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );


        sub_balance( from, quantity ); // calling sub_balance to decrease amount of from 
        add_balance( to, quantity, from ); // calling add_balance to increase ammount of to

    }
    // if user's timelimit is greater than now then it exicutes else part and gives assertion
    else
    {
        eosio_assert(false,"Your Token is not unlocked yet! Wait untill it unlock!!!"); 
    }
   

    
}

// sub_balance to decrease balance function provided by eosio
void token::sub_balance( account_name owner, asset value ) {
   accounts from_acnts( _self, owner );

   const auto& from = from_acnts.get( value.symbol.name(), "no balance object found" );
   eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );


   if( from.balance.amount == value.amount ) {
      from_acnts.erase( from );
   } else {
      from_acnts.modify( from, owner, [&]( auto& a ) {
          a.balance -= value;
      });
   }
}
 // add_balance to increase balance function provided by eosio
void token::add_balance( account_name owner, asset value, account_name ram_payer )
{
   accounts to_acnts( _self, owner );
   auto to = to_acnts.find( value.symbol.name() );
   if( to == to_acnts.end() ) {
      to_acnts.emplace( ram_payer, [&]( auto& a ){
        a.balance = value;
      });
   } else {
      to_acnts.modify( to, 0, [&]( auto& a ) {
        a.balance += value;
      });
   }
}

} /// namespace eosio

EOSIO_ABI( eosio::token, (create)(issue)(transfer) )
