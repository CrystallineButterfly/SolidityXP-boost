// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ConstructorIntro {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}