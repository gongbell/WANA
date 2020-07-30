# EOSafe

EOSafe is an on-chain smart-contract based wallet which maximizes fund security and minimizes losses in the event of a hack.

The project has been built entirely during the EOS global hackathon event in London. The chanllenge was:

> Create an application on the EOSIO platform that improves the relationship between technology and a user's privacy or security.

## Building and Using the System

### Clone the repository

    $ git clone https://github.com/xJonathanLEI/EOSafe
    $ cd EOSafe

### Build the contract

You'll need [eos](https://github.com/EOSIO/eos.git) v1.2.5 for building the smart contract. Note that, however, you do NOT need [eosio.cdt](https://github.com/EOSIO/eosio.cdt.git) for this project, as the project uses `eosiocpp` due to compatibility considerations.

To build the contract:

    $ cd contracts
    $ ./build.sh

Three files `wallet.wast`, `wallet.wasm` and `wallet.abi` shall be generated in the `contracts/build` folder.

### Spawn a local testnet

You may use anyway you like to spawn a local EOS testnet, but the project has provided a useful script for configuring `nodeos` for local testing:

    $ cd ..
    $ ./local_testnet.sh

Note that you may want to change the data path to your own choice. Under the default setting `/data/eos` a permission error may be thrown.

### Bootstrapping the network

For easier testing, a mini project has been provided in `bootstrapping`. Note that the project assumes that `nodeos` has been built with `CORE_SYMBOL` set to `EOS` instead of the default `SYS` value.

To build `nodeos` with `EOS` as `CORE_SYMBOL`:

    $ cd /path/to/eos/repository
    $ ./eosio_build.sh -s EOS

Make sure you've installed it after building. Go back to the EOSafe repository, and run the bootstrapping script:

    $ cd bootstrapping
    $ npm install
    $ node index.js

Once the bootstrapping process has been completed, the script will write `System ready for demo!` to the screen.

### Run the front-end web app

A front-end web application for EOSafe has been built with React using `create-react-app`. To run the application:

    $ cd ..
    $ cd webapp
    $ npm install
    $ npm start

Now visit `http://localhost:3000` in your web browser, and you shall see the login page for EOSafe.