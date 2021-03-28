/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "StandardToken_444" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_StandardToken_444()

        codecopy(0, dataoffset("StandardToken_444_deployed"), datasize("StandardToken_444_deployed"))

        return(0, datasize("StandardToken_444_deployed"))

        function constructor_BasicToken_158() {

            constructor_ERC20_198()

        }

        function constructor_ERC20Basic_72() {

        }

        function constructor_ERC20_198() {

            constructor_ERC20Basic_72()

        }

        function constructor_StandardToken_444() {

            constructor_BasicToken_158()

        }

    }
    object "StandardToken_444_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x095ea7b3
                {
                    // approve(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_approve_324(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_totalSupply_47()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transferFrom_294(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x66188463
                {
                    // decreaseApproval(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_decreaseApproval_443(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_157(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_144(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd73dd623
                {
                    // increaseApproval(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_increaseApproval_383(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdd62ed3e
                {
                    // allowance(address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    let ret_0 :=  fun_allowance_342(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
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

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
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

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_add_44(vloc_a_22, vloc_b_24) -> vloc__27 {
                let zero_value_for_type_t_uint256_32 := zero_value_for_split_t_uint256()
                vloc__27 := zero_value_for_type_t_uint256_32

                let _33 := vloc_a_22
                let expr_31 := _33
                let _34 := vloc_b_24
                let expr_32 := _34
                let expr_33 := checked_add_t_uint256(expr_31, expr_32)

                let vloc_c_30 := expr_33
                let _35 := vloc_c_30
                let expr_36 := _35
                let _36 := vloc_a_22
                let expr_37 := _36
                let expr_38 := iszero(lt(cleanup_t_uint256(expr_36), cleanup_t_uint256(expr_37)))
                assert_helper(expr_38)
                let _37 := vloc_c_30
                let expr_41 := _37
                vloc__27 := expr_41
                leave

            }

            function fun_allowance_342(vloc__owner_327, vloc__spender_329) -> vloc__333 {
                let zero_value_for_type_t_uint256_104 := zero_value_for_split_t_uint256()
                vloc__333 := zero_value_for_type_t_uint256_104

                let _105 := 0x02
                let expr_335 := _105
                let _106 := vloc__owner_327
                let expr_336 := _106
                let _107 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_335,expr_336)
                let _108 := _107
                let expr_337 := _108
                let _109 := vloc__spender_329
                let expr_338 := _109
                let _110 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_337,expr_338)
                let _111 := read_from_storage_split_offset_0_t_uint256(_110)
                let expr_339 := _111
                vloc__333 := expr_339
                leave

            }

            function fun_approve_324(vloc__spender_297, vloc__value_299) -> vloc__303 {
                let zero_value_for_type_t_bool_91 := zero_value_for_split_t_bool()
                vloc__303 := zero_value_for_type_t_bool_91

                let _92 := vloc__value_299
                let expr_311 := _92
                let _93 := 0x02
                let expr_305 := _93
                let expr_307 := caller()
                let _94 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_305,expr_307)
                let _95 := _94
                let expr_309 := _95
                let _96 := vloc__spender_297
                let expr_308 := _96
                let _97 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_309,expr_308)
                update_storage_value_offset_0t_uint256_to_t_uint256(_97, expr_311)
                let expr_312 := expr_311
                let expr_316 := caller()
                let _98 := vloc__spender_297
                let expr_317 := _98
                let _99 := vloc__value_299
                let expr_318 := _99
                let _100 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _101 := convert_t_address_payable_to_t_address(expr_316)
                {
                    let _102 := mload(64)
                    let _103 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_102 , expr_318)
                    log3(_102, sub(_103, _102) , _100, _101, expr_317)
                }let expr_321 := 0x01
                vloc__303 := expr_321
                leave

            }

            function fun_balanceOf_157(vloc__owner_146) -> vloc_balance_150 {
                let zero_value_for_type_t_uint256_38 := zero_value_for_split_t_uint256()
                vloc_balance_150 := zero_value_for_type_t_uint256_38

                let _39 := 0x01
                let expr_152 := _39
                let _40 := vloc__owner_146
                let expr_153 := _40
                let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_152,expr_153)
                let _42 := read_from_storage_split_offset_0_t_uint256(_41)
                let expr_154 := _42
                vloc_balance_150 := expr_154
                leave

            }

            function fun_decreaseApproval_443(vloc__spender_386, vloc__subtractedValue_388) -> vloc__391 {
                let zero_value_for_type_t_bool_136 := zero_value_for_split_t_bool()
                vloc__391 := zero_value_for_type_t_bool_136

                let _137 := 0x02
                let expr_395 := _137
                let expr_397 := caller()
                let _138 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_395,expr_397)
                let _139 := _138
                let expr_398 := _139
                let _140 := vloc__spender_386
                let expr_399 := _140
                let _141 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_398,expr_399)
                let _142 := read_from_storage_split_offset_0_t_uint256(_141)
                let expr_400 := _142
                let vloc_oldValue_394 := expr_400
                let _143 := vloc__subtractedValue_388
                let expr_402 := _143
                let _144 := vloc_oldValue_394
                let expr_403 := _144
                let expr_404 := gt(cleanup_t_uint256(expr_402), cleanup_t_uint256(expr_403))
                switch expr_404
                case 0 {
                    let _145 := vloc_oldValue_394
                    let expr_421 := _145
                    let _146 := vloc__subtractedValue_388
                    let expr_422 := _146
                    let expr_423 := checked_sub_t_uint256(expr_421, expr_422)

                    let _147 := 0x02
                    let expr_415 := _147
                    let expr_417 := caller()
                    let _148 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_415,expr_417)
                    let _149 := _148
                    let expr_419 := _149
                    let _150 := vloc__spender_386
                    let expr_418 := _150
                    let _151 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_419,expr_418)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_151, expr_423)
                    let expr_424 := expr_423
                }
                default {
                    let expr_411 := 0x00
                    let _152 := convert_t_rational_0_by_1_to_t_uint256(expr_411)
                    let _153 := 0x02
                    let expr_405 := _153
                    let expr_407 := caller()
                    let _154 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_405,expr_407)
                    let _155 := _154
                    let expr_409 := _155
                    let _156 := vloc__spender_386
                    let expr_408 := _156
                    let _157 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_409,expr_408)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_157, _152)
                    let expr_412 := _152
                }
                let expr_430 := caller()
                let _158 := vloc__spender_386
                let expr_431 := _158
                let _159 := 0x02
                let expr_432 := _159
                let expr_434 := caller()
                let _160 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_432,expr_434)
                let _161 := _160
                let expr_435 := _161
                let _162 := vloc__spender_386
                let expr_436 := _162
                let _163 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_435,expr_436)
                let _164 := read_from_storage_split_offset_0_t_uint256(_163)
                let expr_437 := _164
                let _165 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _166 := convert_t_address_payable_to_t_address(expr_430)
                {
                    let _167 := mload(64)
                    let _168 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_167 , expr_437)
                    log3(_167, sub(_168, _167) , _165, _166, expr_431)
                }let expr_440 := 0x01
                vloc__391 := expr_440
                leave

            }

            function fun_increaseApproval_383(vloc__spender_345, vloc__addedValue_347) -> vloc__350 {
                let zero_value_for_type_t_bool_112 := zero_value_for_split_t_bool()
                vloc__350 := zero_value_for_type_t_bool_112

                let _113 := 0x02
                let expr_358 := _113
                let expr_360 := caller()
                let _114 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_358,expr_360)
                let _115 := _114
                let expr_361 := _115
                let _116 := vloc__spender_345
                let expr_362 := _116
                let _117 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_361,expr_362)
                let _118 := read_from_storage_split_offset_0_t_uint256(_117)
                let expr_363 := _118
                let _119 := vloc__addedValue_347
                let expr_364 := _119
                let expr_365 := checked_add_t_uint256(expr_363, expr_364)

                let _120 := 0x02
                let expr_352 := _120
                let expr_354 := caller()
                let _121 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_352,expr_354)
                let _122 := _121
                let expr_356 := _122
                let _123 := vloc__spender_345
                let expr_355 := _123
                let _124 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_356,expr_355)
                update_storage_value_offset_0t_uint256_to_t_uint256(_124, expr_365)
                let expr_366 := expr_365
                let expr_370 := caller()
                let _125 := vloc__spender_345
                let expr_371 := _125
                let _126 := 0x02
                let expr_372 := _126
                let expr_374 := caller()
                let _127 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_372,expr_374)
                let _128 := _127
                let expr_375 := _128
                let _129 := vloc__spender_345
                let expr_376 := _129
                let _130 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_375,expr_376)
                let _131 := read_from_storage_split_offset_0_t_uint256(_130)
                let expr_377 := _131
                let _132 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _133 := convert_t_address_payable_to_t_address(expr_370)
                {
                    let _134 := mload(64)
                    let _135 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_134 , expr_377)
                    log3(_134, sub(_135, _134) , _132, _133, expr_371)
                }let expr_380 := 0x01
                vloc__350 := expr_380
                leave

            }

            function fun_sub_20(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_27 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_27

                let _28 := vloc_b_4
                let expr_10 := _28
                let _29 := vloc_a_2
                let expr_11 := _29
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                assert_helper(expr_12)
                let _30 := vloc_a_2
                let expr_15 := _30
                let _31 := vloc_b_4
                let expr_16 := _31
                let expr_17 := checked_sub_t_uint256(expr_15, expr_16)

                vloc__7 := expr_17
                leave

            }

            function fun_transferFrom_294(vloc__from_211, vloc__to_213, vloc__value_215) -> vloc__219 {
                let zero_value_for_type_t_bool_43 := zero_value_for_split_t_bool()
                vloc__219 := zero_value_for_type_t_bool_43

                let _44 := vloc__to_213
                let expr_222 := _44
                let expr_225 := 0x00
                let expr_226 := convert_t_rational_0_by_1_to_t_address_payable(expr_225)
                let expr_227 := iszero(eq(cleanup_t_address(expr_222), convert_t_address_payable_to_t_address(expr_226)))
                require_helper(expr_227)
                let _45 := vloc__value_215
                let expr_231 := _45
                let _46 := 0x01
                let expr_232 := _46
                let _47 := vloc__from_211
                let expr_233 := _47
                let _48 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_232,expr_233)
                let _49 := read_from_storage_split_offset_0_t_uint256(_48)
                let expr_234 := _49
                let expr_235 := iszero(gt(cleanup_t_uint256(expr_231), cleanup_t_uint256(expr_234)))
                require_helper(expr_235)
                let _50 := vloc__value_215
                let expr_239 := _50
                let _51 := 0x02
                let expr_240 := _51
                let _52 := vloc__from_211
                let expr_241 := _52
                let _53 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_240,expr_241)
                let _54 := _53
                let expr_242 := _54
                let expr_244 := caller()
                let _55 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_242,expr_244)
                let _56 := read_from_storage_split_offset_0_t_uint256(_55)
                let expr_245 := _56
                let expr_246 := iszero(gt(cleanup_t_uint256(expr_239), cleanup_t_uint256(expr_245)))
                require_helper(expr_246)
                let _57 := 0x01
                let expr_252 := _57
                let _58 := vloc__from_211
                let expr_253 := _58
                let _59 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_252,expr_253)
                let _60 := read_from_storage_split_offset_0_t_uint256(_59)
                let expr_254 := _60
                let _61 := vloc__value_215
                let expr_255 := _61
                let expr_256 := checked_sub_t_uint256(expr_254, expr_255)

                let _62 := 0x01
                let expr_249 := _62
                let _63 := vloc__from_211
                let expr_250 := _63
                let _64 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_249,expr_250)
                update_storage_value_offset_0t_uint256_to_t_uint256(_64, expr_256)
                let expr_257 := expr_256
                let _65 := 0x01
                let expr_262 := _65
                let _66 := vloc__to_213
                let expr_263 := _66
                let _67 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_262,expr_263)
                let _68 := read_from_storage_split_offset_0_t_uint256(_67)
                let expr_264 := _68
                let _69 := vloc__value_215
                let expr_265 := _69
                let expr_266 := checked_add_t_uint256(expr_264, expr_265)

                let _70 := 0x01
                let expr_259 := _70
                let _71 := vloc__to_213
                let expr_260 := _71
                let _72 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_259,expr_260)
                update_storage_value_offset_0t_uint256_to_t_uint256(_72, expr_266)
                let expr_267 := expr_266
                let _73 := 0x02
                let expr_275 := _73
                let _74 := vloc__from_211
                let expr_276 := _74
                let _75 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_275,expr_276)
                let _76 := _75
                let expr_277 := _76
                let expr_279 := caller()
                let _77 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_277,expr_279)
                let _78 := read_from_storage_split_offset_0_t_uint256(_77)
                let expr_280 := _78
                let _79 := vloc__value_215
                let expr_281 := _79
                let expr_282 := checked_sub_t_uint256(expr_280, expr_281)

                let _80 := 0x02
                let expr_269 := _80
                let _81 := vloc__from_211
                let expr_270 := _81
                let _82 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_269,expr_270)
                let _83 := _82
                let expr_273 := _83
                let expr_272 := caller()
                let _84 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_273,expr_272)
                update_storage_value_offset_0t_uint256_to_t_uint256(_84, expr_282)
                let expr_283 := expr_282
                let _85 := vloc__from_211
                let expr_286 := _85
                let _86 := vloc__to_213
                let expr_287 := _86
                let _87 := vloc__value_215
                let expr_288 := _87
                let _88 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                {
                    let _89 := mload(64)
                    let _90 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_89 , expr_288)
                    log3(_89, sub(_90, _89) , _88, expr_286, expr_287)
                }let expr_291 := 0x01
                vloc__219 := expr_291
                leave

            }

            function fun_transfer_144(vloc__to_84, vloc__value_86) -> vloc__90 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__90 := zero_value_for_type_t_bool_1

                let _2 := vloc__to_84
                let expr_93 := _2
                let expr_96 := 0x00
                let expr_97 := convert_t_rational_0_by_1_to_t_address_payable(expr_96)
                let expr_98 := iszero(eq(cleanup_t_address(expr_93), convert_t_address_payable_to_t_address(expr_97)))
                require_helper(expr_98)
                let _3 := vloc__value_86
                let expr_102 := _3
                let _4 := 0x01
                let expr_103 := _4
                let expr_105 := caller()
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_103,expr_105)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                let expr_106 := _6
                let expr_107 := iszero(gt(cleanup_t_uint256(expr_102), cleanup_t_uint256(expr_106)))
                require_helper(expr_107)
                let _7 := 0x01
                let expr_114 := _7
                let expr_116 := caller()
                let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_114,expr_116)
                let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                let expr_117 := _9
                let _10 := vloc__value_86
                let expr_119 := _10
                let expr_120 := fun_sub_20(expr_117, expr_119)
                let _11 := 0x01
                let expr_110 := _11
                let expr_112 := caller()
                let _12 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_110,expr_112)
                update_storage_value_offset_0t_uint256_to_t_uint256(_12, expr_120)
                let expr_121 := expr_120
                let _13 := 0x01
                let expr_126 := _13
                let _14 := vloc__to_84
                let expr_127 := _14
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_126,expr_127)
                let _16 := read_from_storage_split_offset_0_t_uint256(_15)
                let expr_128 := _16
                let _17 := vloc__value_86
                let expr_130 := _17
                let expr_131 := fun_add_44(expr_128, expr_130)
                let _18 := 0x01
                let expr_123 := _18
                let _19 := vloc__to_84
                let expr_124 := _19
                let _20 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_123,expr_124)
                update_storage_value_offset_0t_uint256_to_t_uint256(_20, expr_131)
                let expr_132 := expr_131
                let expr_136 := caller()
                let _21 := vloc__to_84
                let expr_137 := _21
                let _22 := vloc__value_86
                let expr_138 := _22
                let _23 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _24 := convert_t_address_payable_to_t_address(expr_136)
                {
                    let _25 := mload(64)
                    let _26 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_25 , expr_138)
                    log3(_25, sub(_26, _25) , _23, _24, expr_137)
                }let expr_141 := 0x01
                vloc__90 := expr_141
                leave

            }

            function getter_fun_totalSupply_47() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
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

