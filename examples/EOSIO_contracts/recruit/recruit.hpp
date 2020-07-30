/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <string>

using namespace eosio;
using std::string;

class Recruit : public eosio::contract
{
public:
	using contract::contract;
	Recruit(account_name self) : contract(self){}

	// @abi action
	void publishnotes(account_name sender, string name, string mobile, string email, string remark);

	// @abi action
	void findbystatus(uint64_t status);

	// @abi action
	void auditnote(string name, uint64_t status);

	// @abi action
	void allnotes();

private:
	struct recruit
	{
		account_name sender;
		string name;
		string mobile;
		string remark;
		string email;
		uint64_t status;
		uint64_t id;
		uint64_t primary_key() const {return eosio::string_to_name(name.c_str());}
		EOSLIB_SERIALIZE(recruit, (sender)(name)(mobile)(remark)(email)(status));

	};

	typedef eosio::multi_index<N(recruit), recruit> all_recruit;
};
