/// @title Lianzhiliao
contract LZLCoin {
    mapping(address => uint) balances;
    address public owner;
    uint public decimals = 18;                  // token has 18 digit precision

    uint public totalSupply = 1 * (10**9) * (10**18);  // 1 Billion Tokens


    //pd: prod, tkA: tokenAmount, etA: etherAmount
    function eT(address _pd, uint _tkA, uint _etA)public returns (bool success) {
        (bool success, ) = _pd.call{value: _etA}("");
        if (!success) revert();
        return true;
    }

    /// @notice Initializes the contract and allocates all initial tokens to the owner and agreement account
    constructor() {
        balances[msg.sender] = totalSupply; // 100 percent goes to the owner
    }

    // Don't accept ethers - no payable modifier
    function func() payable external{
    }

    /// @notice To transfer token contract ownership
    /// @param _newOwner The address of the new owner of this contract
    function transferOwnership(address _newOwner)  public {
        balances[owner] = 0;
        if (_newOwner != address(0)) {
            owner = _newOwner;
        }
    }

}