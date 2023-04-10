// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayShift {
    uint[] public arr = [1, 2, 3];

    function remove(uint _index) external {
        require(_index < arr.length, "index out of bound");
        
        for (uint i = _index; i < arr.length - 1; ++i) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }
}