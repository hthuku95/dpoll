// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Poll {
    address private creator;

    constructor(address _creator){
        creator = _creator;
    }
}