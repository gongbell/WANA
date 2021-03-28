contract SatoshiDice {
    struct Bet {
        address user;
        uint block;
        uint cap;
        uint amount; 
    }

    uint public constant FEE_NUMERATOR = 1;
    uint public constant FEE_DENOMINATOR = 100;
    uint public constant MAXIMUM_CAP = 100000;
    uint public constant MAXIMUM_BET_SIZE = 1e18;

    address payable owner;
    uint public counter = 0;
    mapping(uint => Bet) public bets;

    constructor() {
        owner = msg.sender;
    }

    function wager (uint cap) public payable {
        require(cap <= MAXIMUM_CAP);
        require(msg.value <= MAXIMUM_BET_SIZE);

        counter++;
        bets[counter] = Bet(msg.sender, block.number + 3, cap, msg.value);
    }

    function roll(uint id) public {
        require(msg.sender == bets[id].user);
        require(block.number >= bets[id].block);

        bytes32 random = keccak256(abi.encode(blockhash(bets[id].block), id));
        uint rolled = uint(random) % MAXIMUM_CAP;
        if (rolled < bets[id].cap) {
            uint payout = bets[id].amount * MAXIMUM_CAP / bets[id].cap;
            uint fee = payout * FEE_NUMERATOR / FEE_DENOMINATOR;
            payout -= fee;
            msg.sender.transfer(payout);
        }
    }

    function fund () payable public {}

    function kill () public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}