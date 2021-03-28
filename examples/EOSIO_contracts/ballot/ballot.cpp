#include "ballot.hpp"


/*****************************************************************************
 *                      PUBLIC MEMBER FUNCTIONS
 ****************************************************************************/

void ballot::init(account_name appKey) {
    require_auth(_self);
    require_auth(appKey);

    /* First Member Ever Created */
    uint64_t id = accountHash(appKey);

    /* Instantiate the BallotSettings Singleton */
    BallotSettings(code, _self).set(Settings{appKey}, _self);

    /* Emplce the first member; the creator */
    /* TODO: consider refactoring this to send and INLINE_ACTION to 
    *  'addmember'  */
    auto creator = Members.emplace(_self, [&](auto& m) {
        m.member_id = id;
        m.account = appKey;
        m.weight = 0;
        m.granter = appKey;
        m.invite_permission = true;
    });

    print("Contract Initialized by ", name{appKey});
}

void ballot::addmember(account_name account, account_name granter,
                       uint32_t     weight, bool invite_permission) {
    require_auth(appKey());
    require_auth(account);
    require_auth(granter);

    uint64_t id = accountHash(account);
    uint64_t granter_id = accountHash(granter);

    /* Error Handling */
    auto granter_member = Members.find(granter_id);
    eosio_assert(granter_member != Members.end(), "Granter does not exist");
    eosio_assert(granter_member->invite_permission,
                 "You do not have permission to add a new member!");

    auto member = Members.find(id);
    eosio_assert(member == Members.end(), "Member already exists!");

    /* Create New Member */
    Members.emplace(_self, [&](auto& m) {
        m.member_id = id;
        m.account   = account;
        m.weight    = weight;
        m.granter   = granter;
        m.invite_permission = invite_permission;
    });

    print("New Member Added: ", name{account});
}

void ballot::rmmember(account_name account) {
    require_auth(appKey());
    require_auth(account);

    uint64_t id = accountHash(account);

    auto itr = Members.find(id);

    Members.erase(itr);
}

void ballot::propose(account_name proposer, const string& title, const string& description) {
    require_auth(appKey());
    require_auth(proposer);

    uint64_t proposer_id = accountHash(proposer);
    uint64_t proposal_id = murmur(title);

    // get 'proposer' member
    auto proposer_member = Members.find(proposer_id);
    eosio_assert(proposer_member != Members.end(), "Member does not exist!");

    // check that proposal is new or modify existing
    auto proposal = Proposals.find(proposal_id);
    if (proposal == Proposals.end()) {
        print("Creating new proposal");
        Proposals.emplace(_self, [&](auto& p) {
            p.id = proposal_id;
            p.account = proposer_member->account;
            p.title = title;
            p.description = description;
            p.approved = false;
        });
    } else {
        print("Modifing existing proposal");
        eosio_assert(proposal->id == proposal_id, "Proposal ID mismatch");
        Proposals.modify(proposal, 0, [&](auto& p) {
            p.description = description;
        });
    }

}

void ballot::rmproposal(account_name proposal_owner, const string& title) {
    require_auth(appKey());
    require_auth(proposal_owner);

    uint64_t proposer_id = accountHash(proposal_owner);
    uint64_t proposal_id = murmur(title);

    auto proposer_member = Members.find(proposer_id);
    eosio_assert(proposer_member != Members.end(), "Member does not exist");

    auto proposal = Proposals.find(proposal_id);
    eosio_assert(proposal != Proposals.end(), "Proposal does not exist");

    Proposals.erase(proposal);

    print("Proposal: ", proposal->title.c_str(), " removed from the database\n");

}

void ballot::addvote(account_name voter, const string& proposal_title) {
    require_auth(appKey());
    require_auth(voter);

    // Find the member 'voter'
    uint64_t voter_id = accountHash(voter);
    uint64_t proposal_id = murmur(proposal_title);

    auto member = Members.find(voter_id);
    eosio_assert(member != Members.end(), "Member does not exists!");

    // Find the proposal by 'proposal_id'
    auto proposal = Proposals.find(proposal_id);
    eosio_assert(proposal != Proposals.end(), "Proposal does not exist");

    // Check to make sure member hasn't already voted for this proposal
    auto vote_itr = proposal->votes.begin();

    for (; vote_itr != proposal->votes.end(); ++vote_itr) {
        //print("itr  : ", name{vote_itr->voter_name}, "\n");
        //print("Input: ", name{voter}, "\n");
        eosio_assert(vote_itr->voter_name != voter, "Member already voted for this proposal");
    }

    // push a vote to the vote vector in the proposal
    Proposals.modify(proposal, 0, [&](auto& p) {
        // Create the new vote
        Vote new_vote = { 
            .vote = member->weight,
            .voter_name = member->account
        };
       p.votes.push_back(new_vote);
    });

    print("'", name{voter}, "' voted for '", proposal->title.c_str(), "'\n");
}

