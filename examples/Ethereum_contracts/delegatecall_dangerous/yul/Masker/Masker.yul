/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Masker_113" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Masker_113()

        codecopy(0, dataoffset("Masker_113_deployed"), datasize("Masker_113_deployed"))

        return(0, datasize("Masker_113_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Masker_113() {

            let expr_7 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_7)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_8 := _1

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_20_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

    }
    object "Masker_113_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1c1b8772
                {
                    // update(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_update_112(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_54()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd03d9604
                {
                    // maskIt(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_maskIt_91(param_0, param_1)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, 0)

                end := add(pos, 0)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos ) -> end {

                pos := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack( pos)

                end := pos
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes4_t_address_t_uint256__to_t_bytes4_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

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

            function array_length_t_bytes_calldata_ptr(value, len) -> length {

                length := len

            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
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

            function fun_func_54() {

                let expr_16_offset := 0
                let expr_16_length := calldatasize()
                let expr_17 := array_length_t_bytes_calldata_ptr(expr_16_offset, expr_16_length)
                let expr_18 := 0x00
                let expr_19 := eq(cleanup_t_uint256(expr_17), convert_t_rational_0_by_1_to_t_uint256(expr_18))
                let expr_24 := expr_19
                if expr_24 {
                    let expr_21 := callvalue()
                    let expr_22 := 0x00
                    let expr_23 := gt(cleanup_t_uint256(expr_21), convert_t_rational_0_by_1_to_t_uint256(expr_22))
                    expr_24 := expr_23
                }
                require_helper(expr_24)
                let _1 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_29 := _1
                let expr_30_address := expr_29
                let expr_31 := 0x0186a0
                let expr_32 := expr_31
                let expr_33_address := expr_30_address
                let expr_33_gas := convert_t_rational_100000_by_1_to_t_uint256(expr_32)
                let expr_35 := callvalue()
                let expr_36 := expr_35
                let expr_37_address := expr_33_address
                let expr_37_gas := expr_33_gas
                let expr_37_value := expr_36

                let _2 := mload(64)
                let _3 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_2  ), _2)

                let expr_39_component_1 := call(expr_37_gas, expr_37_address,  expr_37_value,  _2, _3, 0, 0)

                let expr_39_component_2_mpos := extract_returndata()

                let vloc_success_28 := expr_39_component_1
                let _4 := vloc_success_28
                let expr_41 := _4
                let expr_42 := cleanup_t_bool(iszero(expr_41))
                if expr_42 {
                    let _5 := read_from_storage_split_offset_0_t_address(0x00)
                    let expr_45 := _5
                    let expr_46 := convert_t_address_to_t_address_payable(expr_45)
                    let expr_47_address := convert_t_address_payable_to_t_address(expr_46)
                    let expr_49 := callvalue()

                    let _6 := 0
                    if iszero(expr_49) { _6 := 2300 }
                    let _7 := call(_6, expr_47_address, expr_49, 0, 0, 0, 0)

                    if iszero(_7) { revert_forward_1() }

                }

            }

            function fun_maskIt_91(vloc__token_56, vloc__value_58) -> vloc__61 {
                let zero_value_for_type_t_bool_8 := zero_value_for_split_t_bool()
                vloc__61 := zero_value_for_type_t_bool_8

                let _9 := vloc__token_56
                let expr_65 := _9
                let expr_66_address := expr_65
                let expr_67 := 0x0186a0
                let expr_68_address := expr_66_address
                let expr_68_gas := convert_t_rational_100000_by_1_to_t_uint256(expr_67)
                let expr_75 := 0xa9059cbb2ab09eb219583f4a59a5d0623ade346d962bcd4e46b11da047c9049b
                let expr_76 := convert_t_bytes32_to_t_bytes4(expr_75)
                let _10 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_77 := _10
                let _11 := vloc__value_58
                let expr_78 := _11

                let expr_79_mpos := allocateTemporaryMemory()
                let _12 := add(expr_79_mpos, 0x20)

                let _13 := abi_encode_tuple_t_bytes4_t_address_t_uint256__to_t_bytes4_t_address_t_uint256__fromStack(_12, expr_76, expr_77, expr_78)
                mstore(expr_79_mpos, sub(_13, add(expr_79_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_13))

                let _14 := add(expr_79_mpos, 0x20)
                let _15 := mload(expr_79_mpos)

                let expr_80_component_1 := delegatecall(expr_68_gas, expr_68_address,  _14, _15, 0, 0)

                let expr_80_component_2_mpos := extract_returndata()

                let vloc_success_64 := expr_80_component_1
                let _16 := vloc_success_64
                let expr_82 := _16
                let expr_83 := cleanup_t_bool(iszero(expr_82))
                if expr_83 {
                    revert(0, 0)
                }
                let expr_88 := 0x01
                vloc__61 := expr_88
                leave

            }

            function fun_update_112(vloc__address_93) -> vloc__96 {
                let zero_value_for_type_t_bool_17 := zero_value_for_split_t_bool()
                vloc__96 := zero_value_for_type_t_bool_17

                let expr_100 := caller()
                let _18 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_101 := _18
                let expr_102 := eq(convert_t_address_payable_to_t_address(expr_100), cleanup_t_address(expr_101))
                require_helper(expr_102)
                let _19 := vloc__address_93
                let expr_106 := _19
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_106)
                let expr_107 := expr_106
                let expr_109 := 0x01
                vloc__96 := expr_109
                leave

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
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

