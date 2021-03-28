/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TransferMoney_71" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_TransferMoney_71()

        codecopy(0, dataoffset("TransferMoney_71_deployed"), datasize("TransferMoney_71_deployed"))

        return(0, datasize("TransferMoney_71_deployed"))

        function constructor_TransferMoney_71() {

        }

    }
    object "TransferMoney_71_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x16937d56
                {
                    // addressMoneyBalance()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_addressMoneyBalance_27()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2b8f7a49
                {
                    // depositMoney(string)

                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    fun_depositMoney_70(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x75b8fa6f
                {
                    // contractMoneyBalance()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_contractMoneyBalance_16()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_string_memory_ptr(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

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

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_contract$_TransferMoney_$71_to_t_address(value) -> converted {
                converted := convert_t_contract$_TransferMoney_$71_to_t_uint160(value)
            }

            function convert_t_contract$_TransferMoney_$71_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
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

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_addressMoneyBalance_27() -> vloc__19 {
                let zero_value_for_type_t_uint256_2 := zero_value_for_split_t_uint256()
                vloc__19 := zero_value_for_type_t_uint256_2

                let _3 := 0x00
                let expr_21 := _3
                let expr_23 := caller()
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_21,expr_23)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_24 := _5
                vloc__19 := expr_24
                leave

            }

            function fun_contractMoneyBalance_16() -> vloc__7 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_1

                let expr_11_address := address()
                let expr_12 := convert_t_contract$_TransferMoney_$71_to_t_address(expr_11_address)
                let expr_13 := balance(expr_12)
                vloc__7 := expr_13
                leave

            }

            function fun_depositMoney_70(vloc_message_29_mpos) {

                let expr_34 := callvalue()
                let expr_35 := 0x00
                let expr_36 := iszero(lt(cleanup_t_uint256(expr_34), convert_t_rational_0_by_1_to_t_uint256(expr_35)))
                require_helper(expr_36)
                let _6 := 0x00
                let expr_39 := _6
                let expr_41 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_39,expr_41)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_42 := _8
                let expr_43 := 0x00
                let expr_44 := eq(cleanup_t_uint256(expr_42), convert_t_rational_0_by_1_to_t_uint256(expr_43))
                switch expr_44
                case 0 {
                    let _9 := 0x00
                    let expr_58 := _9
                    let expr_60 := caller()
                    let _10 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_58,expr_60)
                    let _11 := read_from_storage_split_offset_0_t_uint256(_10)
                    let expr_61 := _11
                    let expr_63 := callvalue()
                    let expr_64 := checked_add_t_uint256(expr_61, expr_63)

                    let _12 := 0x00
                    let expr_54 := _12
                    let expr_56 := caller()
                    let _13 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_54,expr_56)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_13, expr_64)
                    let expr_65 := expr_64
                }
                default {
                    let expr_50 := callvalue()
                    let _14 := 0x00
                    let expr_45 := _14
                    let expr_47 := caller()
                    let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_45,expr_47)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_15, expr_50)
                    let expr_51 := expr_50
                }

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

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
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

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

