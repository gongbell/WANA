contract UserWallet {
    address sweeperList;
    function sweep() public returns (bool) {
        (bool success,) = sweeperList.delegatecall(msg.data);
        return success;
    }
}

