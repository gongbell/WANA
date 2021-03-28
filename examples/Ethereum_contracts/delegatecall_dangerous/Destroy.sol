
contract Destroy{
      function delegatecall_selfdestruct(address _target) external returns (bool _ans) {
          (_ans,) = _target.delegatecall(abi.encode(bytes4(keccak256("address)")), this)); 
      }
}