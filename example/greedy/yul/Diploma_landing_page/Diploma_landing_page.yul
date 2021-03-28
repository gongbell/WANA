/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Diploma_landing_page_52" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Diploma_landing_page_52()

        codecopy(0, dataoffset("Diploma_landing_page_52_deployed"), datasize("Diploma_landing_page_52_deployed"))

        return(0, datasize("Diploma_landing_page_52_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Diploma_landing_page_52() {

            let expr_11 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_11)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_12 := _1

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
    object "Diploma_landing_page_52_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0f66791c
                {
                    // setHTML(string)

                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    fun_setHTML_25(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3697d0a7
                {
                    // renderLandingHash()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_renderLandingHash_43()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xff508d76
                {
                    // renderWeb()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_renderWeb_51()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfff93ec3
                {
                    // setLandingPage(string)

                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    fun_setLandingPage_35(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_encodeUpdatedPos_t_string_storage_to_t_string_memory_ptr(value0, pos) -> updatedPos {
                updatedPos := abi_encode_t_string_storage_to_t_string_memory_ptr(value0, pos)
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            // string -> string
            function abi_encode_t_string_storage_to_t_string_memory_ptr(value, pos) -> ret {
                let slotValue := sload(value)
                switch and(slotValue, 1)
                case 0 {
                    // short byte array
                    let length := and(div(slotValue, 2), 0x7f)
                    pos := array_storeLengthForEncoding_t_string_memory_ptr(pos, length)
                    mstore(pos, and(slotValue, not(0xff)))
                    ret := add(pos, 0x20)
                }
                case 1 {
                    // long byte array
                    let length := div(slotValue, 2)
                    pos := array_storeLengthForEncoding_t_string_memory_ptr(pos, length)
                    let dataPos := array_dataslot_t_string_storage(value)
                    let i := 0
                    for { } lt(i, length) { i := add(i, 0x20) } {
                        mstore(add(pos, i), sload(dataPos))
                        dataPos := add(dataPos, 1)
                    }
                    ret := add(pos, i)
                }
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_string_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
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

            function clear_storage_range_t_bytes1(start, end) {
                for {} lt(start, end) { start := add(start, 1) }
                {
                    storage_set_to_zero_t_uint256(start, 0)
                }
            }

            function convert_array_t_string_storage_to_t_string_memory_ptr(value) -> converted {

                // Copy the array to a free position in memory

                converted := copy_array_from_storage_to_memory_t_string_storage(value)

            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function copy_array_from_storage_to_memory_t_string_storage(slot) -> memptr {
                memptr := allocateTemporaryMemory()
                let end := abi_encodeUpdatedPos_t_string_storage_to_t_string_memory_ptr(slot, memptr)
                mstore(64, end)
            }

            function copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage(slot, src) {

                let newLen := array_length_t_string_memory_ptr(src)
                // Make sure array length is sane
                if gt(newLen, 0xffffffffffffffff) { panic_error() }

                let oldLen := extract_byte_array_length(sload(slot))

                src := add(src, 0x20)

                // This is not needed in all branches.
                let dstDataArea
                if or(gt(oldLen, 31), gt(newLen, 31)) {
                    dstDataArea := array_dataslot_t_string_storage(slot)
                }

                if gt(oldLen, 31) {
                    // potentially truncate data
                    let deleteStart := add(dstDataArea, div(add(newLen, 31), 32))
                    if lt(newLen, 32) { deleteStart := dstDataArea }
                    clear_storage_range_t_bytes1(deleteStart, add(dstDataArea, div(add(oldLen, 31), 32)))
                }
                switch gt(newLen, 31)
                case 1 {
                    let loopEnd := and(newLen, not(0x1f))
                    let dstPtr := dstDataArea
                    let i := 0
                    for { } lt(i, loopEnd) { i := add(i, 32) } {
                        sstore(dstPtr, mload(add(src, i)))
                        dstPtr := add(dstPtr, 1)
                    }
                    if lt(loopEnd, newLen) {
                        let lastValue := mload(add(src, i))
                        sstore(dstPtr, mask_bytes_dynamic(lastValue, and(newLen, 0x1f)))
                    }
                    sstore(slot, add(mul(newLen, 2), 1))
                }
                default {
                    let value := 0
                    if newLen {
                        value := mload(src)
                    }
                    sstore(slot, extract_used_part_and_set_length_of_short_byte_array(value, newLen))
                }
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

            function extract_byte_array_length(data) -> length {
                // Retrieve length both for in-place strings and off-place strings:
                // Computes (x & (0x100 * (ISZERO (x & 1)) - 1)) / 2
                // i.e. for short strings (x & 1 == 0) it does (x & 0xff) / 2 and for long strings it
                // computes (x & (-1)) / 2, which is equivalent to just x / 2.
                let mask := sub(mul(0x100, iszero(and(data, 1))), 1)
                length := div(and(data, mask), 2)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_used_part_and_set_length_of_short_byte_array(data, len) -> used {
                // we want to save only elements that are part of the array after resizing
                // others should be set to zero
                data := mask_bytes_dynamic(data, len)
                used := or(data, mul(2, len))
            }
            function fun_renderLandingHash_43() -> vloc__38_mpos {
                let zero_value_for_type_t_string_memory_ptr_3_mpos := zero_value_for_split_t_string_memory_ptr()
                vloc__38_mpos := zero_value_for_type_t_string_memory_ptr_3_mpos

                let _4_slot := 0x02
                let expr_40_slot := _4_slot
                vloc__38_mpos := convert_array_t_string_storage_to_t_string_memory_ptr(expr_40_slot)
                leave

            }

            function fun_renderWeb_51() -> vloc__46_mpos {
                let zero_value_for_type_t_string_memory_ptr_5_mpos := zero_value_for_split_t_string_memory_ptr()
                vloc__46_mpos := zero_value_for_type_t_string_memory_ptr_5_mpos

                let _6_slot := 0x01
                let expr_48_slot := _6_slot
                vloc__46_mpos := convert_array_t_string_storage_to_t_string_memory_ptr(expr_48_slot)
                leave

            }

            function fun_setHTML_25(vloc__htmlhash_17_mpos) {

                let _1_mpos := vloc__htmlhash_17_mpos
                let expr_21_mpos := _1_mpos
                update_storage_value_offset_0t_string_memory_ptr_to_t_string_storage(0x01, expr_21_mpos)

            }

            function fun_setLandingPage_35(vloc__LandingPageHash_27_mpos) {

                let _2_mpos := vloc__LandingPageHash_27_mpos
                let expr_31_mpos := _2_mpos
                update_storage_value_offset_0t_string_memory_ptr_to_t_string_storage(0x02, expr_31_mpos)

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function mask_bytes_dynamic(data, bytes) -> result {
                let mask := not(shift_right_unsigned_dynamic(mul(8, bytes), not(0)))
                result := and(data, mask)
            }
            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_set_to_zero_t_uint256(slot, offset) {
                update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_value_for_split_t_uint256())
            }

            function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_string_memory_ptr_to_t_string_storage(slot, value_0) {

                copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage(slot, value_0)
            }

            function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
            }

            function zero_value_for_split_t_string_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

