contract EthMashMount {

    address public owner;
    mapping (address => uint) public withdrawals;

    int round;
    mapping (int => address[3]) public participants;
    
    constructor() {
        owner = msg.sender;
        round = 1;
        participants[1][0] = owner;
    }

    function publicGetBalance(address player) view public returns (uint) {
        return withdrawals[player];
    }

    function userWithdraw() public {
        require(withdrawals[msg.sender] > 0);
        uint amount = withdrawals[msg.sender];
        withdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }

    function userRegister() public payable {
        require(msg.value == 105 );
        
        withdrawals[owner] += 5 ;
        participants[round][1] = msg.sender;

        uint random = (uint(blockhash(block.number - 1)) + uint(participants[round][0]) + uint(participants[round][1]));

        if (random % 2 == 0) {
            participants[round][2] = participants[round][0];
            withdrawals[participants[round][0]] += 100 ;
            
        } else {
            participants[round][2] = participants[round][1];
            withdrawals[participants[round][1]] += 100 ;
        }
        
        round++;
        participants[round][0] = participants[round - 1][2];
    }
}