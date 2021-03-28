/**
 *Submitted for verification at Etherscan.io on 2018-03-08
*/


contract Ownable {
  address public owner;

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() {
    owner = msg.sender;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public {
    require(newOwner != address(0));
    owner = newOwner;
  }

}


contract WyvernDaoProxy is Ownable {
    function delegateProxy(address dest, bytes memory calldata1) public returns (bool result) {
        (bool success,) = dest.delegatecall(calldata1);
        return success;
    }
    function delegateProxyAssert(address dest, bytes memory calldata1) public {
        require(delegateProxy(dest, calldata1));
    }
}
