contract Owned {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    address newOwner;

    function changeOwner(address _newOwner)public  {
        newOwner = _newOwner;
    }

    function acceptOwnership()public {
        if (msg.sender == newOwner) {
            owner = newOwner;
        }
    }
}

contract FunFairSale is Owned {
    uint public deadline =  1499436000; // July 7th, 2017; 14:00 GMT
    uint public startTime = 1498140000; // June 22nd, 2017; 14:00 GMT
    uint public capAmount = 125000000 ether;

    // Don't allow contributions when the gas price is above
    // 50 Gwei to discourage gas price manipulation.
    uint constant MAX_GAS_PRICE = 50 * 1024 * 1024 * 1024 wei;

    constructor() {}

    function shortenDeadline(uint t) public  {
        // Used to shorten the deadline once (if) we've hit the soft cap.
        if (t > deadline) revert();
        deadline = t;
    }

    function func() payable external{
        // Don't encourage gas price manipulation.
    	if (tx.gasprice > MAX_GAS_PRICE) revert();
        if (block.timestamp < startTime || block.timestamp >= deadline) revert();
        if (address(this).balance >= capAmount) revert();
        if (address(this).balance + msg.value >= capAmount) {
            deadline = block.timestamp;
        }
    }

    function withdraw() public  {
        (bool success, ) = owner.call{value: address(this).balance}("");
        if (!success) revert();
    }

    function setCap(uint _cap) public  {
        capAmount = _cap;
    }

    function setStartTime(uint _startTime, uint _deadline)public  {
        if (block.timestamp >= startTime) revert();
        startTime = _startTime;
        deadline = _deadline;
    }

}