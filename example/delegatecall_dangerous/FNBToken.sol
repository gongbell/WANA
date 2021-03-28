


contract Ownable {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
        newOwner = address(0);
    }

    function transferOwnership(address _newOwner) public {
        require(_newOwner != address(0));
        newOwner = _newOwner;
    }

    function acceptOwnership() public returns(bool) {
        emit OwnershipTransferred(owner, newOwner);        
        owner = newOwner;
        newOwner = address(0x0);
    }
}


contract FNBToken is Ownable {
    uint8 constant public decimals =18;
    uint256 internal initialSupply;
    uint256 internal totalSupply_;

    mapping(address => uint256) internal balances;
    mapping(address => bool) internal locks;
    mapping(address => bool) public frozen;
    mapping(address => mapping(address => uint256)) internal allowed;
    address public implementation;

    constructor() {
        initialSupply = 2500000000; //2,500,000,000 개
        totalSupply_ = initialSupply * 10 ** uint(decimals);
        balances[owner] = totalSupply_;
    }
    
    function upgradeTo(address _newImplementation) public {
        require(implementation != _newImplementation);
        _setImplementation(_newImplementation);
    }
    
    function totalSupply() public returns (uint256) {
        implementationCall();
    }
    function balanceOf(address who) public returns (uint256) {
        implementationCall();
    }
    
    function allowance(address owner, address spender) public returns (uint256) {
        implementationCall();
    }
    
    function transfer(address to, uint256 value) public returns (bool) {
        implementationCall();
    }
    
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        implementationCall();
    }
    
    function approve(address spender, uint256 value) public returns (bool) {
        implementationCall();
    }
    
    function func() payable external {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)
            
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
    
    function implementationCall() internal {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)
            
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    function _setImplementation(address _newImp) internal {
        implementation = _newImp;
    }
}