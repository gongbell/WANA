# Deploy on Docker
> Work in Progress...

> Our docker-compose file does not support **keosd** on v1.4.1. You can use **keosd** on your local machine.

```sh
# Deploy nodeos, keosd containers with docker-compose
docker-compose up -d

# Stops nodeos, keosd containers
docker-compose down
```

## Reference
- [EOSIO/eos - Final keosd unix socket changes #5710](https://github.com/EOSIO/eos/pull/5710/commits/f938aa3bc97bda08f5b05ccde3c22277c9e4d4e9)
