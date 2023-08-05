const { ethers, upgrades } = require('hardhat');

async function main() {
  const VendingMachineV1 = await ethers.getContractFactory('VendingMachineV1');
  const proxy = await upgrades.deployProxy(VendingMachineV1, [420]);
  await proxy.waitForDeployment();

  const address = await proxy.getAddress();
  const implementationAddress = await upgrades.erc1967.getImplementationAddress(
    address
  );

  console.log('Proxy contract address: ' + address);

  console.log('Implementation contract address: ' + implementationAddress);
}

main();