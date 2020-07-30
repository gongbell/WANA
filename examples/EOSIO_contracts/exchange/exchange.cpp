#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/multi_index.hpp>
#include <eosiolib/vector.hpp>
#include <eosiolib/action.hpp>
#include <string>

using namespace eosio;

namespace eosiosystem {
   class system_contract;
}

///TODO: Add in fees
class exchange : public contract {

public:
	exchange( account_name self ) : contract(self) {}

	// ------------------------------ Actions ------------------------------ //

	//@abi action
	struct make_order {
		account_name maker_account;
		string target_token_contract;
		asset amount_of_token;
		uint8_t buy_or_sell;
		float price; /// Caluclated like this: ( Total amount of EOS / amount_of_token == price ) || ( price * amount_of_token == Total amount of EOS) 
	};

	//@abi action
	struct take_order {
		account_name taker_account;
		string target_token_contract;
		asset amount_of_token;
		float price;
		uint8_t buy_or_sell;
		uint64_t order_id;
	};

	//@abi action
	struct make_withdraw {
		account_name withdraw_account;
		string target_token_contract;
		asset amount_of_token;
	};

	//@abi action
	struct cancel_order {
		account_name maker_account;
		string target_token_contract;
		uint64_t order_id;
	};

	//@abi action
	struct set_eos_asset {
		asset eos_asset;
	};

	struct set_admin {
		account_name administrator;
	}

	// ------------------------------ Tables ------------------------------ //

	///This is the template so that we have an eos asset
	///to reference when declaring a new eos asset in a different scope
	//@abi table eostemplate
	struct eos_asseta {
		uint64_t arbritrary_key = 1962; //This key is just set arbritrarily so that we can look up the template in the multi-index table
		asset eos_asset;		
		uint64_t primary_key() const { return arbritrary_key; }
	};

	///Admin that can withdraw the fee amounts
	//@abi table admin
	struct admin {
		uint64_t arbritrary_key = 1962;
		account_name administrator;		
		uint64_t primary_key() const { return arbritrary_key; }
	}

	///Each one of these should be scoped to an account
	//@abi table accounts
	struct balances {
		uint64_t token_contract;
		asset balance;
		uint64_t primary_key() const { return token_contract; }
	};

	///Each one of these should be scoped to the specific token
	//@abi table orders
	struct order {
		uint64_t order_id;
		uint32_t expiration_date;
		account_name maker_account;

		uint64_t target_token_contract;
		uint8_t buy_or_sell; //1 == buy, 0 == sell; where buy means that the maker is going to be buying the token with eos
		asset amount_of_token;
		float price;

		uint64_t primary_key() const { return order_id; }
	};

	///Orders scoped to the given account
	//@abi table myorders
	struct my_orders {
		uint64_t target_token_contract;
		uint64_t order_id;

		uint32_t expiration_date;
		asset amount_of_token;
		float price;
		uint64_t primary_key() const { return target_token_contract+order_id; }
	};

	///Count of the orders
	///Each one needs to be scoped to a specific token contract
	//@abi table counter
	struct count {
		uint64_t current_count = 0;
		uint64_t arbritrary_key = 1962; //This key is just set arbritrarily so that we can look up the counter in the multi-index table
		uint64_t primary_key() const { return arbritrary_key; }
	};

	typedef eosio::multi_index< N(eostemplate), eos_asseta > eostemplate;
	typedef eosio::multi_index< N(administrator), admin > administrator;
	typedef eosio::multi_index< N(counter), count > counter;

	typedef eosio::multi_index< N(orders), order > orders;
	typedef eosio::multi_index< N(myorders), my_orders > myorders;
	typedef eosio::multi_index< N(accounts), balances > accounts;
[[eosio::action]]
	static void seteosasset(uint64_t self, uint64_t code);
[[eosio::action]]
	static void setadmin(uint64_t self, uint64_t code);
[[eosio::action]]
	static void deposit(uint64_t self, uint64_t code);
[[eosio::action]]
	static void makeorder(uint64_t self, uint64_t code);
[[eosio::action]]
	static void takeorder(uint64_t self, uint64_t code);  
[[eosio::action]]
	static void cancelorder(uint64_t self, uint64_t code);
[[eosio::action]]
	static void makewithdraw(uint64_t self, uint64_t code);
};

// ------------------------------ Functions ------------------------------ //

