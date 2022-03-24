var MetaMartianNFT = artifacts.require('./MysteryMartian.sol')
var MRC721Minter = artifacts.require('./MRC721Minter.sol')


var cnpeMinter = artifacts.require('CNPEMinter.sol');
var cnpeMinterPublic = artifacts.require('CNPEMinterPublic.sol');

var cnpe = artifacts.require('./CryptoGodsETH.sol');

var randomNFT = artifacts.require('./MuonRandomNFT.sol');

var testHero = artifacts.require('./TestHero.sol');

var MRC721WithParamsTest = artifacts.require("./MRC721WithParamsTest.sol");

module.exports = async function(deployer) {
	// await deployer.deploy(cnpe);

	await deployer.deploy(MRC721WithParamsTest);

	//await deployer.deploy(MRC721Minter, "0xd8EBe57C68Cd367EFDF8f72d780EFC24756186f9");

	// await deployer.deploy( cnpeMinterPublic,
	// 	'0x25aa0936b394a886398B655631f7D1880543f3DE',
	//  	'0x102424f32dD34d015f039cDa485634D514DA0353'
	// )
}
