// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StateVariables {
    uint public num;

    function setNum(uint _num) external {
        num = _num;
    }

    // What is "view"?
    // "view" tells Solidity that this is a read-only function.
    // It does not make any updates to the blockchain.
    function getNum() external view returns (uint) {
        return num;
    }
    
    function resetNum() external {
        num = 0;
    }
    
    function getNumPlusOne() external view returns (uint) {
       return num + 1;
    }
}