///This sets the eos asset template so that we can now reference
///an eos asset when defining new eos assets
void exchange::seteosasset(uint64_t self, uint64_t code) {
	auto data = unpack_action_data<set_eos_asset>();
	asset eos_asset = data.eos_asset;

	require_auth(self);

	eostemplate eos_template(self, self);
	eos_template.emplace(self, [&](auto& s){
		s.eos_asset = eos_asset;
	});
}

///Set the administrator
///This is the account that will recieve the fees 
void exchange::setadmin(uint64_t self, uint64_t code) {
	auto data = unpack_action_data<set_admin>();
	account_name admin = data.administrator;
	require_auth(self);

	administrator admin_table(self, self);
	auto it = admin_table.find(1962);
	if (it != admin_table.end()) {
		admin_table.modify(it, admin, [&](auto& s){
			s.administrator = admin;
		});
	} else {
		admin_table.emplace(admin, [&](auto& s) {
			s.administrator = admin;
		});
	}
}

void exchange::deposit(uint64_t self, uint64_t code) {
	auto data = unpack_action_data<currency::transfer>();
	auto from = data.from;
	auto amount = data.quantity;
	if(from == self || data.to != self)
		return;

	accounts st(self, from);
	auto it = st.find(code);
	if (it != st.end()) {
		st.modify(it, from, [&](auto& s) {
				s.balance += amount;
			}
		);
	} else {
		st.emplace(from, [&](auto& s) {
				s.token_contract = code;
				s.balance = amount;
			}
		);
	}
}

void exchange::makeorder(uint64_t self, uint64_t code) {
	auto data = unpack_action_data<make_order>();
	account_name maker_account = data.maker_account;
	string target_token_contract_str = data.target_token_contract;
	asset amount_of_token = data.amount_of_token;
	float price = data.price;
	uint8_t buy_or_sell = data.buy_or_sell;

	require_auth(maker_account);

	eosio_assert(target_token_contract_str.size() <= 12, "Invalid target_token_contract");
	uint64_t target_token_contract = eosio::string_to_name(target_token_contract_str.c_str());
	uint64_t eosio_token_contract = N(eosio.token);

	///Here we check to make sure that the maker_account has the enough balance to cover the order
	///Then we subtract the balance from the account
	eosio_assert(buy_or_sell == 0 || buy_or_sell == 1, "Invalid buy_or_sell parameter: Must be either 1 (buy) or 0 (sell)");
	accounts maker_account_table(self, maker_account);
	if (buy_or_sell == 1) {
		auto it = maker_account_table.find(eosio_token_contract);
		eosio_assert(it != maker_account_table.end(), "It appears as though you have not deposited any EOS from eosio.token!");
		float amount_of_eos = price * amount_of_token.amount;
		maker_account_table.modify(it, maker_account, [&](auto& s) {
			eosio_assert(amount_of_eos <= s.balance.amount, "Insufficient EOS balance!");
			s.balance.amount -= amount_of_eos;
		});
	} else if (buy_or_sell == 0) {
		auto it = maker_account_table.find(target_token_contract);
		eosio_assert(it != maker_account_table.end(), "It appears as though you have not deposited any tokens from the given contract!");
		maker_account_table.modify(it, maker_account, [&](auto& s){
			eosio_assert(amount_of_token <= s.balance, "Insufficient token balance!");
			s.balance -= amount_of_token;
		});
	}

	counter total_orders(self, target_token_contract);
	auto total_order_count_ref = total_orders.find(1962);

	if (total_order_count_ref == total_orders.end()) {
		total_orders.emplace(maker_account, [&](auto& s) {
			s.current_count++; //Set the initial count to 1
		});
	} else {
		total_orders.modify(total_order_count_ref, maker_account, [&](auto& s){
			s.current_count++;
		});
	}

	auto order_id_ref = total_orders.find(1962);
	uint64_t order_id_count = order_id_ref->current_count;

	///New order is scoped to the token's contract
	orders new_order(self, target_token_contract);
	new_order.emplace(maker_account, [&](auto& s) {
		s.order_id = order_id_count;
		s.maker_account = maker_account;
		s.expiration_date = now(); //Expiration date is set to 7 days later
		s.buy_or_sell = buy_or_sell;
		s.target_token_contract = target_token_contract;
		s.amount_of_token = amount_of_token;
		s.price = price;
	});

	///Scope the order to the maker's account
	myorders my_order_table(self, maker_account);
	my_order_table.emplace(maker_account, [&](auto& s){
		s.target_token_contract = target_token_contract;
		s.order_id = order_id_count;
		s.expiration_date = now();
		s.price = price;
		s.amount_of_token = amount_of_token;
	});
}

