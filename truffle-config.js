
require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');

module.networks = {
  sepolia: {
    provider: () => new HDWalletProvider(process.env.Mnemonic, `https://eth-sepolia.g.alchemy.com/v2/{process.env.1b9SLyHWL6CZAEN8VykEL4BPah07frT9}`),
    network_id: 11155111,
    gas: 5500000,
    gasPrice: 20000000000,
    confirmations: 2,
    timeoutBlocks: 200,
    skipDryRun: true
  }
};
compilers = {
  solc: {
    version: "0.8.17" // Replace with the desired version
  }
};