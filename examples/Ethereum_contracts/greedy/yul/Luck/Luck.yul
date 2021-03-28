/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Luck_53" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Luck_53()

        codecopy(0, dataoffset("Luck_53_deployed"), datasize("Luck_53_deployed"))

        return(0, datasize("Luck_53_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint32(value) -> cleaned {
            cleaned := and(value, 0xffffffff)
        }

        function constructor_Luck_53() {

            let expr_2 := 0x8a
            update_storage_value_offset_0t_rational_138_by_1_to_t_uint32(0x00, expr_2)
            let expr_7 := 0x00
            let expr_8 := convert_t_rational_0_by_1_to_t_address_payable(expr_7)
            update_storage_value_offset_4t_address_payable_to_t_address(0x00, expr_8)

            let expr_17 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_17)
            update_storage_value_offset_4t_address_to_t_address(0x00, _1)
            let expr_18 := _1

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

        function convert_t_rational_138_by_1_to_t_uint32(value) -> converted {
            converted := cleanup_t_uint32(value)
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

        function prepare_store_t_uint32(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_left_32(value) -> newValue {
            newValue :=

            shl(32, value)

        }

        function update_byte_slice_20_shift_4(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff00000000
            toInsert := shift_left_32(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_byte_slice_4_shift_0(value, toInsert) -> result {
            let mask := 0xffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_rational_138_by_1_to_t_uint32(slot, value_0) {
            let convertedValue_0 := convert_t_rational_138_by_1_to_t_uint32(value_0)
            sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_uint32(convertedValue_0)))
        }

        function update_storage_value_offset_4t_address_payable_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_4(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_4t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_4(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

    }
    object "Luck_53_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x12c0d1ea
                {
                    // changeLuck(uint32)

                    let param_0 :=  abi_decode_tuple_t_uint32(4, calldatasize())
                    fun_changeLuck_52(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1b413d27
                {
                    // getLuck()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getLuck_29()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint32__to_t_uint32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5d1c3171
                {
                    // luck()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_luck_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint32__to_t_uint32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_9()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa7a38f0b
                {
                    // history(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_history_12(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint32__to_t_uint32__fromStack(memPos , ret_0)
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

            function abi_decode_t_uint32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint32(value)
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

            function abi_decode_tuple_t_uint32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint32(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_uint32_to_t_uint32_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint32(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint32__to_t_uint32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint32_to_t_uint32_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_dataslot_t_array$_t_uint32_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_uint32_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_push_t_array$_t_uint32_$dyn_storage(array, value) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_uint32_$dyn_storage(array, oldLen)
                update_storage_value_t_uint32_to_t_uint32(slot, offset, value)

            }
            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
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

            function cleanup_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint32_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint32(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint32(slot_value) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_4t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_32_unsigned(slot_value))
            }

            function fun_changeLuck_52(vloc_newLuck_31) {

                let expr_36 := caller()
                let _3 := read_from_storage_split_offset_4_t_address(0x00)
                let expr_37 := _3
                let expr_38 := eq(convert_t_address_payable_to_t_address(expr_36), cleanup_t_address(expr_37))
                require_helper(expr_38)
                let _4_slot := 0x01
                let expr_41_slot := _4_slot
                let expr_43_slot := expr_41_slot
                let _5 := read_from_storage_split_offset_0_t_uint32(0x00)
                let expr_44 := _5
                array_push_t_array$_t_uint32_$dyn_storage(expr_43_slot, expr_44)
                let _6 := vloc_newLuck_31
                let expr_48 := _6
                update_storage_value_offset_0t_uint32_to_t_uint32(0x00, expr_48)
                let expr_49 := expr_48

            }

            function fun_getLuck_29() -> vloc__24 {
                let zero_value_for_type_t_uint32_1 := zero_value_for_split_t_uint32()
                vloc__24 := zero_value_for_type_t_uint32_1

                let _2 := read_from_storage_split_offset_0_t_uint32(0x00)
                let expr_26 := _2
                vloc__24 := expr_26
                leave

            }

            function getter_fun_history_12(key_0) -> ret {

                let slot := 1
                let offset := 0

                if iszero(lt(key_0, array_length_t_array$_t_uint32_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_uint32_$dyn_storage(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint32(slot, offset)

            }

            function getter_fun_luck_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint32(slot, offset)

            }

            function getter_fun_owner_9() -> ret {

                let slot := 0
                let offset := 4

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint32(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint32(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint32(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint32(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint32(sload(slot))

            }

            function read_from_storage_split_offset_4_t_address(slot) -> value {
                value := extract_from_storage_value_offset_4t_address(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_248_unsigned(value) -> newValue {
                newValue :=

                shr(248, value)

            }

            function shift_right_32_unsigned(value) -> newValue {
                newValue :=

                shr(32, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_uint32_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_uint32_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_uint32_$dyn_storage(array)
                slot := add(dataArea, div(index, 8))
                offset := mul(mod(index, 8), 4)

            }

            function update_byte_slice_4_shift_0(value, toInsert) -> result {
                let mask := 0xffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_dynamic4(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint32_to_t_uint32(slot, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_uint32(convertedValue_0)))
            }

            function update_storage_value_t_uint32_to_t_uint32(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_dynamic4(sload(slot), offset, prepare_store_t_uint32(convertedValue_0)))
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint32(value) {
                if iszero(eq(value, cleanup_t_uint32(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_uint32() -> ret {
                ret := 0
            }

        }

    }

}

