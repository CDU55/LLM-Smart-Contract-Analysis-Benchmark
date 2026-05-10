// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11A11 {
    mapping(address => uint) private balance;

    function deposit() external payable {
        balance[msg.sender] = msg.value;
    }

    function withdraw() external {
        uint addrBal = balance[msg.sender];
        (bool success,) = payable(msg.sender).call{value: addrBal}("");
        if (success){ 
            balance[msg.sender] = 0;
        }
    }
}