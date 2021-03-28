#include <utility>
#include <vector>
#include <string>
#include <eosiolib/eosio.hpp>
#include <eosiolib/time.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/contract.hpp>
#include <eosiolib/types.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/crypto.h>
#include <boost/algorithm/string.hpp>

using eosio::asset;
using eosio::permission_level;
using eosio::action;
using eosio::print;
using eosio::name;
using eosio::unpack_action_data;
using eosio::symbol_type;
using eosio::transaction;
using eosio::time_point_sec;


class EOSBetDice : public eosio::contract {
	public:
		const uint32_t TWO_MINUTES = 2 * 60;
		const uint64_t MINBET = 1000; 
		const uint64_t HOUSEEDGE_times10000 = 200;
		const uint64_t HOUSEEDGE_REF_times10000 = 150;
		const uint64_t REFERRER_REWARD_times10000 = 50;

		const uint64_t BETID_ID = 1;
		const uint64_t TOTALAMTBET_ID = 2;
		const uint64_t TOTALAMTWON_ID = 3;
		const uint64_t LIABILITIES_ID = 4;

		EOSBetDice(account_name self):eosio::contract(self),
			activebets(_self, _self),
			globalvars(_self, _self),
			randkeys(_self, _self)
		{}

		// @abi action
		void initcontract(public_key randomness_key){

			require_auth(N(eosbetcasino));

			auto globalvars_itr = globalvars.begin();
			eosio_assert(globalvars_itr == globalvars.end(), "Contract is init");

			globalvars.emplace(_self, [&](auto& g){
				g.id = BETID_ID;
				g.val = 0;
			});

			globalvars.emplace(_self, [&](auto& g){
				g.id = TOTALAMTBET_ID;
				g.val = 0;
			});

			globalvars.emplace(_self, [&](auto& g){
				g.id = TOTALAMTWON_ID;
				g.val = 0;
			});

			globalvars.emplace(_self, [&](auto& g){
				g.id = LIABILITIES_ID;
				g.val = 0;
			});

			randkeys.emplace(_self, [&](auto & k){
				k.id = 1;
				k.key = randomness_key;
			});
		}

		// @abi action
		void newrandkey(public_key randomness_key){

			require_auth(N(eosbetcasino));

			auto rand_itr = randkeys.begin();
			randkeys.modify(rand_itr, _self, [&](auto& k){
				k.key = randomness_key;
			});
		}

		// @abi action
		void suspendbet(const uint64_t bet_id){

			require_auth(N(eosbetcasino));

			auto activebets_itr = activebets.find(bet_id);
			eosio_assert(activebets_itr != activebets.end(), "No bet exists");

			std::string bettor_str = name_to_string(activebets_itr->bettor);

			decrement_liabilities(activebets_itr->bet_amt);

			action(
				permission_level{_self, N(active)},
				N(eosio.token), 
				N(transfer),
				std::make_tuple(
					_self, 
					N(eosbettransf), 
					asset(activebets_itr->bet_amt, symbol_type(S(4, EOS))), 
					bettor_str
				)
			).send();

			activebets.erase(activebets_itr);
		}

