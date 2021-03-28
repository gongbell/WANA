/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ZwtTokenProxy_27" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ZwtTokenProxy_27()

        codecopy(0, dataoffset("ZwtTokenProxy_27_deployed"), datasize("ZwtTokenProxy_27_deployed"))

        return(0, datasize("ZwtTokenProxy_27_deployed"))

        function constructor_ZwtTokenProxy_27() {

        }

    }
    object "ZwtTokenProxy_27_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xf13101e9
                {
                    // _delegate(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun__delegate_26(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function fun__delegate_26(vloc_implementation_21) {

                {
                    calldatacopy(0, 0, calldatasize())
                    let usr$result := delegatecall(gas(), vloc_implementation_21, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch usr$result
                    case 0 { revert(0, returndatasize()) }
                    default { return(0, returndatasize()) }
                }

            }

            function panic_error() {
                invalid()
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

        }

    }

}

