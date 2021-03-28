contract EternalWealth {
    
    uint public doomsday;
    address payable owner;
    address payable public savior;
    uint public blessings = 0;
    uint public tithes = 0;
    uint public lifePoints = 0;
    
    constructor() payable {
        owner = msg.sender;
        doomsday = block.timestamp + 3 hours;
        savior = msg.sender;
        blessings += msg.value;
    }
    
    function ExtendLife() public payable {

        require(msg.value >= 0.001 ether);

        if (block.timestamp > doomsday) {
            revert();
        }
    
        blessings += msg.value * 8 / 10;
        tithes += msg.value * 2 / 10;
        savior = msg.sender;
        doomsday = block.timestamp + 30 minutes;
        lifePoints += 1;
    }
    

    function ClaimBlessings() public {
        require(msg.sender == savior);
        require(block.timestamp > doomsday);
        uint pendingBlessings = blessings;
        blessings = 0;
        savior.transfer(pendingBlessings);
    }
    
    function WithdrawTithes() public {
        uint pendingTithes = tithes;
        tithes = 0;
        owner.transfer(pendingTithes);
    }
    
}