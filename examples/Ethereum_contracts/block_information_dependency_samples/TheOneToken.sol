contract TheOneToken {
    string public standard = 'The One Token';
    string public name = 'The One Token';
    string public symbol = 'TOKEN';
    
    uint8 public decimals = 0;
    uint256 public totalSupply = 1;
    mapping (address => uint256) public balanceOf;
    
    address public owner;
    address public tokenBearer;
    
    uint public lastStealValue;
    
    event Passed(address from, address to);

    function TheOneToken() {
        owner = msg.sender;
        passToken(owner);
        lastStealValue = 0;
    }
    
    function passToken(address _to) internal {
        Passed(tokenBearer, _to);
        
        balanceOf[tokenBearer] = 0;
        
        tokenBearer = _to;
        balanceOf[tokenBearer] = 1;
    }
    
    function () payable {
        require(msg.value > lastStealValue);
        lastStealValue = msg.value;
        passToken(msg.sender);
    }
    
    function tossIntoTheFire() {
        require(msg.sender == tokenBearer);
        require(block.number > 5800000);
    }

    function transfer(address _to) {
        require(msg.sender == tokenBearer);
        passToken(_to);
    }
}
