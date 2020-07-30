#!/bin/bash
# Usage: ./test.sh

#=================================================================================#
# SETUP

CYAN='\033[1;36m'
NC='\033[0m'

# CHANGE PATH
EOSIO_CONTRACTS_ROOT=/home/ricardo/Documents/eosio.contracts/build

CONTRACT="eosusdcom"
CONTRACT_WASM="$CONTRACT.wasm"
CONTRACT_ABI="$CONTRACT.abi"

OWNER_KEY="EOS6TnW2MQbZwXHWDHAYQazmdc3Sc1KGv4M9TSgsKZJSo43Uxs2Bx"
OWNER_ACCT="5J3TQGkkiRQBKcg8Gg2a7Kk5a2QAQXsyGrkCnnq4krSSJSUkW12"

# pkill nodeos
# nodeos -e -p eosio --http-validate-host=false --delete-all-blocks --contracts-console --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --plugin eosio::producer_plugin --plugin eosio::http_plugin --max-transaction-time=10000

cleos wallet unlock -n default --password PW5JjGjm4FjESLYWUqgpEP4sfVCFoCLfNRccSv2XZNd4cgBJBXnDV
cleos wallet import -n default --private-key $OWNER_ACCT

#=================================================================================#
# BOOTSTRAP EOS CRAP

# EOSIO system-related keys
echo -e "${CYAN}-----------------------SYSTEM KEYS-----------------------${NC}"
cleos wallet import -n default --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cleos wallet import -n default --private-key 5JgqWJYVBcRhviWZB3TU1tN9ui6bGpQgrXVtYZtTG2d3yXrDtYX
cleos wallet import -n default --private-key 5JjjgrrdwijEUU2iifKF94yKduoqfAij4SKk6X5Q3HfgHMS4Ur6
cleos wallet import -n default --private-key 5HxJN9otYmhgCKEbsii5NWhKzVj2fFXu3kzLhuS75upN5isPWNL
cleos wallet import -n default --private-key 5JNHjmgWoHiG9YuvX2qvdnmToD2UcuqavjRW5Q6uHTDtp3KG3DS
cleos wallet import -n default --private-key 5JZkaop6wjGe9YY8cbGwitSuZt8CjRmGUeNMPHuxEDpYoVAjCFZ
cleos wallet import -n default --private-key 5Hroi8WiRg3by7ap3cmnTpUoqbAbHgz3hGnGQNBYFChswPRUt26
cleos wallet import -n default --private-key 5JbMN6pH5LLRT16HBKDhtFeKZqe7BEtLBpbBk5D7xSZZqngrV8o
cleos wallet import -n default --private-key 5JUoVWoLLV3Sj7jUKmfE8Qdt7Eo7dUd4PGZ2snZ81xqgnZzGKdC
cleos wallet import -n default --private-key 5Ju1ree2memrtnq8bdbhNwuowehZwZvEujVUxDhBqmyTYRvctaF

# Create system accounts
echo -e "${CYAN}-----------------------SYSTEM ACCOUNTS-----------------------${NC}"
cleos create account eosio eosio.bpay EOS7gFoz5EB6tM2HxdV9oBjHowtFipigMVtrSZxrJV3X6Ph4jdPg3
cleos create account eosio eosio.msig EOS6QRncHGrDCPKRzPYSiWZaAw7QchdKCMLWgyjLd1s2v8tiYmb45
cleos create account eosio eosio.names EOS7ygRX6zD1sx8c55WxiQZLfoitYk2u8aHrzUxu6vfWn9a51iDJt
cleos create account eosio eosio.ram EOS5tY6zv1vXoqF36gUg5CG7GxWbajnwPtimTnq6h5iptPXwVhnLC
cleos create account eosio eosio.ramfee EOS6a7idZWj1h4PezYks61sf1RJjQJzrc8s4aUbe3YJ3xkdiXKBhF
cleos create account eosio eosio.saving EOS8ioLmKrCyy5VyZqMNdimSpPjVF2tKbT5WKhE67vbVPcsRXtj5z
cleos create account eosio eosio.stake EOS5an8bvYFHZBmiCAzAtVSiEiixbJhLY8Uy5Z7cpf3S9UoqA3bJb
cleos create account eosio eosio.token EOS7JPVyejkbQHzE9Z4HwewNzGss11GB21NPkwTX2MQFmruYFqGXm
cleos create account eosio eosio.vpay EOS6szGbnziz224T1JGoUUFu2LynVG72f8D3UVAS25QgwawdH983U

