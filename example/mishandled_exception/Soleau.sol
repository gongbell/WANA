contract Soleau {

  uint price = 0.001 ether;
  struct Record {
    address holder;
    bool exists; 
    uint createdAt; /* Time */ 
    uint createdIn; /* Block number */
  }
  mapping (string => Record) _records;

  function record(string memory hash) public payable returns (bool success, bool already, uint theBlock) {
    if (msg.value < price) {
      success = false;
      payable(msg.sender).send(msg.value); /* We're nice, we refund */

    } /* Else we keep the money but there is currently no way to use
	 it: it is locked in the contract for ever */
    if (_records[hash].exists) {
      success = true;
      already = true;
      theBlock = _records[hash].createdIn;
    } else {
      _records[hash].exists = true;
      _records[hash].holder = msg.sender;
      _records[hash].createdAt = block.timestamp;
      _records[hash].createdIn = block.number;
      success = true;
      already = false;
      theBlock = _records[hash].createdIn;
    }
    return (success,already,theBlock);
  }

  function get(string memory hash) public returns (bool success, uint theBlock, uint theTime, address holder) {
    if (_records[hash].exists) {
      success = true;
      theBlock = _records[hash].createdIn;
      theTime = _records[hash].createdAt;
      holder = _records[hash].holder;
    } else {
      success = false;
    }
  }
}