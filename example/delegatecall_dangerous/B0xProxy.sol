
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() {
    owner = msg.sender;
  }


  /**
   * @dev Allows the current owner to relinquish control of the contract.
   */
  function renounceOwnership() public  {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public  {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}

contract Debugger {
    
    bool public DEBUG_MODE = false;
    
    event DebugLine(uint lineNumber);

    function voidOrRevert(uint lineno)
        internal
    {
        if (!DEBUG_MODE) {
            revert();
        }

        emit DebugLine(lineno);
        return;
    }
    
    function intOrRevert(uint retVal, uint lineno)
        internal 
        returns (uint)
    {
        if (!DEBUG_MODE) {
            revert();
        }

        emit DebugLine(lineno);
        return retVal;
    }

    function boolOrRevert(bool retVal, uint lineno)
        internal 
        returns (bool)
    {
        if (!DEBUG_MODE) {
            revert();
        }

        emit DebugLine(lineno);
        return retVal;
    }
}


contract B0xStorage is Ownable, Debugger {
    uint constant MAX_UINT = 2**256 - 1;
    uint internal gasUsed;
    bool private reentrancyLock = false;
    address public B0X_TOKEN_CONTRACT;
    address public VAULT_CONTRACT;
    address public ORACLE_REGISTRY_CONTRACT;
    address public B0XTO0X_CONTRACT;

    mapping (address => bytes32[]) public orderList; // mapping of lenders and trader addresses to array of loanOrderHashes
    mapping (bytes32 => address) public orderLender; // mapping of loanOrderHash to lender address
    mapping (bytes32 => address[]) public orderTraders; // mapping of loanOrderHash to array of trader addresses
    mapping (bytes32 => uint) public orderFilledAmounts; // mapping of loanOrderHash to loanTokenAmount filled
    mapping (bytes32 => uint) public orderCancelledAmounts; // mapping of loanOrderHash to loanTokenAmount cancelled
    mapping (bytes32 => mapping (address => uint)) public interestPaid; // mapping of loanOrderHash to mapping of traders to amount of interest paid so far to a lender
}


contract B0xProxy is B0xStorage {
     mapping (bytes4 => address) public targets;

    function initialize(
        address)
        public 
    {
        revert();
    }

    function _replaceContract(address _target) internal {
        _target.delegatecall(abi.encode(bytes4(keccak256("initialize(address)")), _target));
    }

    function func() external {
        address target = targets[msg.sig];
        bytes memory data = msg.data;
        assembly {
            let result := delegatecall(gas(), target, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    /*
     * Owner only functions
     */

    function replaceContract(
        address _target)
        public
        
    {
        _replaceContract(_target);
    }

    function setTarget(
        string memory _funcId,  // example: "takeLoanOrderAsTrader(address[6],uint256[9],address,uint256,bytes)"
        address _target) // logic contract address
        public
        
        returns(bytes4)
    {
        bytes4 f = bytes4(keccak256(abi.encodePacked(_funcId)));
        targets[f] = _target;
        return f;
    }

    function setB0xAddresses(
        address _b0xToken,
        address _vault,
        address _oracleregistry,
        address _exchange0xWrapper) 
        public
        
    {
        if (_b0xToken != address(0) && _vault != address(0) && _oracleregistry != address(0) && _exchange0xWrapper != address(0))
        B0X_TOKEN_CONTRACT = _b0xToken;
        VAULT_CONTRACT = _vault;
        ORACLE_REGISTRY_CONTRACT = _oracleregistry;
        B0XTO0X_CONTRACT = _exchange0xWrapper;
    }

    function setDebugMode (
        bool _debug)
        public
        
    {
        if (DEBUG_MODE != _debug)
            DEBUG_MODE = _debug;
    }

    function setB0xToken (
        address _token)
        public
        
    {
        if (_token != address(0))
            B0X_TOKEN_CONTRACT = _token;
    }

    function setVault (
        address _vault)
        public
        
    {
        if (_vault != address(0))
            VAULT_CONTRACT = _vault;
    }

    function setOracleRegistry (
        address _registry)
        public
        
    {
        if (_registry != address(0))
            ORACLE_REGISTRY_CONTRACT = _registry;
    }

    function set0xExchangeWrapper (
        address _wrapper)
        public
        
    {
        if (_wrapper != address(0))
            B0XTO0X_CONTRACT = _wrapper;
    }

    /*
     * View functions
     */

    function getTarget(
        string memory _funcId) // example: "takeLoanOrderAsTrader(address[6],uint256[9],address,uint256,bytes)"
        public
        returns (address)
    {
        return targets[bytes4(keccak256(abi.encodePacked(_funcId)))];
    }
}