contract HashBet {
    
    constructor() public {}
    
    event Result(uint256 hashVal, uint16 result);
    mapping( address => Bet ) bets;
    
    struct Bet {
        uint value;
        uint height;
    }

    function makeBet() payable public {
        require( bets[msg.sender].height == 0 && msg.value > 10000 );
        Bet memory newBet = bets[msg.sender];
        newBet.value = msg.value;
        newBet.height = block.number;
    }
    
    function resolveBet() public {
        Bet memory bet = bets[msg.sender];
        uint dist = block.number - bet.height;
        require( dist < 255 && dist > 3 );
        bytes32 h1 = blockhash(bet.height);
        bytes32 h2 = blockhash(bet.height+3);
        uint256 hashVal = uint256( keccak256(abi.encode(h1,h2)) );
        uint256 FACTOR = 115792089237316195423570985008687907853269984665640564039457584007913129640; // ceil(2^256 / 1000)
        uint16 result = uint16((hashVal / FACTOR)) % 1000;
        bet.height = 0;
        if( result <= 495 ) { //49.5% chance of winning???
            msg.sender.transfer(address(this).balance);
        }
        
        emit Result(hashVal, result);
    }
}