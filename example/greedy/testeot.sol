contract testeot {
    
    // totalSupply = maximum 210000 Coins with 18 decimals;   
    uint256 public totalSupply = 210000000000000000000000;
    uint256 public availableSupply= 210000000000000000000000;
    uint256 public circulatingSupply = 0;  	
    uint8   public decimals = 18;
         
    uint256 public crowdsalePrice = 100;                          	
    uint256 public crowdsaleClosed = 0;                 
    address public daoMultisig = msg.sender;
    address public owner = msg.sender;  

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;	
	
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);    
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) public returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }
	
    function transferOwnership(address newOwner) public {
        owner = newOwner;
    }	
	
    fallback () external payable {
        if (crowdsaleClosed > 0) revert();		
        if (msg.value == 0) {
          revert();
        }		
        Transfer(msg.sender, daoMultisig, msg.value);		
        uint token = msg.value * crowdsalePrice;		
		availableSupply = totalSupply - circulatingSupply;
        if (token > availableSupply) {
          revert();
        }		
        circulatingSupply += token;
        balances[msg.sender] += token;
    }
	
    function setPrice(uint256 newSellPrice) public {
        crowdsalePrice = newSellPrice;
    }
	
    function stoppCrowdsale(uint256 newStoppSign) public {
        crowdsaleClosed = newStoppSign;
    }		

    function setMultisigAddress(address newMultisig) public {
        daoMultisig = newMultisig;
    }	
	
}