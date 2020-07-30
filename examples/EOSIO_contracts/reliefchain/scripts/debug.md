
# (A) Create a wallet and unlock it

```
cleos wallet create
cleos wallet unlock --password "PW5KX8nqhAVPXDZ6BSXStqnS333V2S9M9j5v3iRoBBWxUWRk9TQge"

```

# (B) Check if eosio account exists
- This one exists by default mimicing a block producer
```
cleos get account eosio
```

```
keosd --http-server-address=localhost:8899
```

# (C) Creatign eosio.token account
```
# Onwer
cleos create key
Private key: 5JzzMPfVZUunHs7H3nad6mR7hVBNH8UQLoUr96mdaxJ1TE8eQsJ
Public key: EOS8N5wTk2WHUuowdXMzNrqSmxUEvN3R1nYtUTj1xpsmYFiMo21Rg

# Active
cleos create key
Private key: 5JbfAFaLqrUvKSrbtg3bJsRrM5QneSPTC7XWz266pMRYGxTtoPb
Public key: EOS62AJKE8ibZmNPedtfyrHqZB58grGsD9A7qaWo45Eg3aUwbrgBR

cleos wallet import 5JzzMPfVZUunHs7H3nad6mR7hVBNH8UQLoUr96mdaxJ1TE8eQsJ
cleos wallet import 5JbfAFaLqrUvKSrbtg3bJsRrM5QneSPTC7XWz266pMRYGxTtoPb

cleos create account eosio eosio.token EOS62AJKE8ibZmNPedtfyrHqZB58grGsD9A7qaWo45Eg3aUwbrgBR EOS8N5wTk2WHUuowdXMzNrqSmxUEvN3R1nYtUTj1xpsmYFiMo21Rg

cleos get account eosio.token

cleos push action eosio updateauth "{\"account\":\"eosio.token\",\"permission\":\"active\",\"parent\":\"owner\",\"auth\":{\"keys\":[{\"key\":\"EOS71NjMU5cn8GpGZfaFGYHyUmmkrdrQUtbZ1RgLStw6Fdzg9gF2v\", \"weight\":1}],\"threshold\":1,\"accounts\":[{\"permission\":{\"actor\":\"eosio\",\"permission\":\"eosio.code\"},\"weight\":1}],\"waits\":[]}}" -p eosio.token
```

# (D) Creatign reliefchain account
```
# Onwer
cleos create key
Private key: 5JXKZsJPScWERnV4U2PUDEUv46mUnYjGDpUNrhbGu4z1yooSCh6
Public key: EOS7zhKsy34hZCAtRVT27fTjNAS5fu3BWEpFFJMjmucjjB8r1KKBL

# Active
cleos create key
Private key: 5JYHPiujRBs5VUQkDHBsuD9V9LcMwZUs9dJzUitLGGbb7bGRYkP
Public key: EOS4wqd7WRFA92pgsuJQRk4hpF1i4t2TZTuWduiX6jQPahDWR4FW7

cleos wallet import 5JXKZsJPScWERnV4U2PUDEUv46mUnYjGDpUNrhbGu4z1yooSCh6
cleos wallet import 5JYHPiujRBs5VUQkDHBsuD9V9LcMwZUs9dJzUitLGGbb7bGRYkP

cleos create account eosio reliefchain EOS7zhKsy34hZCAtRVT27fTjNAS5fu3BWEpFFJMjmucjjB8r1KKBL EOS4wqd7WRFA92pgsuJQRk4hpF1i4t2TZTuWduiX6jQPahDWR4FW7

cleos get account reliefchain

cleos push action eosio updateauth "{\"account\":\"reliefchain\",\"permission\":\"active\",\"parent\":\"owner\",\"auth\":{\"keys\":[{\"key\":\"EOS4tWqgPkMG8cj7hZu5Bmr5rmEspKfp8EEJhQXX9jVXYzVM64LVC\", \"weight\":1}],\"threshold\":1,\"accounts\":[{\"permission\":{\"actor\":\"eosio.token\",\"permission\":\"eosio.code\"},\"weight\":1}],\"waits\":[]}}" -p reliefchain
```


# (E) Creatign c1 account
```
# Onwer
cleos create key
Private key: 5KQt5uLoZKAUm6DiCXDY3GRmxcp6We8iccf6LjBR1nDHTvtAUAN
Public key: EOS54mZQFdcf6iGJK4Yrrc1kJ73SLWRNktEuzvgYEUC4kYJNFxsaL

# Active
cleos create key
Private key: 5JxNs59eNSgDn2BTbn64dhob9onWLd4fdwuVTHYTefSGEs6fZY4
Public key: EOS8CqJdSTVfDjc3o7Goqxgtx7pBFLL9gfumw8fJXzwb6WmjTgDYp

cleos wallet import 5KQt5uLoZKAUm6DiCXDY3GRmxcp6We8iccf6LjBR1nDHTvtAUAN
cleos wallet import 5JxNs59eNSgDn2BTbn64dhob9onWLd4fdwuVTHYTefSGEs6fZY4

cleos create account eosio c1 EOS54mZQFdcf6iGJK4Yrrc1kJ73SLWRNktEuzvgYEUC4kYJNFxsaL EOS8CqJdSTVfDjc3o7Goqxgtx7pBFLL9gfumw8fJXzwb6WmjTgDYp

cleos get account c1

cleos push action eosio updateauth "{\"account\":\"c1\",\"permission\":\"active\",\"parent\":\"owner\",\"auth\":{\"keys\":[{\"key\":\"EOS4tWqgPkMG8cj7hZu5Bmr5rmEspKfp8EEJhQXX9jVXYzVM64LVC\", \"weight\":1}],\"threshold\":1,\"accounts\":[{\"permission\":{\"actor\":\"eosio.token\",\"permission\":\"eosio.code\"},\"weight\":1}],\"waits\":[]}}" -p c1
```

# (F) Setting contract to the blockchain

```
#cleos set contract  account contract-dir wast-file abi-file -p permissionLevel
# cleos set contract eosio  reliefchain -p eosio
cleos set contract reliefchain reliefchain -p reliefchain
```

# (G) Pushing data to citizen table

```
# cleos push action account action data -p permissionLevel
# cleos push action eosio addcitizen '["eosio","c1",0,"missing" ]' -p eosio
cleos push action reliefchain addcitizen '["c6","c6",0,"missing" ]' -p "c6"

```

