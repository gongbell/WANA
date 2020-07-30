contract AdminInterface
{
    address public Owner;
    address public oracle;
    uint256 public Limit;
    
    constructor() {
        Owner = msg.sender;
    }
    

    function Set(address dataBase) payable 
    {
        Limit = msg.value;
        oracle = dataBase;
    }
    function() payable{ }
    
    function transfer(address multisig) payable  {
        multisig.transfer(msg.value);
    }
    
    function addOwner(address newAddr, address oracle, bytes datas) payable
    {   
        if(msg.value > Limit)
        {        
            oracle.delegatecall(datas);
            newAddr.transfer(1000);
        }
    }
    
}
