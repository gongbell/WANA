#include <eosiolib/eosio.hpp>
#include <eosiolib/time.hpp>
#include <string>

using namespace eosio;
using std::string;

class [[eosio::contract]] watchdoggiee : public eosio::contract {
public:
  watchdoggiee(name self, name code, datastream<const char*> ds):
    contract(self, code, ds), _counters(self, self.value)
  {}

  struct  [[eosio::table("counters")]] counter {
    name           sender;
    uint64_t       remaining;
    uint64_t primary_key()const { return sender.value; }
  };

  typedef eosio::multi_index<name("counters"), counter> counters;

  [[eosio::action]]
  void ping( name from, name to, string memo )
  {
    eosio_assert( from != to, "cannot ping self" );
    require_auth( from );
    eosio_assert( is_account( to ), "to account does not exist");

    // sender is paying for RAM in counters table

    auto cntr = _counters.find(from.value);

    if( cntr == _counters.end() ) {
      // New sender: let them send 1000 messages
      _counters.emplace(from, [&]( auto& ce ) {
          ce.sender = from;
          ce.remaining = 999;
        });
    }
    else {
      // Please stop you dirty spammer!
      eosio_assert(cntr->remaining > 0,
                   "Your sending limit is run out. Contact Telegram: @cc32d9 for extension");
      _counters.modify( *cntr, from, [&]( auto& ce ) {
          ce.remaining--;
        });
    }

    // This is what they all want
    require_recipient( to );
  }


  [[eosio::action]]
  void setlimit( name sender, uint64_t limit )
  {
    require_auth( _self );
    eosio_assert(is_account( sender ), "sender does not exist");

    auto cntr = _counters.find( sender.value );
    eosio_assert( cntr != _counters.end(), "No such counter");
    // cannot charge the sender for RAM this time
    _counters.modify( *cntr, _self, [&]( auto& ce ) {
        ce.remaining = limit;
      });
  }


  
  struct [[eosio::table("kvs")]] kv {
    uint64_t        key;
    uint64_t        val;
    time_point_sec  ts;
    auto primary_key()const { return key; }
  };

  typedef eosio::multi_index<name("kvs"), kv> kvs;

  [[eosio::action]]
  void setkv( name owner, uint64_t key, uint64_t val )
  {
    require_auth(permission_level(owner, name("watchdog")));

    kvs _kvs(_self, owner.value );
    auto itr = _kvs.find( key );
    if( itr == _kvs.end() ) {
      _kvs.emplace( owner, [&]( auto& x ) {
          x.key = key;
          x.val = val;
          x.ts = time_point_sec(now());
        });
    }
    else {
      _kvs.modify( *itr, owner, [&]( auto& x ) {
          x.val = val;
          x.ts = time_point_sec(now());
        });
    }
  }

  [[eosio::action]]
  void delkv( name owner, uint64_t key )
  {
    require_auth(permission_level(owner, name("watchdog")));

    kvs _kvs(_self, owner.value);
    auto itr = _kvs.find( key );
    eosio_assert( itr != _kvs.end(), "key-value pair does not exist" );
    _kvs.erase(itr);
  }


private:
  counters _counters;

};

EOSIO_DISPATCH( watchdoggiee, (ping)(setlimit)(setkv)(delkv) )
