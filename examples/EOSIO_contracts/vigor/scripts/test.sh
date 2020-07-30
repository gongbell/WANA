#start the local testnet
#rm -rf ~/eosio-wallet/*.wallet
pkill nodeos
rm -rf ~/.local/share/eosio/nodeos/data
nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --contracts-console --max-transaction-time=10000
##############################################

##############################################
# setup eosio system accounts for local testnet
#cleos wallet create -n testwallet --to-console
cleos wallet unlock -n testwallet --password PW5JfGWx3HGfytVbq8eYAdudxPZbun7MvYpk5PyGaYesTJrSK7cpT
#
#cleos wallet import -n testwallet --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
cd ~/contracts/eosio.contracts/contracts/eosio.bios
#eosio-cpp -I include -o eosio.bios.wasm src/eosio.bios.cpp --abigen
cleos set contract eosio ~/contracts/eosio.contracts/contracts/eosio.bios -p eosio@active
cd ~/contracts/eosio.contracts/contracts/eosio.system 
#eosio-cpp -I include -I ../eosio.token/include -o eosio.system.wasm src/eosio.system.cpp --abigen
#cleos set contract eosio ~/contracts/eosio.contracts/contracts/eosio.system -p eosio@active
cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cd ~/contracts/eosio.contracts/contracts/eosio.token
#eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen
cleos set contract eosio.token ~/contracts/eosio.contracts/contracts/eosio.token --abi eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "1000000000.0000 EOS"]' -p eosio.token@active
##############################################

##############################################
# create the eosusdcom111 account, set the contract, create UZD stablecoins
#cleos create key --to-console
#cleos wallet import -n testwallet --private-key 5KNgPef5eY7EBCNHbbm2egiTXfACxSPW3YSiktMkMFVmpqJbRGT
cleos create account eosio eosusdcom111 EOS6gn7ZtKFNRS2WS6oAgcf5QWfmU1CwQEnof6FrBRCTPMBbSMKCY EOS6gn7ZtKFNRS2WS6oAgcf5QWfmU1CwQEnof6FrBRCTPMBbSMKCY
cleos set account permission eosusdcom111 active '{"threshold":1,"keys":[{"key":"EOS6gn7ZtKFNRS2WS6oAgcf5QWfmU1CwQEnof6FrBRCTPMBbSMKCY","weight":1}],"accounts":[{"permission":{"actor":"eosusdcom111","permission":"eosio.code"},"weight":1}],"waits":[]}' owner -p eosusdcom111@owner
#kylin eosusdcom111
# active EOS6AJMuDLaZGP3pre5BJN1KE2H165HWLhxz8VnnuuwWFwW8EzwA8 5JURzu6SWjKZyPiEAPJr9RukKwNce6VmXrifxnSVnpY3vTDEdcH
# owner EOS8X7DhpsAGCbBXsw5LUjWTWDDhtzfaC6K91mfp4DQBCVEGJwUsj 5JUPzEesJZ6CsW73r4qK17KxDFpW1rqFF1bFvzz8RGiYGfBbhUQ
# cleos wallet create -n kylin --to-console
# PW5KSTURv7yGqJAvMvepASYEAmtER9N26UERwce44XnFauUuXsYp7
# cleos wallet import -n kylin --private-key 5JgQGN1pgMgYpiaJnKZeZsK2dJgAwCd3eYwkqkX3m7Ams8wNaQr
# cleos -u https://api.kylin.alohaeos.com system regproducer feeder111111 EOS5vGy7F7AdjUEfnB5Z9YhTSccMrhePhbq4Q2QnuNENGPSJf6Tvi
# feeder111111 {"msg": "succeeded", "keys": {"active_key": {"public": "EOS5vGy7F7AdjUEfnB5Z9YhTSccMrhePhbq4Q2QnuNENGPSJf6Tvi", "private": "5JgQGN1pgMgYpiaJnKZeZsK2dJgAwCd3eYwkqkX3m7Ams8wNaQr"}, "owner_key": {"public": "EOS58sxSZWPbj2VqCzQXv3KfeZ42Zyr6kACuacgPLpJ9YvvLBveGR", "private": "5JekaFjVjYzcWbXaGSYq9vK6CR2zdQxxyxioMJ4Xx2KzVhXaNVv"}}, "account": "feeder111111"}
cd ~/contracts/eosusd/contracts
eosio-cpp -I . -abigen eosusdcom.cpp -o eosusdcom.wasm
cleos set contract eosusdcom111 ~/contracts/eosusd/contracts eosusdcom.wasm eosusdcom.abi -p eosusdcom111@active
cleos push action eosusdcom111 create '[ "eosusdcom111", "1000000000.0000 UZD"]' -p eosusdcom111@active
cleos push action eosusdcom111 setsupply '[ "eosusdcom111", "1000000000.0000 UZD"]' -p eosusdcom111@active
##############################################

