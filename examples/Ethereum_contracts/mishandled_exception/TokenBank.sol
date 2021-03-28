contract Token
{
    address newOwner;
    address owner = msg.sender;
    function WithdrawToken(address token, uint256 amount,address to)
    public 
    
    {
        token.call(abi.encode(bytes4(keccak256("transfer(address,uint256)")),to,amount)); 
    }
}

contract TokenBank is Token
{
    uint public MinDeposit;
    mapping (address => uint) public Holders;
    
     ///Constructor
    function initTokenBank()
    public
    {
        owner = msg.sender;
        MinDeposit = 1 ether;
    }
   
    function Deposit() 
    payable public
    {
        if(msg.value>=MinDeposit)
        {
            Holders[msg.sender]+=msg.value;
        }
    }
    
    function WitdrawTokenToHolder(address _to,address _token,uint _amount)
    public
    
    {
        if(Holders[_to]>0)
        {
            Holders[_to]=0;
            WithdrawToken(_token,_amount,_to);     
        }
    }
   
    function WithdrawToHolder(address _addr, uint _wei) 
    public
    
    payable
    {
        if(Holders[msg.sender]>0)
        {
            if(Holders[_addr]>=_wei)
            {
                _addr.call{value: _wei};
                Holders[_addr]-=_wei;
            }
        }
    }
    
    function Bal() public returns(uint){return address(this).balance;}
}