contract Faucet {
    mapping (address => uint) lastSent;
	
    function getWei(uint sendAmount, uint blockLimit, address reveiver) returns (bool){
        if (lastSent[msg.sender] < (block.number-blockLimit)) { 
            reveiver.send(10);
            lastSent[msg.sender] = block.number;       
            return true;
        } else {
            return false;
        }
    }
}
