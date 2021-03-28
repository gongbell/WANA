contract Storage{
    address payable  public founder;
    bool public changeable;
    mapping( address => bool) public adminStatus;
    mapping( address => uint256) public slot;

    constructor() {
        founder=msg.sender;
        adminStatus[founder]=true;
        changeable=true;
    }
    
    function update(address userAddress,uint256 data) public {
        assert(changeable==true);
        assert(slot[userAddress]+data>slot[userAddress]);
        slot[userAddress]+=data;
    }
    
    function set(address userAddress, uint256 data) public  {
        require(changeable==true || msg.sender==founder);
        slot[userAddress]=data;
    }
    
    function admin(address addr) public {
        adminStatus[addr] = !adminStatus[addr];
    }
    
    function halt() public {
        changeable=!changeable;
    }
    
}


contract Payee{
    
    uint256 public price;
    address payable  public storageAddress;
    address payable  public founder;
    bool public changeable;
    mapping( address => bool) public adminStatus;
    
    Storage s;
    
    function admin(address addr) public {
        adminStatus[addr] = !adminStatus[addr];
    }
    
    constructor() {
        founder=msg.sender;
        price=3000000000000000; //default price will be 0.003 ether($2);
        adminStatus[founder]=true;
        s=Storage(storageAddress);
        changeable=true;
    }
    
    function setPrice(uint256 _price) public {
        price=_price;
    }
    
    function setStorageAddress(address payable _addr) public {
        storageAddress=_addr;
        s=Storage(storageAddress);

    }
    
    function halt() public {
        changeable=!changeable;
    }
    
    function pay(address _addr, uint256 count) public payable {
        assert(changeable==true);
        assert(msg.value >= price*count);
        (bool success1, ) = founder.call{value: price*count}("");
        //value(msg.value-price*count)("")
        (bool success2, ) = msg.sender.call{value:msg.value-price*count}("");
        if(!success1 || !success2){
            revert();
        }
        s.update(_addr,count);
    }
    
    function func() external payable {
        pay(msg.sender,1);
    }
}