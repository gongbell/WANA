#include <members.hpp>

/**
 * @brief Register Member
 * @param account <eosio::name> Signee account name
 * @param username <std::string> Member's username name
 */
void members::add(const name account, const string& username) {
	// Authorize and merge member
	require_auth(account);
	merge(account, username);
}

void members::set(const name account, const string& property, const string& value) {
	// Authorize and load member
	require_auth(account);
	profile_table profiles(_self, account);
	auto iter = profiles.find(account);
	// Update property
	profiles.modify(iter, account, [&](auto& member) {
		if (property == "given_name") {
			member.given_name = value;
		} else if (property == "surname") {
			member.surname = value;
		} else {
			prints("Invalid property");
		}
	});
}

/**
 * @brief Merge Member
 * @desc Updates member profile or creates if donesn't exist
 * @param account <eosio::name> Signee account name
 * @param amount <uint64_t> Deposit amount
 */
void members::merge(const name account, const string& username) {

	profile_table profiles(_self, account);
	auto iter = profiles.find(account);

	if (iter == profiles.end()) {
		profiles.emplace(account, [&](auto& member) {
			member.account = account;
			member.username = username;
		});
	} else {
		profiles.modify(iter, account, [&](auto& member) {
			member.username = username;
		});
	}
}

/**
 * @brief Deposit Funds
 * @param account <eosio::name> Signee account name
 * @param amount <uint64_t> Deposit amount
 * @note Should notify the rewards program contract
 * @note Serious underflow error in amount validation
 */
void members::deposit(const name account, const uint64_t amount) {
	// Authorize and validate request arguments
	require_auth(account);
	// Fetch member profile and validate sufficent funds
	profile_table profiles(_self, account);
	auto iter = profiles.find(account);
	// Validate member and amount
	eosio_assert(iter != profiles.end(), "Account doesn't exits");
	eosio_assert(amount > 0 || amount >= (uint64_t)(-amount), "Invalid deposit amount"); 
	// Update the member profile table balance
 	profiles.modify(iter, account, [&](auto& obj) {
		obj.balance = obj.balance + amount;
	});
}

/**
 * @brief Withdraw Funds
 * @param account <eosio::name> Signee account name
 * @param amount <uint64_t> Withdrawal amount
 * @note Should notify the rewards program contract
 */
void members::withdraw(const name account, const uint64_t amount) {
	// Authorize and validate request arguments
	require_auth(account);
	profile_table profiles(_self, account);
	auto member = profiles.find(account);
	// Validate member and balance
	eosio_assert(member != profiles.end(), "Account doesn't exits");
	eosio_assert(member->balance >= amount, "Insufficient funds");
	// Update the balance for the member's profile
 	profiles.modify(member, account, [&](auto& obj) {
		obj.balance = obj.balance - amount;
	});
}

/**
 * @brief Remove Member
 * @param account <eosio::name> Signee account name
 * @note Should notify all dependent contracts
 */
void members::remove(const name account) {
	// Authroize signee account
	require_auth(account);
	profile_table profiles(_self, account);
	// Fetch member
	auto member = profiles.find(account);
	eosio_assert(member != profiles.end(), "Account doesn't exits");
	// Remove member profile
	profiles.erase(member);
}