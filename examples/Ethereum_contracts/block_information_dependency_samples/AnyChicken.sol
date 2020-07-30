contract AnyChicken {

    address public owner;
	uint public bigAmount;
	uint public lastBlock;
	
	function AnyChicken() public payable {
		owner = msg.sender;
		bigAmount = msg.value;
		lastBlock = block.number;
	}
	
	function () public payable {
		if (block.number <= lastBlock + 1000) {
			require(msg.value > bigAmount);
			bigAmount = msg.value;
			lastBlock = block.number;
			owner.transfer(msg.value/100);
		}
	}
}
