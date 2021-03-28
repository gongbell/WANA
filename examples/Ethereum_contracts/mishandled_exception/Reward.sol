contract Reward{
    
    function reward(uint32 rewardsDistribution, address payable winners) public payable{
        
        if(rewardsDistribution == 0 || rewardsDistribution > 64){ // do not risk gas shortage on reward
			revert();
		}
		
        uint8 numWinners = uint8(rewardsDistribution);

        uint forJack = msg.value;

		uint value = msg.value * rewardsDistribution;
		winners.send(value); // skip winner if fail to send but still use next distribution index
		forJack = forJack - value;
		
		if(forJack > 0){
		    if(!msg.sender.send(forJack)){
		        revert();
		    } 
		}
		
    }
    
}