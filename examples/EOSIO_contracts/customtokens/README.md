# customtokens

Custom Token tracking smart contract for EOS

# Usage

### View the table

`cleos get table customtokens customtokens tokens`

### Add to the table

```
cleos push action customtokens set '[unique_id, your_account, contract_account, asset_string]' -p your_account@active
```

**Parameter List**:

- **Unique ID**: `1` below, this must be a unique number in the table.
- **Record Owner**: `solveforanyx` below, the account that manages this table record.
- **Contract Account**: `eosio.token` below, the account which holds the smart contract for the token.
- **Asset**: `0.0000 EOS` below, must be `0` and have the correct amount of decimal places (`.0000`), with the correct symbol (`EOS`).

**Example**:

```
cleos push action customtokens set '[1, "solveforanyx", "eosio.token", "0.0000 EOS"]' -p solveforanyx@active
```

### Remove from the table

```
cleos push action customtokens del '[unique_id]' -p your_account@active
```

**Parameter List**:

- **Unique ID**: `1` below, the unique ID of the row to remove.

**Example**:

`cleos push action customtokens del '[1]' -p solveforanyx@active`

# How to build

`eosiocpp -g customtokens.abi customtokens.cpp && eosiocpp -o customtokens.wast customtokens.cpp`

# How to deploy

`cleos set contract customtokens customtokens -p customtokens@active`
