# myprofile

Requirements
Create another account called `mytokenaccnt` that runs the `eosio.token` contract hosting a token called `GYTZ`

This is a skeleton contract that will "listen" to "transfer" actions on the "mytokenaccnt" ( replace with any account hosting an eosio token contract, i.e. eosio.token ) account.


I call methods that execute after listening to events "call-back" functions, therefore I will prefix these methods with "cb" for "call-back".