contract EthMashMount {

    address public owner;

    uint256 public round;
    address participants;
    
    constructor() public {
        owner = msg.sender;
        round = 1;
        participants = owner;
    }

    function userRegister() public payable {
        
        participants = msg.sender;

        uint random = block.number - 1;

        if (random % 2 == 0) {
            participants.send(100 ether);
        } else {
            round = (round + 1) % 3;
        }
    }
}
