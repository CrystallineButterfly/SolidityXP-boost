// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
    
    function min(uint x, uint y) internal pure returns (uint) {
        return x <= y ? x : y;
    }
}

contract TestMath {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }

    function testMin(uint x, uint y) external pure returns (uint) {
        return Math.min(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
    
    function sum(uint[] storage arr) internal view returns (uint) {
        uint total;
        for (uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }
}

contract TestArray {
    using ArrayLib for uint[];

    uint[] public arr = [3, 2, 1];

    function testFind() external view {
        arr.find(2);
    }

    function testSum() external view returns (uint) {
        return arr.sum();
    }
}