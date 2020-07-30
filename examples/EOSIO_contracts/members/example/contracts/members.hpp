#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

using namespace eosio;
using std::string;

class members : public eosio::contract {

	public:
		// Constructor
		//explicit members(action_name self) : contract(self) {}
		using contract::contract;
		// @abi action
		void add(const name account, const string& username);
		// @abi action
		void set(const name account, const string& property, const string& value);
		//void setRegion(uint64_t regionID);
		//void activate(const name account);
		//void approve(const name account, bool shouldApprove);
		// @abi action
		void remove(const name account);
		// @abi action
		void deposit(const name account, const uint64_t amount);
		// @abi action
		void withdraw(const name account, const uint64_t amount);

	private:
		// @private merge
		void merge(const name account, const string& username);
		// @abi table profiles i64
		struct Profile {
			uint64_t 			account;
			string				username;
			string				given_name;
			string				surname;
			uint64_t			balance = 0;
			bool				active = false;
			bool				approved = false;
			bool				flagged = false;
			bool				verified = false;
			uint64_t			regionID = 0;

			uint64_t primary_key() const { return account; }
			EOSLIB_SERIALIZE(Profile, (account)(username)(given_name)(surname)(balance)(active)(approved)(flagged)(verified)(regionID));
		};
		// @abi table rewards i64
		struct Reward {
			uint64_t	id;
			uint64_t	type;
			string		title;
			string		description;
			uint64_t	price;
			uint64_t	period;

			uint64_t primary_key() const { return id; }
			EOSLIB_SERIALIZE(Reward, (id)(type)(title)(description)(price)(period));
		};

		typedef multi_index<N(profiles), Profile> profile_table;
		typedef multi_index<N(rewards), Reward> membership_table;	
};

EOSIO_ABI(members, (add)(set)(remove)(deposit)(withdraw));