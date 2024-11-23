
require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();



module.exports = {
  networks: {
    sepolia: {
      provider: () => new HDWalletProvider(MNEMONIC, `https://sepolia.infura.io/v3/${INFURA_ID}`),
      network_id: 11155111,
      gas: 5500000,
      gasPrice: 20000000000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
      
    }
  }
}

module.exports = {
  // ... other Truffle configuration options
  compilers: {
    solc: {
      version: "0.8.17" // Replace with the desired version
    }
  }
};