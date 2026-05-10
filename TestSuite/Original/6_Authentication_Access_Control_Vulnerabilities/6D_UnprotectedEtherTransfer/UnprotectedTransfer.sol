// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract UnprotectedTransfer {
    mapping(address => uint256) private employees;
    address private owner;
    uint private reserve;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable onlyOwner {
        reserve = reserve + msg.value;
     }

    function assignSalary(address recipient, uint amount) external {
        require(amount <= reserve);
        employees[recipient] = amount;
        reserve = reserve - amount;
    }

    function withdrawSalary() external {
        employees[msg.sender] = 0;
        payable(msg.sender).transfer(employees[msg.sender]);
    }
}
