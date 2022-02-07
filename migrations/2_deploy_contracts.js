// var MetaMartianNFT = artifacts.require('./MetaMartianNFT.sol')
var MRC721Minter = artifacts.require('./MRC721Minter.sol')

module.exports = async function(deployer) {
	// await deployer.deploy(MetaMartianNFT)
	await deployer.deploy(MRC721Minter, '0x0d56ec1022093Bed7897aC5302bc6c33C0B0A4AA',
					'0x102424f32dD34d015f039cDa485634D514DA0353')
}
