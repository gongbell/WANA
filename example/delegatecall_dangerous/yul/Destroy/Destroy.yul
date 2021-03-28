/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Destroy_26" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Destroy_26()

        codecopy(0, dataoffset("Destroy_26_deployed"), datasize("Destroy_26_deployed"))

        return(0, datasize("Destroy_26_deployed"))

        function constructor_Destroy_26() {

        }

    }
    object "Destroy_26_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x301d5209
                {
                    // delegatecall_selfdestruct(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_delegatecall_selfdestruct_25(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_contract$_Destroy_$26_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_Destroy_$26_to_t_address(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes4_t_contract$_Destroy_$26__to_t_bytes4_t_address__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_contract$_Destroy_$26_to_t_address_fromStack(value1,  add(headStart, 32))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes4(value) -> cleaned {
                cleaned := and(value, 0xffffffff00000000000000000000000000000000000000000000000000000000)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_contract$_Destroy_$26_to_t_address(value) -> converted {
                converted := convert_t_contract$_Destroy_$26_to_t_uint160(value)
            }

            function convert_t_contract$_Destroy_$26_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_tuple$_t_bool_$_t_bytes_memory_ptr_$_to_t_tuple$_t_bool_$__$(value0, value1) -> converted0 {
                converted0 := convert_t_bool_to_t_bool(value0)

            }

            function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    // allocate some memory into data of size returndatasize() + PADDING
                    data := allocateMemory(round_up_to_mul_of_32(add(returndatasize(), 0x20)))

                    // store array length into the front
                    mstore(data, returndatasize())

                    // append to data
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            function fun_delegatecall_selfdestruct_25(vloc__target_2) -> vloc__ans_5 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__ans_5 := zero_value_for_type_t_bool_1

                let _2 := vloc__target_2
                let expr_9 := _2
                let expr_10_address := expr_9
                let expr_17 := 0x4761dcc2e9c0388ad3ba69dfc8036082eb4b56b64eb15572f714933e3cc0fea2
                let expr_18 := convert_t_bytes32_to_t_bytes4(expr_17)
                let expr_19_address := address()

                let expr_20_mpos := allocateTemporaryMemory()
                let _3 := add(expr_20_mpos, 0x20)

                let _4 := abi_encode_tuple_t_bytes4_t_contract$_Destroy_$26__to_t_bytes4_t_address__fromStack(_3, expr_18, expr_19_address)
                mstore(expr_20_mpos, sub(_4, add(expr_20_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_4))

                let _5 := add(expr_20_mpos, 0x20)
                let _6 := mload(expr_20_mpos)

                let expr_21_component_1 := delegatecall(gas(), expr_10_address,  _5, _6, 0, 0)

                let expr_21_component_2_mpos := extract_returndata()

                let _7_component_1 := convert_t_tuple$_t_bool_$_t_bytes_memory_ptr_$_to_t_tuple$_t_bool_$__$(expr_21_component_1, expr_21_component_2_mpos)
                vloc__ans_5 := _7_component_1

            }

            function panic_error() {
                invalid()
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

