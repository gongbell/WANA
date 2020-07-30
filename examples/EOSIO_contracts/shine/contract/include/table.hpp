#pragma once

#include <vector>

#include <eosio/eosio.hpp>

/**
 * Clear completely a EOS table (`multi_index`) from all its data.
 */
template <name::raw TableName, typename T, typename... Indices>
void table_clear(eosio::multi_index<TableName, T, Indices...>& table) {
  auto itr = table.begin();
  while (itr != table.end()) {
    itr = table.erase(itr);
  }
}
