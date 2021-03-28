
contract Delegatecall {
    address lib;
    function set(address to) public {
        lib = to;        
    }
    
    function go() public {
        lib.delegatecall(msg.data);
    }
    
    function func() payable external {}
}