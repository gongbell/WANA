/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */

#include "stablecoooin.hpp"

ACTION stablecoooin::create( name issuer, asset maximum_supply ) {

    require_auth( _self );

    auto sym = maximum_supply.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( maximum_supply.is_valid(), "invalid supply");
    eosio_assert( maximum_supply.amount > 0, "max-supply must be positive");

    stats statstable( _self, sym.code().raw() );
    auto existing = statstable.find( sym.code().raw() );
    eosio_assert( existing == statstable.end(), "token with symbol already exists" );

    statstable.emplace( _self, [&]( auto& s ) {
       s.supply.symbol = maximum_supply.symbol;
       s.max_supply    = maximum_supply;
       s.issuer        = issuer;
    });
}

ACTION stablecoooin::issue( name to, asset quantity, string memo ) {
    auto sym = quantity.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    stats statstable( _self, sym.code().raw() );
    auto existing = statstable.find( sym.code().raw() );
    eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );
    const auto& st = *existing;

    require_auth( st.issuer );
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must issue positive quantity" );

    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );

    statstable.modify( st, same_payer, [&]( auto& s ) {
       s.supply += quantity;
       if ( s.supply > s.max_supply ) {
           s.max_supply = s.supply;
       }
    });

    add_balance( st.issuer, quantity, st.issuer );

    if( to != st.issuer ) {
       SEND_INLINE_ACTION( *this, transfer, {st.issuer, "active"_n}, {st.issuer, to, quantity, memo} );
    }
}

ACTION stablecoooin::transfer( name from, name to, asset quantity, string memo ) {
    eosio_assert( is_paused(), "contract is paused." );

    blacklists blacklistt(_self, _self.value);
    auto fromexisting = blacklistt.find( from.value );
    eosio_assert( fromexisting == blacklistt.end(), "account blacklisted(from)" );
    auto toexisting = blacklistt.find( to.value );
    eosio_assert( toexisting == blacklistt.end(), "account blacklisted(to)" );

    eosio_assert( from != to, "cannot transfer to self" );
    require_auth( from );
    eosio_assert( is_account( to ), "to account does not exist");
    auto sym = quantity.symbol.code();
    stats statstable( _self, sym.raw() );
    const auto& st = statstable.get( sym.raw() );

    require_recipient( from );
    require_recipient( to );

    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    auto payer = has_auth( to ) ? to : from;

    sub_balance( from, quantity );
    add_balance( to, quantity, payer );
}

ACTION stablecoooin::burn(asset quantity, string memo ) {
    auto sym = quantity.symbol;
    eosio_assert( sym.is_valid(), "invalid symbol name" );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

    auto sym_name = sym.code();
    stats statstable( _self, sym_name.raw() );
    auto existing = statstable.find( sym_name.raw() );
    eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before burn" );
    const auto& st = *existing;

    require_auth( st.issuer );
    //require_recipient( st.issuer );
    eosio_assert( quantity.is_valid(), "invalid quantity" );
    eosio_assert( quantity.amount > 0, "must burn positive or zero quantity" );

    eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
    eosio_assert( quantity.amount <= st.supply.amount, "quantity exceeds available supply");

    statstable.modify( st, same_payer, [&]( auto& s ) {
       s.supply -= quantity;
       s.max_supply -= quantity;
    });

    sub_balance( st.issuer, quantity );
}

ACTION stablecoooin::pause() {
    require_auth( _self );

    pausetable pauset(_self, _self.value);
    auto itr = pauset.find(1);
    if (itr != pauset.end()) {
      pauset.modify(itr, _self, [&](auto& p) {
        p.paused = true;
      });
    } else {
      pauset.emplace(_self, [&](auto& p) {
        p.id = 1;
        p.paused = true;
      });
    }
}

ACTION stablecoooin::unpause() {
    require_auth( _self );
    pausetable pauset(_self, _self.value);
    while (pauset.begin() != pauset.end()) {
      auto itr = pauset.end();
      itr--;
      pauset.erase(itr);
      pausetable pauset(_self, _self.value);
    }
}

ACTION stablecoooin::blacklist( name account, string memo ) {
    require_auth( _self );
    eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );
    
    blacklists blacklistt(_self, _self.value);
    auto existing = blacklistt.find( account.value );
    eosio_assert( existing == blacklistt.end(), "blacklist account already exists" );

    blacklistt.emplace( _self, [&]( auto& b ) {
       b.account = account;
    });
}

ACTION stablecoooin::unblacklist( name account) {
    require_auth( _self );

    blacklists blacklistt(_self, _self.value);
    auto existing = blacklistt.find( account.value );
    eosio_assert( existing != blacklistt.end(), "blacklist account not exists" );

    blacklistt.erase(existing);
}

void stablecoooin::sub_balance( name owner, asset value ) {
   accounts from_acnts( _self, owner.value );

   const auto& from = from_acnts.get( value.symbol.code().raw(), "no balance object found" );
   eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );


   if( from.balance.amount == value.amount ) {
      from_acnts.erase( from );
   } else {
      from_acnts.modify( from, owner, [&]( auto& a ) {
          a.balance -= value;
      });
   }
}

void stablecoooin::add_balance( name owner, asset value, name ram_payer ) {
   accounts to_acnts( _self, owner.value );
   auto to = to_acnts.find( value.symbol.code().raw() );
   if( to == to_acnts.end() ) {
      to_acnts.emplace( ram_payer, [&]( auto& a ){
        a.balance = value;
      });
   } else {
      to_acnts.modify( to, same_payer, [&]( auto& a ) {
        a.balance += value;
      });
   }
}

bool stablecoooin::is_paused() {
      pausetable pauset(_self, _self.value);
      bool existing = ( pauset.find( 1 ) == pauset.end() );
      return existing;
}

EOSIO_DISPATCH( stablecoooin, (create)(issue)(transfer)(burn)(pause)(unpause)(blacklist)(unblacklist) )
