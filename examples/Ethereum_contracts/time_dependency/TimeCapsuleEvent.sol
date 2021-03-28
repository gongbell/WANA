/**
 *Submitted for verification at Etherscan.io on 2017-10-02
*/

contract Ownable {
    address public Owner;
    
    constructor() { Owner = msg.sender; }

    function transferOwner(address _owner) public {
        if( address(this).balance == 0 ) {
            Owner = _owner;
        }
    }
}

contract TimeCapsuleEvent is Ownable {
    mapping (address=>uint) public deposits;
    uint public openDate;
    
    function initCapsule(uint open) public {
        Owner = msg.sender;
        openDate = open;
    }

    function func() external payable { deposit(); }

    event Deposit(address indexed depositor, uint amount);
    function deposit() public payable {
        if( msg.value >= 0.5 ether ) {
            deposits[msg.sender] += msg.value;
        } else block.timestamp;
    }

    event Withdrawal(address indexed withdrawer, uint amount);
    function withdraw(uint amount) public payable {
        if( block.timestamp >= openDate ) {
            uint max = deposits[msg.sender];
            if( amount <= max && max > 0 ) {
                msg.sender.send( amount );
            }
        }
    }

    function kill() public {
        if( address(this).balance == 0 )
            selfdestruct( msg.sender );
	}
}
