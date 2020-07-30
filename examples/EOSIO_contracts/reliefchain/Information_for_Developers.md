
- Last tested on OSX High Sierra 10.13.5

### (a) Staring private EOS blockchain 
- Download the docker
```
docker pull eosio/eos-dev:v1.0.7
```
- Start the blockchain. You need to be careful about the path you mount to docker image. This will change from the path mentioned below, so please change else it wont work!
```
sudo docker run --rm --name eosio -p 8888:8888 -p 9876:9876 -v /Users/gautamanand/Library/Github/serganus/ReliefChain-smartcontracts:/tmp/work -v /Users/gautamanand/Library/Github/serganus/dataEOS:/mnt/dev/data -v /Users/gautamanand/Library/Github/serganus/dataEOS:/mnt/dev/config eosio/eos-dev:v1.0.7 /bin/bash -c "nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::wallet_plugin --plugin eosio::producer_plugin --plugin eosio::history_plugin --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --plugin eosio::http_plugin -d /mnt/dev/data --config-dir /mnt/dev/config --http-server-address=0.0.0.0:8888 --access-control-allow-origin=* --contracts-console"
```
- Check if this works. Open the web browser, to load chain info: http://localhost:8888/v1/chain/get_info
```
sudo docker logs --tail 10 eosio
```

### (b) Compiling/Publishing/Seeding
- You can seed (5 citizens, 5 NGOs and 2 Disaster Events)
```
docker exec -it eosio /bin/bash
cd /tmp/work
bash ./scripts/seed/compile.sh
bash ./scripts/seed/setup.sh
bash ./scripts/seed/deploy.sh
bash ./scripts/seed/seed.sh
```

- You can superseed (625 citizens, 100 NGOs and 2 Disaster Events)
```
docker exec -it eosio /bin/bash
cd /tmp/work
bash ./scripts/superseed/compile.sh
bash ./scripts/superseed/setup.sh
bash ./scripts/superseed/deploy.sh
bash ./scripts/superseed/seed.sh
```