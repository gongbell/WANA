

contract Private_Bank
{
    mapping (address => uint) public balances;
    
    uint public MinDeposit = 1 ether;
        
    constructor() public
    {
    }
    
    function Deposit()
    public
    payable
    {
        if(msg.value >= MinDeposit)
        {
            balances[msg.sender]+=msg.value;
        }
    }
    
    function CashOut(uint _am) public
    {
        if(_am<=balances[msg.sender])
        {
            
            (bool success, ) = msg.sender.call{value: _am}("");
            if(success)
            {
                balances[msg.sender]-=_am;
            }
        }
    }
    
    function func() external payable{}    
    
}