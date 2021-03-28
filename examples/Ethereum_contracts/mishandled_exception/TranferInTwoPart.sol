contract TranferInTwoPart {
    function transfer(address payable _to) payable public {
        uint half = msg.value / 2;
        uint halfRemain = msg.value - half;
        
        _to.send(half);
        _to.send(halfRemain);
    }
}