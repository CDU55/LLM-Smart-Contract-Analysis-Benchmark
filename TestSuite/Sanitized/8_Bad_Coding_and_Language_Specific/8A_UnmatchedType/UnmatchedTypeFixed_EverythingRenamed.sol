// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88A21 {
    enum Options {
        Candidate1,
        Candidate2,
        Candidate3
    }
    mapping(address => Options) private _votes;
    mapping(Options => uint256) private _votesCount;

    function vote(uint256 option) external {
        require(option <= uint256(Options.Candidate3), "Invalid Option");
        _votes[msg.sender] = Options(option);
        _votesCount[Options(option)]++;
    }

    function getStatisticsForOption(uint256 option)
        external
        view
        returns (uint256)
    {
        require(option <= uint256(Options.Candidate3), "Invalid Option");
        return _votesCount[Options(option)];
    }
}