##############################################
# create 2 borrowers and 2 insurers
#cleos wallet create -n testwallet2 --to-console
cleos wallet unlock -n testwallet2 --password PW5HuDfHm4wznVknC6Bewug4VtJNfsFsxRH2yendtdvDZ9Lt9F5nR
#cleos create key --to-console
#cleos wallet import -n testwallet2 --private-key 5J7UbUYpJfywWRtvq94b3RBzQvKYfRcUA3NSi1ApRsh8HuKfCy3
cleos create account eosio testborrow11 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio testborrow12 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio testinsure11 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio testinsure12 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos push action eosio.token issue '[ "testborrow11", "100000.0000 EOS", "m" ]' -p eosio@active
cleos push action eosio.token issue '[ "testborrow12", "100000.0000 EOS", "m" ]' -p eosio@active
cleos push action eosio.token issue '[ "testinsure11", "100000.0000 EOS", "m" ]' -p eosio@active
cleos push action eosio.token issue '[ "testinsure12", "100000.0000 EOS", "m" ]' -p eosio@active


##############################################

##############################################
# create the VIG token
cleos create account eosio vig111111111 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cd ~/contracts/eosio.contracts/contracts/eosio.token
#eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen
cleos set contract vig111111111 ~/contracts/eosio.contracts/contracts/eosio.token --abi eosio.token.abi -p vig111111111@active
cleos push action vig111111111 create '[ "vig111111111", "1000000000.0000 VIG"]' -p vig111111111@active
cleos push action vig111111111 issue '[ "testborrow11", "100000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 issue '[ "testborrow12", "100000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 issue '[ "testinsure11", "100000.0000 VIG", "m" ]' -p vig111111111@active
cleos push action vig111111111 issue '[ "testinsure12", "100000.0000 VIG", "m" ]' -p vig111111111@active
##############################################

##############################################
# create dummy tokens
cleos create account eosio dummytokens1 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cd ~/contracts/eosio.contracts/contracts/eosio.token
#eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen
cleos set contract dummytokens1 ~/contracts/eosio.contracts/contracts/eosio.token --abi eosio.token.abi -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "1000000000.0000 IQ"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "1000000000.0000 UTG"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "1000000000.0000 PTI"]' -p dummytokens1@active
cleos push action dummytokens1 create '[ "dummytokens1", "1000000000.0000 OWN"]' -p dummytokens1@active

cleos push action dummytokens1 issue '[ "testborrow11", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow11", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow11", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow11", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 issue '[ "testborrow12", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow12", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow12", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testborrow12", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 issue '[ "testinsure11", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure11", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure11", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure11", "100000.0000 OWN", "m" ]' -p dummytokens1@active

cleos push action dummytokens1 issue '[ "testinsure12", "100000.0000 IQ", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure12", "100000.0000 UTG", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure12", "100000.0000 PTI", "m" ]' -p dummytokens1@active
cleos push action dummytokens1 issue '[ "testinsure12", "100000.0000 OWN", "m" ]' -p dummytokens1@active
#cleos get currency balance dummytokens1 testborrow11
##############################################

##############################################
# create the oracle contract (for EOS only for now)
cleos create account eosio oracle111111 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio eostitanprod EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio feeder111111 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8
cleos create account eosio feeder211111 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8 EOS6RYBoZJzGFR35mdQMyb7SBUuZQuupM2ZuqGnbtFJ4wLW3fXbb8

cd ~/contracts/delphioracle/contract
cleos -u http://api.eosnewyork.io:80 get code delphioracle --wasm -c delphioracle.wasm
cleos -u http://api.eosnewyork.io:80 get code delphioracle --abi delphioracle.abi
cleos set contract oracle111111 ~/contracts/delphioracle/contract delphioracle.wasm delphioracle.abi -p oracle111111@active

