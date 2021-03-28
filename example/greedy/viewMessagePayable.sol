contract viewMessagePayable{
    bytes32 message;
    bytes32 message2;
    address public owner;
    uint amount;

    constructor() {
        owner = msg.sender;
        amount = 0;
    }
    
    
    function setNewMessage(bytes32 newMsg) public payable
    {
        
        //msg.value is a special variable that holds the number of wei sent with the transaction (gas is counted separately)
        message = newMsg;
        amount += msg.value;
        
        
    }
    
    function setNewMessage2(bytes32 meg) public payable {
        message2 = meg;
        amount += msg.value;
    }
    
    function getMessage() public returns (bytes32)
    {
        return message;
    }
    
    
}