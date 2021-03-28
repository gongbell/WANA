/*
    Contract to force hodl 
*/
contract Owned {
    address public owner;
}

/*
Master Contract for Forcing Users to Hodl.
*/
contract HodlContract{
    
    HodlStruct[] public hodls; 
    address payable FeeAddress;    
    
    struct HodlStruct {
        address recipient;
        uint amount;
        uint waitTime;
        bool executed;
    }
  
   function HodlEth(address beneficiary, uint daysWait) public payable returns (uint hodlID) 
   {
       uint FeeAmount;
       FeeAddress = 0x9979cCFF79De92fbC1fb43bcD2a3a97Bb86b6920; 
        FeeAmount = msg.value * 1/100; //1% fee because you don't have the self control to hodl yourself.
        FeeAddress.transfer(FeeAmount);
        
        hodls[hodlID].waitTime = block.timestamp + daysWait * 1 days;
        hodls[hodlID].recipient = beneficiary;
        hodls[hodlID].amount = msg.value * 99/100;
        hodls[hodlID].executed = false;

        return hodlID;
        
    }
    
    function Realize(uint hodlID) public payable returns (uint amount){
    require (block.timestamp > hodls[hodlID].waitTime  //Didn't wait long enough.
    && !hodls[hodlID].executed //Not already executed.
    && msg.sender == hodls[hodlID].recipient); //Only recipient as sender can get ether back.
        
        msg.sender.transfer(hodls[hodlID].amount); // transfer the ether to the sender.
        hodls[hodlID].executed = true;
        return hodls[hodlID].amount;
    }
    
    
    function FindID(address beneficiary) public returns (uint hodlID){ //Emergency if user lost HodlID        
        for (uint i = 0; i <  hodls.length; ++i) {
            if (hodls[hodlID].recipient == beneficiary && !hodls[hodlID].executed ) {
                return hodlID;
            } else {
                revert();
            }
        }
        
    }
    
}