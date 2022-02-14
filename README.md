# MRC721 Contracts

# Compile
$ npm install  
$ ./node_modules/.bin/truffle compile  

# Deploy and Test

1- Deploy MRC721Bridge.sol  
2- Deploy a MRC721 NFT(e.g MRC721TestNFT.sol)  
3- Grant MINTER_ROLE to the MRC721Bridge on the NFT contract  
4- Grant TOKEN_ADDER_ROLE to your address  
5- Call AddToken on MRC721Bridge and add the NFT contract as the first supported NFT  
  
Note: Each NFT contract should have a unique ID on all chains

