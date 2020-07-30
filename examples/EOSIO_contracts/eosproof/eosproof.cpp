#include "./eosproof.hpp"
#include <eosiolib/crypto.h>
using namespace eosio;
namespace eosproof
{

class eosproof : public eosio::contract
{
public:
  using contract::contract;
  eosproof(account_name self)
      : eosio::contract(self),
        hasher(_self, _self)
  {
  }
  /// @abi action
  void save(account_name user, const checksum256 &hash, bool saveToTable, string name, string memo, string content) // ,bool force)
  {
    require_auth(user);
    if (!saveToTable)
    {
      return;
    }
    // asserts
    eosio_assert(!exists(hash), "hash already exist in table");
    // read txid
    auto s = read_transaction(nullptr, 0);
    char *tx = (char *)malloc(s);
    read_transaction(tx, s);
    checksum256 txid;
    sha256(tx, s, &txid);
    // insert
    hasher.emplace(user, [&](auto &rec) {
      rec.id = hasher.available_primary_key();
      rec.owner = user;
      rec.hash = hash;
      rec.tx = txid;
    });
  }

  bool exists(const checksum256 &hash) const
  {
    auto idx = hasher.template get_index<N(hash)>();
    auto itr = idx.find(hasher_rec::get_hash(hash));
    return itr != idx.end();
  }

  //@abi table hasher i64
  struct hasher_rec
  {
    uint64_t id;
    account_name owner;
    checksum256 hash;
    checksum256 tx;

    uint64_t primary_key() const { return id; }
    key256 by_hash() const { return get_hash(hash); }

    static key256 get_hash(const checksum256 &hash)
    {
      const uint64_t *p64 = reinterpret_cast<const uint64_t *>(&hash);
      return key256::make_from_word_sequence<uint64_t>(p64[0], p64[1], p64[2], p64[3]);
    }

    EOSLIB_SERIALIZE(hasher_rec, (id)(owner)(hash)(tx))
  };
  // key256 by_tx() const { return get_tx(tx); }

  // static key256 get_tx(const checksum256 &tx)
  // {
  //   const uint64_t *p64 = reinterpret_cast<const uint64_t *>(&tx);
  //   return key256::make_from_word_sequence<uint64_t>(p64[0], p64[1], p64[2], p64[3]);
  // }
  typedef eosio::multi_index<N(hasher), hasher_rec, indexed_by<N(hash), const_mem_fun<hasher_rec, key256, &hasher_rec::by_hash>>> hasher_table_type;

  hasher_table_type hasher;
};
EOSIO_ABI(eosproof, (save))
}