void exchange::takeorder(uint64_t self, uint64_t code) 
{
	auto data = unpack_action_data<take_order>();
	account_name taker_account = data.taker_account;
	string target_token_contract_str = data.target_token_contract;
	asset amount_of_token = data.amount_of_token;
	uint64_t order_id = data.order_id;
	float take_price = data.price;

	require_auth(taker_account);

	eosio_assert(target_token_contract_str.size() <= 12, "Invalid target_token_contract");
	uint64_t target_token_contract = eosio::string_to_name(target_token_contract_str.c_str());
	uint64_t eosio_token_contract = N(eosio.token);

	orders order_to_fill(self, target_token_contract);
	auto order_reference = order_to_fill.find(order_id);
	
	eostemplate eos_template_ref(self, self);
	auto eos_asset_struct = eos_template_ref.find(1962);
	const asset eos_asset = eos_asset_struct->eos_asset;

	const account_name maker_account = order_reference->maker_account;

	myorders maker_order_table(self, maker_account);
	auto maker_order_reference = maker_order_table.find(target_token_contract+order_id);
	
	accounts maker_account_table(self, maker_account);
	const float price = order_reference->price;
	const uint8_t buy_or_sell = order_reference->buy_or_sell; 

	eosio_assert(take_price == price, "Price does not match the order. Are you sure you have selected the correct order?"); //Failsafe

	///Check that order hasn't expired
	auto current_time = now();
	auto order_expiration_date = order_reference->expiration_date;
	eosio_assert(current_time < order_expiration_date, "The order you selected has expired");

	eosio_assert(amount_of_token.symbol == order_reference->amount_of_token.symbol, "Symbol mismatch");
	eosio_assert(order_reference->amount_of_token >= amount_of_token && order_reference->amount_of_token.amount > 0, "Overflow error: Amount of token must be greater than 0 and less than the order amount");
	eosio_assert(order_reference != order_to_fill.end(), "The order_id you entered does not exist!");

	///We need to subtract the balance from the taker
	///And then add the balance to the taker
	///And then add the balance to the maker
	accounts taker_account_table(self, taker_account);
	if (buy_or_sell == 0) {
		///Subtract eos balance from the taker
		float amount_of_eos = price * amount_of_token.amount;
		auto it = taker_account_table.find(eosio_token_contract);
		eosio_assert(it != taker_account_table.end(), "You do not have any EOS");
		taker_account_table.modify(it, taker_account, [&](auto& s) {
			eosio_assert(amount_of_eos <= s.balance.amount, "Insufficient EOS balance!");
			s.balance.amount -= amount_of_eos;
		});
		///Add token balance to the taker
		auto itb = taker_account_table.find(target_token_contract);
		if (itb == taker_account_table.end()) {
			taker_account_table.emplace(taker_account, [&](auto& s){
				s.balance = amount_of_token;
				s.token_contract = target_token_contract;
			});
		} else {
			taker_account_table.modify(itb, taker_account, [&](auto& s){
				s.balance += amount_of_token;
			});
		}
		///Add eos balance to the maker
		auto itc = maker_account_table.find(eosio_token_contract);
		if(itc == maker_account_table.end()) {
			maker_account_table.emplace(taker_account, [&](auto& s){
				s.balance = eos_asset;
				s.balance.amount += amount_of_token.amount * price;
				s.token_contract = eosio_token_contract;
			});
		} else {
			maker_account_table.modify(itc, taker_account, [&](auto& s){
				s.balance.amount += amount_of_token.amount * price;
			});
		}
	} else if (buy_or_sell == 1) {
		///Subtract token balance from the taker
		auto it = taker_account_table.find(target_token_contract);
		eosio_assert(it != taker_account_table.end(), "You do not have the given asset");
		taker_account_table.modify(it, taker_account, [&](auto& s){
			eosio_assert(amount_of_token <= s.balance, "Insufficient token balance!");
			s.balance -= amount_of_token;
		});
		///Add eos balance to the taker
		auto itb = taker_account_table.find(eosio_token_contract);
		if (itb == taker_account_table.end()) {
			taker_account_table.emplace(taker_account, [&](auto& s) {
				s.balance = eos_asset;
				s.balance.amount = amount_of_token.amount * price;
				s.token_contract = eosio_token_contract;
			});
		} else {
			taker_account_table.modify(itb, taker_account, [&](auto& s){
				s.balance.amount += amount_of_token.amount * price;
			});
		}
		///Add token balance to the maker
		auto itc = maker_account_table.find(target_token_contract);
		if(itc == maker_account_table.end()) {
			maker_account_table.emplace(taker_account, [&](auto& s){
				s.balance = amount_of_token;
				s.token_contract = target_token_contract;
			});
		} else {
			maker_account_table.modify(itc, taker_account, [&](auto& s){
				s.balance += amount_of_token; 
			});
		}
	}

	///We need to subtract from the order or erase it
	if (amount_of_token == order_reference->amount_of_token) {
		maker_order_table.erase(maker_order_reference);
		order_to_fill.erase(order_reference);
	} else {
		order_to_fill.modify(order_reference, taker_account, [&](auto& s) {
			s.amount_of_token -= amount_of_token; 
		});
	}
}


