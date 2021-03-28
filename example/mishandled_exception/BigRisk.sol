contract BigRisk {

  struct Person {
      address payable etherAddress;
      uint amount;
  }

  Person[] public persons;

  uint public payoutIdx = 0;
  uint public collectedFees;
  uint public balance = 0;

  address public owner;


  constructor() {
    owner = msg.sender;
  }

  function func() external {
    enter();
  }
  
  function enter() private{
  
  	uint amount;
	  amount = msg.value;
	
    if (amount % 100 ether != 0  ) {
	      msg.sender.send(amount);
        return;
	  }

	  uint idx = persons.length;
    Person memory temp = Person(msg.sender, amount);
    persons.push();
    balance += amount;
  
    while (balance >= persons[payoutIdx].amount * 2) {
      uint transactionAmount = persons[payoutIdx].amount * 2;
      persons[payoutIdx].etherAddress.send(transactionAmount);
      balance -= transactionAmount;
      payoutIdx += 1;
    }

  }


  function setOwner(address _owner) public{
      owner = _owner;
  }
}