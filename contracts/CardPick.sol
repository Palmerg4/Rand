// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract CardPick {
    constructor() payable {}

    function pickACard() private view returns (uint256) {

        uint256 pickedCard = uint256(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp)));
        return pickedCard;
    }

    function guess(uint256 _guess) public {

        uint256 _pickedCard = pickACard();

        if(_guess == _pickedCard) {
            (bool sent,) = msg.sender.call{value: 0.1 ether}("");
            require(sent, "Call Failed");
        }
    }

    function getBalance() view public returns(uint256) {
        return address(this).balance;
    }
}