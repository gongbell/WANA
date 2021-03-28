contract MiCon{
    uint public totalSupply;
    uint public decimals=10^18;
    
    mapping(address=>uint) balances;
    
    address public owner;
    
    constructor(){
        owner=msg.sender;
    }
    
    function mint(address _investor, uint amount) public {
        balances[_investor]+=amount*decimals;
        totalSupply+=amount*decimals;
    }
    
    function buy() public payable{
        balances[msg.sender]+=msg.value;
        totalSupply+=msg.value;
    }
    
    function transfer(address _to, uint amount) public{
        require(balances[msg.sender]>=amount);
        balances[_to]+=amount;
        balances[msg.sender]-=amount;
    }
    
}