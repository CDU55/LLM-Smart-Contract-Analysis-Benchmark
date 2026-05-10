// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C44B31 {
    event Forwarded(address, address);
    function forward(address recipient) external payable {
        require(msg.value > 0);
        require(recipient != address(0));
        emit Forwarded(msg.sender, recipient);
        payable(recipient).transfer(msg.value);
    }
}
