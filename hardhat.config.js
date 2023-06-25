require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy");
require("hardhat-tracer");

/** @type import('hardhat/config').HardhatUserConfig */

const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;
const ACCOUNT_MNEMONIC = process.env.ACCOUNT_MNEMONIC;

module.exports = {
  solidity: "0.8.13",
  networks: {
    hardhat: {
      mining: {
        auto: true,
        interval: 2000,
      },
      chainId: 137,
    },
    polygon: {
      url: process.env.RPC,
      chainId: 137,
      accounts: [ACCOUNT_PRIVATE_KEY],
      gasPrice: 150e9, // in wei
      gasMultiplier: 1.2,
    },
    mumbai: {
      url: process.env.TESTNET_RPC,
      chainId: 80001,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
  },
};
