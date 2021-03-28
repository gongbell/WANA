// Simple Game. Each time you send more than the current jackpot, you become
// owner of the contract. As an owner, you can take the jackpot after a delay
// of 5 days after the last payment.

contract Owned {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}

contract RichestTakeAll is Owned {
    uint public jackpot;
    uint public withdrawDelay;

    function func() external payable {
        // transfer contract ownership if player pay more than current jackpot
        if (msg.value >= jackpot) {
            owner = msg.sender;
            withdrawDelay = block.timestamp + 5 days;
        }

        jackpot += msg.value;
    }

    function takeAll() public {
        require(block.timestamp >= withdrawDelay);

        msg.sender.transfer(jackpot);

        // restart
        jackpot = 0;
    }
}