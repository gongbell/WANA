/*

Ambrosus funds pool
========================

Original by: moonlambos
Modified by: dungeon

*/


contract AMBROSUSFund {
  // Store the amount of ETH deposited by each account.
  mapping (address => uint256) public balances;
  
  // Track whether the contract has bought the tokens yet.
  bool public bought_tokens;
  
  // Record ETH value of tokens currently held by contract.
  uint256 public contract_eth_value;
  
  // The minimum amount of ETH that must be deposited before the buy-in can be performed.
  // It's the min AND the max in the same time, since we must deposit exactly 300 ETH.
  uint256 constant public min_required_amount = 300 ether;
  
  // The first block after which buy-in is allowed. Set in the contract constructor.
  uint256 public min_buy_block = 4224446;
  
  // The crowdsale address.
  address payable constant public sale = 0x54e80390434b8BFcaBC823E9656c57d018C1dc77;
  
  // Allows any user to get his eth refunded before the purchase is made or after approx. 20 days in case the devs refund the eth.
  function refund_me() public {
    if (bought_tokens) revert();

    // Store the user's balance prior to withdrawal in a temporary variable.
    uint256 eth_to_withdraw = balances[msg.sender];
      
    // Update the user's balance prior to sending ETH to prevent recursive call.
    balances[msg.sender] = 0;
      
    // Return the user's funds.  revert()s on failure to prevent loss of funds.
    msg.sender.transfer(eth_to_withdraw);
  }
  
  // Buy the tokens. Sends ETH to the presale wallet and records the ETH amount held in the contract.
  function buy_the_tokens() public {
    // Short circuit to save gas if the contract has already bought tokens.
    if (bought_tokens) return;
    
    // revert() if the contract balance is less than the minimum required amount
    if (address(this).balance != min_required_amount) revert();
    
    // revert() if the minimum buy-in block hasn't been reached
    if (block.number < min_buy_block) revert();
    
    // Record that the contract has bought the tokens.
    bought_tokens = true;
    
    // Record the amount of ETH sent as the contract's current value.
    contract_eth_value = address(this).balance;

    // Transfer all the funds to the crowdsale address.
    sale.transfer(contract_eth_value);
  }

  // A helper function for the default function, allowing contracts to interact.
  function default_helper() public payable {
    uint256 deposit = msg.value;

    if (address(this).balance > min_required_amount) {
      uint256 refund = address(this).balance - min_required_amount;
      deposit -= refund;
      msg.sender.transfer(refund);
    }

    balances[msg.sender] += deposit;
  }
  
}