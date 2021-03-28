/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "payrollSystem_237" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_payrollSystem_237()

        codecopy(0, dataoffset("payrollSystem_237_deployed"), datasize("payrollSystem_237_deployed"))

        return(0, datasize("payrollSystem_237_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_payrollSystem_237() {

            let expr_31 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_31)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_32 := _1

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
    object "payrollSystem_237_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_totalSupply_126()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x22003f10
                {
                    // updateSalary(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_updateSalary_101(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3c9266e0
                {
                    // sendSalary(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_sendSalary_223(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x661956fb
                {
                    // depositInvestment()

                    abi_decode_tuple_(4, calldatasize())
                    fun_depositInvestment_114()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_236(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9f8a13d7
                {
                    // isActive(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_isActive_139(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd108177a
                {
                    // removeEmployee(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_removeEmployee_86(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe53cacba
                {
                    // listOutEmployees()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_listOutEmployees_110()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_array$_t_address_$dyn_memory_ptr__to_t_array$_t_address_$dyn_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe7fd9a13
                {
                    // addEmployee(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_addEmployee_73(param_0, param_1)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
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

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encodeUpdatedPos_t_address_to_t_address(value0, pos) -> updatedPos {
                abi_encode_t_address_to_t_address(value0, pos)
                updatedPos := add(pos, 0x20)
            }

            function abi_encodeUpdatedPos_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(value0, pos) -> updatedPos {
                updatedPos := abi_encode_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(value0, pos)
            }

            function abi_encode_t_address_to_t_address(value, pos) {
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

            // address[] -> address[]
            function abi_encode_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(value, pos)  -> end  {
                let length := array_length_t_array$_t_address_$dyn_storage(value)
                pos := array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr(pos, length)
                let baseRef := array_dataslot_t_array$_t_address_$dyn_storage(value)
                let srcPtr := baseRef
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementValue0 := read_from_storage_offset_0_t_address(srcPtr)
                    pos := abi_encodeUpdatedPos_t_address_to_t_address(elementValue0, pos)
                    srcPtr := array_nextElement_t_array$_t_address_$dyn_storage(srcPtr)
                }
                end := pos
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

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

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
            }

            function allocate_memory_struct_t_struct$_employee_$11_memory_ptr() -> memPtr {
                memPtr := allocateMemory(128)
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

            function array_nextElement_t_array$_t_address_$dyn_storage(ptr) -> next {
                next := add(ptr, 0x01)
            }

            function array_push_t_array$_t_address_$dyn_storage(array, value) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_address_$dyn_storage(array, oldLen)
                update_storage_value_t_address_to_t_address(slot, offset, value)

            }
            function array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function array_storeLengthForEncoding_t_array$_t_address_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
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

            function convert_array_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(value) -> converted {

                // Copy the array to a free position in memory

                converted := copy_array_from_storage_to_memory_t_array$_t_address_$dyn_storage(value)

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

            function convert_t_contract$_payrollSystem_$237_to_t_address(value) -> converted {
                converted := convert_t_contract$_payrollSystem_$237_to_t_uint160(value)
            }

            function convert_t_contract$_payrollSystem_$237_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_struct$_employee_$11_storage_to_t_struct$_employee_$11_memory_ptr(value) -> converted {

                converted := read_from_storage_reference_type_t_struct$_employee_$11_memory_ptr(value)

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

            function copy_array_from_storage_to_memory_t_array$_t_address_$dyn_storage(slot) -> memptr {
                memptr := allocateTemporaryMemory()
                let end := abi_encodeUpdatedPos_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(slot, memptr)
                mstore(64, end)
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_1t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_8_unsigned(slot_value))
            }

            function fun_addEmployee_73(vloc_newEmployee_37, vloc_salary_39) {

                let _1 := 0x01
                let expr_44 := _1
                let _2 := vloc_newEmployee_37
                let expr_45 := _2
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_44,expr_45)
                let _4_slot := _3
                let expr_46_slot := _4_slot
                let vloc__employee_43_mpos := convert_t_struct$_employee_$11_storage_to_t_struct$_employee_$11_memory_ptr(expr_46_slot)
                let expr_51 := 0x01
                let _5_mpos := vloc__employee_43_mpos
                let expr_48_mpos := _5_mpos
                let _6 := add(expr_48_mpos, 0)
                let _7 := expr_51
                write_to_memory_t_bool(_6, _7)
                let expr_52 := expr_51
                let _8 := vloc_salary_39
                let expr_57 := _8
                let _9_mpos := vloc__employee_43_mpos
                let expr_54_mpos := _9_mpos
                let _10 := add(expr_54_mpos, 64)
                let _11 := expr_57
                write_to_memory_t_uint256(_10, _11)
                let expr_58 := expr_57
                let expr_63 := 0x00
                let _12 := convert_t_rational_0_by_1_to_t_uint256(expr_63)
                let _13_mpos := vloc__employee_43_mpos
                let expr_60_mpos := _13_mpos
                let _14 := add(expr_60_mpos, 96)
                let _15 := _12
                write_to_memory_t_uint256(_14, _15)
                let expr_64 := _12
                let _16_slot := 0x02
                let expr_66_slot := _16_slot
                let expr_68_slot := expr_66_slot
                let _17 := vloc_newEmployee_37
                let expr_69 := _17
                array_push_t_array$_t_address_$dyn_storage(expr_68_slot, expr_69)

            }

            function fun_balanceOf_236(vloc_empAd_225) -> vloc__228 {
                let zero_value_for_type_t_uint256_87 := zero_value_for_split_t_uint256()
                vloc__228 := zero_value_for_type_t_uint256_87

                let _88 := 0x01
                let expr_230 := _88
                let _89 := vloc_empAd_225
                let expr_231 := _89
                let _90 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_230,expr_231)
                let _91_slot := _90
                let expr_232_slot := _91_slot
                let _92 := add(expr_232_slot, 2)
                let _93 := read_from_storage_split_offset_0_t_uint256(_92)
                let expr_233 := _93
                vloc__228 := expr_233
                leave

            }

            function fun_depositInvestment_114() {

            }

            function fun_isActive_139(vloc_check_128) -> vloc__131 {
                let zero_value_for_type_t_bool_32 := zero_value_for_split_t_bool()
                vloc__131 := zero_value_for_type_t_bool_32

                let _33 := 0x01
                let expr_133 := _33
                let _34 := vloc_check_128
                let expr_134 := _34
                let _35 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_133,expr_134)
                let _36_slot := _35
                let expr_135_slot := _36_slot
                let _37 := add(expr_135_slot, 0)
                let _38 := read_from_storage_split_offset_0_t_bool(_37)
                let expr_136 := _38
                vloc__131 := expr_136
                leave

            }

            function fun_listOutEmployees_110() -> vloc__105_mpos {
                let zero_value_for_type_t_array$_t_address_$dyn_memory_ptr_29_mpos := zero_value_for_split_t_array$_t_address_$dyn_memory_ptr()
                vloc__105_mpos := zero_value_for_type_t_array$_t_address_$dyn_memory_ptr_29_mpos

                let _30_slot := 0x02
                let expr_107_slot := _30_slot
                vloc__105_mpos := convert_array_t_array$_t_address_$dyn_storage_to_t_array$_t_address_$dyn_memory_ptr(expr_107_slot)
                leave

            }

            function fun_removeEmployee_86(vloc__address_75) {

                let expr_82 := 0x00
                let _18 := 0x01
                let expr_78 := _18
                let _19 := vloc__address_75
                let expr_79 := _19
                let _20 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_78,expr_79)
                let _21_slot := _20
                let expr_80_slot := _21_slot
                let _22 := add(expr_80_slot, 0)
                update_storage_value_offset_0t_bool_to_t_bool(_22, expr_82)
                let expr_83 := expr_82

            }

            function fun_sendSalary_223(vloc_sendTo_204) {

                let expr_207_functionIdentifier := 139
                let _39 := vloc_sendTo_204
                let expr_208 := _39
                let expr_209 := fun_isActive_139(expr_208)
                let expr_215 := expr_209
                if expr_215 {
                    let _40 := 0x01
                    let expr_210 := _40
                    let _41 := vloc_sendTo_204
                    let expr_211 := _41
                    let _42 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_210,expr_211)
                    let _43_slot := _42
                    let expr_212_slot := _43_slot
                    let _44 := add(expr_212_slot, 0)
                    let _45 := read_from_storage_split_offset_1_t_bool(_44)
                    let expr_213 := _45
                    let expr_214 := cleanup_t_bool(iszero(expr_213))
                    expr_215 := expr_214
                }
                if expr_215 {
                    let expr_216_functionIdentifier := 186
                    let _46 := vloc_sendTo_204
                    let expr_217 := _46
                    fun_transfer_186(expr_217)
                }

            }

            function fun_totalSupply_126() -> vloc__117 {
                let zero_value_for_type_t_uint256_31 := zero_value_for_split_t_uint256()
                vloc__117 := zero_value_for_type_t_uint256_31

                let expr_121_address := address()
                let expr_122 := convert_t_contract$_payrollSystem_$237_to_t_address(expr_121_address)
                let expr_123 := balance(expr_122)
                vloc__117 := expr_123
                leave

            }

            function fun_transferLog_202(vloc__address_188) {

                let expr_193 := caller()
                let _76 := vloc__address_188
                let expr_194 := _76
                let _77 := 0x01
                let expr_195 := _77
                let _78 := vloc__address_188
                let expr_196 := _78
                let _79 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_195,expr_196)
                let _80_slot := _79
                let expr_197_slot := _80_slot
                let _81 := add(expr_197_slot, 1)
                let _82 := read_from_storage_split_offset_0_t_uint256(_81)
                let expr_198 := _82
                let _83 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _84 := convert_t_address_payable_to_t_address(expr_193)
                {
                    let _85 := mload(64)
                    let _86 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_85 , expr_198)
                    log3(_85, sub(_86, _85) , _83, _84, expr_194)
                }
            }

            function fun_transfer_186(vloc__address_141) {

                let _47 := 0x01
                let expr_144 := _47
                let _48 := vloc__address_141
                let expr_145 := _48
                let _49 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_144,expr_145)
                let _50_slot := _49
                let expr_146_slot := _50_slot
                let _51 := add(expr_146_slot, 1)
                let _52 := read_from_storage_split_offset_0_t_uint256(_51)
                let expr_147 := _52
                let expr_150_address := address()
                let expr_151 := convert_t_contract$_payrollSystem_$237_to_t_address(expr_150_address)
                let expr_152 := balance(expr_151)
                let expr_153 := lt(cleanup_t_uint256(expr_147), cleanup_t_uint256(expr_152))
                switch expr_153
                case 0 {
                    let expr_180 := 0x00
                    let _53 := 0x01
                    let expr_176 := _53
                    let _54 := vloc__address_141
                    let expr_177 := _54
                    let _55 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_176,expr_177)
                    let _56_slot := _55
                    let expr_178_slot := _56_slot
                    let _57 := add(expr_178_slot, 0)
                    update_storage_value_offset_1t_bool_to_t_bool(_57, expr_180)
                    let expr_181 := expr_180
                }
                default {
                    let expr_154_functionIdentifier := 202
                    let _58 := vloc__address_141
                    let expr_155 := _58
                    fun_transferLog_202(expr_155)
                    let expr_162 := 0x01
                    let _59 := 0x01
                    let expr_158 := _59
                    let _60 := vloc__address_141
                    let expr_159 := _60
                    let _61 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_158,expr_159)
                    let _62_slot := _61
                    let expr_160_slot := _62_slot
                    let _63 := add(expr_160_slot, 0)
                    update_storage_value_offset_1t_bool_to_t_bool(_63, expr_162)
                    let expr_163 := expr_162
                    let _64 := 0x01
                    let expr_169 := _64
                    let _65 := vloc__address_141
                    let expr_170 := _65
                    let _66 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_169,expr_170)
                    let _67_slot := _66
                    let expr_171_slot := _67_slot
                    let _68 := add(expr_171_slot, 1)
                    let _69 := read_from_storage_split_offset_0_t_uint256(_68)
                    let expr_172 := _69
                    let _70 := 0x01
                    let expr_165 := _70
                    let _71 := vloc__address_141
                    let expr_166 := _71
                    let _72 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_165,expr_166)
                    let _73_slot := _72
                    let expr_167_slot := _73_slot
                    let _74 := add(expr_167_slot, 2)
                    let _75 := read_from_storage_split_offset_0_t_uint256(_74)
                    expr_172 := checked_add_t_uint256(_75, expr_172)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_74, expr_172)
                    let expr_173 := expr_172
                }

            }

            function fun_updateSalary_101(vloc__address_88, vloc_newSalary_90) {

                let _23 := vloc_newSalary_90
                let expr_97 := _23
                let _24 := 0x01
                let expr_93 := _24
                let _25 := vloc__address_88
                let expr_94 := _25
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(expr_93,expr_94)
                let _27_slot := _26
                let expr_95_slot := _27_slot
                let _28 := add(expr_95_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_28, expr_97)
                let expr_98 := expr_97

            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_employee_$11_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function read_from_storage_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_reference_type_t_struct$_employee_$11_memory_ptr(slot) -> value {
                value := allocate_memory_struct_t_struct$_employee_$11_memory_ptr()

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_bool(add(slot, 0), 0)
                    write_to_memory_t_bool(add(value, 0), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_bool(add(slot, 0), 1)
                    write_to_memory_t_bool(add(value, 32), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 1), 0)
                    write_to_memory_t_uint256(add(value, 64), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 2), 0)
                    write_to_memory_t_uint256(add(value, 96), memberValue_0)
                }

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function read_from_storage_split_offset_1_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_1t_bool(sload(slot))

            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_8(value) -> newValue {
                newValue :=

                shl(8, value)

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

            function shift_right_8_unsigned(value) -> newValue {
                newValue :=

                shr(8, value)

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

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_offset_1t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_1(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_t_address_to_t_address(slot, offset, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_dynamic20(sload(slot), offset, prepare_store_t_address(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function write_to_memory_t_bool(memPtr, value) {
                mstore(memPtr, cleanup_t_bool(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
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

