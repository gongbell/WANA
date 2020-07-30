# OWDIN-PORT EOS Smart Contract
[![OWDIN NETWORK](docs/img/banner-owdin.png "OWDIN NETWORK")](https://owdin.network/)

## About
* Share OWDIN-PORT resources such as storage, computing power, and network bandwidth
* Participates in the network as a portion of the virtual data center
* OWDIN-PORT's config data and status log are stored in the EOS blockchain

## Action
| action      | auth               | Description                        |
|:------------|:-------------------|:-----------------------------------|
| `burn`      | `Contract Account` | OWDIN token burn                   |
| `clear`     | `Contract Account` | Clear user account data            |
| `create`    | `Contract Account` | Create OWDIN token                 |
| `issue`     | `Contract Account` | Issue OWDIN token                  |
| `price`     | `Contract Account` | Set resource price                 |
| `remove`    | `Contract Account` | Remove user account data           |
| `reward`    | `Contract Account` | Reward token to user               |
| `set`       | `Contract Account` | Set OWDIN port device              |
| `upgrade`   | `Contract Account` | Upgrade OWDIN port process         |
| `initial`   | `EOS Account`      | Initialize user account data       |
| `activate`  | `EOS Account`      | Activate/Deactivate user account   |
| `debug`     | `EOS Account`      | Test action                        |
| `logging`   | `EOS Account`      | Device status logging              |
| `regpool`   | `EOS Account`      | Register resource pool user device |
| `reset`     | `EOS Account`      | Reset user data                    |
| `signup`    | `EOS Account`      | Sign up OWDIN Network              |
| `staking`   | `EOS Account`      | Staking resource                   |
| `transfer`  | `EOS Account`      | Transfer OWDIN token               |
| `unstaking` | `EOS Account`      | Unstaking resource                 |
| `update`    | `EOS Account`      | User data update                   |

## Example action using cleos

### debug
```bash
cleos push action serviceaccount debug '["serviceaccount"]' -p user_account@active
```

### create
```bash
cleos push action serviceaccount create '["1000000000.0000 TOKEN"]' -p serviceaccount@active
```

### issue
```bash
cleos push action serviceaccount issue '["1000000000.0000 TOKEN", "INITIAL TOKEN ISSUE"]' -p serviceaccount@active
```

### transfer
```bash
cleos push action serviceaccount transfer '["user_account_1", "user_account_2", "1000000.0000 TOKEN", "transfer Test"]' -p user_account_1@active
```

### reward
```bash
cleos push action serviceaccount reward '["user_account", "10.0000 TOKEN", "TOKEN Reward Test"]' -p serviceaccount@active
```

### burn
```bash
cleos push action serviceaccount burn '["serviceaccount", "100.0000 TOKEN", "TOKEN BURN Test"]' -p serviceaccount@active
```

### signup
```bash
cleos push action serviceaccount signup '["user_account", "user_public_key_1", "device_unique_index_1", "secure_ip_index_1", 10240, 409600, 1024000, 0, 0 ]' -p user_account@active
```

### reset
```bash
cleos push action serviceaccount reset '["user_account", "user_public_key_reset_1", "device_unique_index_reset_1", "secure_ip_index_reset_1", 10241, 409601, 1024001, 0, 0 ]' -p user_account@active
```

### activate
```bash
cleos push action serviceaccount activate '["user_account", false]' -p user_account@active
```

### set
```bash
cleos push action serviceaccount set '["user_account", "config_data", 0]' -p serviceaccount@active
```

### remove
```bash
cleos push action serviceaccount remove '["user_account"]' -p serviceaccount@active
```

### initial
```bash
cleos push action serviceaccount initial '["user_account"]' -p user_account@active
```

### clear
```bash
cleos push action serviceaccount clear '["user_account", 0]' -p serviceaccount@active
```

### update
```bash
cleos push action serviceaccount update '["user_account", 0, "Update Status"]' -p user_account@active
```

### logging
```bash
cleos push action serviceaccount logging '["user_account", 10, 1024, 10240, 1024, 5120, 200, "Logging Status", "Logging Test"]' -p user_account@active
```

### regpool
```bash
cleos push action serviceaccount regpool '["user_account", 0, 1024]' -p user_account@active
```

### staking
```bash
cleos push action serviceaccount staking '["user_account_1", "user_account_2", 0, "10.0000 TOKEN"]' -p user_account_1@active
```

### unstaking
```bash
cleos push action serviceaccount unstaking '["user_account_1", "user_account_2", 1, 0]' -p user_account_1@active
```

### price
```bash
cleos push action serviceaccount price '[0, "10.0000 TOKEN"]' -p serviceaccount@active
```

### upgrade
```bash
cleos push action serviceaccount upgrade '[0, 1, "binary_url", "binary_hash"]' -p serviceaccount@active
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

