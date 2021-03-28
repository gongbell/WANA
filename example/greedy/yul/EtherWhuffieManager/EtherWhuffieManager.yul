/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EtherWhuffieManager_80" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EtherWhuffieManager_80()

        codecopy(0, dataoffset("EtherWhuffieManager_80_deployed"), datasize("EtherWhuffieManager_80_deployed"))

        return(0, datasize("EtherWhuffieManager_80_deployed"))

        function constructor_EtherWhuffieManager_80() {

        }

    }
    object "EtherWhuffieManager_80_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x8bcdcbf3
                {
                    // stats(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1 :=  getter_fun_stats_9(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xadcd4aaf
                {
                    // sendNegativeWhuffies(address,string)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_string_memory_ptr(4, calldatasize())
                    fun_sendNegativeWhuffies_79(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb8ccf4c7
                {
                    // sendPositiveWhuffies(address,string)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_string_memory_ptr(4, calldatasize())
                    fun_sendPositiveWhuffies_54(param_0, param_1)
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

            function abi_decode_t_string_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_string_memory_ptr(length))
                mstore(array, length)
                let src := add(offset, 0x20)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_string_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value1 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_uint256_t_string_memory_ptr__to_t_uint256_t_string_memory_ptr__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value1,  tail)

            }

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
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

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function copy_memory_to_memory(src, dst, length) {
                let i := 0
                for { } lt(i, length) { i := add(i, 32) }
                {
                    mstore(add(dst, i), mload(add(src, i)))
                }
                if gt(i, length)
                {
                    // clear end
                    mstore(add(dst, length), 0)
                }
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_sendNegativeWhuffies_79(vloc__to_56, vloc_message_58_mpos) {

                let expr_66 := callvalue()
                let _13 := 0x00
                let expr_61 := _13
                let _14 := vloc__to_56
                let expr_62 := _14
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Status_$5_storage_$_of_t_address(expr_61,expr_62)
                let _16_slot := _15
                let expr_63_slot := _16_slot
                let _17 := add(expr_63_slot, 1)
                let _18 := read_from_storage_split_offset_0_t_uint256(_17)
                expr_66 := checked_add_t_uint256(_18, expr_66)
                update_storage_value_offset_0t_uint256_to_t_uint256(_17, expr_66)
                let expr_67 := expr_66
                let expr_71 := caller()
                let _19 := vloc__to_56
                let expr_72 := _19
                let expr_74 := callvalue()
                let _20_mpos := vloc_message_58_mpos
                let expr_75_mpos := _20_mpos
                let _21 := 0x8f22964d6c17c67e34a272dcc6f53ec5f964c88393ec3de3f57da5ccc43a55d6
                let _22 := convert_t_address_payable_to_t_address(expr_71)
                {
                    let _23 := mload(64)
                    let _24 := abi_encode_tuple_t_uint256_t_string_memory_ptr__to_t_uint256_t_string_memory_ptr__fromStack(_23 , expr_74, expr_75_mpos)
                    log3(_23, sub(_24, _23) , _21, _22, expr_72)
                }
            }

            function fun_sendPositiveWhuffies_54(vloc__to_31, vloc_message_33_mpos) {

                let expr_41 := callvalue()
                let _1 := 0x00
                let expr_36 := _1
                let _2 := vloc__to_31
                let expr_37 := _2
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Status_$5_storage_$_of_t_address(expr_36,expr_37)
                let _4_slot := _3
                let expr_38_slot := _4_slot
                let _5 := add(expr_38_slot, 0)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                expr_41 := checked_add_t_uint256(_6, expr_41)
                update_storage_value_offset_0t_uint256_to_t_uint256(_5, expr_41)
                let expr_42 := expr_41
                let expr_46 := caller()
                let _7 := vloc__to_31
                let expr_47 := _7
                let expr_49 := callvalue()
                let _8_mpos := vloc_message_33_mpos
                let expr_50_mpos := _8_mpos
                let _9 := 0x4c18e57e6e303cf41507e08607e5302fa1921a1f817e0cbc4ea1159ae0fbfe1d
                let _10 := convert_t_address_payable_to_t_address(expr_46)
                {
                    let _11 := mload(64)
                    let _12 := abi_encode_tuple_t_uint256_t_string_memory_ptr__to_t_uint256_t_string_memory_ptr__fromStack(_11 , expr_49, expr_50_mpos)
                    log3(_11, sub(_12, _11) , _9, _10, expr_47)
                }
            }

            function getter_fun_stats_9(key_0) -> ret_0, ret_1 {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_struct$_Status_$5_storage_$_of_t_address(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Status_$5_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

        }

    }

}

