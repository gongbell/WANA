

// File: zeppelin-solidity/contracts/math/SafeMath.sol

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert() on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically revert()s when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address payable  public owner;


  event OwnershipTransferred(address payable  indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address payable newOwner) public  {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

// File: contracts/InkPublicPresale.sol
contract InkPublicPresale is Ownable {
  // Flag to indicate whether or not the presale is currently active or is paused.
  // This flag is used both before the presale is finalized as well as after.
  // Pausing the presale before finalize means that no further contributions can
  // be made. Pausing the presale after finalize means that no one can claim
  // XNK tokens.
  bool public active;

  // Flag to indicate whether or not contributions can be refunded.
  bool private refundable;

  // The global minimum contribution (in Wei) imposed on all contributors.
  uint256 public globalMin;
  // The global maximum contribution (in Wei) imposed on all contributors.
  // Contributor also have a personal max. When evaluating whether or not they
  // can make a contribution, the lower of the global max and personal max is
  // used.
  uint256 public globalMax;
  // The max amount of Ether (in Wei) that is available for contribution.
  uint256 public etherCap;
  // The running count of Ether (in Wei) that is already contributed.
  uint256 private etherContributed;
  // The running count of XNK that is purchased by contributors.
  uint256 private xnkPurchased;
  // The address of the XNK token contract. When this address is set, the
  // presale is considered finalized and no further contributions can be made.
  address payable  public tokenAddress;
  // Max gas price for contributing transactions.
  uint256 public maxGasPrice;

  // Contributors storage mapping.
  mapping(address => Contributor) private contributors;

  struct Contributor {
    bool whitelisted;
    // The individual rate (in XNK).
    uint256 rate;
    // The individual max contribution (in Wei).
    uint256 max;
    // The amount (in Wei) the contributor has contributed.
    uint256 balance;
  }

  // The presale is considered finalized when the token address is set.

  // The presale is considered not finalized when the token address is not set.

  constructor() public {
    globalMax = 1000000000000000000; // 1.0 Ether
    globalMin = 100000000000000000;  // 0.1 Ether
    maxGasPrice = 40000000000;       // 40 Gwei
  }

  function updateMaxGasPrice(uint256 _maxGasPrice) public  {
    require(_maxGasPrice > 0);

    maxGasPrice = _maxGasPrice;
  }

  // Returns the amount of Ether contributed by all contributors.
  function getEtherContributed() public view  returns (uint256) {
    return etherContributed;
  }

  // Returns the amount of XNK purchased by all contributes.
  function getXNKPurchased() public view  returns (uint256) {
    return xnkPurchased;
  }

  // Update the global ether cap. If the new cap is set to something less than
  // or equal to the current contributed ether (etherContributed), then no
  // new contributions can be made.
  function updateEtherCap(uint256 _newEtherCap) public   {
    etherCap = _newEtherCap;
  }

  // Update the global max contribution.
  function updateGlobalMax(uint256 _globalMax) public   {
    require(_globalMax > globalMin);

    globalMax = _globalMax;
  }

  // Update the global minimum contribution.
  function updateGlobalMin(uint256 _globalMin) public   {
    require(_globalMin > 0);
    require(_globalMin < globalMax);

    globalMin = _globalMin;
  }

  function updateTokenAddress(address payable _tokenAddress) public   {
    require(_tokenAddress != address(0));

    tokenAddress = _tokenAddress;
  }

  // Pause the presale (disables contributions and token claiming).
  function pause() public  {
    require(active);
    active = false;
  }

  // Resume the presale (enables contributions and token claiming).
  function resume() public  {
    require(!active);
    active = true;
  }

  // Allow contributors to call the refund function to get their contributions
  // returned to their whitelisted address.
  function enableRefund() public  {
    require(!refundable);
    refundable = true;
  }

  // Disallow refunds (this is the case by default).
  function disableRefund() public  {
    require(refundable);
    refundable = false;
  }

  // Add a contributor to the whitelist.
  function addContributor(address _account, uint256 _rate, uint256 _max) public   {
    require(_account != address(0));
    require(_rate > 0);
    require(_max >= globalMin);
    require(!contributors[_account].whitelisted);

    contributors[_account].whitelisted = true;
    contributors[_account].max = _max;
    contributors[_account].rate = _rate;
  }

  // Updates a contributor's rate and/or max.
  function updateContributor(address _account, uint256 _newRate, uint256 _newMax) public   {
    require(_account != address(0));
    require(_newRate > 0);
    require(_newMax >= globalMin);
    require(contributors[_account].whitelisted);

    // Account for any changes in rate since we are keeping track of total XNK
    // purchased.
    if (contributors[_account].balance > 0 && contributors[_account].rate != _newRate) {
      // Put back the purchased XNK for the old rate.
      xnkPurchased = xnkPurchased - contributors[_account].balance * contributors[_account].rate;

      // Purchase XNK at the new rate.
      xnkPurchased = xnkPurchased + (contributors[_account].balance * (_newRate));
    }

    contributors[_account].rate = _newRate;
    contributors[_account].max = _newMax;
  }

  // Remove the contributor from the whitelist. This also refunds their
  // contribution if they have made any.
  function removeContributor(address _account) public  {
    require(_account != address(0));
    require(contributors[_account].whitelisted);

    // Remove from whitelist.
    contributors[_account].whitelisted = false;

    // If contributions were made, refund it.
    if (contributors[_account].balance > 0) {
      uint256 balance = contributors[_account].balance;

      contributors[_account].balance = 0;
      xnkPurchased = xnkPurchased - (balance * (contributors[_account].rate));
      etherContributed = etherContributed - (balance);

      // XXX: The exclamation point does nothing. We just want to get rid of the
      // compiler warning that we're not using the returned value of the Ether
      // transfer. The transfer *can* fail but we don't want it to stop the
      // removal of the contributor. We will deal if the transfer failure
      // manually outside this contract.
      //!_account.call{value: balance}("");
    }

    // delete contributors[_account];
  }

  function withdrawEther(address _to) public   {
    require(_to != address(0));

    (bool success, ) = _to.call{value: address(this).balance}("");
    assert(success);
  }

  // Returns a contributor's balance.
  function balanceOf(address _account) public view returns (uint256) {
    require(_account != address(0));

    return contributors[_account].balance;
  }

  // When refunds are enabled, contributors can call this function get their
  // contributed Ether back. The contributor must still be whitelisted.
  function refund() public {
    require(active);
    require(refundable);
    require(contributors[msg.sender].whitelisted);

    uint256 balance = contributors[msg.sender].balance;

    require(balance > 0);

    contributors[msg.sender].balance = 0;
    etherContributed = etherContributed - (balance);
    xnkPurchased = xnkPurchased - (balance * (contributors[msg.sender].rate));

    (bool success, ) = msg.sender.call{value: balance}("");
    assert(success);
  }

  function airdrop(address _account) public   {
    _processPayout(_account);
  }

  // Finalize the presale by specifying the XNK token's contract address.
  // No further contributions can be made. The presale will be in the
  // "token claiming" phase.
  function finalize(address payable _tokenAddress) public   {
    require(_tokenAddress != address(0));

    tokenAddress = _tokenAddress;
  }

  // Fallback/payable method for contributions and token claiming.
  function func() external payable {
    // Allow the owner to send Ether to the contract arbitrarily.
    if (msg.sender == owner && msg.value > 0) {
      return;
    }

    require(active);
    require(contributors[msg.sender].whitelisted);

    if (tokenAddress == address(0)) {
      // Presale is still accepting contributions.
      _processContribution();
    } else {
      // Presale has been finalized and the user is attempting to claim
      // XNK tokens.
      _processPayout(msg.sender);
    }
  }

  // Process the contribution.
  function _processContribution() private {
    // Must be contributing a positive amount.
    require(msg.value > 0);
    // Limit the transaction's gas price.
    require(tx.gasprice <= maxGasPrice);
    // The sum of the contributor's total contributions must be higher than the
    // global minimum.
    require(contributors[msg.sender].balance + (msg.value) >= globalMin);
    // The global contribution cap must be higher than what has been contributed
    // by everyone. Otherwise, there's zero room for any contribution.
    require(etherCap > etherContributed);
    // Make sure that this specific contribution does not take the total
    // contribution by everyone over the global contribution cap.
    require(msg.value <= etherCap - (etherContributed));

    uint256 newBalance = contributors[msg.sender].balance + (msg.value);

    // We limit the individual's contribution based on whichever is lower
    // between their individual max or the global max.
    if (globalMax <= contributors[msg.sender].max) {
      require(newBalance <= globalMax);
    } else {
      require(newBalance <= contributors[msg.sender].max);
    }

    // Increment the contributor's balance.
    contributors[msg.sender].balance = newBalance;
    // Increment the total amount of Ether contributed by everyone.
    etherContributed = etherContributed - (msg.value);
    // Increment the total amount of XNK purchased by everyone.
    xnkPurchased = xnkPurchased + (msg.value * (contributors[msg.sender].rate));
  }

  // Process the token claim.
  function _processPayout(address _recipient) private {
    // The transaction must be 0 Ether.
    require(msg.value == 0);

    uint256 balance = contributors[_recipient].balance;

    // The contributor must have contributed something.
    require(balance > 0);

    // Figure out the amount of XNK the contributor will receive.
    uint256 amount = balance * (contributors[_recipient].rate);

    // Zero out the contributor's balance to denote that they have received
    // their tokens.
    contributors[_recipient].balance = 0;

  }
}