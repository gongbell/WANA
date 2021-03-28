/**
 *Submitted for verification at Etherscan.io on 2018-01-25
*/

// See thecryptobutton.com
contract Countdown {
    
    uint public deadline;
    address owner;
    address public winner;
    uint public reward = 0;
    uint public tips = 0;
    uint public buttonClicks = 0;
    
    constructor() public payable {
        owner = msg.sender;
        deadline = block.timestamp + 3 hours;
        winner = msg.sender;
        reward += msg.value;
    }
    
    function ClickButton() public payable {
        // Pay at least 1 dollar to click the button
        require(msg.value >= 0.001 ether);
        
        // Refund people who click the button
        // after it expires
        if (block.timestamp > deadline) {
            revert();
        }
    
        reward += msg.value * 8 / 10;
        // Take 20% tip for server costs.
        tips += msg.value * 2 / 10;
        winner = msg.sender;
        deadline = block.timestamp + 30 minutes;
        buttonClicks += 1;
    }
    
    // The winner is responsible for withdrawing the funds
    // after the button expires
    function Win() public {
        require(msg.sender == winner);
        require(block.timestamp > deadline);
        reward = 0;
        payable(winner).transfer(reward);
    }
    
    function withdrawTips() public {
        // The owner can only withdraw the tips
        tips = 0;
        payable(owner).transfer(tips);
    }
    
}
