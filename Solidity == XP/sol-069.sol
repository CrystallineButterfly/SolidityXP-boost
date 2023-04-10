// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Hodl {
    uint private constant HODL_DURATION = 3 * 365 days;

    mapping(address => uint) public balanceOf;
    mapping(address => uint) public lockedUntil;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
        lockedUntil[msg.sender] = block.timestamp + HODL_DURATION;
    }

    function withdraw() external {
        require(block.timestamp >= lockedUntil[msg.sender], "locked"); 
        uint bal = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        payable(msg.sender).transfer(bal);
    }
}