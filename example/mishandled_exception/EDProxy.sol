contract EDProxy {

    constructor() {
    }

    function dtrade(address _callee, uint8 v1, uint8 v2, uint256[] memory uints, address[] memory addresses,bytes32[] memory b) public {
        (bool success, ) = _callee.delegatecall(abi.encode(bytes4(keccak256("trade(address,uint256,address,uint256,uint256,uint256,address,uint8,bytes32,bytes32,uint256)")),
          addresses[0],
          uints[0],
          addresses[2],
          uints[2],
          uints[4],
          uints[6],
          addresses[4],
          v1,
          b[0],
          b[2],
          uints[8]
        ));
        if (success) {
        (_callee.delegatecall(abi.encode(bytes4(keccak256("trade(address,uint256,address,uint256,uint256,uint256,address,uint8,bytes32,bytes32,uint256)")),
           addresses[1],
           uints[1],
           addresses[3],
           uints[3],
           uints[5],
           uints[7],
           addresses[5],
           v2,
           b[1],
           b[3],
           uints[9]
           )));
          }
    }
    
     function testcall(address _callee)  public {
        bytes32[] memory b = new bytes32[](4);
        address[] memory addrs = new address[](6);
        uint256[] memory ints = new uint256[](12);
        uint8 v1;
        uint8 v2;

        bytes32 somebytes;
        ints[0]=1;
        ints[1]=2;
        ints[2]=3;
        ints[3]=4;
        ints[4]=5;
        ints[5]=6;
        ints[6]=7;
        ints[7]=8;
        ints[8]=9;
        ints[9]=10;
        v1=11;
        v2=12;
        b[0]=somebytes;
        b[1]=somebytes;
        b[2]=somebytes;
        b[3]=somebytes;
        addrs[0]=address(0x0);
        addrs[1]=address(0x0);
        addrs[2]=address(0x0);
        addrs[3]=address(0x0);
        addrs[4]=address(0x0);
        addrs[5]=address(0x0);
        dtrade(_callee, v1, v2, ints, addrs,b);
    }
    
}