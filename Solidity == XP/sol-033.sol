// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// visibility - public, private, internal, external
contract VisibilityBase {
    // State variables can be one of private, internal or public.
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    // Private function can only be called
    // - inside this contract
    // Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns (uint) {
        return 0;
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns (uint) {
        return 200;
    }

    // External functions can only be called
    // - by other contracts and accounts
    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        // Access state variables
        x + y + z;

        // Call functions, cannot call externalFunc()
        privateFunc();
        internalFunc();
        publicFunc();

        // Actually you can call an external function with this syntax.
        // This is bad code.
        // Instead of making an internal call to the function, it does an
        // external call into this contract. Hence using more gas than necessary.
        this.externalFunc();
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        // Access state variables (internal and public)
        y + z;

        // Call functions (internal and public)
        internalFunc();
        publicFunc();
    }

    function test() external view returns (uint) {
        return y + z + internalFunc() + publicFunc();
        return 0;
    }
}