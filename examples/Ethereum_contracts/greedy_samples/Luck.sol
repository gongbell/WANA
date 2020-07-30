contract Luck {
    uint32 public luck = 138;
    address public owner;
    uint32[] public history;
    
    function Luck() public {
        owner = msg.sender;
    }
    
    function getLuck() public view returns(uint32) {
        return luck;
    }
    
    function changeLuck(uint32 newLuck) external payable {
        require(msg.sender == owner);
        luck = newLuck;
    }
}
