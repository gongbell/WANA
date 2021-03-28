/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Freeze_480" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Freeze_480()

        codecopy(0, dataoffset("Freeze_480_deployed"), datasize("Freeze_480_deployed"))

        return(0, datasize("Freeze_480_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Freeze_480() {

            let expr_121 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_121)
            let expr_122 := expr_121

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_address_payable(value) -> ret {
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

    }
    object "Freeze_480_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x835fc6ca
                {
                    // withdrawal(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_withdrawal_292(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x864c2e94
                {
                    // service_founder()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_service_founder_112()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x94a5cccb
                {
                    // deposit_period(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_deposit_period_163(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_transfer_382(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb6b55f25
                {
                    // deposit(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_deposit_217(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_144()
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocate_memory_struct_t_struct$_deposit_st_$102_storage_ptr() -> memPtr {
                memPtr := allocateMemory(64)
            }

            function array_dataslot_t_array$_t_uint256_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_uint256_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_pop_t_array$_t_uint256_$dyn_storage(array) {
                let oldLen := array_length_t_array$_t_uint256_$dyn_storage(array)
                if iszero(oldLen) { panic_error() }
                let newLen := sub(oldLen, 1)
                let slot, offset := storage_array_index_access_t_array$_t_uint256_$dyn_storage(array, newLen)
                storage_set_to_zero_t_uint256(slot, offset)
                sstore(array, newLen)
            }
            function array_push_t_array$_t_uint256_$dyn_storage(array, value) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_uint256_$dyn_storage(array, oldLen)
                update_storage_value_t_uint256_to_t_uint256(slot, offset, value)

            }
            function assert_helper(condition) {
                if iszero(condition) { panic_error() }
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }

                r := div(x, y)
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

                product := mul(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_address_payable(value) -> cleaned {
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

            function convert_t_rational_200_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_deposit_217(vloc_term_165) {

                let expr_171 := callvalue()
                let vloc_amount_169 := expr_171
                let expr_175 := caller()
                let expr_178 := 0x00
                let expr_179 := convert_t_rational_0_by_1_to_t_address_payable(expr_178)
                let expr_180 := iszero(eq(cleanup_t_address_payable(expr_175), cleanup_t_address_payable(expr_179)))
                require_helper(expr_180)
                let _3 := vloc_amount_169
                let expr_184 := _3
                let expr_185 := 0x00
                let expr_186 := gt(cleanup_t_uint256(expr_184), convert_t_rational_0_by_1_to_t_uint256(expr_185))
                require_helper(expr_186)
                let _4 := vloc_amount_169
                let expr_191 := _4
                let expr_193 := 0xc8
                let _5 := convert_t_rational_200_by_1_to_t_uint256(expr_193)
                let expr_194 := fun_div_49(expr_191, _5)
                let vloc_fee_190 := expr_194
                let _6 := vloc_amount_169
                let expr_198 := _6
                let _7 := vloc_fee_190
                let expr_200 := _7
                let expr_201 := fun_sub_69(expr_198, expr_200)
                let vloc_amount_of_deposit_197 := expr_201
                let _8 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_203 := _8
                let expr_205_address := convert_t_address_payable_to_t_address(expr_203)
                let _9 := vloc_fee_190
                let expr_206 := _9

                let _10 := 0
                if iszero(expr_206) { _10 := 2300 }
                let _11 := call(_10, expr_205_address, expr_206, 0, 0, 0, 0)

                if iszero(_11) { revert_forward_1() }

                let expr_209_functionIdentifier := 431
                let expr_211 := caller()
                let _12 := vloc_amount_of_deposit_197
                let expr_212 := _12
                let _13 := vloc_term_165
                let expr_213 := _13
                let _14 := convert_t_address_payable_to_t_address(expr_211)
                fun_deposit_to_address_431(_14, expr_212, expr_213)

            }

            function fun_deposit_period_163(vloc_number_of_days_146) {

                let expr_152 := timestamp()
                let _1 := vloc_number_of_days_146
                let expr_153 := _1
                let expr_154 := 0x015180
                let expr_155 := checked_mul_t_uint256(expr_153, convert_t_rational_86400_by_1_to_t_uint256(expr_154))

                let expr_156 := checked_add_t_uint256(expr_152, expr_155)

                let vloc_term_150 := expr_156
                let expr_158_functionIdentifier := 217
                let _2 := vloc_term_150
                let expr_159 := _2
                fun_deposit_217(expr_159)

            }

            function fun_deposit_to_address_431(vloc_account_384, vloc__amount_386, vloc__term_388) {

                let expr_394 := timestamp()
                let vloc_currenttime_392 := expr_394
                for {
                    } 1 {
                }
                {
                    let _133 := 0x01
                    let expr_396 := _133
                    let _134 := vloc_account_384
                    let expr_397 := _134
                    let _135 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_396,expr_397)
                    let _136_slot := _135
                    let expr_398_slot := _136_slot
                    let _137 := add(expr_398_slot, 1)
                    let _138 := _137
                    let expr_399 := _138
                    let _139 := vloc_currenttime_392
                    let expr_400 := _139
                    let _140 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_399,expr_400)
                    let _141_slot := _140
                    let expr_401_slot := _141_slot
                    let _142 := add(expr_401_slot, 0)
                    let _143 := read_from_storage_split_offset_0_t_uint256(_142)
                    let expr_402 := _143
                    let expr_403 := 0x00
                    let expr_404 := gt(cleanup_t_uint256(expr_402), convert_t_rational_0_by_1_to_t_uint256(expr_403))
                    if iszero(expr_404) { break }
                    let _145 := vloc_currenttime_392
                    let _144 := increment_t_uint256(_145)
                    vloc_currenttime_392 := _144
                    let expr_406 := _145
                }
                let _146 := vloc__amount_386
                let expr_417 := _146
                let _147 := vloc__term_388
                let expr_418 := _147
                let expr_419_mpos := allocate_memory_struct_t_struct$_deposit_st_$102_storage_ptr()
                write_to_memory_t_uint256(add(expr_419_mpos, 0), expr_417)
                write_to_memory_t_uint256(add(expr_419_mpos, 32), expr_418)
                let _148 := 0x01
                let expr_410 := _148
                let _149 := vloc_account_384
                let expr_411 := _149
                let _150 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_410,expr_411)
                let _151_slot := _150
                let expr_412_slot := _151_slot
                let _152 := add(expr_412_slot, 1)
                let _153 := _152
                let expr_413 := _153
                let _154 := vloc_currenttime_392
                let expr_414 := _154
                let _155 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_413,expr_414)
                update_storage_value_offset_0t_struct$_deposit_st_$102_memory_ptr_to_t_struct$_deposit_st_$102_storage(_155, expr_419_mpos)
                let _156 := 0x01
                let expr_422 := _156
                let _157 := vloc_account_384
                let expr_423 := _157
                let _158 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_422,expr_423)
                let _159_slot := _158
                let expr_424_slot := _159_slot
                let _160 := add(expr_424_slot, 0)
                let _161_slot := _160
                let expr_425_slot := _161_slot
                let expr_426_slot := expr_425_slot
                let _162 := vloc_currenttime_392
                let expr_427 := _162
                array_push_t_array$_t_uint256_$dyn_storage(expr_426_slot, expr_427)

            }

            function fun_div_49(vloc_a_33, vloc_b_35) -> vloc__38 {
                let zero_value_for_type_t_uint256_15 := zero_value_for_split_t_uint256()
                vloc__38 := zero_value_for_type_t_uint256_15

                let _16 := vloc_a_33
                let expr_42 := _16
                let _17 := vloc_b_35
                let expr_43 := _17
                let expr_44 := checked_div_t_uint256(expr_42, expr_43)

                let vloc_c_41 := expr_44
                let _18 := vloc_c_41
                let expr_46 := _18
                vloc__38 := expr_46
                leave

            }

            function fun_func_144() {

                let expr_130 := caller()
                let expr_133 := 0x00
                let expr_134 := convert_t_rational_0_by_1_to_t_address_payable(expr_133)
                let expr_135 := iszero(eq(cleanup_t_address_payable(expr_130), cleanup_t_address_payable(expr_134)))
                require_helper(expr_135)
                let expr_138_functionIdentifier := 217
                let expr_140 := timestamp()
                fun_deposit_217(expr_140)

            }

            function fun_remove_deposit_479(vloc_account_433, vloc_index_435) {

                let _163 := 0x01
                let expr_440 := _163
                let _164 := vloc_account_433
                let expr_441 := _164
                let _165 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_440,expr_441)
                let _166_slot := _165
                let expr_442_slot := _166_slot
                let _167 := add(expr_442_slot, 0)
                let _168_slot := _167
                let expr_443_slot := _168_slot
                let _169 := vloc_index_435
                let expr_444 := _169

                let _170, _171 := storage_array_index_access_t_array$_t_uint256_$dyn_storage(expr_443_slot, expr_444)
                let _172 := read_from_storage_split_dynamic_t_uint256(_170, _171)
                let expr_445 := _172
                let vloc_createtime_439 := expr_445
                let _173 := 0x01
                let expr_449 := _173
                let _174 := vloc_account_433
                let expr_450 := _174
                let _175 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_449,expr_450)
                let _176_slot := _175
                let expr_451_slot := _176_slot
                let _177 := add(expr_451_slot, 0)
                let _178_slot := _177
                let expr_452_slot := _178_slot
                let expr_453 := array_length_t_array$_t_uint256_$dyn_storage(expr_452_slot)
                let vloc_count_448 := expr_453
                let _179 := 0x01
                let expr_461 := _179
                let _180 := vloc_account_433
                let expr_462 := _180
                let _181 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_461,expr_462)
                let _182_slot := _181
                let expr_463_slot := _182_slot
                let _183 := add(expr_463_slot, 0)
                let _184_slot := _183
                let expr_464_slot := _184_slot
                let _185 := vloc_count_448
                let expr_465 := _185
                let expr_466 := 0x01
                let expr_467 := checked_sub_t_uint256(expr_465, convert_t_rational_1_by_1_to_t_uint256(expr_466))

                let _186, _187 := storage_array_index_access_t_array$_t_uint256_$dyn_storage(expr_464_slot, expr_467)
                let _188 := read_from_storage_split_dynamic_t_uint256(_186, _187)
                let expr_468 := _188
                let _189 := 0x01
                let expr_455 := _189
                let _190 := vloc_account_433
                let expr_456 := _190
                let _191 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_455,expr_456)
                let _192_slot := _191
                let expr_457_slot := _192_slot
                let _193 := add(expr_457_slot, 0)
                let _194_slot := _193
                let expr_458_slot := _194_slot
                let _195 := vloc_index_435
                let expr_459 := _195

                let _196, _197 := storage_array_index_access_t_array$_t_uint256_$dyn_storage(expr_458_slot, expr_459)
                update_storage_value_t_uint256_to_t_uint256(_196, _197, expr_468)
                let expr_469 := expr_468
                let _198 := 0x01
                let expr_471 := _198
                let _199 := vloc_account_433
                let expr_472 := _199
                let _200 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(expr_471,expr_472)
                let _201_slot := _200
                let expr_473_slot := _201_slot
                let _202 := add(expr_473_slot, 0)
                let _203_slot := _202
                let expr_474_slot := _203_slot
                let expr_475_slot := expr_474_slot
                array_pop_t_array$_t_uint256_$dyn_storage(expr_475_slot)

            }

            function fun_sub_69(vloc_a_51, vloc_b_53) -> vloc__56 {
                let zero_value_for_type_t_uint256_19 := zero_value_for_split_t_uint256()
                vloc__56 := zero_value_for_type_t_uint256_19

                let _20 := vloc_b_53
                let expr_59 := _20
                let _21 := vloc_a_51
                let expr_60 := _21
                let expr_61 := iszero(gt(cleanup_t_uint256(expr_59), cleanup_t_uint256(expr_60)))
                assert_helper(expr_61)
                let _22 := vloc_a_51
                let expr_64 := _22
                let _23 := vloc_b_53
                let expr_65 := _23
                let expr_66 := checked_sub_t_uint256(expr_64, expr_65)

                vloc__56 := expr_66
                leave

            }

            function fun_transfer_382(vloc_to_294, vloc_index_296) {

                let _73 := vloc_index_296
                let expr_300 := _73
                let _74 := 0x01
                let expr_301 := _74
                let expr_303 := caller()
                let _75 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_301,expr_303)
                let _76_slot := _75
                let expr_304_slot := _76_slot
                let _77 := add(expr_304_slot, 0)
                let _78_slot := _77
                let expr_305_slot := _78_slot
                let expr_306 := array_length_t_array$_t_uint256_$dyn_storage(expr_305_slot)
                let expr_307 := lt(cleanup_t_uint256(expr_300), cleanup_t_uint256(expr_306))
                require_helper(expr_307)
                let _79 := 0x01
                let expr_312 := _79
                let expr_314 := caller()
                let _80 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_312,expr_314)
                let _81_slot := _80
                let expr_315_slot := _81_slot
                let _82 := add(expr_315_slot, 0)
                let _83_slot := _82
                let expr_316_slot := _83_slot
                let _84 := vloc_index_296
                let expr_317 := _84

                let _85, _86 := storage_array_index_access_t_array$_t_uint256_$dyn_storage(expr_316_slot, expr_317)
                let _87 := read_from_storage_split_dynamic_t_uint256(_85, _86)
                let expr_318 := _87
                let vloc_createtime_311 := expr_318
                let _88 := 0x01
                let expr_321 := _88
                let expr_323 := caller()
                let _89 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_321,expr_323)
                let _90_slot := _89
                let expr_324_slot := _90_slot
                let _91 := add(expr_324_slot, 1)
                let _92 := _91
                let expr_325 := _92
                let _93 := vloc_createtime_311
                let expr_326 := _93
                let _94 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_325,expr_326)
                let _95_slot := _94
                let expr_327_slot := _95_slot
                let _96 := add(expr_327_slot, 0)
                let _97 := read_from_storage_split_offset_0_t_uint256(_96)
                let expr_328 := _97
                let expr_329 := 0x00
                let expr_330 := gt(cleanup_t_uint256(expr_328), convert_t_rational_0_by_1_to_t_uint256(expr_329))
                require_helper(expr_330)
                let _98 := 0x01
                let expr_334 := _98
                let expr_336 := caller()
                let _99 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_334,expr_336)
                let _100_slot := _99
                let expr_337_slot := _100_slot
                let _101 := add(expr_337_slot, 1)
                let _102 := _101
                let expr_338 := _102
                let _103 := vloc_createtime_311
                let expr_339 := _103
                let _104 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_338,expr_339)
                let _105_slot := _104
                let expr_340_slot := _105_slot
                let _106 := add(expr_340_slot, 1)
                let _107 := read_from_storage_split_offset_0_t_uint256(_106)
                let expr_341 := _107
                let expr_343 := timestamp()
                let expr_344 := lt(cleanup_t_uint256(expr_341), cleanup_t_uint256(expr_343))
                require_helper(expr_344)
                let _108 := 0x01
                let expr_349 := _108
                let expr_351 := caller()
                let _109 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_349,expr_351)
                let _110_slot := _109
                let expr_352_slot := _110_slot
                let _111 := add(expr_352_slot, 1)
                let _112 := _111
                let expr_353 := _112
                let _113 := vloc_createtime_311
                let expr_354 := _113
                let _114 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_353,expr_354)
                let _115_slot := _114
                let expr_355_slot := _115_slot
                let _116 := add(expr_355_slot, 0)
                let _117 := read_from_storage_split_offset_0_t_uint256(_116)
                let expr_356 := _117
                let vloc__amount_348 := expr_356
                let _118 := 0x01
                let expr_360 := _118
                let expr_362 := caller()
                let _119 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_360,expr_362)
                let _120_slot := _119
                let expr_363_slot := _120_slot
                let _121 := add(expr_363_slot, 1)
                let _122 := _121
                let expr_364 := _122
                let _123 := vloc_createtime_311
                let expr_365 := _123
                let _124 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_364,expr_365)
                let _125_slot := _124
                let expr_366_slot := _125_slot
                let _126 := add(expr_366_slot, 1)
                let _127 := read_from_storage_split_offset_0_t_uint256(_126)
                let expr_367 := _127
                let vloc__term_359 := expr_367
                let expr_369_functionIdentifier := 479
                let expr_371 := caller()
                let _128 := vloc_index_296
                let expr_372 := _128
                let _129 := convert_t_address_payable_to_t_address(expr_371)
                fun_remove_deposit_479(_129, expr_372)
                let expr_375_functionIdentifier := 431
                let _130 := vloc_to_294
                let expr_376 := _130
                let _131 := vloc__amount_348
                let expr_377 := _131
                let _132 := vloc__term_359
                let expr_378 := _132
                fun_deposit_to_address_431(expr_376, expr_377, expr_378)

            }

            function fun_withdrawal_292(vloc_index_219) {

                let _24 := vloc_index_219
                let expr_223 := _24
                let _25 := 0x01
                let expr_224 := _25
                let expr_226 := caller()
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_224,expr_226)
                let _27_slot := _26
                let expr_227_slot := _27_slot
                let _28 := add(expr_227_slot, 0)
                let _29_slot := _28
                let expr_228_slot := _29_slot
                let expr_229 := array_length_t_array$_t_uint256_$dyn_storage(expr_228_slot)
                let expr_230 := lt(cleanup_t_uint256(expr_223), cleanup_t_uint256(expr_229))
                require_helper(expr_230)
                let _30 := 0x01
                let expr_235 := _30
                let expr_237 := caller()
                let _31 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_235,expr_237)
                let _32_slot := _31
                let expr_238_slot := _32_slot
                let _33 := add(expr_238_slot, 0)
                let _34_slot := _33
                let expr_239_slot := _34_slot
                let _35 := vloc_index_219
                let expr_240 := _35

                let _36, _37 := storage_array_index_access_t_array$_t_uint256_$dyn_storage(expr_239_slot, expr_240)
                let _38 := read_from_storage_split_dynamic_t_uint256(_36, _37)
                let expr_241 := _38
                let vloc_createtime_234 := expr_241
                let _39 := 0x01
                let expr_244 := _39
                let expr_246 := caller()
                let _40 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_244,expr_246)
                let _41_slot := _40
                let expr_247_slot := _41_slot
                let _42 := add(expr_247_slot, 1)
                let _43 := _42
                let expr_248 := _43
                let _44 := vloc_createtime_234
                let expr_249 := _44
                let _45 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_248,expr_249)
                let _46_slot := _45
                let expr_250_slot := _46_slot
                let _47 := add(expr_250_slot, 0)
                let _48 := read_from_storage_split_offset_0_t_uint256(_47)
                let expr_251 := _48
                let expr_252 := 0x00
                let expr_253 := gt(cleanup_t_uint256(expr_251), convert_t_rational_0_by_1_to_t_uint256(expr_252))
                require_helper(expr_253)
                let _49 := 0x01
                let expr_257 := _49
                let expr_259 := caller()
                let _50 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_257,expr_259)
                let _51_slot := _50
                let expr_260_slot := _51_slot
                let _52 := add(expr_260_slot, 1)
                let _53 := _52
                let expr_261 := _53
                let _54 := vloc_createtime_234
                let expr_262 := _54
                let _55 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_261,expr_262)
                let _56_slot := _55
                let expr_263_slot := _56_slot
                let _57 := add(expr_263_slot, 1)
                let _58 := read_from_storage_split_offset_0_t_uint256(_57)
                let expr_264 := _58
                let expr_266 := timestamp()
                let expr_267 := lt(cleanup_t_uint256(expr_264), cleanup_t_uint256(expr_266))
                require_helper(expr_267)
                let expr_273 := caller()
                let expr_274_address := convert_t_address_payable_to_t_address(expr_273)
                let _59 := 0x01
                let expr_275 := _59
                let expr_277 := caller()
                let _60 := mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(expr_275,expr_277)
                let _61_slot := _60
                let expr_278_slot := _61_slot
                let _62 := add(expr_278_slot, 1)
                let _63 := _62
                let expr_279 := _63
                let _64 := vloc_createtime_234
                let expr_280 := _64
                let _65 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(expr_279,expr_280)
                let _66_slot := _65
                let expr_281_slot := _66_slot
                let _67 := add(expr_281_slot, 0)
                let _68 := read_from_storage_split_offset_0_t_uint256(_67)
                let expr_282 := _68

                let _69 := 0
                if iszero(expr_282) { _69 := 2300 }
                let _70 := call(_69, expr_274_address, expr_282, 0, 0, 0, 0)

                if iszero(_70) { revert_forward_1() }

                let expr_285_functionIdentifier := 479
                let expr_287 := caller()
                let _71 := vloc_index_219
                let expr_288 := _71
                let _72 := convert_t_address_payable_to_t_address(expr_287)
                fun_remove_deposit_479(_72, expr_288)

            }

            function getter_fun_service_founder_112() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_deposit_list_$110_storage_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_deposit_st_$102_storage_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
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

            function storage_set_to_zero_t_uint256(slot, offset) {
                update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_value_for_split_t_uint256())
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

            function update_storage_value_offset_0t_struct$_deposit_st_$102_memory_ptr_to_t_struct$_deposit_st_$102_storage(slot, value) {

                {

                    let memberSlot := add(slot, 0)
                    let memberSrcPtr := add(value, 0)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 1)
                    let memberSrcPtr := add(value, 32)

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

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

