// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IMRC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract MRC721Minter is Ownable {

  using ECDSA for bytes32;


  uint256 public unitPrice = 10000000000000000; // 0.01 ether
  bool public mintEnabled = false;
  bool public mintWithSigEnabled = true;
  uint8 public maxPerUser = 20;
  uint public constant MAX_SUPPLY = 4004;

  IMRC721 public nftContract;
  address public signer;

  modifier checkSig(address _to, uint256 _count, bytes calldata sig){
    if(!mintEnabled){
      require(mintWithSigEnabled, "!enabled");

      bytes32 hash = keccak256(abi.encodePacked(
            _to,
            _count
      ));
      hash = hash.toEthSignedMessageHash();

      address sigSigner = hash.recover(sig);
      require(sigSigner == signer, "!sig");
    }
    _;
  }

  constructor(
    address nftContractAddress,
    address _signer
  ){
    nftContract = IMRC721(nftContractAddress);
    signer = _signer;
  }

  function mint(address _to, uint _count, bytes calldata sig)
    checkSig(_to,_count, sig) public payable {
    require(_count <= maxPerUser, "> maxPerUser");
    require(nftContract.totalSupply() < MAX_SUPPLY, "Ended");
    require(nftContract.totalSupply() + _count <= MAX_SUPPLY, ">limit");
    require(msg.value >= price(_count), "!value");
    _mint(_to, _count);
  }

  function _mint(address _to, uint _count) private{
    for(uint i = 0; i < _count; i++){
      nftContract.mint(_to, nftContract.totalSupply());
    }
  }

  function price(uint _count) public view returns (uint256) {
    return _count * unitPrice;
  }

  function updateUnitPrice(uint256 _unitPrice) public onlyOwner {
    unitPrice = _unitPrice;
  }

  function updateMintEnabled(bool enable) public onlyOwner {
    mintEnabled = enable;
  }

  function updateMintWithSigEnabled(bool _mintWithSigEnabled) public onlyOwner {
    mintWithSigEnabled = _mintWithSigEnabled;
  }

  function updateMaxPerUser(uint8 _maxPerUser) public onlyOwner {
    maxPerUser = _maxPerUser;
  }

  function updateNftContrcat(IMRC721 _newAddress) public onlyOwner {
    nftContract = IMRC721(_newAddress);
  }

  function updateSigner(address newSigner) public onlyOwner {
    signer = newSigner;
  }

  // allows the owner to withdraw tokens
  function ownerWithdraw(uint256 amount, address _to, address _tokenAddr) public onlyOwner{
    require(_to != address(0));
    if(_tokenAddr == address(0)){
      payable(_to).transfer(amount);
    }else{
      IERC20(_tokenAddr).transfer(_to, amount);  
    }
  }
}
