#!/bin/bash
# Usage: ./test.sh
#=================================================================================#
# SETUP
# 
pkill nodeos
rm -rf ~/.local/share/eosio/nodeos/data
nodeos -e -p eosio --http-validate-host=false --delete-all-blocks --plugin eosio::chain_api_plugin --contracts-console --plugin eosio::http_plugin --plugin eosio::history_api_plugin --verbose-http-errors --max-transaction-time=10000
#nodeos -e -p eosio --plugin eosio::producer_plugin --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --plugin eosio::state_history_plugin --access-control-allow-origin='*' --contracts-console --http-validate-host=false --trace-history --chain-state-history --verbose-http-errors --filter-on='*' --disable-replay-opts >> nodeos.log 2>&1 &


CYAN='\033[1;36m'
NC='\033[0m'

# CHANGE PATH
EOSIO_CONTRACTS_ROOT=/home/gg/contracts/eosio.contracts/contracts


OWNER_KEY="EOS6TnW2MQbZwXHWDHAYQazmdc3Sc1KGv4M9TSgsKZJSo43Uxs2Bx"
OWNER_ACCT="5J3TQGkkiRQBKcg8Gg2a7Kk5a2QAQXsyGrkCnnq4krSSJSUkW12"

#cleos wallet create -n testuser --to-console
cleos wallet unlock -n testuser --password PW5J5Q8suG6RbrjgD8on3BGwZtGbdGdmu7k2Q3tszvYMz7pokrfzL
cleos wallet import -n testuser --private-key $OWNER_ACCT
#cleos wallet create --to-console
cleos wallet unlock -n default --password PW5HzuR3R2g77WZCsqaSMD91aC3WPFQzmeHkyzyEREbPTB3EmHeMC

#cleos wallet remove_key -n default $OWNER_KEY --password PW5HzuR3R2g77WZCsqaSMD91aC3WPFQzmeHkyzyEREbPTB3EmHeMC

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
#cleos create account eosio eosio.token EOS7JPVyejkbQHzE9Z4HwewNzGss11GB21NPkwTX2MQFmruYFqGXm
cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos create account eosio eosio.vpay EOS6szGbnziz224T1JGoUUFu2LynVG72f8D3UVAS25QgwawdH983U
cleos create account eosio eosio.rex EOS6szGbnziz224T1JGoUUFu2LynVG72f8D3UVAS25QgwawdH983U



# Bootstrap new system contracts
echo -e "${CYAN}-----------------------SYSTEM CONTRACTS-----------------------${NC}"
#eosio-cpp -contract=eosio.msig -I=$EOSIO_CONTRACTS_ROOT/eosio.msig/include -o=$EOSIO_CONTRACTS_ROOT/eosio.msig/eosio.msig.wasm -abigen $EOSIO_CONTRACTS_ROOT/eosio.msig/src/eosio.msig.cpp
#eosio-cpp -contract=eosio.system -I=$EOSIO_CONTRACTS_ROOT/eosio.system/include -I=$EOSIO_CONTRACTS_ROOT/eosio.token/include -o=$EOSIO_CONTRACTS_ROOT/eosio.system/eosio.system.wasm -abigen $EOSIO_CONTRACTS_ROOT/eosio.system/src/eosio.system.cpp
#eosio-cpp -contract=eosio.wrap -I=$EOSIO_CONTRACTS_ROOT/eosio.wrap/include -o=$EOSIO_CONTRACTS_ROOT/eosio.wrap/eosio.wrap.wasm -abigen $EOSIO_CONTRACTS_ROOT/eosio.wrap/src/eosio.wrap.cpp
#eosio-cpp -contract=eosio.token -I=$EOSIO_CONTRACTS_ROOT/eosio.token/include -o=$EOSIO_CONTRACTS_ROOT/eosio.token/eosio.token.wasm -abigen $EOSIO_CONTRACTS_ROOT/eosio.token/src/eosio.token.cpp
#eosio-cpp -contract=eosio.bios -I=$EOSIO_CONTRACTS_ROOT/eosio.bios/include -o=$EOSIO_CONTRACTS_ROOT/eosio.bios/eosio.bios.wasm -abigen $EOSIO_CONTRACTS_ROOT/eosio.bios/src/eosio.bios.cpp

cleos set contract eosio.token $EOSIO_CONTRACTS_ROOT/eosio.token/
cleos set contract eosio.msig $EOSIO_CONTRACTS_ROOT/eosio.msig
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
cleos push action eosio init '["0", "4,EOS"]' -p eosio@active
#cleos push action eosio init '["0", "4,SYS"]' -p eosio@active

# Deploy eosio.wrap
echo -e "${CYAN}-----------------------EOSIO WRAP-----------------------${NC}"
cleos wallet import -n default --private-key 5J3JRDhf4JNhzzjEZAsQEgtVuqvsPPdZv4Tm6SjMRx1ZqToaray
cleos system newaccount eosio eosio.wrap EOS7LpGN1Qz5AbCJmsHzhG7sWEGd9mwhTXWmrYXqxhTknY2fvHQ1A --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 5000 --transfer
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active
cleos set contract eosio.wrap $EOSIO_CONTRACTS_ROOT/eosio.wrap/

#=================================================================================#
# create the vigorairburn account, set the contract, create UZD stablecoins

cleos system newaccount eosio vigorairburn $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos set account permission vigorairburn active '{"threshold":1,"keys":[{"key":"EOS6TnW2MQbZwXHWDHAYQazmdc3Sc1KGv4M9TSgsKZJSo43Uxs2Bx","weight":1}],"accounts":[{"permission":{"actor":"vigorairburn","permission":"eosio.code"},"weight":1}],"waits":[]}' -p vigorairburn@active