		void transfer(uint64_t sender, uint64_t receiver) {

			auto transfer_data = unpack_action_data<st_transfer>();

			// Detect: Vulnerability!
			if (transfer_data.from == _self || transfer_data.from == N(eosbetcasino)){
				return;
			}


			eosio_assert( transfer_data.quantity.is_valid(), "Invalid asset");

			const uint64_t your_bet_amount = (uint64_t)transfer_data.quantity.amount;
			eosio_assert(MINBET <= your_bet_amount, "Must bet greater than min");

			increment_liabilities_bet_id(your_bet_amount);

			std::string roll_str;
			std::string ref_str;
			std::string seed_str;

			const std::size_t first_break = transfer_data.memo.find("-");
			roll_str = transfer_data.memo.substr(0, first_break);

			if(first_break != std::string::npos){
				
				const std::string after_first_break = transfer_data.memo.substr(first_break + 1);
				const std::size_t second_break = after_first_break.find("-");

				if(second_break != std::string::npos){
					
					ref_str = after_first_break.substr(0, second_break);
					seed_str = after_first_break.substr(second_break + 1);
				}
				else {
					
					ref_str = after_first_break;
					seed_str = std::string("");
				}
			}
			else {
				ref_str = std::string("");
				seed_str = std::string("");
			}

			account_name referral = N(eosbetcasino);

			const account_name possible_ref = eosio::string_to_name(ref_str.c_str());
			uint64_t house_edge = HOUSEEDGE_times10000;

			if (possible_ref != _self && possible_ref != transfer_data.from && is_account(possible_ref)){
				referral = possible_ref;
				house_edge = HOUSEEDGE_REF_times10000;
			}

			const uint64_t roll_under = std::stoull(roll_str, 0, 10);
			eosio_assert( roll_under >= 2 && roll_under <= 96, "Roll must be >= 2, <= 96.");

			const uint64_t your_win_amount = (your_bet_amount * get_payout_mult_times10000(roll_under, house_edge) / 10000) - your_bet_amount;
			eosio_assert(your_win_amount <= get_max_win(), "Bet less than max");

			checksum256 user_seed_hash;
			sha256( (char *)&seed_str, seed_str.length(), &user_seed_hash );

			auto s = read_transaction(nullptr, 0);
		    char *tx = (char *)malloc(s);
		    read_transaction(tx, s);
		    checksum256 tx_hash;
		    sha256(tx, s, &tx_hash);

			st_seeds seeds;
			seeds.seed1 = user_seed_hash;
			seeds.seed2 = tx_hash;
			
			checksum256 seed_hash;
			sha256( (char *)&seeds.seed1, sizeof(seeds.seed1) * 2, &seed_hash);

			const uint64_t bet_id = ((uint64_t)tx_hash.hash[0] << 56) + ((uint64_t)tx_hash.hash[1] << 48) + ((uint64_t)tx_hash.hash[2] << 40) + ((uint64_t)tx_hash.hash[3] << 32) + ((uint64_t)tx_hash.hash[4] << 24) + ((uint64_t)tx_hash.hash[5] << 16) + ((uint64_t)tx_hash.hash[6] << 8) + (uint64_t)tx_hash.hash[7];

			activebets.emplace(_self, [&](auto& bet){
				bet.id = bet_id;
				bet.bettor = transfer_data.from;
				bet.referral = referral;
				bet.bet_amt = your_bet_amount;
				bet.roll_under = roll_under;
				bet.seed = seed_hash;
				bet.bet_time = time_point_sec(now());
			});
		}

		// @abi action
		void resolvebet(const uint64_t bet_id, signature sig) {

			require_auth2(N(eosbetcasino), N(random));

			auto activebets_itr = activebets.find( bet_id );
			eosio_assert(activebets_itr != activebets.end(), "Bet doesn't exist");

			auto key_entry = randkeys.get(1);
			public_key rand_signing_key = key_entry.key;
			assert_recover_key(&activebets_itr->seed, (const char *)&sig, sizeof(sig), (const char *)&rand_signing_key, sizeof(rand_signing_key));
			
			checksum256 random_num_hash;
			sha256( (char *)&sig, sizeof(sig), &random_num_hash );

			const uint64_t random_roll = ((random_num_hash.hash[0] + random_num_hash.hash[1] + random_num_hash.hash[2] + random_num_hash.hash[3] + random_num_hash.hash[4] + random_num_hash.hash[5] + random_num_hash.hash[6] + random_num_hash.hash[7]) % 100) + 1;

			uint64_t edge = HOUSEEDGE_times10000;
			uint64_t ref_reward = 0;
			uint64_t payout = 0;
			if (activebets_itr->referral != N(eosbetcasino)){
				edge = HOUSEEDGE_REF_times10000;
				ref_reward = activebets_itr->bet_amt * REFERRER_REWARD_times10000 / 10000;
			}

			if(random_roll < activebets_itr->roll_under){
				payout = (activebets_itr->bet_amt * get_payout_mult_times10000(activebets_itr->roll_under, edge)) / 10000;
			}

			increment_game_stats(activebets_itr->bet_amt, payout);
			decrement_liabilities(activebets_itr->bet_amt);

			if (payout > 0){
				action(
					permission_level{_self, N(active)},
					N(eosio.token), 
					N(transfer),
					std::make_tuple(
						_self, 
						activebets_itr->bettor, 
						asset(payout, symbol_type(S(4, EOS))), 
						std::string("Bet id: ") + std::to_string(bet_id) + std::string(" -- Winner! Play: dice.eosbet.io")
					)
				).send();
			}

			transaction ref_tx{};

			ref_tx.actions.emplace_back(
				permission_level{_self, N(active)},
				_self,
				N(betreceipt),
				std::make_tuple(
					bet_id,
					activebets_itr->bettor,
					N(eosio.token),
					asset(activebets_itr->bet_amt, symbol_type(S(4, EOS))),
					asset(payout, symbol_type(S(4, EOS))),
					activebets_itr->seed,
					sig,
					activebets_itr->roll_under,
					random_roll
				)
			);

			if (ref_reward > 0){

				ref_tx.actions.emplace_back(
					permission_level{_self, N(active)}, 
					N(eosio.token), 
					N(transfer), 
					std::make_tuple(
						_self, 
						N(safetransfer), 
						asset(ref_reward, symbol_type(S(4, EOS))), 
						name_to_string(activebets_itr->referral) + std::string(" Bet id: ") + std::to_string(bet_id) + std::string(" -- Referral reward! Play: dice.eosbet.io")
					)
				);
			}

			ref_tx.delay_sec = 5;
			ref_tx.send(bet_id, _self);

			airdrop_tokens(bet_id, activebets_itr->bet_amt, activebets_itr->bettor);

			activebets.erase(activebets_itr);
		}

