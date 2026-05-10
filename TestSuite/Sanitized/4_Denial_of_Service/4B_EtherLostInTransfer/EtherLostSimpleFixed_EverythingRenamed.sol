// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C44B41 {
    event Forwarded(address, address);
    mapping (address => bool) registered;

    function register() external {
        registered[msg.sender] = true;
    }

    function forward(address recipient) external payable {
        require(msg.value > 0);
        require(recipient != address(0));
        require(registered[recipient]);
        emit Forwarded(msg.sender, recipient);
        payable(recipient).transfer(msg.value);
    }
}
