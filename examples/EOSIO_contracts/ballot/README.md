# Abstract
This contract can be used by any application that wishes to create proposals that can be voted on and approved by eosio accounts.

# About
Users can create proposals that consist of a description.  In order for other users to vote on the proposal, they must become a member of the contract.

## Singletons
settings
--------
* appKey (key)
+ voting_enabled
+ approval_percentage (NOT IMPLEMENTED YET)
--------

## Tables
members
--------
* member_id ( key )
+ account
+ weight
+ granter
+ invite_permission
--------

proposals
---------
* id  ( key )
+ account
+ title
+ description
+ votes[]
+ approved
---------

proposals: Any member can create a proposal.  A proposal can be anything, i.e. new law or rule.  Proposals get approved once they reach x% of the combined voting weight from all the members.

Approval Mechanism:
x% of the active member weight must vote for the proposal inorder for it to be approved

Ex:
* p = percentage of total vote weight needed for approval (as decimal, for now)
* m = total votes cast
* a = total votes needed (summation of all members weights)
approval = m > (p * a)

p = 75% (0.75)
m = 250
a = 500

approval = 250 > (0.75 * 500)
approval = 250 > 375
approval failed


## Actions
init: Conceive this contract
* creates the settings for the contract
  * creates the 'creator' of the contract.  The creator is the first member of the
    contract.  Since the creator is also the owner, they cannot vote (weight=0), 
    instead that have only have the ability to add new members.
  * percentage of members needed to approve a proposal
* creates the first member of the contract

addmember: Adds a new member to the contract
  account
  granter
  weight
  invite_permission

rmmember: Free up the storage for the member that wants to leave
  account

propose: Creates a new proposal
  proposer account
  title
  description

rmproposal: Free up storage for a proposal that wants to be deleted
  proposer account
  title

addvote: Allows members to vote on a proposals
  voter account
  proposal title

rmvote: Removes vote to free up storage
  voter account
  proposal title

countvotes: Tallys up the votes for a proposal.  If the amount surpasses the threshold, then the proposal will be approved.
  proposal title

### Example Commands
1) Create contract and set contract owner

`$cleos push action ballot init '["ballot"]' -p ballot`

2) Add new members

`$cleos push action ballot addmember '["usera","ballot","1","1"]' -p usera ballot`

3) Create a new proposal

`$cleos push action ballot propose '["usera","Proposal Title","Description of proposal"]' -p usera ballot`


4) Vote on proposal

`$cleos push action ballot addvote '["usera","Proposal Title"]' -p usera ballot`

5) Approve proposal

`$cleos push action ballot countvotes '["Proposal Title"]' -p ballot`


```
$cleos get table ballot ballot members
{
  "rows": [{
      "member_id": 829746564,
      "account": "ballot",
      "weight": 0,
      "granter": "ballot",
      "invite_permission": 1
    },{
      "member_id": 3803100191,
      "account": "usera",
      "weight": 1,
      "granter": "ballot",
      "invite_permission": 1
    },{
      "member_id": 3877138775,
      "account": "userc",
      "weight": 3,
      "granter": "userb",
      "invite_permission": 1
    }
  ],
  "more": false
}

```

```
$cleos get table ballot ballot proposals
{
  "rows": [{
      "id": 1578512733,
      "account": "usera",
      "title": "Declare Today As A Holiday",
      "description": "May 29, 2018 shall be declared a holiday since because I say so.",
      "votes": [],
      "approved": 0
    },{
      "id": 2136098542,
      "account": "usera",
      "title": "My Proposal",
      "description": "My rule goes here.",
      "votes": [{
          "vote": 1,
          "voter_name": "usera"
        },{
          "vote": 3,
          "voter_name": "userc"
        },{
          "vote": 1,
          "voter_name": "userb"
        }
      ],
      "approved": 0
    }
  ],
  "more": false
}
```