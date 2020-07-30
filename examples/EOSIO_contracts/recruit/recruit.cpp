#include <eosiolib/eosio.hpp>
#include "recruit.hpp"

using namespace eosio;

void Recruit::publishnotes(account_name sender, string name, string mobile, string email, string remark) 
{
	// verify 
	require_auth(sender);
	all_recruit recruits(_self, sender);
	eosio_assert(!name.empty(), "invalid name");
	eosio_assert(!email.empty(), "invalid empty");
	eosio_assert(!mobile.empty(), "invalid mobile");

	//find exit record
	auto rt = recruits.find(eosio::string_to_name(name.c_str()));
	if (rt == recruits.end()) 
	{
		//add new notes
		recruits.emplace(sender, [&](recruit &a){
			a.sender = sender;
			a.name = name;
			a.mobile = mobile;
			a.remark = remark;
			a.email = email;
			a.status = 0;
		});
	}else {
		if (rt->status == 0)
		{
			eosio_assert(false, "has publish notes");
		}else if(rt->status == 1) {
			eosio_assert(false, "your notes wast aopted. I'll contract you later");
		}else {
			recruits.modify(rt, _self, [&](recruit &a){
				a.sender = sender;
				a.name = name;
				a.mobile = mobile;
				a.remark = remark;
				a.email = email;
				a.status = 0;
			});
		}
	}
}

void Recruit::auditnote(string name, uint64_t status)
{
	require_auth(_self);
	eosio_assert(status<3, "invalid status[0,1,2]");

	all_recruit recruits(_self, _self);
	auto rt = recruits.find(eosio::string_to_name(name.c_str()));
	eosio_assert(rt != recruits.end(), "not exist");
	recruits.modify(rt, _self, [&](recruit &a){	
		a.status = status;	
	});
}

void Recruit::findbystatus(uint64_t status)
{
	eosio_assert(status<3, "invalid status");

	all_recruit recruits(_self, _self);

	for (recruit rt : recruits)
	{
		//
		if (rt.status == status)
		{
			eosio::print("name:",rt.name.c_str(), " mobile:", rt.mobile.c_str(), " email:", rt.email.c_str(), " remark:", rt.remark.c_str(), "\n");
		}
	}

}

void Recruit::allnotes()
{
	eosio::print("allnotes___");
	all_recruit recruits(_self, _self);
	for(auto rt : recruits) {
		eosio::print("name:",rt.name.c_str(), " mobile:", rt.mobile.c_str(), " email:", rt.email.c_str(), " remark:", rt.remark.c_str(), "\n");
	}
}

EOSIO_ABI(Recruit, (publishnotes)(findbystatus)(auditnote))