var DamChain = artifacts.require("./DamChain.sol");

module.exports = function(deployer) {
  deployer.deploy(DamChain);
};
