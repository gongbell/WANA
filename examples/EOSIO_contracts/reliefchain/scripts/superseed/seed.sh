#!/bin/sh

# (9) SEED DATA TO BLOCKCHAIN - Calling Actions (Mimicing remote Nodejs API, but we use command-line API for the timebeing)
# (9.1) Adding new citizens ~600
add_new_citizen() {
	# Creating multiple citizens (mocking registeration)
	cleos push action reliefchain addcitizen "[\"$1\", $2, \"$3\", $4, $5]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"10.0000 RFT\", \"airdrop\" ]" -p eosio
}

# account_name,  citizen_name,  isvolunteer,  statusLiving
for n1 in {1..5}
do
	for n2 in {1..5}
	do
		for n3 in {1..5}
		do
			for n4 in {1..5}
			do			
				add_new_citizen "citizen"$n1$n2$n3$n4 "\"10 RFT\"" "citizen"$n1$n2$n3$n4 0 "missing" "$((RANDOM%100))"
			done
		done
	done
done

# (9.2) Adding new ngos ~5
add_new_ngo() {
	cleos push action reliefchain addngo "[\"$1\", $2, \"$3\", $4, $5]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"100.0000 RFT\", \"airdrop\" ]" -p eosio
}
# Add 5 ngo
# account_name, ngo_name, totalvolunteers, activevolunteers
for m1 in {1..5}
do
	for m2 in {1..5}
	do
		for m3 in {1..2}
		do
			for m4 in {1..2}
			do			
				add_new_ngo "ngo"$m1$m2$m3$m4 "\"100 RFT\"" "ngo"$m1$m2$m3$m4 "$((RANDOM%100))" "$((RANDOM%100))"
			done
		done
	done
done

# (9.3) Adding new diasters ~2
add_new_disaster() {
	cleos push action reliefchain adddisaster "[\"$1\", $2, \"$3\", $4, $5, $6, $7, $8, $9]" -p "$1"
	# Air-dropping tokens
	cleos push action eosio.token issue "[ \"$1\", \"10.0000 RFT\", \"airdrop\" ]" -p eosio
}
# Add 2 disaster
add_new_disaster "disaster1" "\"10 RFT\"" "disaster1" 10000 90 5000 420 1000 90000
add_new_disaster "disaster2" "\"10 RFT\"" "disaster2" 10000 90 5000 420 1000 90000