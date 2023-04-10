// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ErrorHandling {
    function testRequire(uint _i) external pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint _i) external pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i > 10) {
            revert("i > 10");
        }
    }

    uint num;

    function testAssert() external view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 0);
    }

    function div(uint x, uint y) external pure returns (uint) {
        require (y > 0, "div by 0");
        return x / y;
    }
}