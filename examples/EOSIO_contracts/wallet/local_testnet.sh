rm -rf /data/eos;
nodeos -e -p eosio --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --contracts-console -d /data/eos --filter-on "*" --access-control-allow-origin "*" --http-server-address 0.0.0.0:8888 --max-transaction-time 100;
