contract whoDepositV3{
    mapping(address => uint) public balances;
    
    function deposit() public payable {
        balances[msg.sender]+=msg.value;
    }
    fallback() external payable {
        deposit();
    }
}