		// @abi action
		void betreceipt(
			uint64_t bet_id, 
			account_name bettor,
			account_name amt_contract,
			asset bet_amt, 
			asset payout,
			checksum256 seed,
			signature signature,
			uint64_t roll_under,
			uint64_t random_roll
 			) {
 
			require_auth(N(eosbetdice11));
 			require_recipient( bettor );
		}

		// @abi action
		void refundbet(const uint64_t bet_id) {

			require_auth2(N(eosbetcasino), N(random));

			auto activebets_itr = activebets.find( bet_id );

			eosio_assert(activebets_itr != activebets.end(), "Game doesn't exist");

			const time_point_sec bet_time = activebets_itr->bet_time;

			//eosio_assert(time_point_sec(now() - TWO_MINUTES) > bet_time, "Wait 10 minutes");

			decrement_liabilities(activebets_itr->bet_amt);

			action(
				permission_level{_self, N(active)},
				N(eosio.token), 
				N(transfer),
				std::make_tuple(
					_self, 
					N(safetransfer), 
					asset(activebets_itr->bet_amt, symbol_type(S(4, EOS))), 
					//name_to_string(activebets_itr->bettor) + std::string(" Bet id: ") + std::to_string(bet_id) + std::string(" -- REFUND. Sorry for the inconvenience.")
					name_to_string(activebets_itr->bettor)
				)
			).send();

			activebets.erase(activebets_itr);
		}
	
	private:
		// @abi table activebets i64
		struct bet {
			uint64_t 		id;
			account_name	bettor;
			account_name	referral;
			uint64_t		bet_amt;
			uint64_t		roll_under;
			checksum256		seed;
			time_point_sec bet_time;
			
			uint64_t 		primary_key() const { return id; }
			
			EOSLIB_SERIALIZE( bet, (id)(bettor)(referral)(bet_amt)(roll_under)(seed)(bet_time))
		};

		typedef eosio::multi_index< N(activebets), bet> bets_index;

		// @abi table globalvars i64
		struct globalvar{
			uint64_t		id;
			uint64_t		val;

			uint64_t		primary_key() const { return id; }

			EOSLIB_SERIALIZE(globalvar, (id)(val));
		};

		typedef eosio::multi_index< N(globalvars), globalvar> globalvars_index;

		// @abi table randkeys i64
		struct randkey {
			uint64_t 		id;
			public_key		key;

			uint64_t		primary_key() const { return id; }
		};

		typedef eosio::multi_index< N(randkeys), randkey > randkeys_index;

		// taken from eosio.token.hpp
		struct account {
	    	asset    balance;

	    	uint64_t primary_key() const { return balance.symbol.name(); }
	    };

		typedef eosio::multi_index<N(accounts), account> accounts;

		// taken from eosio.token.hpp
		struct st_transfer {
            account_name  from;
            account_name  to;
            asset         quantity;
            std::string   memo;
        };

        struct st_seeds{
         	checksum256 	seed1;
         	checksum256		seed2;
        };

