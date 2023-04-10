// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GlobalVariables {
    function globalVars() external {
        // address that called this function
        address sender = msg.sender;
        // timestamp (in seconds) of current block
        uint timeStamp = block.timestamp;
        // current block number
        uint blockNum = block.number;
        // hash of given block
        // here we get the hash of the current block
        // WARNING: only works for 256 recent blocks
        bytes32 blockHash = blockhash(block.number);
    }
    
    function returnSender() external view returns (address) {
        return msg.sender;
    }
}