# Bootstrap new system contracts
echo -e "${CYAN}-----------------------SYSTEM CONTRACTS-----------------------${NC}"
cleos set contract eosio.token $EOSIO_CONTRACTS_ROOT/eosio.token/
cleos set contract eosio.msig $EOSIO_CONTRACTS_ROOT/eosio.msig/
cleos push action eosio.token create '[ "eosio", "100000000000.0000 EOS" ]' -p eosio.token
cleos push action eosio.token create '[ "eosio", "100000000000.0000 SYS" ]' -p eosio.token
echo -e "      EOS TOKEN CREATED"
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 EOS", "memo" ]' -p eosio
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 SYS", "memo" ]' -p eosio
echo -e "      EOS TOKEN ISSUED"
cleos set contract eosio $EOSIO_CONTRACTS_ROOT/eosio.bios/
echo -e "      BIOS SET"
cleos set contract eosio $EOSIO_CONTRACTS_ROOT/eosio.system/
echo -e "      SYSTEM SET"
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active
cleos push action eosio init '[0, "4,EOS"]' -p eosio@active
#cleos push action eosio init '[0, "4,SYS"]' -p eosio@active

# Deploy eosio.wrap
echo -e "${CYAN}-----------------------EOSIO WRAP-----------------------${NC}"
cleos wallet import -n default --private-key 5J3JRDhf4JNhzzjEZAsQEgtVuqvsPPdZv4Tm6SjMRx1ZqToaray
cleos system newaccount eosio eosio.wrap EOS7LpGN1Qz5AbCJmsHzhG7sWEGd9mwhTXWmrYXqxhTknY2fvHQ1A --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 5000 --transfer
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active
cleos set contract eosio.wrap $EOSIO_CONTRACTS_ROOT/eosio.wrap/

#=================================================================================#
# create the eosusdcom111 account, set the contract, create UZD stablecoins

cleos system newaccount eosio eosusdcom111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos set account permission eosusdcom111 active '{"threshold":1,"keys":[{"key":"EOS6TnW2MQbZwXHWDHAYQazmdc3Sc1KGv4M9TSgsKZJSo43Uxs2Bx","weight":1}],"accounts":[{"permission":{"actor":"eosusdcom111","permission":"eosio.code"},"weight":1}],"waits":[]}' -p eosusdcom111@active

cleos set contract eosusdcom111 . $CONTRACT_WASM $CONTRACT_ABI -p eosusdcom111@active
cleos push action eosusdcom111 create '[ "eosusdcom111", "1000000000.0000 UZD"]' -p eosusdcom111@active
cleos push action eosusdcom111 setsupply '[ "eosusdcom111", "1000000000.0000 UZD"]' -p eosusdcom111@active

#=================================================================================#

cleos system newaccount eosio testborrow11 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio testborrow12 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio testinsure11 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio testinsure12 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer

cleos push action eosio.token transfer '[ "eosio", "testborrow11", "1000000.0000 EOS", "m" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "testborrow12", "1000000.0000 EOS", "m" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "testinsure11", "1000000.0000 EOS", "m" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "testinsure12", "1000000.0000 EOS", "m" ]' -p eosio

#=================================================================================#
# create the VIG token
cleos system newaccount eosio vig111111111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer

