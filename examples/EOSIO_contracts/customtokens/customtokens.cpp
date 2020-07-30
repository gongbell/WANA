#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>

using eosio::asset;

class customtokens_contract : public eosio::contract {
 public:
  customtokens_contract(account_name self) :
    eosio::contract(self),
    tokens(_self, _self) {}

  // A simple set function:
  // Takes a unique identifier, the person who will own the entry,
  // and the info about the token itself (contract name and asset symbol).
[[eosio::action]]
  void set(const uint64_t uuid, const account_name owner,
      const account_name customtoken, const asset customasset) {
    require_auth(owner);  // Will need owner permission to consume ram.

    // Ensure the asset is a valid type.
    eosio_assert(customasset.is_valid(),  "asset not valid");
    // For simplicity, just allow zero for the initialization value.
    eosio_assert(customasset.amount == 0, "must init with 0");

    // Look up the balance in the owner account of the specified token.
    // There's probably a better way to check if a token is valid or not,
    // but this is a quick check to ensure that the token is live.
    if (owner != _self) {  // Let the contract owner skip this validation.
      accounts accountfind(customtoken, owner);
      const auto& owneracc = accountfind.get(customasset.symbol.name());
      eosio_assert(owneracc.balance.amount > 0, "a bal must exist");
    }

    // Find if we need to replace by identifier.
    auto target_itr = tokens.find(uuid);
    if (target_itr != tokens.end()) {
      require_auth(target_itr->owner);  // Remember to check that owner matches!
      tokens.modify(target_itr, owner, [&](auto& t) {
        t.uuid        = uuid;
        t.owner       = owner;
        t.customtoken = customtoken;
        t.customasset = customasset;
      });
    } else {  // If not a replace, then create a new entry with the details.
      tokens.emplace(owner, [&](auto& t) {
        t.uuid        = uuid;
        t.owner       = owner;
        t.customtoken = customtoken;
        t.customasset = customasset;
      });
    }
  }


  // This allows a user to delete their entry to the table, freeing their ram.
[[eosio::action]]
  void del(const uint64_t uuid) {
    auto target_itr = tokens.find(uuid);
    require_auth(target_itr->owner);  // Ensure they're deleting what they own! 
    tokens.erase(target_itr);
  }


  // Backup function to allow the contract holder to remove a table entry.
  // Not particularly useful unless there's a broken entry or something.
[[eosio::action]]
  void sudodel(const uint64_t uuid) {
    require_auth(_self);
    tokens.erase(tokens.find(uuid));
  }


 private:
  // @abi table tokens i64
  struct token {
    uint64_t     uuid;
    account_name owner;
    account_name customtoken;
    asset        customasset;

    auto primary_key() const {  return uuid;  }
    EOSLIB_SERIALIZE(token, (uuid)(owner)(customtoken)(customasset))
  };
  typedef eosio::multi_index<N(tokens), token> tokens_table;
  tokens_table tokens;

  // This is just to help the account lookup, and is not exposed.
  struct account {
    asset balance;
    auto  primary_key() const {  return balance.symbol.name();  }
  };
  typedef eosio::multi_index<N(accounts), account> accounts;
};

EOSIO_ABI(customtokens_contract, (set)(del)(sudodel))
