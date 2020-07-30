# Token Lock contract

This contract allows you to lock your non-core tokens such as EOSDAC as a security measure against losing your `active` key.

## Compilation and install

First clone the repository

```
$ cd tokenlock
$ eosio-cpp -o tokenlock.wast tokenlock.cpp
$ cd ..
$ ./cleos.sh set contract [your account] tokenlock/
```

## Setting account permissions

This contract aims to lock tokens for a configurable amount of time but it is installed into your account, anyone who gets your active key will be able to remove the code and the tokens would be unlocked.  To prevent this, we must set the minimum required permission to `owner` for `eosio::setcode`

Make sure that your owner key is different from your active key and is stored safely.

```
$ ./cleos.sh set action permission [your account] eosio setcode owner
```

## Locking tokens

The contract has 2 actions `lock` and `unlock`.

The `lock` function takes 3 parameters, the account setting the lock, the asset to lock and the time in seconds to lock it for.

To lock EOSDAC tokens for 3 days, use this command.  The number of tokens specified does not matter, only the symbol is used.

```
$ ./cleos.sh push action [your account] lock '["[your account]", "1.0000 EOSDAC", 259200]' -p [your account]@active
```

To unlock use the following command, you will have to wait for the unlock time to transfer the tokens.

```
$ ./cleos.sh push action [your account] unlock '["[your account]","1.0000 EOSDAC"]' -p [your account]@active
```
