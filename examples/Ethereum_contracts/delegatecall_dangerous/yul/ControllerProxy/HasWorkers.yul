/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "HasWorkers_215" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_HasWorkers_215()

        codecopy(0, dataoffset("HasWorkers_215_deployed"), datasize("HasWorkers_215_deployed"))

        return(0, datasize("HasWorkers_215_deployed"))

        function array_dataslot_t_array$_t_address_$dyn_storage(ptr) -> data {
            data := ptr

            mstore(0, ptr)
            data := keccak256(0, 0x20)

        }

        function array_length_t_array$_t_address_$dyn_storage(value) -> length {

            length := sload(value)

        }

        function array_push_zero_t_array$_t_address_$dyn_storage(array) -> slot, offset {
            let oldLen := array_length_t_array$_t_address_$dyn_storage(array)
            if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
            sstore(array, add(oldLen, 1))
            slot, offset := storage_array_index_access_t_array$_t_address_$dyn_storage(array, oldLen)
        }
        function cleanup_from_storage_t_address(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_HasWorkers_215() {

            constructor_Ownable_36()

            let _1_slot := 0x02
            let expr_56_slot := _1_slot
            let expr_58_slot := expr_56_slot
            let _2, _3 := array_push_zero_t_array$_t_address_$dyn_storage(expr_58_slot)
            let _4 := read_from_storage_split_dynamic_t_address(_2, _3)
            let expr_59 := _4

        }

        function constructor_Ownable_36() {

            let expr_7 := caller()
            let _5 := convert_t_address_payable_to_t_address(expr_7)
            update_storage_value_offset_0t_address_to_t_address(0x00, _5)
            let expr_8 := _5

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

        function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
            value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
        }

        function panic_error() {
            invalid()
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
            value := extract_from_storage_value_dynamict_address(sload(slot), offset)

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_right_unsigned_dynamic(bits, value) -> newValue {
            newValue :=

            shr(bits, value)

        }

        function storage_array_index_access_t_array$_t_address_$dyn_storage(array, index) -> slot, offset {
            let arrayLength := array_length_t_array$_t_address_$dyn_storage(array)
            if iszero(lt(index, arrayLength)) { panic_error() }

            let dataArea := array_dataslot_t_array$_t_address_$dyn_storage(array)
            slot := add(dataArea, mul(index, 1))
            offset := 0

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
    object "HasWorkers_215_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x13af4035
                {
                    // setOwner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_setOwner_35(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x806ad57e
                {
                    // addWorker(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_addWorker_157(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

                case 0xaa156645
                {
                    // isWorker(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_isWorker_76(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc4f987a5
                {
                    // removeWorker(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_removeWorker_214(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcb3eef2c
                {
                    // allWorkers()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_allWorkers_117()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_array$_t_address_$dyn_memory_ptr__to_t_array$_t_address_$dyn_memory_ptr__fromStack(memPos , ret_0)
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

            function abi_encodeUpdatedPos_t_address_to_t_address(value0, pos) -> updatedPos {
                abi_encode_t_address_to_t_address(value0, pos)
                updatedPos := add(pos, 0x20)
            }

            function abi_encode_t_address_to_t_address(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            // address[] -> address[]
            function abi_encode_t_array$_t_address_$dyn_memory_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
                let length := array_length_t_array$_t_address_$dyn_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length)
                let baseRef := array_dataslot_t_array$_t_address_$dyn_memory_ptr(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := mload(srcPtr)
                    pos := abi_encodeUpdatedPos_t_address_to_t_address(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_address_$dyn_memory_ptr(srcPtr)
                }
                end := pos
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_array$_t_address_$dyn_memory_ptr__to_t_array$_t_address_$dyn_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_array$_t_address_$dyn_memory_ptr_to_t_array$_t_address_$dyn_memory_ptr_fromStack(value0,  tail)

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocate_and_zero_memory_array_t_array$_t_address_$dyn_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_address_$dyn_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length)

                dataStart := add(dataStart, 32)
                dataSize := sub(dataSize, 32)

                zero_memory_chunk_t_address(dataStart, dataSize)
            }

            function allocate_memory_array_t_array$_t_address_$dyn_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_array$_t_address_$dyn_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_dataslot_t_array$_t_address_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_address_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_address_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_nextElement_t_array$_t_address_$dyn_memory_ptr(ptr) -> next {
                next := add(ptr, 0x20)
            }

            function array_push_t_array$_t_address_$dyn_storage(array, value) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_address_$dyn_storage(array, oldLen)
                update_storage_value_t_address_to_t_address(slot, offset, value)

            }
            function array_push_zero_t_array$_t_address_$dyn_storage(array) -> slot, offset {
                let oldLen := array_length_t_array$_t_address_$dyn_storage(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                slot, offset := storage_array_index_access_t_array$_t_address_$dyn_storage(array, oldLen)
            }
            function array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
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

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_addWorker_157(vloc__worker_119) -> vloc__122 {
                let zero_value_for_type_t_bool_23 := zero_value_for_split_t_bool()
                vloc__122 := zero_value_for_type_t_bool_23

                let expr_125_functionIdentifier := 76
                let _24 := vloc__worker_119
                let expr_126 := _24
                let expr_127 := fun_isWorker_76(expr_126)
                let expr_128 := cleanup_t_bool(iszero(expr_127))
                require_helper(expr_128)
                let _25_slot := 0x02
                let expr_131_slot := _25_slot
                let expr_133_slot := expr_131_slot
                let _26 := vloc__worker_119
                let expr_134 := _26
                array_push_t_array$_t_address_$dyn_storage(expr_133_slot, expr_134)
                let _27_slot := 0x02
                let expr_139_slot := _27_slot
                let expr_140 := array_length_t_array$_t_address_$dyn_storage(expr_139_slot)
                let expr_141 := 0x01
                let expr_142 := checked_sub_t_uint256(expr_140, convert_t_rational_1_by_1_to_t_uint256(expr_141))

                let vloc_index_138 := expr_142
                let _28 := vloc_index_138
                let expr_147 := _28
                let _29 := 0x01
                let expr_144 := _29
                let _30 := vloc__worker_119
                let expr_145 := _30
                let _31 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_144,expr_145)
                update_storage_value_offset_0t_uint256_to_t_uint256(_31, expr_147)
                let expr_148 := expr_147
                let _32 := vloc__worker_119
                let expr_151 := _32
                let _33 := 0xdecaaccf65fa0157d575425d16efcccc089f3df91ee0abedec8d1def2f12ab39
                {
                    let _34 := mload(64)
                    let _35 := abi_encode_tuple_t_address__to_t_address__fromStack(_34 , expr_151)
                    log1(_34, sub(_35, _34) , _33)
                }let expr_154 := 0x01
                vloc__122 := expr_154
                leave

            }

            function fun_allWorkers_117() -> vloc_result_80_mpos {
                let zero_value_for_type_t_array$_t_address_$dyn_memory_ptr_9_mpos := zero_value_for_split_t_array$_t_address_$dyn_memory_ptr()
                vloc_result_80_mpos := zero_value_for_type_t_array$_t_address_$dyn_memory_ptr_9_mpos

                let _10_slot := 0x02
                let expr_86_slot := _10_slot
                let expr_87 := array_length_t_array$_t_address_$dyn_storage(expr_86_slot)
                let expr_88 := 0x01
                let expr_89 := checked_sub_t_uint256(expr_87, convert_t_rational_1_by_1_to_t_uint256(expr_88))

                let expr_90_mpos := allocate_and_zero_memory_array_t_array$_t_address_$dyn_memory_ptr(expr_89)
                vloc_result_80_mpos := expr_90_mpos
                for {
                    let expr_95 := 0x01
                    let vloc_i_94 := convert_t_rational_1_by_1_to_t_uint256(expr_95)
                    } 1 {
                    let _12 := vloc_i_94
                    let _11 := increment_t_uint256(_12)
                    vloc_i_94 := _11
                    let expr_102 := _12
                }
                {
                    let _13 := vloc_i_94
                    let expr_97 := _13
                    let _14_slot := 0x02
                    let expr_98_slot := _14_slot
                    let expr_99 := array_length_t_array$_t_address_$dyn_storage(expr_98_slot)
                    let expr_100 := lt(cleanup_t_uint256(expr_97), cleanup_t_uint256(expr_99))
                    if iszero(expr_100) { break }
                    let _15_slot := 0x02
                    let expr_109_slot := _15_slot
                    let _16 := vloc_i_94
                    let expr_110 := _16

                    let _17, _18 := storage_array_index_access_t_array$_t_address_$dyn_storage(expr_109_slot, expr_110)
                    let _19 := read_from_storage_split_dynamic_t_address(_17, _18)
                    let expr_111 := _19
                    let _20_mpos := vloc_result_80_mpos
                    let expr_104_mpos := _20_mpos
                    let _21 := vloc_i_94
                    let expr_105 := _21
                    let expr_106 := 0x01
                    let expr_107 := checked_sub_t_uint256(expr_105, convert_t_rational_1_by_1_to_t_uint256(expr_106))

                    let _22 := expr_111
                    write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_104_mpos, expr_107), _22)
                    let expr_112 := expr_111
                }

            }

            function fun_isWorker_76(vloc__worker_64) -> vloc__67 {
                let zero_value_for_type_t_bool_4 := zero_value_for_split_t_bool()
                vloc__67 := zero_value_for_type_t_bool_4

                let _5 := 0x01
                let expr_69 := _5
                let _6 := vloc__worker_64
                let expr_70 := _6
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_69,expr_70)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_71 := _8
                let expr_72 := 0x00
                let expr_73 := iszero(eq(cleanup_t_uint256(expr_71), convert_t_rational_0_by_1_to_t_uint256(expr_72)))
                vloc__67 := expr_73
                leave

            }

            function fun_removeWorker_214(vloc__worker_159) -> vloc__162 {
                let zero_value_for_type_t_bool_36 := zero_value_for_split_t_bool()
                vloc__162 := zero_value_for_type_t_bool_36

                let expr_165_functionIdentifier := 76
                let _37 := vloc__worker_159
                let expr_166 := _37
                let expr_167 := fun_isWorker_76(expr_166)
                require_helper(expr_167)
                let _38 := 0x01
                let expr_172 := _38
                let _39 := vloc__worker_159
                let expr_173 := _39
                let _40 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_172,expr_173)
                let _41 := read_from_storage_split_offset_0_t_uint256(_40)
                let expr_174 := _41
                let vloc_index_171 := expr_174
                let _42_slot := 0x02
                let expr_178_slot := _42_slot
                let _43_slot := 0x02
                let expr_179_slot := _43_slot
                let expr_180 := array_length_t_array$_t_address_$dyn_storage(expr_179_slot)
                let expr_181 := 0x01
                let expr_182 := checked_sub_t_uint256(expr_180, convert_t_rational_1_by_1_to_t_uint256(expr_181))

                let _44, _45 := storage_array_index_access_t_array$_t_address_$dyn_storage(expr_178_slot, expr_182)
                let _46 := read_from_storage_split_dynamic_t_address(_44, _45)
                let expr_183 := _46
                let vloc_lastWorker_177 := expr_183
                let _47 := vloc_index_171
                let expr_188 := _47
                let _48 := 0x01
                let expr_185 := _48
                let _49 := vloc_lastWorker_177
                let expr_186 := _49
                let _50 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_185,expr_186)
                update_storage_value_offset_0t_uint256_to_t_uint256(_50, expr_188)
                let expr_189 := expr_188
                let _51 := vloc_lastWorker_177
                let expr_194 := _51
                let _52_slot := 0x02
                let expr_191_slot := _52_slot
                let _53 := vloc_index_171
                let expr_192 := _53

                let _54, _55 := storage_array_index_access_t_array$_t_address_$dyn_storage(expr_191_slot, expr_192)
                update_storage_value_t_address_to_t_address(_54, _55, expr_194)
                let expr_195 := expr_194
                let _56_slot := 0x02
                let expr_197_slot := _56_slot
                let expr_199_slot := expr_197_slot
                let _57, _58 := array_push_zero_t_array$_t_address_$dyn_storage(expr_199_slot)
                let _59 := read_from_storage_split_dynamic_t_address(_57, _58)
                let expr_200 := _59
                let _60 := 0x01
                let expr_202 := _60
                let _61 := vloc__worker_159
                let expr_203 := _61
                let _62 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_202,expr_203)
                storage_set_to_zero_t_uint256(_62, 0)
                let _63 := vloc__worker_159
                let expr_208 := _63
                let _64 := 0x3edc40c0328998eaea1b10228950034eb711623f80702c71897e856964c203c3
                {
                    let _65 := mload(64)
                    let _66 := abi_encode_tuple_t_address__to_t_address__fromStack(_65 , expr_208)
                    log1(_65, sub(_66, _65) , _64)
                }let expr_211 := 0x01
                vloc__162 := expr_211
                leave

            }

            function fun_setOwner_35(vloc__owner_14) -> vloc__17 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__17 := zero_value_for_type_t_bool_1

                let _2 := vloc__owner_14
                let expr_20 := _2
                let expr_23 := 0x00
                let expr_24 := convert_t_rational_0_by_1_to_t_address_payable(expr_23)
                let expr_25 := iszero(eq(cleanup_t_address(expr_20), convert_t_address_payable_to_t_address(expr_24)))
                require_helper(expr_25)
                let _3 := vloc__owner_14
                let expr_29 := _3
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_29)
                let expr_30 := expr_29
                let expr_32 := 0x01
                vloc__17 := expr_32
                leave

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_address_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
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

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

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

            function storage_array_index_access_t_array$_t_address_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_address_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_address_$dyn_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function storage_set_to_zero_t_uint256(slot, offset) {
                update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_value_for_split_t_uint256())
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

            function update_byte_slice_dynamic20(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
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

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_t_address_to_t_address(slot, offset, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_dynamic20(sload(slot), offset, prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function write_to_memory_t_address(memPtr, value) {
                mstore(memPtr, cleanup_t_address(value))
            }

            function zero_memory_chunk_t_address(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function zero_value_for_split_t_array$_t_address_$dyn_memory_ptr() -> ret {
                ret := 96
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

