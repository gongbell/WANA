/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Soleau_172" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Soleau_172()

        codecopy(0, dataoffset("Soleau_172_deployed"), datasize("Soleau_172_deployed"))

        return(0, datasize("Soleau_172_deployed"))

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_Soleau_172() {

            let expr_2 := 0x038d7ea4c68000
            update_storage_value_offset_0t_rational_1000000000000000_by_1_to_t_uint256(0x00, expr_2)

        }

        function convert_t_rational_1000000000000000_by_1_to_t_uint256(value) -> converted {
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

        function update_storage_value_offset_0t_rational_1000000000000000_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_1000000000000000_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "Soleau_172_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x693ec85e
                {
                    // get(string)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3 :=  fun_get_171(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool_t_uint256_t_uint256_t_address__to_t_bool_t_uint256_t_uint256_t_address__fromStack(memPos , ret_0, ret_1, ret_2, ret_3)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe51ace16
                {
                    // record(string)

                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    let ret_0, ret_1, ret_2 :=  fun_record_121(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool_t_bool_t_uint256__to_t_bool_t_bool_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2)
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

            function abi_decode_tuple_t_string_memory_ptr(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, length)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
            }

            function abi_encode_tuple_packed_t_string_memory_ptr_t_uint256__to_t_string_memory_ptr_t_uint256__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                pos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value0,  pos)

                abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value1,  pos)
                pos := add(pos, 32)

                end := pos
            }

            function abi_encode_tuple_t_bool_t_bool_t_uint256__to_t_bool_t_bool_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bool_to_t_bool_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_tuple_t_bool_t_uint256_t_uint256_t_address__to_t_bool_t_uint256_t_uint256_t_address__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

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

            function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
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

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
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

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_20t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_160_unsigned(slot_value))
            }

            function fun_get_171(vloc_hash_123_mpos) -> vloc_success_126, vloc_theBlock_128, vloc_theTime_130, vloc_holder_132 {
                let zero_value_for_type_t_bool_48 := zero_value_for_split_t_bool()
                vloc_success_126 := zero_value_for_type_t_bool_48
                let zero_value_for_type_t_uint256_49 := zero_value_for_split_t_uint256()
                vloc_theBlock_128 := zero_value_for_type_t_uint256_49
                let zero_value_for_type_t_uint256_50 := zero_value_for_split_t_uint256()
                vloc_theTime_130 := zero_value_for_type_t_uint256_50
                let zero_value_for_type_t_address_51 := zero_value_for_split_t_address()
                vloc_holder_132 := zero_value_for_type_t_address_51

                let _52 := 0x01
                let expr_134 := _52
                let _53_mpos := vloc_hash_123_mpos
                let expr_135_mpos := _53_mpos
                let _54 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_134,expr_135_mpos)
                let _55_slot := _54
                let expr_136_slot := _55_slot
                let _56 := add(expr_136_slot, 0)
                let _57 := read_from_storage_split_offset_20_t_bool(_56)
                let expr_137 := _57
                switch expr_137
                case 0 {
                    let expr_165 := 0x00
                    vloc_success_126 := expr_165
                    let expr_166 := expr_165
                }
                default {
                    let expr_139 := 0x01
                    vloc_success_126 := expr_139
                    let expr_140 := expr_139
                    let _58 := 0x01
                    let expr_143 := _58
                    let _59_mpos := vloc_hash_123_mpos
                    let expr_144_mpos := _59_mpos
                    let _60 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_143,expr_144_mpos)
                    let _61_slot := _60
                    let expr_145_slot := _61_slot
                    let _62 := add(expr_145_slot, 2)
                    let _63 := read_from_storage_split_offset_0_t_uint256(_62)
                    let expr_146 := _63
                    vloc_theBlock_128 := expr_146
                    let expr_147 := expr_146
                    let _64 := 0x01
                    let expr_150 := _64
                    let _65_mpos := vloc_hash_123_mpos
                    let expr_151_mpos := _65_mpos
                    let _66 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_150,expr_151_mpos)
                    let _67_slot := _66
                    let expr_152_slot := _67_slot
                    let _68 := add(expr_152_slot, 1)
                    let _69 := read_from_storage_split_offset_0_t_uint256(_68)
                    let expr_153 := _69
                    vloc_theTime_130 := expr_153
                    let expr_154 := expr_153
                    let _70 := 0x01
                    let expr_157 := _70
                    let _71_mpos := vloc_hash_123_mpos
                    let expr_158_mpos := _71_mpos
                    let _72 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_157,expr_158_mpos)
                    let _73_slot := _72
                    let expr_159_slot := _73_slot
                    let _74 := add(expr_159_slot, 0)
                    let _75 := read_from_storage_split_offset_0_t_address(_74)
                    let expr_160 := _75
                    vloc_holder_132 := expr_160
                    let expr_161 := expr_160
                }

            }

            function fun_record_121(vloc_hash_18_mpos) -> vloc_success_21, vloc_already_23, vloc_theBlock_25 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc_success_21 := zero_value_for_type_t_bool_1
                let zero_value_for_type_t_bool_2 := zero_value_for_split_t_bool()
                vloc_already_23 := zero_value_for_type_t_bool_2
                let zero_value_for_type_t_uint256_3 := zero_value_for_split_t_uint256()
                vloc_theBlock_25 := zero_value_for_type_t_uint256_3

                let expr_28 := callvalue()
                let _4 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_29 := _4
                let expr_30 := lt(cleanup_t_uint256(expr_28), cleanup_t_uint256(expr_29))
                if expr_30 {
                    let expr_32 := 0x00
                    vloc_success_21 := expr_32
                    let expr_33 := expr_32
                    let expr_38 := caller()
                    let expr_39 := expr_38
                    let expr_40_address := convert_t_address_payable_to_t_address(expr_39)
                    let expr_42 := callvalue()

                    let _5 := 0
                    if iszero(expr_42) { _5 := 2300 }
                    let expr_43 := call(_5, expr_40_address, expr_42, 0, 0, 0, 0)

                }
                let _6 := 0x01
                let expr_47 := _6
                let _7_mpos := vloc_hash_18_mpos
                let expr_48_mpos := _7_mpos
                let _8 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_47,expr_48_mpos)
                let _9_slot := _8
                let expr_49_slot := _9_slot
                let _10 := add(expr_49_slot, 0)
                let _11 := read_from_storage_split_offset_20_t_bool(_10)
                let expr_50 := _11
                switch expr_50
                case 0 {
                    let expr_71 := 0x01
                    let _12 := 0x01
                    let expr_67 := _12
                    let _13_mpos := vloc_hash_18_mpos
                    let expr_68_mpos := _13_mpos
                    let _14 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_67,expr_68_mpos)
                    let _15_slot := _14
                    let expr_69_slot := _15_slot
                    let _16 := add(expr_69_slot, 0)
                    update_storage_value_offset_20t_bool_to_t_bool(_16, expr_71)
                    let expr_72 := expr_71
                    let expr_79 := caller()
                    let _17 := convert_t_address_payable_to_t_address(expr_79)
                    let _18 := 0x01
                    let expr_74 := _18
                    let _19_mpos := vloc_hash_18_mpos
                    let expr_75_mpos := _19_mpos
                    let _20 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_74,expr_75_mpos)
                    let _21_slot := _20
                    let expr_76_slot := _21_slot
                    let _22 := add(expr_76_slot, 0)
                    update_storage_value_offset_0t_address_to_t_address(_22, _17)
                    let expr_80 := _17
                    let expr_87 := timestamp()
                    let _23 := 0x01
                    let expr_82 := _23
                    let _24_mpos := vloc_hash_18_mpos
                    let expr_83_mpos := _24_mpos
                    let _25 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_82,expr_83_mpos)
                    let _26_slot := _25
                    let expr_84_slot := _26_slot
                    let _27 := add(expr_84_slot, 1)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_27, expr_87)
                    let expr_88 := expr_87
                    let expr_95 := number()
                    let _28 := 0x01
                    let expr_90 := _28
                    let _29_mpos := vloc_hash_18_mpos
                    let expr_91_mpos := _29_mpos
                    let _30 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_90,expr_91_mpos)
                    let _31_slot := _30
                    let expr_92_slot := _31_slot
                    let _32 := add(expr_92_slot, 2)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_32, expr_95)
                    let expr_96 := expr_95
                    let expr_99 := 0x01
                    vloc_success_21 := expr_99
                    let expr_100 := expr_99
                    let expr_103 := 0x00
                    vloc_already_23 := expr_103
                    let expr_104 := expr_103
                    let _33 := 0x01
                    let expr_107 := _33
                    let _34_mpos := vloc_hash_18_mpos
                    let expr_108_mpos := _34_mpos
                    let _35 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_107,expr_108_mpos)
                    let _36_slot := _35
                    let expr_109_slot := _36_slot
                    let _37 := add(expr_109_slot, 2)
                    let _38 := read_from_storage_split_offset_0_t_uint256(_37)
                    let expr_110 := _38
                    vloc_theBlock_25 := expr_110
                    let expr_111 := expr_110
                }
                default {
                    let expr_52 := 0x01
                    vloc_success_21 := expr_52
                    let expr_53 := expr_52
                    let expr_56 := 0x01
                    vloc_already_23 := expr_56
                    let expr_57 := expr_56
                    let _39 := 0x01
                    let expr_60 := _39
                    let _40_mpos := vloc_hash_18_mpos
                    let expr_61_mpos := _40_mpos
                    let _41 := mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(expr_60,expr_61_mpos)
                    let _42_slot := _41
                    let expr_62_slot := _42_slot
                    let _43 := add(expr_62_slot, 2)
                    let _44 := read_from_storage_split_offset_0_t_uint256(_43)
                    let expr_63 := _44
                    vloc_theBlock_25 := expr_63
                    let expr_64 := expr_63
                }
                let _45 := vloc_success_21
                let expr_115 := _45
                let expr_118_component_1 := expr_115
                let _46 := vloc_already_23
                let expr_116 := _46
                let expr_118_component_2 := expr_116
                let _47 := vloc_theBlock_25
                let expr_117 := _47
                let expr_118_component_3 := expr_117
                vloc_success_21 := expr_118_component_1
                vloc_already_23 := expr_118_component_2
                vloc_theBlock_25 := expr_118_component_3
                leave

            }

            function leftAlign_t_uint256(value) -> aligned {
                aligned := value
            }

            function mapping_index_access_t_mapping$_t_string_memory_ptr_$_t_struct$_Record_$12_storage_$_of_t_string_memory_ptr(slot , key) -> dataSlot {
                dataSlot := packed_hashed_t_string_memory_ptr_t_uint256__to_t_string_memory_ptr_t_uint256_(key , slot)
            }

            function packed_hashed_t_string_memory_ptr_t_uint256__to_t_string_memory_ptr_t_uint256_(var_1, var_2) -> hash {
                let pos := mload(64)
                let end := abi_encode_tuple_packed_t_string_memory_ptr_t_uint256__to_t_string_memory_ptr_t_uint256__nonPadded_inplace_fromStack(pos , var_1, var_2)
                hash := keccak256(pos, sub(end, pos))
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function read_from_storage_split_offset_20_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_20t_bool(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_160(value) -> newValue {
                newValue :=

                shl(160, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function update_byte_slice_1_shift_20(value, toInsert) -> result {
                let mask := 0xff0000000000000000000000000000000000000000
                toInsert := shift_left_160(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
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

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
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