void exchange::makewithdraw(uint64_t self, uint64_t code)
{
	auto data = unpack_action_data<make_withdraw>();
	account_name withdraw_account = data.withdraw_account;
	string target_token_contract_str = data.target_token_contract;
	asset amount_of_token = data.amount_of_token;
	
	require_auth(withdraw_account);

	
	eosio_assert(target_token_contract_str.size() <= 12, "Invalid target_token_contract");
	uint64_t target_token_contract = eosio::string_to_name(target_token_contract_str.c_str());

	accounts withdraw_account_table(self, withdraw_account);
	auto it = withdraw_account_table.find(target_token_contract);

	eosio_assert(it != withdraw_account_table.end(), "You do not have any available balances");
	
	///Subtract or delete balance from the withdraw account
	asset current_balance = it->balance;
	eosio_assert(current_balance >= amount_of_token, "You do not have enough of the given asset");
	if (current_balance == amount_of_token) {
		withdraw_account_table.erase(it);
	} else {
		withdraw_account_table.modify(it, withdraw_account, [&](auto& s){
			s.balance -= amount_of_token;
		});
	}

	action {
		permission_level{self, N(active)},
		target_token_contract,
		N(transfer),
		currency::transfer{
		.from=self, .to=withdraw_account, .quantity=amount_of_token, .memo="Withdraw from eostrader"}
	}.send();
}

void exchange::cancelorder(uint64_t self, uint64_t code) {
	auto data = unpack_action_data<cancel_order>();
	string target_token_contract_str = data.target_token_contract;
	uint64_t order_id = data.order_id;

	eosio_assert(target_token_contract_str.size() <= 12, "Invalid target_token_contract");
	uint64_t target_token_contract = eosio::string_to_name(target_token_contract_str.c_str());
	uint64_t eosio_token_contract = N(eosio.token);

	orders order_table(self, target_token_contract);
	auto order_ref = order_table.find(order_id);
	eosio_assert(order_ref != order_table.end(), "Could not find the specified order");

	account_name maker_account = order_ref->maker_account;
	myorders myorder_table(self, order_ref->maker_account);
	auto myorder_ref = myorder_table.find(target_token_contract+order_id);
	
	require_auth(maker_account);

	accounts account_table(self, maker_account);
	if (order_ref->buy_or_sell == 1) {
		auto it = account_table.find(eosio_token_contract);
		float amount_of_eos = order_ref->amount_of_token.amount * order_ref->price;
		account_table.modify(it, maker_account, [&](auto& s){
			s.balance.amount += amount_of_eos;
		});
	} else if (order_ref->buy_or_sell == 0) {
		auto it = account_table.find(target_token_contract);
		account_table.modify(it, maker_account, [&](auto& s){
			s.balance += order_ref->amount_of_token;
		});
	}

	order_table.erase(order_ref);
	myorder_table.erase(myorder_ref);
}

///Listen to actions
extern "C" {
	/// The apply method implements the dispatch of events to this contract
	void apply( uint64_t receiver, uint64_t code, uint64_t action ) {
		if( code == N(eosio) && action == N(onerror) ) {
		//apply_onerror( receiver, onerror::from_current_action() );
		} else if( code ) {
			switch(action) {
					case N(seteosasset): return exchange::seteosasset(receiver, code);
					case N(setadmin): return exchange::setadmin(receiver, code);
					case N(transfer): return exchange::deposit(receiver, code);
					case N(makeorder): return exchange::makeorder(receiver, code);
					case N(takeorder): return exchange::takeorder(receiver, code);
					case N(cancelorder): return exchange::cancelorder(receiver, code);
					case N(makewithdraw): return exchange::makewithdraw(receiver, code);
				}
			}
	}
}
