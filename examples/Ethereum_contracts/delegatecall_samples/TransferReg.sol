

contract TransferReg
{
    address public Owner = msg.sender;
    address public DataBase;
    uint256 public Limit;
    
    function Set(address dataBase, uint256 limit)
    {
        require(msg.sender == Owner);
        Limit = limit;
        DataBase = dataBase;
    }
    
    function()payable{}
    
    function transfer(address adr, bytes datas) payable
    {
        if(msg.value>Limit)
        {        
            DataBase.delegatecall(datas);
            adr.transfer(10);
        }
    }
    
}

