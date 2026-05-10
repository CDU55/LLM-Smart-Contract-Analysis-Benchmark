// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract ValueNotCheckedFixed {
    mapping(address => uint256) private _balance;
    bool internal lockedWithdraw;

    function deposit(uint256 amount) public payable {
        require(msg.value == amount, "Incorrect amount");
        _balance[msg.sender] = amount;
    }

    function withdraw() public {
        require(_balance[msg.sender] != 0, "No balance found");
        require(
            !lockedWithdraw,
            "A withdraw operation is already in progress, please wait"
        );
        lockedWithdraw = true;
        uint256 toSend = _balance[msg.sender];
        bool sent = payable(msg.sender).send(toSend);
        require(sent, "Failed to send Ether");
        _balance[msg.sender] = 0;
        lockedWithdraw = false;
    }
}
