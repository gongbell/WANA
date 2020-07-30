# watchdoggie EOS contract

This is a simple contract that helps verifying that the watch script is
monitoring the network and sending notifications.

## Action: ping

So, if you need to create a dummy transaction without sending any
tokens, just do:

```
alias mcleos='cleos -u http://mainnet.eoscalgary.io'
mcleos push action watchdoggiee ping '["FROMACCOUNT", "TOACCOUNT", "hello world"]' -p FROMACCOUNT
```

As a result, both accounts will have this "ping" transaction in their
history of actions.

Due to excessive use of this contract for sending mass notifications,
each sender is limited to 1000 messages. Extending the limit is possible
if you contact me at Telegram: @cc32d9


## Action: setkv

This action is designed for monitoring purpose: a monitoring script can
set a key-value pair and verify its result in the EOS network. The
sender has to have a special permission "watchdog", and the sender pays
for RAM.

```
alias mcleos='cleos -u http://mainnet.eoscalgary.io'
mcleos set account permission MYACCOUNT watchdog EOS8C9tb8QQhZet6WWcYFCWDKHYfjC3W59ugHCD63s7LLDQx6JsNK
mcleos set action permission MYACCOUNT watchdoggiee setkv watchdog
mcleos set action permission MYACCOUNT watchdoggiee delkv watchdog
mcleos push action watchdoggiee setkv '["MYACCOUNT", "777", "777"]' -p MYACCOUNT@watchdog
mcleos get table watchdoggiee MYACCOUNT kvs
```

## Action: delkv

The action deletes a corresponding key-value pair

```
mcleos push action watchdoggiee delkv '["MYACCOUNT", "777"]' -p MYACCOUNT@watchdog
mcleos get table watchdoggiee MYACCOUNT kvs
```

## Using `watchdoggiee` for blockchain health monitoring

I developed a number of Nagios plugins for `nodeos` health monitoring:
https://github.com/cc32d9/eos-nagios-plugins

The `check_eos_watchdoggiee` plugin is sending a transaction using one
API URL, and reading its result using another API URL. It will alert if
the result of transaction is not visible within the time limit, and it
usually means that your `nodeos` is disconnected from the network or
malfunctioning.





## Copyright and License

Copyright 2018 cc32d9@gmail.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
