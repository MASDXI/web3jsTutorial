# Web3js Tutorial

## Project setup

start your Ganache GUI, Ganache CLI before and deploying smartcontract with REMIX IDE + METAMASK

recommended to set gas in Local testnet to 0 for developing purpose.

[web3.js](https://github.com/ethereum/web3.js/)

[Ganache GUI](https://github.com/trufflesuite/ganache)

[Ganache CLI](https://github.com/trufflesuite/ganache-cli)

``` bash

# deploy contract to localnetwork or testnet
if using testnet infura
const NETWORK = {
  INFURA: "INFURA_ENDPOINT", // insert your INFURA_ENDPOINT here
  GANACHE_GUI: "http://localhost:7545",
  GANACHE_CLI: "http://localhost:8545",
  RPC_ENDPOINT: "CUSTOM_ENDPOINT", // insert your CUSTOM_RPC_ENDPOINT here
};

const web3 = new Web3(new Web3.providers.HttpProvider(NETWORK.{props}));

# insert your contract config
const CONTRACT_ADDRESS = "CONTRACT_ADDRESS"; // insert your CONTRACT_ADDRESS here

#insert your account publickey and private key
const account = {
    address: "publickey", // insert your publickey
    privateKey: "privatekey", // insert your privateKey
  };

```
To run these tutorials, you must have the following installed:

```
npm install

# for run web3_gettingstart.js
npm run chapter1

# for run web3_smartcontract.js
npm run chapter2
```
