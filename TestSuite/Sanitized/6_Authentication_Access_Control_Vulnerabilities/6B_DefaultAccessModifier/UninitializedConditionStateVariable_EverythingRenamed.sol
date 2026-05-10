// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C66B51 {
    mapping(address => uint256) private _employees;

    address private owner;

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the owner of the contract can access this"
        );
        _;
    }

    function sendSalary(address employeeAddress) external payable onlyOwner {
        _employees[employeeAddress] = msg.value;
    }

    function getSalary() external {
        require(
            _employees[msg.sender] > 0,
            "You cannot receive your salary at this moment"
        );
        _employees[msg.sender] = 0;
        payable(msg.sender).transfer(_employees[msg.sender]);
    }

    function cancelContract() external onlyOwner {
        selfdestruct(payable(msg.sender));
    }
}
