// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IfElse {
    function ifElse(uint _x) external pure returns (uint) {
        if (_x < 10) {
            return 1;
        } else if (_x < 20) {
            return 2;
        } else {
            return 3;
        }
    }

    function ternaryOperator(uint _x) external pure returns (uint) {
        // condition ? value to return if true : value to return if false
        return _x > 1 ? 10 : 20;
    }

    function exercise_1(uint _x) external pure returns (uint) {
        return _x > 0 ? 1 : 0;
    }

    function exercise_2(uint _x) external pure returns (uint) {
        return _x > 0 ? 1 : 0;
    }
    
}