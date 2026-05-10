// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C55A21 {
    uint256[] private _companyGrossSalaries;

    constructor(uint256[] memory grossSalaries) {
        _companyGrossSalaries = grossSalaries;
    }

    function getSalariesNumber() external view returns (uint256 count) {
        return _companyGrossSalaries.length;
    }

    function getNetSalary(uint256 index)
        external
        view
        returns (uint256 salary)
    {
        require(
            index < _companyGrossSalaries.length,
            "The index that was provided is too high"
        );
        uint256 netSalary = _companyGrossSalaries[index];
        netSalary = salary - (_companyGrossSalaries[index] / 100) * 45;
        return netSalary;
    }
}
