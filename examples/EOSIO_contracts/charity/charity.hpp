/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */

#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>

#include <string>

namespace eosio
{

class charity : public contract
{
  public:
    charity(account_name self) : contract(self) {}

    /// @abi action
    void hi(account_name user);

    void transfer(account_name from,
                  account_name to,
                  asset quantity,
                  std::string memo);

  public:
    // @table
    struct record
    {
        uint64_t id; // auto increment key
        account_name from;
        account_name to;
        asset quantity;
        std::string memo;

        uint64_t primary_key() const { return id; }

        EOSLIB_SERIALIZE(record, (id)(from)(to)(quantity)(memo))
    };


    typedef multi_index<N(record), record> records;


};

} // namespace eosio
