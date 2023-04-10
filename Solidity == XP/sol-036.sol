// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Fallback {
    string[] public answers = ["receive", "fallback"];

    fallback() external payable {}

    receive() external payable {}
}