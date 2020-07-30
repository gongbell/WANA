#pragma once

#include <cmath>

#include <eosio/asset.hpp>
#include <eosio/symbol.hpp>
#include <eosio/eosio.hpp>

static const uint8_t EOS_PRECISION = 4;
static const eosio::symbol EOS_SYMBOL = eosio::symbol("EOS", EOS_PRECISION);

inline static eosio::asset double_to_asset(double amount) {
  return eosio::asset((uint64_t)(pow(10, EOS_PRECISION) * amount), EOS_SYMBOL);
}

inline static double asset_to_double(const eosio::asset& asset) { return asset.amount / pow(10, EOS_PRECISION); }
