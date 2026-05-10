// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C33A51 {
    address private owner;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }    

    function changeOwnerTo(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
