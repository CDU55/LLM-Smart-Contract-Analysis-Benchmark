// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract SendReturnValueNotCheckedInconsistentFixed {
    address public highestBidder;
    uint public highestBid;
    event Bid(address, bool);

    function bid() external payable {
        if (msg.value > highestBid) {
            uint hb_tmp = highestBid;
            address hd_addr = highestBidder;
            highestBid = msg.value;
            highestBidder = msg.sender;
            bool success = payable(hd_addr).send(hb_tmp);
            emit Bid(highestBidder, success);
            if (!success) 
                revert("Failed to return bid");
        }
    }
}