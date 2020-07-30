#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/action.hpp>
#include <eosiolib/singleton.hpp>

using namespace eosio;
using namespace std;

const account_name contract_fee_account = N(guytomjxhage);

static constexpr uint64_t     ramprice_symbol    = S(8,EOS);  // precision: 8
static constexpr uint32_t     seconds_per_round  = 6 * 3600;  // 6 hours
static constexpr uint32_t     seconds_per_draw   = 15 * 60 + seconds_per_round;  // 15 minutes later afetr round end

class unionramgame: contract {
public:
    unionramgame(account_name self): contract( self ),
        _rammarket( N(eosio), N(eosio) ),
        _round( self, self ),
        _players( self, self ),
        _winners( self, self ) {}
    void genesisr();
    void gamedraw( account_name owner );
    void transfer( account_name from, account_name to, asset quantity, string memo );
private:
    void contractpay( account_name to, asset quantity, string memo );
    struct exchange_state {
        asset    supply;

        struct connector {
            asset balance;
            double weight = .5;

            EOSLIB_SERIALIZE( connector, (balance)(weight) )
        };

        connector base;
        connector quote;

        uint64_t primary_key()const { return supply.symbol; }

        asset convert_to_exchange( connector& c, asset in ); 
        asset convert_from_exchange( connector& c, asset in );
        asset convert( asset from, symbol_type to );

        EOSLIB_SERIALIZE( exchange_state, (supply)(base)(quote) )
    };

    // @abi table round i64
    struct st_round {
        uint32_t   roundth;
        uint64_t   start_time;
        asset      gamepool;
        asset      last_ramprice;  // precision is 8 !!!!!!
    };

    // @abi table players i64
    struct st_player {
        uint64_t      id;  // a owner may transfer more than one, so the primary key could not be owner
        account_name  owner;
        uint64_t      tx_time;
        asset         tx_quantity;
        asset         tx_ramprice;  // precision !!!

        uint64_t primary_key()const { return id; }
        uint64_t get_owner()const { return owner; }
        uint64_t get_ramprice()const { return (uint64_t)tx_ramprice.amount; }
        EOSLIB_SERIALIZE( st_player, (id)(owner)(tx_time)(tx_quantity)(tx_ramprice) )
    };

    // @abi table winners i64
    struct st_winner {
        uint64_t      id;  // // a owner may transfer more than one, so the primary key could not be owner
        account_name  owner;
        uint64_t      tx_time;
        asset         tx_quantity;
        asset         tx_ramprice;  // precision !!!
        asset         win_quantity;

        uint64_t primary_key()const { return id; }
        EOSLIB_SERIALIZE( st_winner, (id)(owner)(tx_time)(tx_quantity)(tx_ramprice)(win_quantity) )
    };

    typedef eosio::multi_index<N(rammarket), exchange_state> rammarket;
    typedef singleton<N(round), st_round> round;
    typedef eosio::multi_index<N(players), st_player,
        indexed_by<N(si_owner), const_mem_fun<st_player, uint64_t, &st_player::get_owner>>,
        indexed_by<N(si_ramprice), const_mem_fun<st_player, uint64_t, &st_player::get_ramprice>>
    > players;
    typedef eosio::multi_index<N(winners), st_winner> winners;

    rammarket _rammarket;
    round _round;
    players _players;
    winners _winners;

    st_round get_round() {
        eosio_assert(_round.exists(), "round not exist");
        return _round.get();
    }
};

// EOSIO_ABI( unionramgame, (genesisr)(gamedraw) )
#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
    void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
        auto self = receiver; \
        if( action == N(onerror)) { \
            /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
            eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account"); \
        } \
        if( ((code == self && action != N(transfer)) || action == N(onerror)) || (code == N(eosio.token) && action == N(transfer)) ) { \
            TYPE thiscontract( self ); \
            switch( action ) { \
                EOSIO_API( TYPE, MEMBERS ) \
            } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
        } \
    } \
} \

EOSIO_ABI_EX( unionramgame, (genesisr)(gamedraw)(transfer) )
