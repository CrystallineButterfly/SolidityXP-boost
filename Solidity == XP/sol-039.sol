// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./TestContract.sol";

contract CallTestContract {
    function setX(TestContract _test, uint _x) external {
        _test.setX(_x);
    }

    function setXfromAddress(address _addr, uint _x) external {
        TestContract test = TestContract(_addr);
        test.setX(_x);
    }

    function getX(address _addr) external view returns (uint) {
        uint x = TestContract(_addr).getX();
        return x;
    }

    function setXandSendEther(TestContract _test, uint _x) external payable {
        _test.setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _addr) external view returns (uint, uint) {
        (uint x, uint value) = TestContract(_addr).getXandValue();
        return (x, value);
    }

    function setXwithEther(address _addr) external payable {
        TestContract(_addr).setXtoValue{value: msg.value}();
    }

    function getValue(address _addr) external view returns (uint) {
        return TestContract(_addr).getValue();
    }
}