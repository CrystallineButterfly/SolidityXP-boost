// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HashFunc {
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    function getHash(address _addr, uint _num) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(_addr, _num));
    }
}