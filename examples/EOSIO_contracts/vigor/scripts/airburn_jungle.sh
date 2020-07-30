


#=================================================================================#
# create the VIG token
#vig111111111
#EOS6Gn47t8P3Qxk8FiTKL82kmCLehtxMiVT6JL8zTL42cHRCkWMWT
#5KFrhgFwJgA22Kvjdxpqc4bPUULbocWnqKTPgsbUktj7YCjEwGL


#cleos wallet create -n testvig --to-console
cleos wallet unlock -n testvig --password PW5J5HRrWktH7wsnTbd6rx4Zt97xgGSRCQj1RMNNePvRNtHDWVMeY
#cleos wallet import -n testvig --private-key 5KFrhgFwJgA22Kvjdxpqc4bPUULbocWnqKTPgsbUktj7YCjEwGL

./jungle.sh system buyram vig111111111 vig111111111 "25.0000 EOS" -p vig111111111
./jungle.sh system delegatebw vig111111111 vig111111111 "20.000 EOS" "20.000 EOS" -p vig111111111

EOSIO_CONTRACTS_ROOT=/home/gg/contracts/eosio.contracts/contracts
./jungle.sh set contract vig111111111 $EOSIO_CONTRACTS_ROOT/eosio.token/ -p vig111111111@active
./jungle.sh push action vig111111111 create '[ "vig111111111", "1000000000.0000 VIG"]' -p vig111111111@active
./jungle.sh push action vig111111111 issue '[ "vig111111111", "1000000000.0000 VIG", "issue"]' -p vig111111111@active
#=================================================================================#

#=================================================================================#
#vigairburn14
#EOS6USbDgMcUwWpHV8gvqyudufqypwYKejgXtLrQkcKL5VYQhpkAZ 
#5KWQTxtZDzNNWj68ToKHdyhqutupsejnmpEZYMv7sBBcuX5dmf2 Public
#vigairburn13
#EOS8e6v5AtCLqY6mVaYdASTgVwq9YKkdrGzJUpom7EVgDXUdceYnH 
#5KUDqwsM4AAn6tBUMQXLEtckdmAxzYY4qfBz1XceEd1CJaR9xMh Public
#vigairburn12
#EOS5hW2mgJVG4WpZwLvgNVZAGzGeZ65VbLvNX5Z1kBpeiib3t8MSy 
#5J1294hRG7g21AnXVRu5ndSPTjGqLUuK1vu1GYPZtjo9c82Y9kC
#cleos wallet create -n testburn --to-console
cleos wallet unlock -n testburn --password PW5JgePS8hWi1bN8kEywVVt1nT83o1nDJhLRrwf4rcjBRivrJWiw5
#cleos wallet import -n testburn --private-key 5KWQTxtZDzNNWj68ToKHdyhqutupsejnmpEZYMv7sBBcuX5dmf2
#old
#vigairburn11
#EOS8VKfwWGHeiKSVtUQYvPtmihT59oJgAzgJr3tNYRnf334xMubAy
#5JkAWv8E6wRZov4NeCYmUoc1XKjQsUSFnBJcNtNfyQKjyeMR4WR

./jungle.sh system buyram vigairburn14 vigairburn14 "25.0000 EOS" -p vigairburn14
./jungle.sh system delegatebw vigairburn14 vigairburn14 "20.000 EOS" "20.000 EOS" -p vigairburn14
CONTRACT_ROOT=/home/gg/contracts/vigor/contracts
CONTRACT="airburn"
CONTRACT_WASM="$CONTRACT.wasm"
CONTRACT_ABI="$CONTRACT.abi"
CONTRACT_CPP="$CONTRACT.cpp"
EOSIO_CONTRACTS_ROOT=/home/gg/contracts/eosio.contracts/contracts
eosio-cpp -contract=$CONTRACT -I=$CONTRACT_ROOT -I=$EOSIO_CONTRACTS_ROOT/eosio.system/include -o="$CONTRACT_ROOT/$CONTRACT_WASM" -abigen "$CONTRACT_ROOT/$CONTRACT_CPP"

