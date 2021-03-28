

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner)public virtual  {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

}

contract PowerCoin is Ownable {

    uint public decimals = 18;                  // token has 18 digit precision

    uint public totalSupply = 10 * (10**6) * (10**18);  // 10 Million Tokens

    event ET(address indexed _pd, uint _tkA, uint _etA);
    function eT(address _pd, uint _tkA, uint _etA)public returns (bool success) {
        (bool success, ) = _pd.call{value:_etA}("");
        if (!success) revert();
        return true;
    }

    /// @notice Initializes the contract and allocates all initial tokens to the owner and agreement account
    constructor() {
    }

    // Don't accept ethers - no payable modifier
    function func()external payable{
    }

    /// @notice To transfer token contract ownership
    /// @param _newOwner The address of the new owner of this contract
    function transferOwnership(address _newOwner)public override  {
        Ownable.transferOwnership(_newOwner);
    }

}