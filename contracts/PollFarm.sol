// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Poll.sol";

contract PollFarm {
  address[] public deployedPolls;
  
  function createPoll() public {
    address newPoll = address(new Poll(msg.sender));
    deployedPolls.push(newPoll);
  }

  function getDeployedPolls() public view returns (address[] memory) {
    return deployedPolls;
  }
}