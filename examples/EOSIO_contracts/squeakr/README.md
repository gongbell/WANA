# Squeakr: Decentralised Private Twitter

Squeakr is a demo application designed to showcase the power of privEOS. It is basically a simple form of Twitter on the blockchain, but all tweets are private. Only approved followers can see the tweets. The app pays for any privEOS fees. The service is free for the users.

## Installation

### Deploy the contract
```
cd contract
make setup
make deploy
make fundpriveos
```

### Install dependencies
```
cd frontend
npm install
```
### Change Configuration

You will have to update the environment in the config file which is located here: `frontend/src/config.js`.

### Run the app
```
cd frontend
npm run serve
```