CONTRACT_ROOT=/home/gg/contracts/vigor/contracts
CONTRACT="airburn"
CONTRACT_WASM="$CONTRACT.wasm"
CONTRACT_ABI="$CONTRACT.abi"
CONTRACT_CPP="$CONTRACT.cpp"
EOSIO_CONTRACTS_ROOT=/home/gg/contracts/eosio.contracts/contracts
#eosio-cpp -contract=$CONTRACT -I=$CONTRACT_ROOT -I=$EOSIO_CONTRACTS_ROOT/eosio.system/include -o="$CONTRACT_ROOT/$CONTRACT_WASM" -abigen "$CONTRACT_ROOT/$CONTRACT_CPP" 
cleos set contract vigorairburn $CONTRACT_ROOT $CONTRACT_WASM $CONTRACT_ABI -p vigorairburn@active

cleos system newaccount eosio testbuy11111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio testbuy11112 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos system newaccount eosio testsavings1 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer

cleos push action eosio.token transfer '[ "eosio", "testbuy11111", "1000000.0000 EOS", "m" ]' -p eosio
cleos push action eosio.token transfer '[ "eosio", "testbuy11112", "1000000.0000 EOS", "m" ]' -p eosio

#=================================================================================#
# create the VIG token
cleos system newaccount eosio vig111111111 $OWNER_KEY --stake-cpu "50 EOS" --stake-net "10 EOS" --buy-ram-kbytes 50000 --transfer
cleos set contract vig111111111 $EOSIO_CONTRACTS_ROOT/eosio.token/ -p vig111111111@active
cleos push action vig111111111 create '[ "vig111111111", "1000000000.0000 VIG"]' -p vig111111111@active
cleos push action vig111111111 issue '[ "vig111111111", "1000000000.0000 VIG", "m"]' -p vig111111111@active
#=================================================================================#

#=================================================================================#
# start an auction

#start_ts; //starting time
#payouts_per_payin;  // how many outbound transfers to trigger on each inbound
#payouts_delay_sec;  // defferred transaction delay in seconds
#payout_cycles_per_user; // how many cycles aggregated per transfer for a user
 
 echo '{"setting":
     {"whitelist": "vigorairburn",
                    "tokens_account": "vigorairburn",
                    "savings_account": "testsavings1",
                    "cycles": 2,
                    "seconds_per_cycle": 60,
                    "start_ts": '$(($(date +%s%N)/1000))',
                    "quota_per_cycle": {
                            "quantity": "100.0000 VIG",
                            "contract": "vig111111111",
                    },
                    "accepted_token": {
                            "quantity": "0.1000 EOS",
                            "contract": "eosio.token",
                    },
                    "payouts_per_payin": 0,
                    "payouts_delay_sec": 5,
                    "payout_cycles_per_user": 10}
                    }'> "$CONTRACT_ROOT/settings.json"

cleos push action vigorairburn init "$CONTRACT_ROOT/settings.json" -p vigorairburn

echo '{
    "threshold": 1,
    "keys": [],
    "accounts": [
        {"permission":{"actor":"eosio", "permission":"active"}, "weight":1},
        {"permission":{"actor":"vigorairburn", "permission":"eosio.code"}, "weight":1}
    ],
    "waits": []
}' > airburn_active.json
cleos set account permission vigorairburn active ./airburn_active.json '' -p vigorairburn@active

echo '{
    "threshold": 1,
    "keys": [],
    "accounts": [
        {"permission":{"actor":"eosio", "permission":"active"}, "weight":1},
    ],
    "waits": []
}' > airburn_owner.json
cleos set account permission vigorairburn owner ./airburn_owner.json '' -p vigorairburn@owner

cleos push action vig111111111 transfer '[ "vig111111111", "vigorairburn", "200.0000 VIG", "seed transfer" ]' -p vig111111111@active

#buy from 0th cycle
cleos push action eosio.token transfer '[ "testbuy11111", "vigorairburn", "100.0000 EOS", "" ]' -p testbuy11111@active
cleos push action eosio.token transfer '[ "testbuy11112", "vigorairburn", "200.0000 EOS", "" ]' -p testbuy11112@active
#pause 60 seconds
cleos push action vigorairburn claim '[ "testbuy11111"]' -p testbuy11111@active
cleos push action vigorairburn claim '[ "testbuy11112"]' -p testbuy11111@active
#buy from 1st cycle
cleos push action eosio.token transfer '[ "testbuy11111", "vigorairburn", "100.0000 EOS", "" ]' -p testbuy11111@active
cleos push action eosio.token transfer '[ "testbuy11112", "vigorairburn", "200.0000 EOS", "" ]' -p testbuy11112@active
#pause 60 seconds
cleos push action vigorairburn claim '[ "testbuy11111"]' -p testbuy11111@active
cleos push action vigorairburn claim '[ "testbuy11112"]' -p testbuy11111@active

#check balances of all users, and sale proceeds were sent to savings
cleos get table eosio.token vigorairburn accounts
cleos get table vig111111111 vigorairburn accounts

cleos get table vigorairburn vigorairburn payment
cleos get table vigorairburn vigorairburn cycle
cleos get table vig111111111 VIG stat
cleos get table vig111111111 vig111111111 accounts
cleos get table vig111111111 testbuy11111 accounts
cleos get table vig111111111 testbuy11112 accounts
cleos get table eosio.token testsavings1 accounts
cleos push action eosio.token transfer '[ "vigorairburn", "testbuy11111", "100.0000 EOS", "m" ]' -p vigorairburn
cleos get table vigorairburn vigorairburn payment -Ltestbuy11111 --limit -1 --index 1 --key-type i64
