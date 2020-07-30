# EOS Toll Gate Simulator

## Motivation / Background

I chose a toll gate and ride-sharing model to challenge the throughput and micro-transaction aspects of EOS. This simulation / model includes
toll gates, vehicles, riders that check in and out of vehicles, toll gate breaches. Riders can check-in and check-out of vehicles (requires authorization from both rider and vehicle). Riders are charged both for toll gates and the time in each vehicle based on the vehicle's hourly rate.

Each toll gate decides how much to charge for each breach. When a vehicle breaches a toll gate, each of the current riders in the vehicle are charged equal amounts.

## Dependencies

EOS

python

## Setup

Clone repo and cd to "tolls" dir

Start nodeos

--data_dir and --config-dir create new default chain in current directory

```
nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::chain_api_plugin --plugin eosio::account_history_api_plugin --data-dir data --config-dir config
```

Setup wallet and keys

```
cleos wallet create > wallet
cleos create key > keys
cleos create key >> keys
cleos wallet import {private key #1}
cleos wallet import {private key #2}
```

Set the bios contract

```
cleos set contract eosio <path>/<to>/eos/build/contracts/eosio.bios -p eosio
```

Create tolls account

```
cleos create account eosio tolls {public key #1} {public key #1}
```

Compile and deploy smart contract.

I use the following shell script with "tolls tolls" as the arguments:

```
#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "USAGE: comptract.sh <ACCOUNT NAME> <Contract Name> from within the directory"
    exit 1
fi

ACCOUNT=$1
CONTRACT=$2

eosiocpp -o ${CONTRACT}.wast ${CONTRACT}.cpp &&
eosiocpp -g ${CONTRACT}.abi ${CONTRACT}.cpp &&
cleos set contract ${ACCOUNT} ../${CONTRACT}
```

Or can compile and deploy directly with:

```
eosiocpp -o tolls.wast tolls.cpp
eosiocpp -g tolls.abi tolls.cpp
cleos set contract tolls ../tolls
```

Create an account for 'vehicle1'

```
cleos create account eosio vehicle1 EOS8EUKv5ywgAxxnDyznxtVqgGShisJzUxa14CEZYbLhmdTvdxUaa EOS8EUKv5ywgAxxnDyznxtVqgGShisJzUxa14CEZYbLhmdTvdxUaa
```

Create an account for 'rider1'

```
cleos create account eosio rider1 EOS8EUKv5ywgAxxnDyznxtVqgGShisJzUxa14CEZYbLhmdTvdxUaa EOS8EUKv5ywgAxxnDyznxtVqgGShisJzUxa14CEZYbLhmdTvdxUaa
```

Push action to create record for vehicle in contract.

```
cleos push action tolls createveh '["vehicle1",10000]' -p vehicle1
```

Push action to create record for user / rider.

```
cleos push action tolls createtgu '["rider1"]' -p rider1
```

Add rider to vehicle.

```
cleos push action tolls addrider '["vehicle1","rider1"]' -p vehicle1 -p rider1
```

Take a look at the tgus table to see that timein is non-zero. (Clock has started)

```
cleos get table tolls tolls tgus
{
  "rows": [{
      "account": "rider1",
      "balance": 0,
      "timein": 1527187492
    }
  ],
  "more": false
}
```

Take a look at the vehicles table.

```
cleos get table tolls tolls vehicles
{
  "rows": [{
      "account": "vehicle1",
      "hourly_rate": 10000,
      "riders": [
        "rider1"
      ]
    }
  ],
  "more": false
}
```

Remove rider1 from vehicle1.

```
cleos push action tolls remrider '["vehicle1","rider1"]' -p vehicle1 -p rider1
```

Take a look at the tgus table, and you'll see that "timein" is set back to zero since the rider has checked out of the vehicle and the balance is incremented based on the vehicles hourly rate. Charges will also show up in the balance if the vehicle breaches any toll gates.

```
$ cleos get table tolls tolls tgus
{
  "rows": [{
      "account": "rider1",
      "balance": 627480,
      "timein": 0
    }
  ],
  "more": false
}
```

## Run the Simulator

There is a python and C++ driver application. These are used for automated simulations and performance testing.

### Python Simulator

Run python driver script to create accounts for toll gates, toll gate users, and then breach the tolls. The toll gate users' balances are incremented each time a toll gate is breached.

```
python tolls_simulate.py
```

### C++ Simulator

```
g++ tolls_driver.cpp
./a.out
```

You can modify the "num_gates", "num_tgus", and "num_breaches" to change how many gates, users, and breaches are created / executed.

## View the Results

The C++ driver runs about 130 TPS on my single EOS node running my laptop.

You cam then view the tables to see tollgates, toll gate users, and breaches:

```
$ cleos get table tolls tolls tgs
{
"rows": [{
"account": "44h4k",
"gatename": "Zinkey State Road Exit 44",
"latitude": 5,
"longitude": 5,
"highway_name": "Zinkey State Road",
"highway_number": 507,
"direction": "W"
},{
"account": "rf4ff",
"gatename": "Roosevelt Turnpike Exit 61",
"latitude": 7,
"longitude": 6,
"highway_name": "Roosevelt Turnpike",
"highway_number": 300,
"direction": "W"
} }
],
"more": false
}

$ cleos get table tolls tolls tgus
{
"rows": [{
"account": "afmru",
"balance": 1
},{
"account": "bt4bm",
"balance": 2
},{
"account": "elrn5",
"balance": 4
}],
"more": false
}

$ cleos get table tolls tolls tgbs
{
"rows": [{
"breachId": 123951,
"tg": "ouema",
"tgu": "bt4bm",
"timestamp": 1526914049
},{
"breachId": 222617,
"tg": "ouema",
"tgu": "elrn5",
"timestamp": 1526914049
},{
"breachId": 228466,
"tg": "ouema",
"tgu": "elrn5",
"timestamp": 1526914049
},{
"breachId": 314925,
"tg": "rf4ff",
"tgu": "afmru",
"timestamp": 1526913980
}],
"more": false
}
```