void ballot::rmvote(account_name voter, const string& proposal_title) {
    require_auth(appKey());
    require_auth(voter);

    bool is_vote_found = false;

    uint64_t voter_id = accountHash(voter);
    uint64_t proposal_id = murmur(proposal_title);

    // find voter
    auto member = Members.find(voter_id);
    eosio_assert(member != Members.end(), "Member does not exists!");

    // Find the proposal
    auto proposal = Proposals.find(proposal_id);
    eosio_assert(proposal != Proposals.end(), "Proposal does not exist");

    // find vote inside proposal
    Vote vote_to_find = {
        .vote = member->weight,
        .voter_name = member->account
    };

    /* The 'find' algorith was not compiling so I did it manualy.  However this is not very
    *  efficent.  Should be refactored in the future */
    //auto found_vote = find(proposal->votes.begin(), proposal->votes.end(), vote_to_find);
    //eosio_assert(found_vote != proposal->votes.end(), "Member has not voted for this proposal");

    auto vote_itr = proposal->votes.begin();
    while( (vote_itr != proposal->votes.end()) && !is_vote_found) {
        //print("vote_itr: ", name{vote_itr->voter_name}, "\n");
        if (vote_itr->voter_name == voter) {
            is_vote_found = true;

            print("Removing vote for '", name{vote_itr->voter_name}, "'\n");

            Proposals.modify(proposal, 0, [&](auto& p) {
                p.votes.erase(vote_itr);
            });
            return;
        }
        ++vote_itr;
    }

    eosio_assert(0, "Member has not voted for this proposals!");

}

void ballot::countvotes(const string& title) {
    require_auth(appKey());

    uint64_t proposal_id = murmur(title);

    // find proposal
    auto proposal = Proposals.find(proposal_id);
    eosio_assert(proposal != Proposals.end(), "Proposal does not exist");

    // count all votes cast
    uint64_t total_votes_cast = 0;
    for (auto vote_itr = proposal->votes.begin(); vote_itr != proposal->votes.end(); ++vote_itr) {
        total_votes_cast += vote_itr->vote;
    }
    print("Total votes cast for this proposal: ", total_votes_cast, "\n");

    // count the total voting power in existance
    uint64_t total_voting_weight = 0;
    for (auto member = Members.begin(); member != Members.end(); ++member) {
        total_voting_weight += member->weight;
    }
    print("Total voting weight in existance: ", total_voting_weight, "\n");

    // check to approve
    if (check_for_approval(total_votes_cast, total_voting_weight, 0.75 /* Test */)) {
        Proposals.modify(proposal, 0, [&](auto& p) {
            p.approved = true;
        });
        print("APPROVED!\n");
    }
    else {
        Proposals.modify(proposal, 0, [&](auto& p) {
            p.approved = false;
        });
        print("NOT APPROVED!\n");
    }
}

/*****************************************************************************
 *                      PRIVATE MEMBER FUNCTIONS
 ****************************************************************************/

bool ballot::check_for_approval(const uint64_t& votes_cast,
                                const uint64_t& votes_total,
                                const double&   percentage_needed) {
    print("Percentage needed: ", percentage_needed, "\n");
    print("Votes needed: ", votes_total * percentage_needed, "\n");

    return (votes_cast > (votes_total * percentage_needed)) ? true : false;
}

/*ballot::Member ballot::get_member(account_name voter) {
    auto member = ballot::Members.find(voter);
    eosio_assert(member =! ballot::Members.end(), "Member doesn't exist");

    return *member;  // member object itr points to
}*/

/*Member ballot::create_member(account_name account, account_name granter,
                             uint32_t     weight, bool invite_permission) {
    require_auth(account);
    require_auth(granter);

    auto member = Members.find(account);
    eosio_assert(member == Members.end(), "Memember already exists!");
    eosio_assert(granter.invite_permission,
                 "You do not have permission to add a new member!");
    eosio_assert(weight >= 0, "Weight must be a positive integer");

    // Create New Member
    auto new_member = Members.emplace(_self, [&](auto& m) {
        m.account = account;
        m.weight = weight;
        m.granter = granter;
        m.invite_permission = invite_permission;
    });

    return *new_member;
}*/

EOSIO_ABI( ballot, (init)(addmember)(rmmember)(propose)(rmproposal)(addvote)(rmvote)(countvotes) )