#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/multi_index.hpp>
#include <boost/container/flat_map.hpp>

using namespace eosio;

using std::string;
using std::vector;
using std::map;

using boost::container::flat_map;

typedef uint64_t uuid;

/**
 * We are playing with contracts from ethereum
 * to compare how is a solidity implementation
 * vs awesome eos :)
 * @author Leo Ribeiro
 */
class mydao : public eosio::contract {
public:
    mydao( account_name self)
            :eosio::contract(self),
             daos(_self,_self),
             last_id(_self, _self)
    {}

    void hi(account_name user) {
        require_recipient(user);
        print("Hello, ", name{user});
    }

    void createdao(account_name owner, uint16_t min_quorum, uint16_t debating_period_minutes,
                   uint16_t majority_margin) {

        require_auth(owner);

        daos.emplace(owner, [&](auto& r) {
            r.id = next_id();
            r.owner = owner;
            r.min_quorum = min_quorum;
            r.debating_period_minutes = debating_period_minutes;
            r.majority_margin = majority_margin;
            r.members = {owner};
        });

    }

    void changeowner(uuid dao_id, account_name new_owner, account_name owner) {
        require_auth(owner);

        auto dao = require_dao(dao_id);

        // validate owner
        eosio_assert(dao->owner == owner, "only the owner can transfer the ownership");

        require_recipient(new_owner);

        daos.modify(dao, owner, [&](auto &r) {
           r.owner = new_owner;
        });
    }

    void changevoting(uuid dao_id, uint8_t min_quorum, uint16_t debating_period_minutes,
                      uint8_t majority_margin, account_name owner) {
        require_auth(owner);

        auto dao = require_dao(dao_id);

        // validate owner
        eosio_assert(dao->owner == owner, "only the owner can change the voting rules");

        require_recipient(owner);

        daos.modify(dao, owner, [&](auto &r) {
            r.min_quorum = min_quorum;
            r.debating_period_minutes = debating_period_minutes;
            r.majority_margin = majority_margin;
        });
    }

    void addmember(uuid dao_id, account_name new_user, account_name owner) {
        require_auth(owner);

        auto dao = require_dao(dao_id);

        // validate owner
        eosio_assert(dao->owner == owner, "only the owner can add members");

        // check if new user already exists
        const auto &itr_new_member = find(dao->members.begin(), dao->members.end(), new_user);
        eosio_assert(itr_new_member == dao->members.end(), "new user already in dao");

        require_recipient(new_user);

        daos.modify(dao, owner, [&](auto &r) {
            r.members.push_back(new_user);
        });
    }

    void delmember(uuid dao_id, account_name member, account_name owner) {
        require_auth(owner);

        auto dao = require_dao(dao_id);

        // validate owner
        eosio_assert(dao->owner == owner, "only the owner can remove members");

        require_recipient(member);

        daos.modify(dao, owner, [&](auto &r) {

            // check if member exists and remove it
            const auto &itr_member = find(r.members.begin(), r.members.end(), member);
            eosio_assert(itr_member != r.members.end(), "user is not a dao member");

            r.members.erase(itr_member);
        });
    }

    void newproposal(uuid dao_id, account_name author, account_name recipient, asset amount,
                    string description, uint64_t min_execution_date) {
        require_auth(author);

        auto dao = require_dao(dao_id);

        // validate member
        auto itr_member = find(dao->members.begin(), dao->members.end(), author);
        eosio_assert(itr_member != dao->members.end(), "proposal author not in dao");

        daos.modify(dao, author, [&](auto &r) {
            proposal p{recipient, amount, description, min_execution_date, false, false, 0};
            r.proposals.emplace(next_id(), p);
        });
    }

private:

    struct vote {
        bool in_support;
        string justification;
    };

    struct proposal {
        account_name recipient;
        asset amount;
        string description;
        uint64_t min_execution_date;
        bool executed;
        bool proposal_passed;
        uint8_t current_result;
        string proposal_hash;

        map<account_name, vote> votes;
    };

    // @abi table dao i64
    struct dao {
        uuid id;
        account_name owner;
        uint16_t min_quorum;
        uint16_t debating_period_minutes;
        uint16_t majority_margin;

        std::vector<account_name> members;

        flat_map<uuid, proposal> proposals;

        uuid primary_key() const { return id; }
    };

    typedef eosio::multi_index<N(dao), dao> tb_dao;

    tb_dao daos;

    typedef singleton<N(last_id), uuid> last_id_singleton;
    last_id_singleton last_id;

    uuid next_id(){
        uuid lid = last_id.exists() ? last_id.get()+1 : 1000000000;
        last_id.set(lid, _self);
        return lid;
    }

    tb_dao::const_iterator require_dao(uuid dao_id) {
        auto dao = daos.find(dao_id);
        eosio_assert(dao != daos.end(), "invalid dao");
        return dao;
    }

};

EOSIO_ABI(mydao, (hi)(createdao)(newproposal)(addmember)(delmember)(changeowner)(changevoting))
