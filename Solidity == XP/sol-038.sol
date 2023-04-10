// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
    
    receive() payable external {}
    
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "not owner");
        (bool sent, ) = owner.call{value: _amount}("");
        require(sent, "Failed to send ether");
    }
}