cleos push action oracle111111 setoracles '{"oracleslist":["feeder111111","feeder211111"]}' -p eostitanprod@active
cleos push action oracle111111 write '{"owner":"feeder111111", "value":63800}' -p feeder111111@active
##############################################

###### OPTIONAL FOR LOCAL TESTNET #############
# launch two oracle feeders
#in a new shell
cd ~/contracts/delphioracle/scripts
nodeosurl='http://127.0.0.1:8888' interval=15000 account="oracle111111" defaultPrivateKey="5J7UbUYpJfywWRtvq94b3RBzQvKYfRcUA3NSi1ApRsh8HuKfCy3" feeder="feeder111111" node updater2.js
#in another shell
cd ~/contracts/delphioracle/scripts
nodeosurl='http://127.0.0.1:8888' interval=15000 account="oracle111111" defaultPrivateKey="5J7UbUYpJfywWRtvq94b3RBzQvKYfRcUA3NSi1ApRsh8HuKfCy3" feeder="feeder211111" node updater2.js
#cleos get table oracle111111 oracle111111 eosusd --limit 1
#cleos get table oracle111111 oracle111111 oracles
#cleos get table oracle111111 oracle111111 eosusdstats
##############################################

##############################################
# exposed actions for eosusdcom demo starts here
cleos push action eosio.token transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"collateral"}' -p testborrow11@active
cleos push action dummytokens1 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"collateral"}' -p testborrow11@active
cleos push action vig111111111 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"1000.0000 VIG","memo":"collateral"}' -p testborrow11@active

cleos push action eosio.token transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"insurance"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"insurance"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"insurance"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"insurance"}' -p testinsure11@active
cleos push action dummytokens1 transfer '{"from":"testinsure11","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"insurance"}' -p testinsure11@active

cleos push action eosio.token transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"collateral"}' -p testborrow12@active
cleos push action dummytokens1 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"collateral"}' -p testborrow12@active
cleos push action vig111111111 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"1000.0000 VIG","memo":"collateral"}' -p testborrow12@active

cleos push action eosio.token transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"6.0000 EOS","memo":"insurance"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 IQ","memo":"insurance"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 UTG","memo":"insurance"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 PTI","memo":"insurance"}' -p testinsure12@active
cleos push action dummytokens1 transfer '{"from":"testinsure12","to":"eosusdcom111","quantity":"1000.0000 OWN","memo":"insurance"}' -p testinsure12@active

cleos push action eosusdcom111 assetout '{"usern":"testborrow11","assetout":"2.0000 UZD","memo":"borrow"}' -p testborrow11@active
cleos push action eosusdcom111 assetout '{"usern":"testborrow12","assetout":"24.0000 UZD","memo":"borrow"}' -p testborrow12@active

cleos push action eosusdcom111 assetout '{"usern":"testborrow11","assetout":"1.0000 EOS","memo":"collateral"}' -p testborrow11@active
cleos push action eosusdcom111 assetout '{"usern":"testborrow12","assetout":"1.0000 EOS","memo":"collateral"}' -p testborrow12@active

cleos push action eosusdcom111 assetout '{"usern":"testinsure11","assetout":"1.0000 EOS","memo":"insurance"}' -p testinsure11@active
cleos push action eosusdcom111 assetout '{"usern":"testinsure12","assetout":"1.0000 EOS","memo":"insurance"}' -p testinsure12@active

cleos push action eosusdcom111 transfer '{"from":"testborrow11","to":"eosusdcom111","quantity":"6.0000 UZD","memo":"payoff debt"}' -p testborrow11@active
cleos push action eosusdcom111 transfer '{"from":"testborrow12","to":"eosusdcom111","quantity":"5.0000 UZD","memo":"payoff debt"}' -p testborrow12@active

# doupdate action does the following:
# pull prices from oracle
# update loan pricing
# monitor for bailouts
# pay insurance premiums
cleos push action eosusdcom111 doupdate '{}' -p eosusdcom111@active

# get all the user data
cleos get table eosusdcom111 eosusdcom111 user --limit 1

cleos get table eosusdcom111 UZD stat
cleos get table eosio.token eosusdcom111 accounts
cleos get table eosio.token testborrow11 accounts
cleos get table eosusdcom111 testborrow11 accounts
#cleos get currency balance eosusdcom111 testborrow11
#cleos get currency balance eosio.token eosusdcom111
##############################################


