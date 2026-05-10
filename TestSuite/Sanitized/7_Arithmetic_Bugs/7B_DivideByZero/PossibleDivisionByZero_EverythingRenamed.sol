// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C77B51 {
    uint256 public recipientsCount;
    mapping(uint256 => address payable) private _recipients;

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
        recipientsCount = 0;
    }

    receive() external payable {}

    function registerRecipient(address payable recipient) external {
        recipientsCount = recipientsCount + 1;
        _recipients[recipientsCount] = recipient;
    }

    function distributeTorecipients() external onlyOwner {
        uint256 share = address(this).balance / recipientsCount;
        for (uint256 index = 1; index <= recipientsCount; index++) {
            _recipients[index].transfer(share);
        }
    }
}
