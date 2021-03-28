
contract Freeze {
    using SafeMath for uint256;
    struct deposit_st{
        uint256 amount;
        uint256 term;
    }
    struct deposit_list{
        uint256[] list_key;
        mapping(uint256=>deposit_st) deposits;
    }
    address payable public service_founder;
    mapping (address =>deposit_list) depositors;
    
    constructor() {
        service_founder = msg.sender;
    }
    function func() external payable {
        require(msg.sender != address(0x0));
        deposit(block.timestamp);
    }
    function deposit_period (uint256 number_of_days) public payable {
        uint256 term =block.timestamp+number_of_days*86400;
        deposit(term);
    }
    function deposit(uint256 term) public payable {
        uint256 amount=msg.value;
        require(msg.sender != address(0x0));
        require(amount>0);
        uint256 fee=amount/200;
        uint256 amount_of_deposit=amount.sub(fee);
        service_founder.transfer(fee);
        deposit_to_address(msg.sender,amount_of_deposit,term);
    }
    function withdrawal(uint index) public {
        //validate deposit available
        require(index<depositors[msg.sender].list_key.length);
        uint256 createtime=depositors[msg.sender].list_key[index];
        require(depositors[msg.sender].deposits[createtime].amount>0);
        require(depositors[msg.sender].deposits[createtime].term<block.timestamp);
        //return ethereum to depositors
        msg.sender.transfer(depositors[msg.sender].deposits[createtime].amount);
        //remove deposit
        remove_deposit(msg.sender,index);
    }
    function transfer(address to,uint index) public{
        //validate deposit available
        require(index<depositors[msg.sender].list_key.length);
        uint256 createtime=depositors[msg.sender].list_key[index];
        require(depositors[msg.sender].deposits[createtime].amount>0);
        require(depositors[msg.sender].deposits[createtime].term<block.timestamp);
        //
        uint256 _amount=depositors[msg.sender].deposits[createtime].amount;
        uint256 _term=depositors[msg.sender].deposits[createtime].term;
        //remove the deposit from the old account
        remove_deposit(msg.sender,index);
        //deposit to the new account
        deposit_to_address(to,_amount,_term);
    }
     function deposit_to_address(address account,uint256 _amount,uint256 _term) private{
        uint256 currenttime=block.timestamp;
        depositors[account].deposits[currenttime]=deposit_st({amount:_amount,term:_term});
        depositors[account].list_key.push(currenttime);
    }
    function remove_deposit(address account,uint index) private{
        uint256 createtime=depositors[account].list_key[index];
        //remove deposit 
        //remove from list key
        uint count=depositors[account].list_key.length;
        depositors[account].list_key[index]=depositors[account].list_key[count-1];
        depositors[account].list_key.pop();
    }
}