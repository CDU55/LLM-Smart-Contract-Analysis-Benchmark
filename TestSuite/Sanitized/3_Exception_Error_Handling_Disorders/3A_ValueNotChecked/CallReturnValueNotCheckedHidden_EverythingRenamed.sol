// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C33A31 {
    mapping (address=>uint) balanceOf;

    function deposit() public payable {
        balanceOf[msg.sender] = msg.value;
    }

    function withdraw() public {
        uint amount = balanceOf[msg.sender];
        (bool success,)  = payable(msg.sender).call{value: amount}("");
        success = true;
    }
}