// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// You know what functions you can call, so you define an interface to TestInterface.
interface ITestInterface {
    function count() external view returns (uint);

    function inc() external;
    // Write your code here
    function dec() external;
}

// Contract that uses TestInterface interface to call TestInterface contract
contract CallInterface {
    function examples(address _test) external {
        ITestInterface(_test).inc();
        uint count = ITestInterface(_test).count();
    }

    function dec(address _test) external {
         ITestInterface(_test).dec();
    }
}