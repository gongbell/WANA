echo '--------------------------'
echo 'Building for the jungle..'
echo '--------------------------'
# REACT_APP_CHAIN_HOST=dev.cryptolions.io REACT_APP_CHAIN_PORT=38888  REACT_APP_CHAIN_PROTOCOL=http REACT_APP_CHAIN_ID=038f4b0fc8ff18a4f0842a8f0564611f6e96e8535901dd45e43ac8691a1c4dca REACT_APP_HISTORY_URL=http://junglehistory.cryptolions.io:18888 REACT_APP_GRAPHQL_ENDPOINT=http://144.76.165.114:3030/graphql  REACT_APP_PAGE_HERO_COLOR=is-success REACT_APP_PAGE_WELCOME="A Wild Animals Tamagotchi and Battle game for EOS JungleNet Blockchain! :)" REACT_APP_VERSION=0.5.5 REACT_APP_NETWORK="Jungle Test Net" yarn install --verbose  --frozen-lockfile --network-timeout 1000000
# rm -rf build/images/monsters && mv build/images/jungle-animals build/images/monsters