// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MRC721.sol";
import "./MRC721Metadata.sol";

contract MRC721TestNFT is MRC721, MRC721Metadata{

    struct NFTParam{
        bool boolParam;
        uint256 p1;
        uint256 p2;
    }

    mapping(uint256 => NFTParam) public params;

	constructor(
    ) MRC721(
    	"MRC721 with parameters", 
    	"MRC",
        "https://mmac-meta-martian.communitynftproject.io/"
    ){
    	_setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    	_setupRole(MINTER_ROLE, msg.sender);
    }

    function mintPublic(address to) public{
        uint256 id = totalSupply();
        _mint(to, id);
        setParams(id, true,
            block.timestamp,
            block.number);
    }

    function mint(address to, uint256 id, bytes calldata data) override external onlyRole(MINTER_ROLE){
        _mint(to, id);
        (bool _bool, uint256 _p1, uint256 _p2) = abi.decode(
            data,
            (bool, uint256, uint256)
        );
        setParams(id, _bool, _p1, _p2);
    }

    function setParams(uint256 id, bool _bool, uint256 _p1, uint256 _p2) private{
        params[id].boolParam = _bool;
        params[id].p1 = _p1;
        params[id].p2 = _p2;   
    }
}
