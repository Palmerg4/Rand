const { expect } = require("chai");
const { ethers, waffle } = require("hardhat");
const { BigNumber, utils } = require("ethers");

describe("Guess the correct card using the 'randommness' from CardPick", () => {
    it("Should guess the card number correctly", async () => {
        const CardPick = await ethers.getContractFactory("CardPick");
        const cardpick = await CardPick.deploy({ value: utils.parseEther("0.1") });
        await cardpick.deployed();

        const Attack = await ethers.getContractFactory("Attack");
        const attack = await Attack.deploy(cardpick.address);

        const tx = await attack.attack();
        await tx.wait();

        const balanceCardpick = await cardpick.getBalance();

        expect(balanceCardpick).to.equal(BigNumber.from("0"));
    });
});