./jungle.sh set account permission vigairburn14 active '{"threshold":1,"keys":[{"key":"EOS6USbDgMcUwWpHV8gvqyudufqypwYKejgXtLrQkcKL5VYQhpkAZ","weight":1}],"accounts":[{"permission":{"actor":"vigairburn14","permission":"eosio.code"},"weight":1}],"waits":[]}' -p vigairburn14@active
./jungle.sh set contract vigairburn14 $CONTRACT_ROOT $CONTRACT_WASM $CONTRACT_ABI -p vigairburn14@active
#=================================================================================#



#=================================================================================#
#initiate the airburn
 echo '{"setting":
     {"whitelist": "airburn11111",
                    "tokens_account": "airburn11111",
                    "savings_account": "testsavings1",
                    "cycles": 10,
                    "seconds_per_cycle": 64800,
                    "start_ts": '$(($(date +%s%N)/1000000*1000))',
                    "quota_per_cycle": {
                            "quantity": "1.0000 VIG",
                            "contract": "vig111111111",
                    },
                    "accepted_token": {
                            "quantity": "0.0100 EOS",
                            "contract": "eosio.token",
                    },
                    "payouts_per_payin": 0,
                    "payouts_delay_sec": 1,
                    "payout_cycles_per_user": 10}
                    }'> "$CONTRACT_ROOT/settings.json"



./jungle.sh push action vigairburn14 init "$CONTRACT_ROOT/settings.json" -p vigairburn14

echo '{
    "threshold": 1,
    "keys": [],
    "accounts": [
        {"permission":{"actor":"eosio", "permission":"active"}, "weight":1},
        {"permission":{"actor":"vigairburn14", "permission":"eosio.code"}, "weight":1}
    ],
    "waits": []
}' > airburn_active.json
./jungle.sh set account permission vigairburn14 active ./airburn_active.json '' -p vigairburn14@active

echo '{
    "threshold": 1,
    "keys": [],
    "accounts": [
        {"permission":{"actor":"eosio", "permission":"active"}, "weight":1},
    ],
    "waits": []
}' > airburn_owner.json
./jungle.sh set account permission vigairburn14 owner ./airburn_owner.json '' -p vigairburn14@owner

#=================================================================================#

#=================================================================================#
#add seed funds and buy/claim
./jungle.sh push action vig111111111 transfer '[ "vig111111111", "vigairburn14", "50000.0000 VIG", "seed transfer" ]' -p vig111111111@active


#andrewpbrya3
#EOS6TjAXW4nb4usMuttaCN3dp5SCDGc6wh64LY3A1jtavAxKKkSmR	
#5J5mF2dNMABPN1yWXFoLbWwSuyHiwcf6w9wszDGZD353JVdNdgC

#cleos wallet create -n andrewpbrya3 --to-console
cleos wallet unlock -n andrewpbrya3 --password PW5JDdcwzMW1ubtngaJ8t4qse6iFojfA2VRbhgx6jAexUnHmfP3rn
#cleos wallet import -n andrewpbrya3 --private-key 5J5mF2dNMABPN1yWXFoLbWwSuyHiwcf6w9wszDGZD353JVdNdgC

#buy from 0th cycle
./jungle.sh push action eosio.token transfer '[ "andrewpbrya3", "vigairburn14", "1.0000 EOS", "" ]' -p andrewpbrya3@active
#wait 15 seconds till cycle is over
./jungle.sh push action vigairburn14 claim '[ "andrewpbrya3"]' -p andrewpbrya3@active

#check balances of all users, and sale proceeds were sent to savings
./jungle.sh get table eosio.token vigairburn14 accounts
./jungle.sh get table vig111111111 vigairburn14 accounts
./jungle.sh get table vigairburn14 vigairburn14 payment
./jungle.sh get table vigairburn14 vigairburn14 cycle
./jungle.sh get table vig111111111 VIG stat
./jungle.sh get table vig111111111 vig111111111 accounts

./jungle.sh  push action eosio.token transfer '[ "vigairburn14", "andrewpbrya3", "10.0000 EOS", "m" ]' -p vigairburn14@active

#=================================================================================#

./jungle.sh get table vigairburn14 vigairburn14 payment -Landrewpbrya3 -Uandrewpbrya3 --limit -1 --index 2 --key-type i64

