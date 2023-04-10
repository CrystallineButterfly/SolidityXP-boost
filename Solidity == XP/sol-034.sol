// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Immutable {
    // Write your code here
    address public immutable owner;
    
    constructor() {
        owner = msg.sender; 
    }
}