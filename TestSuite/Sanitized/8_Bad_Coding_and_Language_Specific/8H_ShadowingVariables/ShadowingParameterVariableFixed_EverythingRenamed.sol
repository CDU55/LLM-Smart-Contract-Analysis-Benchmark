// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88H21 {
    function split(address[] calldata sendTo, uint256 amountToSend)
        external
        payable
    {
        require(
            msg.value > 0,
            "Please also send the currency that is meant to be split"
        );
        require(
            sendTo.length > 0,
            "Please specify who the currency will be distributed to"
        );
        require(
            amountToSend * sendTo.length <= msg.value,
            "Please specify the correct ammount"
        );
        for (uint256 index = 0; index < sendTo.length; index++) {
            bool success = payable(sendTo[index]).send(amountToSend);
            require(success, "Failed to send currency");
        }
    }
}
