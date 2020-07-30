#!/bin/sh

# (1) Setting the alias inside the docker container
#alias cleos='docker exec eosio /opt/eosio/bin/cleos --wallet-url http://localhost:8888'

# (2) Creating the wallet password and saving a JSON file
WALLET_PASSWORD=$(cleos wallet create | tail -n 1)
echo "\"wallet_password\" : \"$WALLET_PASSWORD\"," >> keyfile.json

# (3) Unlock the wallet for 3600 seconds
cleos wallet unlock --password ${WALLET_PASSWORD} --unlock-timeout 36000

# (4) Setting variables and creating OWNER account and Relating private keys inside the wallet, when its unlocked
OWNER_ACCOUNT_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
OWNER_ACCOUNT_KEY_PAIR_ARR=($OWNER_ACCOUNT_KEY_PAIR)
OWNER_ACCOUNT_PRIVATE_KEY=${OWNER_ACCOUNT_KEY_PAIR_ARR[0]}
OWNER_ACCOUNT_PUBLIC_KEY=${OWNER_ACCOUNT_KEY_PAIR_ARR[1]}

OWNER_ACTIVE_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
OWNER_ACTIVE_KEY_PAIR_ARR=($OWNER_ACTIVE_KEY_PAIR)
OWNER_ACTIVE_PRIVATE_KEY=${OWNER_ACTIVE_KEY_PAIR_ARR[0]}
OWNER_ACTIVE_PUBLIC_KEY=${OWNER_ACTIVE_KEY_PAIR_ARR[1]}

cleos wallet import ${OWNER_ACCOUNT_PRIVATE_KEY}
cleos wallet import ${OWNER_ACTIVE_PRIVATE_KEY}

# (5) Creating TESTACC account and Relating private keys inside the wallet, when its unlocked

TESTACC_OWNER_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
TESTACC_OWNER_KEY_PAIR_ARR=($TESTACC_OWNER_KEY_PAIR)
TESTACC_OWNER_PRIVATE_KEY=${OWNER_ACCOUNT_KEY_PAIR_ARR[0]}
TESTACC_OWNER_PUBLIC_KEY=${OWNER_ACCOUNT_KEY_PAIR_ARR[1]}

TESTACC_ACTIVE_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
TESTACC_ACTIVE_KEY_PAIR_ARR=($TESTACC_ACTIVE_KEY_PAIR)
TESTACC_ACTIVE_PRIVATE_KEY=${TESTACC_ACTIVE_KEY_PAIR_ARR[0]}
TESTACC_ACTIVE_PUBLIC_KEY=${TESTACC_ACTIVE_KEY_PAIR_ARR[1]}

# Improting the eosio private key -Only LocaltestNet
cleos wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

cleos wallet import ${TESTACC_ACTIVE_PRIVATE_KEY}
cleos wallet import ${TESTACC_OWNER_PRIVATE_KEY}
cleos create account eosio testacc ${TESTACC_OWNER_PUBLIC_KEY} ${TESTACC_ACTIVE_PUBLIC_KEY}

# (6) Create keys, add keys to wallet, create new account 
add_new_account() {
	echo "START: Creating account: $1" 
	OWNER_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
	OWNER_KEY_PAIR_ARR=($OWNER_KEY_PAIR)
	OWNER_PRIVATE_KEY=${OWNER_KEY_PAIR_ARR[0]}
	OWNER_PUBLIC_KEY=${OWNER_KEY_PAIR_ARR[1]}

	ACTIVE_KEY_PAIR=$(cleos create key |  grep -oE "[^:]+$")
	ACTIVE_KEY_PAIR_ARR=($ACTIVE_KEY_PAIR)
	ACTIVE_PRIVATE_KEY=${ACTIVE_KEY_PAIR_ARR[0]}
	ACTIVE_PUBLIC_KEY=${ACTIVE_KEY_PAIR_ARR[1]}

	echo "\""$1"\" : \""$OWNER_PRIVATE_KEY"\"," >> keyfile.json

	cleos wallet import ${OWNER_PRIVATE_KEY}
	cleos wallet import ${ACTIVE_PRIVATE_KEY}
	cleos create account eosio "$1" ${OWNER_PUBLIC_KEY} ${ACTIVE_PUBLIC_KEY}
	cleos push action eosio updateauth "{\"account\":\"$1\",\"permission\":\"active\",\"parent\":\"owner\",\"auth\":{\"keys\":[{\"key\":\"${OWNER_PUBLIC_KEY}\", \"weight\":1}],\"threshold\":1,\"accounts\":[{\"permission\":{\"actor\":\"eosio.token\",\"permission\":\"eosio.code\"},\"weight\":1}],\"waits\":[]}}" -p $1
	echo "FINISH: Creating account: $1" 
}

# (7) Add more smart contract accounts
add_new_account "eosio.token"
add_new_account "reliefchain"


# Add 5 citizens
add_new_account "c1"
add_new_account "c2"
add_new_account "c3"
add_new_account "c4"
add_new_account "c5"

# Add 5 ngo
add_new_account "ngo1"
add_new_account "ngo2"
add_new_account "ngo3"
add_new_account "ngo4"
add_new_account "ngo5"

# Add 2 disaster
add_new_account "disaster1"
add_new_account "disaster2"
