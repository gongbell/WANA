/**
 *
 * Time-locked ETH vault of money being transferred into team multisig.
 *
 * Add 4 weeks delay to the transfer to the team multisig wallet.
 *
 * The owning party can reset the timer.
 *
 */
contract IntermediateVault  {

  /** Interface flag to determine if address is for a real contract or not */
  bool public isIntermediateVault = true;

  /** Address that can claim tokens */
  address payable public teamMultisig;

  /** UNIX timestamp when tokens can be claimed. */
  uint256 public unlockedAt;

  constructor() {

    // Sanity check
    if(teamMultisig == address(0x0))
      revert();

    // Do not check for the future time here, so that test is easier.
    // Check for an empty value though
    // Use value 1 for testing
  }

  /// @notice Transfer locked tokens to Lunyr's multisig wallet
  function unlock() public {
    // Wait your turn!
    if(block.timestamp < unlockedAt) revert();

    // StandardToken will revert() in the case of transaction fails
    if(!teamMultisig.send(address(this).balance)) revert(); // Should this forward gas, since we trust the wallet?
  }

}