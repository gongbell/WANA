#!/usr/bin/env bash
/opt/application/scripts/init_wallet.sh

ROOT_DIR="/opt/eosio/bin"
cd $ROOT_DIR

./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,8,8,8,8,8,5,8,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,8,20,15,10,5,10,10,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,5,8,20,15,10,10,10,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,10,5,8,20,15,10,10,8,5] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,15,10,5,8,20,10,10,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,20,15,10,5,8,10,10,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [15,10,10,10,10,10,8,5,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,10,10,10,10,10,20,8,8,8] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [12,12,12,12,12,12,12,12,12,5] }' -p monstereosio
sleep .5
./cleos -u http://eosiodev:8888 push action monstereosio addelemttype '{"ratios": [8,10,10,20,10,10,10,10,20,20] }' -p monstereosio
