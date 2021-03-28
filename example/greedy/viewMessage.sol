contract viewMessage{
    bytes32 message;
    constructor() public {
    }
    
    
    function setNewMessage(bytes32  newMsg) public payable
    {
        //msg.value is a special variable that holds the number of wei sent with the transaction (gas is counted separately)
        message = newMsg;
        
    }
    
    function getMessage() public returns (bytes32 )
    {
        return message;
    }
    
    
}