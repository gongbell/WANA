/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "LetMeIn_35" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_LetMeIn_35()

        codecopy(0, dataoffset("LetMeIn_35_deployed"), datasize("LetMeIn_35_deployed"))

        return(0, datasize("LetMeIn_35_deployed"))

        function constructor_LetMeIn_35() {

        }

    }
    object "LetMeIn_35_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xe97dcb62
                {
                    // enter()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_enter_34()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_bytes8_to_t_bytes8_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes8(value))
            }

            function abi_encode_t_stringliteral_4926d12848fab07df0350d5af3694260809016fba044fbd8c974291aa2f6474b_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 17)

                mstore(add(pos, 0), "bytes32 _passcode")

                end := add(pos, 32)
            }

            function abi_encode_t_stringliteral_b46ddb4a4281769492584f490dcbf269ae18f3e1a925926fc475a968d6121d2a_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 15)

                mstore(add(pos, 0), "bytes8 _gateKey")

                end := add(pos, 32)
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_stringliteral_4926d12848fab07df0350d5af3694260809016fba044fbd8c974291aa2f6474b_t_bytes32_t_stringliteral_b46ddb4a4281769492584f490dcbf269ae18f3e1a925926fc475a968d6121d2a_t_bytes8_t_address_payable__to_t_string_memory_ptr_t_bytes32_t_string_memory_ptr_t_bytes8_t_address_payable__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 160)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_4926d12848fab07df0350d5af3694260809016fba044fbd8c974291aa2f6474b_to_t_string_memory_ptr_fromStack( tail)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 32))

                mstore(add(headStart, 64), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_b46ddb4a4281769492584f490dcbf269ae18f3e1a925926fc475a968d6121d2a_to_t_string_memory_ptr_fromStack( tail)

                abi_encode_t_bytes8_to_t_bytes8_fromStack(value1,  add(headStart, 96))

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value2,  add(headStart, 128))

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

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes8(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffff000000000000000000000000000000000000000000000000)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint64(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_stringliteral_3d0836543f5fa63cf9a33cf89c5d6d58fa1f4a7ef6176f4aa0c9af50a5bc537b_to_t_bytes32() -> converted {
                converted := 0x706f7274657220636f6e6365707420656d657267656e637920646576656c6f70
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint64_to_t_bytes8(value) -> converted {
                converted := shift_left_192(cleanup_t_uint64(value))
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

            function fun_enter_34() {

                let vloc__gateKey_4
                let zero_value_for_type_t_bytes8_1 := zero_value_for_split_t_bytes8()
                vloc__gateKey_4 := zero_value_for_type_t_bytes8_1
                let vloc__n_7
                let zero_value_for_type_t_uint64_2 := zero_value_for_split_t_uint64()
                vloc__n_7 := zero_value_for_type_t_uint64_2
                let vloc__passcode_10 := convert_t_stringliteral_3d0836543f5fa63cf9a33cf89c5d6d58fa1f4a7ef6176f4aa0c9af50a5bc537b_to_t_bytes32()
                let _3 := vloc__n_7
                let expr_16 := _3
                let expr_17 := convert_t_uint64_to_t_bytes8(expr_16)
                vloc__gateKey_4 := expr_17
                let expr_18 := expr_17
                let expr_20 := 0x7f6e31b58e96af9204acc71da3ff6c576d69e9a1
                let expr_21_address := convert_t_address_payable_to_t_address(expr_20)
                let _4 := vloc__passcode_10
                let expr_25 := _4
                let _5 := vloc__gateKey_4
                let expr_27 := _5
                let expr_29 := caller()

                let expr_30_mpos := allocateTemporaryMemory()
                let _6 := add(expr_30_mpos, 0x20)

                let _7 := abi_encode_tuple_t_stringliteral_4926d12848fab07df0350d5af3694260809016fba044fbd8c974291aa2f6474b_t_bytes32_t_stringliteral_b46ddb4a4281769492584f490dcbf269ae18f3e1a925926fc475a968d6121d2a_t_bytes8_t_address_payable__to_t_string_memory_ptr_t_bytes32_t_string_memory_ptr_t_bytes8_t_address_payable__fromStack(_6, expr_25, expr_27, expr_29)
                mstore(expr_30_mpos, sub(_7, add(expr_30_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_7))

                let _8 := add(expr_30_mpos, 0x20)
                let _9 := mload(expr_30_mpos)

                let expr_31_component_1 := delegatecall(gas(), expr_21_address,  _8, _9, 0, 0)

                let expr_31_component_2_mpos := extract_returndata()

            }

            function panic_error() {
                invalid()
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_192(value) -> newValue {
                newValue :=

                shl(192, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function zero_value_for_split_t_bytes8() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint64() -> ret {
                ret := 0
            }

        }

    }

}

