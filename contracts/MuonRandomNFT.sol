// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MRC721.sol";
import "./IMuonV02.sol";

contract MuonRandomNFT is MRC721{
    uint256 public MUON_RANOM_NFT_APP_ID = 14;

	uint256 public maxSupply = 1000;

    // nftId => randomNumber
    mapping(uint256 => uint256) nftRandomParameters;

    IMuonV02 public muon = IMuonV02(0xeE67E903d322FA65d8D370dE4eD99Fd9C3C5EF54);

	constructor(
    ) MRC721(
    	"Muon Random NFT TEST", 
    	"MRT",
        "https://random-nft.muon.net/" // a dummy address
    ){
    	_setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        // need to grant MINTER_ROLE to the minter contract
    }

    function _beforeMint(
        address to,
        uint256 id
    ) internal virtual override {
    	require(totalSupply() <= maxSupply, "> maxSupply");
    }

    /**
     * This function will be called by Muon keeper OR 
     * the user(from the UI) OR by any other external script.
     *
     * NOTE 1: It is possible to set the parameters immediately or wait and
     * let the users mint all nfts and then set the parameters.
     *
     * NOTE 2: If more than one random number is required, the muon app could be
     * adjusted to provide as many as random numbers.
     */
    function fulfillMuonRandomNumber(
        uint256 nftId,
        uint256 randomNumber,
        bytes calldata _reqId,
        IMuonV02.SchnorrSign[] calldata _sigs
    ) public{
        require(_exists(nftId), "not minted yet");
        require(nftRandomParameters[nftId] == 0, "already have parameters");

        // verify the random number
        bytes32 hash = keccak256(
            abi.encodePacked(
                MUON_RANOM_NFT_APP_ID,
                nftId,
                randomNumber
            )
        );
        require(muon.verify(_reqId, uint256(hash), _sigs), '!verified');
        nftRandomParameters[nftId] = randomNumber;
    }
}
