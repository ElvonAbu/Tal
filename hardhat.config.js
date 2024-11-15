require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const pkey=process.env.mainnetkey;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks:{
    mainnet:{
      url:process.env.mainurl,
      accounts:[pkey]
    }
  }
};
