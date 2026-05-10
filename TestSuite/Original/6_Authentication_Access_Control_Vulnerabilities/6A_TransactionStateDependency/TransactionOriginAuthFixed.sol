// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract TransactionOriginAuthFixed {
    address owner;
    mapping (address => bool) registered;

    constructor() {
        owner = msg.sender;
    }

    function register() external {
        registered[msg.sender] = true;
    }

    function distribute(address recipient, uint share) external {
        require(msg.sender == owner);
        require(registered[recipient]);
        payable(recipient).transfer(share);
    }
}
