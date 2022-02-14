var MetaMartianNFT = artifacts.require('./MysteryMartian.sol')
var MRC721Minter = artifacts.require('./MRC721Minter.sol')

module.exports = async function(deployer) {
	await deployer.deploy(MetaMartianNFT)
	// await deployer.deploy(MRC721Minter, 
	// 	'0xdd2b34e738042413028a82de14b47bf887ff2d29',
	//  	'0x102424f32dD34d015f039cDa485634D514DA0353'
	// )
}
