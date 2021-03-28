/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "BdpEntryPoint_60" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_BdpEntryPoint_60()

        codecopy(0, dataoffset("BdpEntryPoint_60_deployed"), datasize("BdpEntryPoint_60_deployed"))

        return(0, datasize("BdpEntryPoint_60_deployed"))

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_BdpEntryPoint_60() {

            let expr_10 := 0x00
            update_storage_value_offset_0t_bool_to_t_bool(0x12, expr_10)
            let expr_13 := 0x00
            update_storage_value_offset_1t_bool_to_t_bool(0x12, expr_13)

            let expr_46 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_46)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_47 := _1
            let expr_51 := caller()
            let _2 := convert_t_address_payable_to_t_address(expr_51)
            update_storage_value_offset_0t_address_to_t_address(0x01, _2)
            let expr_52 := _2
            let expr_55 := 0x01
            update_storage_value_offset_1t_bool_to_t_bool(0x12, expr_55)
            let expr_56 := expr_55

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
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

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_left_8(value) -> newValue {
            newValue :=

            shl(8, value)

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_byte_slice_1_shift_1(value, toInsert) -> result {
            let mask := 65280
            toInsert := shift_left_8(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
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

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_1t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_1(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

    }
    object "BdpEntryPoint_60_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x474da79a
                {
                    // contracts(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_contracts_8(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x54fd4d50
                {
                    // version()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_version_16()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes8__to_t_bytes8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5c975abb
                {
                    // paused()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_paused_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x609da897
                {
                    // setupCompleted()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_setupCompleted_14()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8f84aa09
                {
                    // ownerAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ownerAddress_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_41()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcf73a1bc
                {
                    // managerAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_managerAddress_4()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes8_to_t_bytes8_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes8__to_t_bytes8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes8_to_t_bytes8_fromStack(value0,  add(headStart, 0))

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

            function array_dataslot_t_array$_t_address_$16_storage(ptr) -> data {
                data := ptr

            }

            function array_length_t_array$_t_address_$16_storage(value) -> length {

                length := 0x10

            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_bytes8(value) -> cleaned {
                cleaned := shift_left_192(value)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_bytes8(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffff000000000000000000000000000000000000000000000000)
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

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bytes8(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bytes8(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function fun_func_41() {

                let _1_slot := 0x02
                let expr_21_slot := _1_slot
                let expr_22 := 0x01

                let _2, _3 := storage_array_index_access_t_array$_t_address_$16_storage(expr_21_slot, expr_22)
                let _4 := read_from_storage_split_dynamic_t_address(_2, _3)
                let expr_23 := _4
                let vloc__impl_20 := expr_23
                let _5 := vloc__impl_20
                let expr_26 := _5
                let expr_29 := 0x00
                let expr_30 := convert_t_rational_0_by_1_to_t_address_payable(expr_29)
                let expr_31 := iszero(eq(cleanup_t_address(expr_26), convert_t_address_payable_to_t_address(expr_30)))
                require_helper(expr_31)
                let expr_37_offset := 0
                let expr_37_length := calldatasize()
                let vloc_data_35_mpos := convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(expr_37_offset, expr_37_length)
                {
                    let usr$result := delegatecall(gas(), vloc__impl_20, add(vloc_data_35_mpos, 0x20), mload(vloc_data_35_mpos), 0, 0)
                    let usr$size := returndatasize()
                    let usr$ptr := mload(0x40)
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function getter_fun_contracts_8(key_0) -> ret {

                let slot := 2
                let offset := 0

                if iszero(lt(key_0, array_length_t_array$_t_address_$16_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_address_$16_storage(slot, key_0)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_managerAddress_4() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_ownerAddress_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_paused_11() -> ret {

                let slot := 18
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_setupCompleted_14() -> ret {

                let slot := 18
                let offset := 1

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_version_16() -> ret {

                let slot := 18
                let offset := 2

                ret := read_from_storage_split_dynamic_t_bytes8(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bytes8(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bytes8(sload(slot), offset)

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function shift_left_192(value) -> newValue {
                newValue :=

                shl(192, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_address_$16_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_address_$16_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_address_$16_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

        }

    }

}

