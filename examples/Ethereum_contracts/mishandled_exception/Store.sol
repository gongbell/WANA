
contract Store {
    address[] owners;
    mapping(address => uint) ownerBalances;

    constructor() {
    }
    
    function deposit() payable public {
        uint ownerShare = msg.value / owners.length;
        ownerBalances[owners[0]] += msg.value % owners.length;
        
        for (uint i = 0; i < owners.length; i++) {
            ownerBalances[owners[i]] += ownerShare;
        }
    }
    
    function payout() public returns (uint) {
        uint amount = ownerBalances[msg.sender];
        ownerBalances[msg.sender] = 0;

        msg.sender.send(amount);
        return amount;
        
    }
}