/**
 *Submitted for verification at Etherscan.io on 2017-08-25
*/
contract RaffleStrangeLoop {
    address payable owner;
    address public winner;
    mapping(uint => address) public tickets;

    uint public numTickets;
    uint public ethereumFoundationTickets;

    uint public chooseWinnerDeadline;

    uint public lastBlock;
    bytes32 public serverSeedHash;
    bytes32 public clientSeed;

    constructor(){
        owner = msg.sender;
        chooseWinnerDeadline = block.timestamp + 15 days;
    }

    function getRaffleTimeLeft() public returns (uint) {
        int timeLeft = int(chooseWinnerDeadline) - int(block.timestamp);
        if (timeLeft > 0) {
            return uint(timeLeft);
        } else {
            return 0;
        }
    }

    function chooseWinner(bytes32 seed) public {
        // Allow a period of 24 hours to choose a winner
        int timeLeft = int(chooseWinnerDeadline) - int(block.timestamp);
        require(timeLeft < 0 && timeLeft > -86400);

        // Require that at least one person bought the ticket
        require(numTickets > 0);

        // Choose winner
        bytes32 serverClientHash = keccak256(abi.encode(seed, clientSeed));

        uint winnerIdx = (uint(serverClientHash) ^ lastBlock) % numTickets;
        winner = tickets[winnerIdx];
        // Send donation to ethereum foundation
        uint donation = ethereumFoundationTickets * 10000000000000000;
        if (donation > 0) {
            // See https://www.ethereum.org/donate
            address payable ethereumTipJar = 0xfB6916095ca1df60bB79Ce92cE3Ea74c37c5d359;
            ethereumTipJar.transfer(donation);
        }

        // Send remaining balance to owner
        owner.transfer(address(this).balance);
    }

    function buyTickets(bytes32 beneficiary) public payable  {
        // only allow if there is time left
        require(getRaffleTimeLeft() > 0);

        // ticket value = 0.01 ETH
        uint ticketsBought = msg.value / 10000000000000000;

        // Refund the difference
        msg.sender.transfer(msg.value % 10000000000000000);

        //Update client seed
        clientSeed = keccak256(abi.encode(clientSeed, msg.sender, msg.value));

        // Save last block and its hash
        lastBlock = block.number;

        // Buy tickets
        for (uint i = 0; i < ticketsBought; i++) {
            tickets[numTickets++] = msg.sender;
        }

        if (beneficiary == "ethereum-foundation") {
            ethereumFoundationTickets += ticketsBought;
        }
    }

    function getRefund() public {
        // Can only refund when it's been 24 hours after the deadline
        int timeLeft = int(chooseWinnerDeadline) - int(block.timestamp);
        require(timeLeft < -86400);

        uint amountToRefund = 0;
        for (uint i = 0; i < numTickets; i++) {
            if(tickets[i] == msg.sender) {
                amountToRefund += 10000000000000000;
                tickets[i] = address(0x0);
            }
        }

        msg.sender.transfer(amountToRefund);
    }

    function func() external payable  {
        buyTickets("owner");
    }
}
