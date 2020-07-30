#!/usr/bin/env bash

TIME=1543854300 # 3rd dec 16:25
#TIME=1543854600 # 3rd dec 16:30
#TIME=1543854900 # 3rd dec 16:35
#TIME=1543855200 # 3rd dec 16:40
#TIME=1543855500 # 3rd dec 16:45

COUNT=500
BATCH_SIZE=500
ACCOUNT=nothingtosee
NODE=http://jungle2.eosdac.io
WALLET=http://127.0.0.1:8888
TOTAL=$(($COUNT * $BATCH_SIZE))

for (( c=1; c<=$COUNT; c++ ))
do
     LIMIT=$(($BATCH_SIZE * $c))
     ARGS=$(echo "[$TIME, $LIMIT, $BATCH_SIZE]")
     RES=$(cleos -u $NODE --wallet-url $WALLET push action $ACCOUNT blast "$ARGS" -p $ACCOUNT)
     echo "$LIMIT / $TOTAL"
done
