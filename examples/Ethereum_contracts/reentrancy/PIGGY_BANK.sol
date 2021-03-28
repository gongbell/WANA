

contract PIGGY_BANK
{
    mapping (address => uint) public Accounts;
    
    uint public MinSum = 1 ether;
        
    uint putBlock;
    
    constructor()
    {
    }
    
    function Put(address to)
    public
    payable
    {
        Accounts[to]+=msg.value;
        putBlock = block.number;
    }
    
    function Collect(uint _am)
    public
    payable
    {
        if(Accounts[msg.sender]>=MinSum && _am<=Accounts[msg.sender] && block.number>putBlock)
        {
            (bool success,) = msg.sender.call{value: _am}("");
            if(success)
            {
                Accounts[msg.sender]-=_am;
            }
        }
    }
    
    function func()external payable
    {
        Put(msg.sender);
    }    
    
}
