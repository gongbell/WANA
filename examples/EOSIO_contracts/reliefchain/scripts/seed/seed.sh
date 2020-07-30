#!/bin/sh

# (9) SEED DATA TO BLOCKCHAIN - Calling Actions (Mimicing remote Nodejs API, but we use command-line API for the timebeing)
# (9.1) Adding new citizens ~600
add_new_citizen() {
	# Creating multiple citizens (mocking registeration)
	cleos push action reliefchain addcitizen "[\"$1\", $2, \"$3\", $4, $5]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"10.0000 RFT\", \"airdrop\" ]" -p eosio
}

# account_name,  balancev, citizen_name,  isvolunteer,  statusLiving, biometrichash
add_new_citizen "c1" "\"10 RFT\"" "c1" 0 "missing" "useqtfeq65367q457637462763vxetwfdcty"
add_new_citizen "c2" "\"10 RFT\"" "c2" 0 "alive" "useqtfeq65367q457637462763vxetwfdcty"
add_new_citizen "c3" "\"10 RFT\"" "c3" 0 "dead" "useqtfeq65367q457637462763vxetwfdssy"
add_new_citizen "c4" "\"10 RFT\"" "c4" 0 "alive" "useqtfeq65367q457637462763ssetwfdcty"
add_new_citizen "c5" "\"10 RFT\"" "c5" 0 "missing" "useqtfeq65367q457637462763vxsswfdcty"

# (9.2) Adding new ngos ~5
add_new_ngo() {
	cleos push action reliefchain addngo "[\"$1\", $2, \"$3\", $4, $5]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"100.0000 RFT\", \"airdrop\" ]" -p eosio
}
# Add 5 ngo
# account_name, balancev, ngo_name, totalvolunteers, activevolunteers
add_new_ngo "ngo1" "\"100 RFT\"" "ngo1" 100 5
add_new_ngo "ngo2" "\"100 RFT\"" "ngo2" 200 50
add_new_ngo "ngo3" "\"100 RFT\"" "ngo3" 400 59
add_new_ngo "ngo4" "\"100 RFT\"" "ngo4" 500 60
add_new_ngo "ngo5" "\"100 RFT\"" "ngo5" 600 65

# (9.3) Adding new diasters ~2
add_new_disaster() {
	cleos push action reliefchain adddisaster "[\"$1\", $2, \"$3\", $4, $5, $6, $7, $8, $9]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"10.0000 RFT\", \"airdrop\" ]" -p eosio
}
# Add 2 disaster
add_new_disaster "disaster1" "\"10 RFT\"" "disaster1" 10000 90 5000 420 10000 90000
add_new_disaster "disaster2" "\"10 RFT\"" "disaster2" 10000 90 5000 420 10000 90000