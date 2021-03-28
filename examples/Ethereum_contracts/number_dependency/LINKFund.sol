/*
LINK funds pool
========================
Original by: /u/Cintix
Modified by: moonlambos
*/

contract LINKFund {
  // Store the amount of ETH deposited by each account.
  mapping (address => uint256) public balances;
  
  // Track whether the contract has bought the tokens yet.
  bool public bought_tokens;
  
  // Record ETH value of tokens currently held by contract.
  uint256 public contract_eth_value;
  
  // The minimum amount of ETH that must be deposited before the buy-in can be performed
  uint256 constant public min_required_amount = 100 ether;
  
  // The first block after which buy-in is allowed. Set in the contract constructor.
  uint256 public min_buy_block;
  
  // The first block after which a refund is allowed. Set in the contract constructor.
  uint256 public min_refund_block;
  
  // The crowdsale address. Address can be verified at: https://link.smartcontract.com/presales/7e3ad6bc-1d32-4676-86a8-aa04bf63f50b
  address payable constant public sale = 0x6E6c083f8425b896d82C2b4c2bc7955AA5F8a534;
  
  // Constructor. 
  constructor() {
    // Buy-in allowed 8640 blocks (approx. 48 hours) after the contract is deployed.
    min_buy_block = block.number + 8640;
    
    // Refund allowed 86400 blocks (approx. 20 days) after the contract is deployed.
    min_refund_block = block.number + 86400;
  }
  
  // Allows any user to get his eth refunded before the purchase is made or after approx. 20 days in case the devs refund the eth.
  function refund_me() public {
    if (bought_tokens) {
      // Only allow refunds when the tokens have been bought if the minimum refund block has been reached.
      if (block.number < min_refund_block) revert();
    }
    
    // Store the user's balance prior to withdrawal in a temporary variable.
    uint256 eth_to_withdraw = balances[msg.sender];
      
    // Update the user's balance prior to sending ETH to prevent recursive call.
    balances[msg.sender] = 0;
      
    // Return the user's funds.  revert()s on failure to prevent loss of funds.
    msg.sender.transfer(eth_to_withdraw);
  }
  
  // Buys tokens in the crowdsale
  function buy_the_tokens() public {
    // Short circuit to save gas if the contract has already bought tokens.
    if (bought_tokens) return;
    
    // revert() if the contract balance is less than the minimum required amount
    if (address(this).balance < min_required_amount) revert();
    
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
  function default_helper() payable public {
    // Update records of deposited ETH to include the received amount.
    balances[msg.sender] += msg.value;
  }
}