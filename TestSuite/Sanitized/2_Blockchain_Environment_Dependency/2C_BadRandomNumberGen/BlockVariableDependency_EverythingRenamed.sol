// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C22C31 {
    uint256 private _contendersCount;
    mapping(uint256 => address) private _contenders;

    address owner;

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the owner of the contract can access this"
        );
        _;
    }

    constructor() {
        owner = msg.sender;
        _contendersCount = 0;
    }

    receive() external payable {}

    function register(address contender) external payable {
        require(
            msg.value >= 1 ether && msg.value < 2 ether,
            "Invalid entrance tax"
        );
        _contenders[_contendersCount] = contender;
        _contendersCount = _contendersCount + 1;
    }

    function chooseWinner() external onlyOwner {
        require(_contendersCount > 10, "Not enough contenders registered");
        uint256 winnerIndex = block.difficulty % _contendersCount;
        _contendersCount = 0;
        payable(_contenders[winnerIndex]).transfer(
            address(this).balance - 1 ether
        );
        payable(owner).transfer(1 ether);
    }
}
