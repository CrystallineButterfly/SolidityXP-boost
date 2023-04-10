// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter {
  uint public count;
  
  function inc() external returns (uint) {
      count++;
  }
  
  function dec() external returns (uint) {
      count--;
  }
}