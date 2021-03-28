/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Proxy_28" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Proxy_28()

        codecopy(0, dataoffset("Proxy_28_deployed"), datasize("Proxy_28_deployed"))

        return(0, datasize("Proxy_28_deployed"))

        function constructor_Proxy_28() {

        }

    }
    object "Proxy_28_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_27()
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

            function convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(value, length) -> converted {

                // Copy the array to a free position in memory

                converted := allocate_memory_array_t_bytes_memory_ptr(length)
                copy_calldata_to_memory(value, add(converted, 0x20), length)

            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function fun_func_27() {

                let _1 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_9 := _1
                let vloc_impl_8 := expr_9
                let _2 := vloc_impl_8
                let expr_12 := _2
                let expr_15 := 0x00
                let expr_16 := convert_t_rational_0_by_1_to_t_address_payable(expr_15)
                let expr_17 := iszero(eq(cleanup_t_address(expr_12), convert_t_address_payable_to_t_address(expr_16)))
                require_helper(expr_17)
                let expr_23_offset := 0
                let expr_23_length := calldatasize()
                let vloc_data_21_mpos := convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(expr_23_offset, expr_23_length)
                {
                    let usr$result := delegatecall(gas(), vloc_impl_8, add(vloc_data_21_mpos, 0x20), mload(vloc_data_21_mpos), 0, 0)
                    let usr$size := returndatasize()
                    let usr$ptr := mload(0x40)
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

        }

    }

}

