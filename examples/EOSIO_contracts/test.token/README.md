# README

This is a modified version of the eosio.token contract, that places all of the `token_stat`s into the same scope of the contract.  This is different then the original eosio.token which places all of the `currency_stats` into the tokens symbol scope.

### eosio.token
`$cleos get table eosio.token SYM stat`

Lists the statues of the given token "SYM"

### test.token
`$cleos get table test.token test.token stats`

Lists the statues of all the tokens existance.