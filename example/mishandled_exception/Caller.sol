contract Caller {
    address public owner;
    uint bal;
    function callAddress(address payable a) public {
        if (msg.sender != owner) {
            owner = msg.sender;
        }
        a.send(bal);

    }
}