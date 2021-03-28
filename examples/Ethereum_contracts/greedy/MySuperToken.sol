contract MySuperToken {
    uint decimals = 10 ** 10;
    
    uint public totalSupply;
    
    address public owner;
    
    mapping(address=>uint) ballances;
    
    function mint(address _investor, uint amount) public {
        ballances[_investor] += amount;
        totalSupply += amount;
    }
    
    function buy() public payable {
        ballances[msg.sender] += msg.value;
        totalSupply += msg.value;
    }
    
    constructor(){
        owner = msg.sender;
    }
    
    function transfer(address _to, uint amount) public {
        require(ballances[msg.sender] >= amount);
        ballances[_to] += amount;
        ballances[msg.sender] -= amount;
    }
    
}