		bets_index			activebets;
		globalvars_index	globalvars;
		randkeys_index		randkeys;


		std::string name_to_string(uint64_t acct_int) const {
	     static const char* charmap = ".12345abcdefghijklmnopqrstuvwxyz";

	      std::string str(13,'.');

	      uint64_t tmp = acct_int;

	      for( uint32_t i = 0; i <= 12; ++i ) {
	         char c = charmap[tmp & (i == 0 ? 0x0f : 0x1f)];
	         str[12-i] = c;
	         tmp >>= (i == 0 ? 4 : 5);
	      }

	      boost::algorithm::trim_right_if( str, []( char c ){ return c == '.'; } );
	      return str;
	   }

		void increment_liabilities_bet_id(const uint64_t bet_amt){

			auto globalvars_itr = globalvars.find(BETID_ID);
			
			globalvars.modify(globalvars_itr, _self, [&](auto& g){
				g.val++;
			});

			globalvars_itr = globalvars.find(LIABILITIES_ID);

			globalvars.modify(globalvars_itr, _self, [&](auto& g){
				g.val += bet_amt;
			});
		}

		void increment_game_stats(const uint64_t bet_amt, const uint64_t won_amt){

			auto globalvars_itr = globalvars.find(TOTALAMTBET_ID);

			globalvars.modify(globalvars_itr, _self, [&](auto& g){
				g.val += bet_amt;
			});

			if (won_amt > 0){
				globalvars_itr = globalvars.find(TOTALAMTWON_ID);

				globalvars.modify(globalvars_itr, _self, [&](auto& g){
					g.val += won_amt;
				});
			}
		}

		void decrement_liabilities(const uint64_t bet_amt){
			auto globalvars_itr = globalvars.find(LIABILITIES_ID);

			globalvars.modify(globalvars_itr, _self, [&](auto& g){
				g.val -= bet_amt;
			});
		}

		void airdrop_tokens(const uint64_t bet_id, const uint64_t bet_amt, const account_name bettor){
			uint64_t drop_amt = (1 * bet_amt) / 30;

			const uint64_t bet_token_balance = get_token_balance( N(betdividends), symbol_type(S(4, BET)) );

			if (bet_token_balance == 0){
				return;
			}
			else if (bet_token_balance < drop_amt){
				drop_amt = bet_token_balance;
			}
			action(
               permission_level{_self, N(active)},
               N(betdividends), 
               N(transfer),
               std::make_tuple(
                   _self, 
                   bettor, 
                   asset(drop_amt, symbol_type(S(4, BET))), 
                   std::string("Bet id: ") + std::to_string(bet_id) + std::string(" -- Enjoy airdrop! Play: dice.eosbet.io")
	            )
	       ).send();
		}

		uint64_t get_token_balance(const account_name token_contract, const symbol_type& token_type) const {

			accounts from_accounts(token_contract, _self);

			const auto token_name = token_type.name();
			auto my_account_itr = from_accounts.find(token_name);
			if (my_account_itr == from_accounts.end()){
				return 0;
			}
			const asset my_balance = my_account_itr->balance;
			return (uint64_t)my_balance.amount;
		}

		uint64_t get_payout_mult_times10000(const uint64_t roll_under, const uint64_t house_edge_times_10000) const {

			return ((10000 - house_edge_times_10000) * 100) / (roll_under - 1);
		}

		uint64_t get_max_win() const {
			const uint64_t eos_balance = get_token_balance(N(eosio.token), symbol_type(S(4, EOS)));

			auto liabilities_struct = globalvars.get(LIABILITIES_ID);
			const uint64_t liabilities = liabilities_struct.val;

			return (eos_balance - liabilities) / 25;
		}
};

#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      auto self = receiver; \
      if( code == self || code == N(eosio.token)) { \
      	 if( action == N(transfer)){ \
      	 	eosio_assert( code == N(eosio.token), "Must transfer EOS"); \
      	 } \
         TYPE thiscontract( self ); \
         switch( action ) { \
            EOSIO_API( TYPE, MEMBERS ) \
         } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
      } \
   } \
}

EOSIO_ABI_EX( EOSBetDice, 
	(initcontract)
	(newrandkey)
	(resolvebet)
	(refundbet)
	(transfer)
	(betreceipt)
	(suspendbet)
)
