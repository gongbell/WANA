/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "PIGGY_BANK_87" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_PIGGY_BANK_87()

        codecopy(0, dataoffset("PIGGY_BANK_87_deployed"), datasize("PIGGY_BANK_87_deployed"))

        return(0, datasize("PIGGY_BANK_87_deployed"))

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_PIGGY_BANK_87() {

            let expr_6 := 0x0de0b6b3a7640000
            update_storage_value_offset_0t_rational_1000000000000000000_by_1_to_t_uint256(0x01, expr_6)

        }

        function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_rational_1000000000000000000_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "PIGGY_BANK_87_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3fe43822
                {
                    // Collect(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_Collect_77(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_86()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc2808d1a
                {
                    // MinSum()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MinSum_7()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe203b506
                {
                    // Accounts(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_Accounts_4(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe5b5fe72
                {
                    // Put(address)

                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_Put_31(param_0)
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

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

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
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

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
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

            function fun_Collect_77(vloc__am_33) {

                let _5 := 0x00
                let expr_36 := _5
                let expr_38 := caller()
                let _6 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_36,expr_38)
                let _7 := read_from_storage_split_offset_0_t_uint256(_6)
                let expr_39 := _7
                let _8 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_40 := _8
                let expr_41 := iszero(lt(cleanup_t_uint256(expr_39), cleanup_t_uint256(expr_40)))
                let expr_48 := expr_41
                if expr_48 {
                    let _9 := vloc__am_33
                    let expr_42 := _9
                    let _10 := 0x00
                    let expr_43 := _10
                    let expr_45 := caller()
                    let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_43,expr_45)
                    let _12 := read_from_storage_split_offset_0_t_uint256(_11)
                    let expr_46 := _12
                    let expr_47 := iszero(gt(cleanup_t_uint256(expr_42), cleanup_t_uint256(expr_46)))
                    expr_48 := expr_47
                }
                let expr_53 := expr_48
                if expr_53 {
                    let expr_50 := number()
                    let _13 := read_from_storage_split_offset_0_t_uint256(0x02)
                    let expr_51 := _13
                    let expr_52 := gt(cleanup_t_uint256(expr_50), cleanup_t_uint256(expr_51))
                    expr_53 := expr_52
                }
                if expr_53 {
                    let expr_57 := caller()
                    let expr_58_address := convert_t_address_payable_to_t_address(expr_57)
                    let _14 := vloc__am_33
                    let expr_59 := _14
                    let expr_60_address := expr_58_address
                    let expr_60_value := expr_59

                    let _15 := mload(64)
                    let _16 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_15  ), _15)

                    let expr_62_component_1 := call(gas(), expr_60_address,  expr_60_value,  _15, _16, 0, 0)

                    let expr_62_component_2_mpos := extract_returndata()

                    let vloc_success_55 := expr_62_component_1
                    let _17 := vloc_success_55
                    let expr_64 := _17
                    if expr_64 {
                        let _18 := vloc__am_33
                        let expr_69 := _18
                        let _19 := 0x00
                        let expr_65 := _19
                        let expr_67 := caller()
                        let _20 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_65,expr_67)
                        let _21 := read_from_storage_split_offset_0_t_uint256(_20)
                        expr_69 := checked_sub_t_uint256(_21, expr_69)
                        update_storage_value_offset_0t_uint256_to_t_uint256(_20, expr_69)
                        let expr_70 := expr_69
                    }
                }

            }

            function fun_Put_31(vloc_to_15) {

                let expr_22 := callvalue()
                let _1 := 0x00
                let expr_18 := _1
                let _2 := vloc_to_15
                let expr_19 := _2
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_18,expr_19)
                let _4 := read_from_storage_split_offset_0_t_uint256(_3)
                expr_22 := checked_add_t_uint256(_4, expr_22)
                update_storage_value_offset_0t_uint256_to_t_uint256(_3, expr_22)
                let expr_23 := expr_22
                let expr_27 := number()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_27)
                let expr_28 := expr_27

            }

            function fun_func_86() {

                let expr_80_functionIdentifier := 31
                let expr_82 := caller()
                let _22 := convert_t_address_payable_to_t_address(expr_82)
                fun_Put_31(_22)

            }

            function getter_fun_Accounts_4(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_MinSum_7() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

