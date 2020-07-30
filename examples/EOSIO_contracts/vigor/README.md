# eosusd
Website: https://eosUSD.com  
Whitepaper: https://eosUSD.com/eosUSD.pdf

# Usage

Build your eos development image

```
docker build -t my/eos .
```

In a new terminal, start the required environment

```
docker-compose up # down or rm to clean up
```

Initialize the smart contract

```
sh bootstrap.sh # it prepares the environment
alias cleos="docker exec -it nodeos cleos --url http://127.0.0.1:8888 --wallet-url http://keosd:8901"

# Environment is ready, start here your tests/demo
# ..and / or use Scatter configured for local Testnet
cleos get info
cleos get table eosusdcom111 eosusdcom111 user

```

Congrats, here are your first Localnet eosUSD