cleos set contract vig111111111 $EOSIO_CONTRACTS_ROOT/eosio.token/ -p vig111111111@active
cleos push action vig111111111 create '[ "vig111111111", "100000000000.0000 VIG"]' -p vig111111111@active
cleos push action vig111111111 issue '[ "vig111111111", "10000000000.0000 VIG", "m"]' -p vig111111111@active
cleos push action vig111111111 transfer '[ "vig111111111", "testborrow11", "1000000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 transfer '[ "vig111111111", "testborrow12", "1000000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 transfer '[ "vig111111111", "testinsure11", "1000000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 transfer '[ "vig111111111", "testinsure12", "1000000.0000 VIG", "m" ]' -p vig111111111@active

#=================================================================================#
# create dummy tokens
cleos system newaccount eosio dummytokens1 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos set contract dummytokens1 $EOSIO_CONTRACTS_ROOT/eosio.token/ -p dummytokens1@active

cleos push action dummytokens1 create '[ "dummytokens1", "100000000000.0000 IQ"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "100000000000.0000 UTG"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "100000000000.0000 PTI"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "100000000000.0000 OWN"]' -p dummytokens1@active

cleos push action dummytokens1 issue '[ "dummytokens1", "10000000000.0000 IQ", "m"]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "dummytokens1", "10000000000.0000 UTG", "m"]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "dummytokens1", "10000000000.0000 PTI", "m"]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "dummytokens1", "10000000000.0000 OWN", "m"]' -p dummytokens1@active

cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow11", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow11", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow11", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow11", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow12", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow12", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow12", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testborrow12", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure11", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure11", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure11", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure11", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure12", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure12", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure12", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 transfer '[ "dummytokens1", "testinsure12", "100000.0000 OWN", "m" ]' -p dummytokens1@active

#=================================================================================#
# create the oracle contract (for EOS only for now)
cleos system newaccount eosio oracle111111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio eostitanprod $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio feeder111111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer

cleos -u http://api.eosnewyork.io:80 get code delphioracle --wasm -c delphioracle.wasm
cleos -u http://api.eosnewyork.io:80 get code delphioracle --abi delphioracle.abi

cleos set contract oracle111111 . delphioracle.wasm delphioracle.abi -p oracle111111@active

cleos push action oracle111111 setoracles '{"oracleslist":["feeder111111"]}' -p eostitanprod@active
cleos push action oracle111111 write '{"owner":"feeder111111", "value":63800}' -p feeder111111@active
#=================================================================================#

###### OPTIONAL FOR LOCAL TESTNET #############
# nodeosurl='http://127.0.0.1:8888' interval=15000 account="oracle111111" defaultPrivateKey="5J3TQGkkiRQBKcg8Gg2a7Kk5a2QAQXsyGrkCnnq4krSSJSUkW12" feeder="feeder111111" node updater2.js

#cleos get table oracle111111 oracle111111 eosusd --limit 1
#cleos get table oracle111111 oracle111111 oracles
#cleos get table oracle111111 oracle111111 eosusdstats

#=================================================================================#
# exposed actions for eosusdcom demo starts here
cleos push action eosio.token transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"collateral"}' -p testborrow11@active
cleos push action vig111111111 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 VIG","memo":"collateral"}' -p testborrow11@active

cleos push action eosio.token transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"collateral"}' -p testborrow12@active
cleos push action vig111111111 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 VIG","memo":"collateral"}' -p testborrow12@active

cleos push action eosio.token transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"support"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"support"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"support"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"support"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"support"}' -p testinsure11@active

cleos push action eosio.token transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"support"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"support"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"support"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"support"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"support"}' -p testinsure12@active

cleos push action eosusdcom111 assetout '{"usern":"testborrow11","assetout":"2.0000 UZD","memo":"borrow"}' -p testborrow11@active
cleos push action eosusdcom111 assetout '{"usern":"testborrow12","assetout":"24.0000 UZD","memo":"borrow"}' -p testborrow12@active

cleos push action eosusdcom111 assetout '{"usern":"testborrow11","assetout":"1.0000 EOS","memo":"collateral"}' -p testborrow11@active
cleos push action eosusdcom111 assetout '{"usern":"testborrow12","assetout":"1.0000 EOS","memo":"collateral"}' -p testborrow12@active

cleos push action eosusdcom111 assetout '{"usern":"testinsure11","assetout":"1.0000 EOS","memo":"support"}' -p testinsure11@active

cleos push action eosusdcom111 assetout '{"usern":"testinsure12","assetout":"1.0000 EOS","memo":"support"}' -p testinsure12@active

cleos push action eosusdcom111 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"6.0000 UZD","memo":"payoff debt"}' -p testborrow11@active
cleos push action eosusdcom111 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"5.0000 UZD","memo":"payoff debt"}' -p testborrow12@active

cleos get table eosusdcom111 eosusdcom111 user
cleos push action eosusdcom111 doupdate '[true]' -p eosusdcom111@active
sleep 5
cleos push action eosusdcom111 doupdate '[false]' -p eosusdcom111@active
sleep 5
cleos get table eosusdcom111 eosusdcom111 user

# get all the user data
cleos get table eosusdcom111 eosusdcom111 user
cleos get table eosusdcom111 eosusdcom111 globals
# cleos get table eosusdcom111 UZD stat
# cleos get table eosio.token eosusdcom111 accounts
# cleos get table eosio.token testborrow11 accounts
# cleos get table eosusdcom111 testborrow11 accounts
# cleos get currency balance eosusdcom111 testborrow11
# cleos get currency balance eosio.token eosusdcom111
