/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TestQuery_91" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_TestQuery_91()

        codecopy(0, dataoffset("TestQuery_91_deployed"), datasize("TestQuery_91_deployed"))

        return(0, datasize("TestQuery_91_deployed"))

        function constructor_TestQuery_91() {

        }

    }
    object "TestQuery_91_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x83c99722
                {
                    // lockforTransfer()

                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_lockforTransfer_64()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc16fe907
                {
                    // getTransfer(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1, ret_2 :=  fun_getTransfer_90(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_address_t_uint256__to_t_uint256_t_address_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2)
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

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256_t_address_t_uint256__to_t_uint256_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

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

            function allocate_memory_struct_t_struct$_Details_$7_memory_ptr() -> memPtr {
                memPtr := allocateMemory(96)
            }

            function allocate_memory_struct_t_struct$_Details_$7_storage_ptr() -> memPtr {
                memPtr := allocateMemory(96)
            }

            function array_dataslot_t_array$_t_uint256_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_uint256_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_push_t_array$_t_uint256_$dyn_storage(array, value) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_uint256_$dyn_storage(array, oldLen)
                update_storage_value_t_uint256_to_t_uint256(slot, offset, value)

            }
            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_struct$_Details_$7_storage_to_t_struct$_Details_$7_memory_ptr(value) -> converted {

                converted := read_from_storage_reference_type_t_struct$_Details_$7_memory_ptr(value)

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

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_getTransfer_90(vloc__transferId_66) -> vloc__69, vloc__71, vloc__73 {
                let zero_value_for_type_t_uint256_14 := zero_value_for_split_t_uint256()
                vloc__69 := zero_value_for_type_t_uint256_14
                let zero_value_for_type_t_address_15 := zero_value_for_split_t_address()
                vloc__71 := zero_value_for_type_t_address_15
                let zero_value_for_type_t_uint256_16 := zero_value_for_split_t_uint256()
                vloc__73 := zero_value_for_type_t_uint256_16

                let _17 := 0x01
                let expr_77 := _17
                let _18 := vloc__transferId_66
                let expr_78 := _18
                let _19 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Details_$7_storage_$_of_t_uint256(expr_77,expr_78)
                let _20_slot := _19
                let expr_79_slot := _20_slot
                let vloc__locked_76_mpos := convert_t_struct$_Details_$7_storage_to_t_struct$_Details_$7_memory_ptr(expr_79_slot)
                let _21_mpos := vloc__locked_76_mpos
                let expr_81_mpos := _21_mpos
                let _22 := add(expr_81_mpos, 0)
                let _23 := read_from_memoryt_uint256(_22)
                let expr_82 := _23
                let expr_87_component_1 := expr_82
                let _24_mpos := vloc__locked_76_mpos
                let expr_83_mpos := _24_mpos
                let _25 := add(expr_83_mpos, 32)
                let _26 := read_from_memoryt_address(_25)
                let expr_84 := _26
                let expr_87_component_2 := expr_84
                let _27_mpos := vloc__locked_76_mpos
                let expr_85_mpos := _27_mpos
                let _28 := add(expr_85_mpos, 64)
                let _29 := read_from_memoryt_uint256(_28)
                let expr_86 := _29
                let expr_87_component_3 := expr_86
                vloc__69 := expr_87_component_1
                vloc__71 := expr_87_component_2
                vloc__73 := expr_87_component_3
                leave

            }

            function fun_lockforTransfer_64() -> vloc__27 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__27 := zero_value_for_type_t_uint256_1

                let expr_31 := callvalue()
                let expr_32 := 0x00
                let expr_33 := gt(cleanup_t_uint256(expr_31), convert_t_rational_0_by_1_to_t_uint256(expr_32))
                require_helper(expr_33)
                let expr_37 := 0x01
                let _2 := convert_t_rational_1_by_1_to_t_uint256(expr_37)
                let _3 := read_from_storage_split_offset_0_t_uint256(0x00)
                _2 := checked_add_t_uint256(_3, _2)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _2)
                let expr_38 := _2
                let expr_45 := callvalue()
                let expr_47 := caller()
                let _4 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_48 := _4
                let expr_49_mpos := allocate_memory_struct_t_struct$_Details_$7_storage_ptr()
                write_to_memory_t_uint256(add(expr_49_mpos, 0), expr_45)
                let _5 := convert_t_address_payable_to_t_address(expr_47)
                write_to_memory_t_address(add(expr_49_mpos, 32), _5)
                write_to_memory_t_uint256(add(expr_49_mpos, 64), expr_48)
                let _6 := 0x01
                let expr_40 := _6
                let _7 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_41 := _7
                let _8 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Details_$7_storage_$_of_t_uint256(expr_40,expr_41)
                update_storage_value_offset_0t_struct$_Details_$7_memory_ptr_to_t_struct$_Details_$7_storage(_8, expr_49_mpos)
                let _9 := 0x02
                let expr_52 := _9
                let expr_54 := caller()
                let _10 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint256_$dyn_storage_$_of_t_address_payable(expr_52,expr_54)
                let _11_slot := _10
                let expr_55_slot := _11_slot
                let expr_56_slot := expr_55_slot
                let _12 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_57 := _12
                array_push_t_array$_t_uint256_$dyn_storage(expr_56_slot, expr_57)
                let _13 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_60 := _13
                let expr_61 := expr_60
                vloc__27 := expr_61
                leave

            }

            function mapping_index_access_t_mapping$_t_address_$_t_array$_t_uint256_$dyn_storage_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Details_$7_storage_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function read_from_storage_reference_type_t_struct$_Details_$7_memory_ptr(slot) -> value {
                value := allocate_memory_struct_t_struct$_Details_$7_memory_ptr()

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 0), 0)
                    write_to_memory_t_uint256(add(value, 0), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_address(add(slot, 1), 0)
                    write_to_memory_t_address(add(value, 32), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 2), 0)
                    write_to_memory_t_uint256(add(value, 64), memberValue_0)
                }

            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_uint256_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_uint256_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_uint256_$dyn_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_struct$_Details_$7_memory_ptr_to_t_struct$_Details_$7_storage(slot, value) {

                {

                    let memberSlot := add(slot, 0)
                    let memberSrcPtr := add(value, 0)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 1)
                    let memberSrcPtr := add(value, 32)

                    let memberValue_0 := read_from_memoryt_address(memberSrcPtr)

                    update_storage_value_offset_0t_address_to_t_address(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 2)
                    let memberSrcPtr := add(value, 64)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function write_to_memory_t_address(memPtr, value) {
                mstore(memPtr, cleanup_t_address(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

