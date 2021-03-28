contract viewMessageNumPayable{
    bytes32 message;
    bytes32 message2;
    address public owner;
    uint amount;
    uint specialNumber;
    uint public price = 0.001 ether;

    constructor() {
        owner = msg.sender;
        specialNumber = 100;
        amount = 0;
    }
    
    
    function setNewMessage(bytes32 newMsg) public payable
    {
        
        //msg.value is a special variable that holds the number of wei sent with the transaction (gas is counted separately)
        message = newMsg;
        amount += msg.value;
        
        
    }
    
    function setNewMessageNumber(bytes32 m, uint num) public payable {
        require(msg.value >= price);
        message = m;
        specialNumber = num;
        amount += msg.value;
    }
    
    function setNewMessageNumber2(bytes32  m, uint num) public payable {
        message = m;
        specialNumber = num;
        amount += msg.value;
    }
    
    function setNewMessage2(bytes32  meg) public payable {
        message2 = meg;
        amount += msg.value;
    }
    
    function getMessage() public returns (bytes32 )
    {
        return message;
    }
    
    function getMessage2() public returns (bytes32 )
    {
        return message2;
    }
    
    function getSpecialNum() public returns (uint) {
        return specialNumber;
    }
    
    
    
}