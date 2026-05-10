// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract VulnerableDelegateCALL {
    uint256 private vulnerableStorage;

    function forwardToWorker(address workerAddress, bytes calldata callData)
        public
    {
        executePreCallLogic();
        (bool success, ) = workerAddress.delegatecall(callData);
        require(success);
        executePostCallLogic();
    }

    function executePreCallLogic() private {
        //Do some logic
    }

    function executePostCallLogic() private {
        //Do some logic
    }
}
