// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88L51 {
    mapping(address => uint256) private _balance;

    function deposit(uint256 amount) external payable {
        require(msg.value == amount);
        _balance[msg.sender] = amount;
    }

    function withdraw() external {
        uint256 toSend = _balance[msg.sender];
        require(_balance[msg.sender] != 0);
        _balance[msg.sender] = 0;
        bool sent = payable(msg.sender).send(toSend);
        require(sent);
    }
}
