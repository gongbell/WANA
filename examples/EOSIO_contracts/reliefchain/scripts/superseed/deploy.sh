#!/bin/sh

# (8) Deploy the contract on the blockchain network

cleos set contract reliefchain reliefchain -p reliefchain
cleos set contract eosio.token eosio.token -p eosio.token

# (9) Create virtual tokens ReliefChainTokens
cleos push action eosio.token create '{"issuer":"eosio", "maximum_supply":"1000000000.0000 RFT"}' -p eosio.token