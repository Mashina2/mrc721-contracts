var MetaMartianNFT = artifacts.require('./MysteryMartian.sol')
var MRC721Minter = artifacts.require('./MRC721Minter.sol')


var cnpeMinter = artifacts.require('CNPEMinter.sol');
var cnpeMinterPublic = artifacts.require('CNPEMinterPublic.sol');

var cnpe = artifacts.require('./CryptoGodsETH.sol');
var cnph = artifacts.require('./CryptoGodsDOT.sol');

var cbnb = artifacts.require('./CryptoGodsBNB.sol');

var randomNFT = artifacts.require('./MuonRandomNFT.sol');

var testHero = artifacts.require('./TestHero.sol');

var MRC721WithParamsTest = artifacts.require("./MRC721WithParamsTest.sol");

var bridge = artifacts.require("./MRC721Bridge.sol");

module.exports = async function(deployer) {
	// await deployer.deploy(cbnb);

	//await deployer.deploy(MRC721WithParamsTest);

	// await deployer.deploy(cnpeMinter, 
	// 	"0x09518190268f70B43f6f758Bd097cD0e6Ecd9bE8",
	// 	"0x102424f32dd34d015f039cda485634d514da0353");

	// await deployer.deploy(cnpeMinterPublic,
	// 	'0x159CAf9E184d85cc1D91e611918Df0E991ABFB64',
	//  	'0x102424f32dD34d015f039cDa485634D514DA0353'
	// )

	await deployer.deploy(bridge, "0xE4F8d9A30936a6F8b17a73dC6fEb51a3BBABD51A");
}
