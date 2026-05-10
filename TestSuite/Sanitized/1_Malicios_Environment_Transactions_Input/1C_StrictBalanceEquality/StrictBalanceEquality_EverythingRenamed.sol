// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11C11 {
    address private _owner;

    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "Only the owner of the contract can access this"
        );
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    receive() external payable {}

    function getFunds() external onlyOwner {
        require(
            address(this).balance == 10 ether,
            "The funding goal has not been reached"
        );
        payable(_owner).transfer(address(this).balance);
    }
}
