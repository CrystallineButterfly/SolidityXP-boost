// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayReplaceLast {
    uint[] public arr = [1, 2, 3, 4];

    function remove(uint _index) external {
       arr[_index] = arr[arr.length -1];
       arr.pop();
    }
}