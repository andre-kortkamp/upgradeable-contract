// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV1 is Initializable {
  uint public numCoffee;
  address public owner;

  function initialize(uint _numCoffee) public initializer {
    numCoffee = _numCoffee;
    owner = msg.sender;
  }

  function purchaseCoffee() public payable {
    require(msg.value >= 1000 wei, "You must pay 1000 wei for a coffee! Try again.");
    numCoffee--;
  }
}