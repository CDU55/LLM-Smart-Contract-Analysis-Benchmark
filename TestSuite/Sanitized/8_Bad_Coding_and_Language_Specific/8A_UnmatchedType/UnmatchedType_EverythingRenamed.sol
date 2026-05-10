// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88A11 {
    enum Options {
        Candidate1,
        Candidate2,
        Candidate3
    }
    mapping(address => Options) private _votes;
    mapping(Options => uint256) private _votesCount;

    function vote(uint256 option) external {
        _votes[msg.sender] = Options(option);
        _votesCount[Options(option)]++;
    }

    function getStatisticsForOption(uint256 option)
        external
        view
        returns (uint256)
    {
        return _votesCount[Options(option)];
    }
}
