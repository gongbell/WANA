

contract SafeConditionalHFTransfer {

    bool classic;
    
    function classicTransfer(address payable to) public payable {
        if (!classic)
            payable(msg.sender).send(msg.value);
        else
            to.send(msg.value);
    }
    
    function send(address payable to) public payable {
        if (classic)
            payable(msg.sender).send(msg.value);
        else
            to.send(msg.value);
    }
    
}