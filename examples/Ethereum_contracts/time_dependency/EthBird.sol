contract EthBird {
    
    address payable public owner;
    address payable highScoreUser;
    
    uint currentHighScore = 0;
    uint contestStartTime = block.timestamp;
    
    mapping(address => bool) paidUsers;
    
    constructor() {
        owner = msg.sender;
    }
    
    function payEntryFee() public payable  {
        if (msg.value >= 0.001 ether) {
            paidUsers[msg.sender] = true;
        }
    }

    function getCurrentHighscore() public returns (uint) {
        return currentHighScore;
    }
    
    function getCurrentHighscoreUser() public  returns (address) {
        return highScoreUser;
    }
    
    function getCurrentJackpot() public  returns (uint) {
        return address(this).balance;
    }
    
    function getNextPayoutEstimation() public  returns (uint) {
        return (contestStartTime + 1 days) - block.timestamp;
    }
    
    function recordHighScore(uint score, address payable userToScore)  public  returns (address) {
        if(paidUsers[userToScore]){
            if(score > 0 && score >= currentHighScore){
                highScoreUser = userToScore;
                currentHighScore = score;
            }
            if(block.timestamp >= contestStartTime + 1 days){
                awardHighScore();   
            }
        }
        return userToScore;
    }
    
    function awardHighScore() public  {
        uint256 ownerCommision = address(this).balance / 10;
        owner.transfer(ownerCommision);
        highScoreUser.transfer(address(this).balance);
        contestStartTime = block.timestamp;
    }
}