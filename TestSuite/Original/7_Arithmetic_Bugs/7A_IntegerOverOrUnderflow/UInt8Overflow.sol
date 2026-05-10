// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.29;

contract UInt8Overflow {
    uint8 public price;
    address private owner;

    constructor (uint8 initialPrice) {
        price = initialPrice;
        owner = msg.sender;
    }

    function increasePrice(uint8 amount) external {
        price += amount;
    }
}