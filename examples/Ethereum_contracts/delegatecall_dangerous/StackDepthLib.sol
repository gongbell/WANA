// https://github.com/pipermerriam/ethereum-stack-depth-lib

library StackDepthLib {
    // This will probably work with a value of 390 but no need to cut it
    // that close in the case that the optimizer changes slightly or
    // something causing that number to rise slightly.
    uint constant GAS_PER_DEPTH = 400;

    function checkDepth(address self, uint n)  public returns(bool) {
        if (n == 0) return true;
        (bool success, ) = self.call{gas:(GAS_PER_DEPTH * n)}(abi.encode(0x21835af6, n - 1));
        return success;
    }

    function __dig(uint n)  public{
        if (n == 0) return;
        (bool success, ) = address(this).delegatecall(abi.encode(0x21835af6, n - 1));
        if (!success) revert(); //此处ｎ属于外界传入参数
    }
}
