/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Proxy_67" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Proxy_67()

        codecopy(0, dataoffset("Proxy_67_deployed"), datasize("Proxy_67_deployed"))

        return(0, datasize("Proxy_67_deployed"))

        function constructor_DelegateProxy_33() {

        }

        function constructor_Proxy_67() {

            constructor_DelegateProxy_33()

        }

    }
    object "Proxy_67_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0900f010
                {
                    // upgrade(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_upgrade_47(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            fun__66() stop()

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

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(value, length) -> converted {

                // Copy the array to a free position in memory

                converted := allocate_memory_array_t_bytes_memory_ptr(length)
                copy_calldata_to_memory(value, add(converted, 0x20), length)

            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
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

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function fun__66() {

                let _2 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_51 := _2
                let expr_54 := 0x00
                let expr_55 := convert_t_rational_0_by_1_to_t_address_payable(expr_54)
                let expr_56 := iszero(eq(cleanup_t_address(expr_51), convert_t_address_payable_to_t_address(expr_55)))
                require_helper(expr_56)
                let expr_59_functionIdentifier := 16
                let _3 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_60 := _3
                let expr_62_offset := 0
                let expr_62_length := calldatasize()
                let _4_mpos := convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(expr_62_offset, expr_62_length)
                fun_delegatedFwd_16(expr_60, _4_mpos)

            }

            function fun_delegatedFwd_16(vloc__dst_3, vloc__calldata_5_mpos) {

                let expr_9_functionIdentifier := 32
                let _5 := vloc__dst_3
                let expr_10 := _5
                let expr_11 := fun_isContract_32(expr_10)
                require_helper(expr_11)
                {
                    let usr$result := delegatecall(sub(gas(), 10000), vloc__dst_3, add(vloc__calldata_5_mpos, 0x20), mload(vloc__calldata_5_mpos), 0, 0)
                    let usr$size := returndatasize()
                    let usr$ptr := mload(0x40)
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function fun_isContract_32(vloc__target_18) -> vloc__21 {
                let zero_value_for_type_t_bool_6 := zero_value_for_split_t_bool()
                vloc__21 := zero_value_for_type_t_bool_6

                let vloc_size_24
                let zero_value_for_type_t_uint256_7 := zero_value_for_split_t_uint256()
                vloc_size_24 := zero_value_for_type_t_uint256_7
                {
                    vloc_size_24 := extcodesize(vloc__target_18)
                }
                let _8 := vloc_size_24
                let expr_27 := _8
                let expr_28 := 0x00
                let expr_29 := gt(cleanup_t_uint256(expr_27), convert_t_rational_0_by_1_to_t_uint256(expr_28))
                vloc__21 := expr_29
                leave

            }

            function fun_upgrade_47(vloc_newContract_39) {

                let _1 := vloc_newContract_39
                let expr_43 := _1
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_43)
                let expr_44 := expr_43

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

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

