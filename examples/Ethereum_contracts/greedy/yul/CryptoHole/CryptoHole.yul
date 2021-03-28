/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "CryptoHole_494" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_CryptoHole_494()

        codecopy(0, dataoffset("CryptoHole_494_deployed"), datasize("CryptoHole_494_deployed"))

        return(0, datasize("CryptoHole_494_deployed"))

        function constructor_BasicToken_158() {

            constructor_ERC20_198()

        }

        function constructor_CryptoHole_494() {

            constructor_StandardToken_444()

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
    object "CryptoHole_494_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x06fdde03
                {
                    // name()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_name_449()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

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

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_decimals_455()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
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

                case 0x95d89b41
                {
                    // symbol()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_symbol_452()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
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

                case 0xb7fcc321
                {
                    // CryptoHoleToken()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_CryptoHoleToken_459()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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
            fun__493() stop()

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

            function abi_encode_t_rational_1_by_1_to_t_uint256_fromStack(value, pos) {
                mstore(pos, convert_t_rational_1_by_1_to_t_uint256(value))
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_rational_1_by_1__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_rational_1_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint8__to_t_uint8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function constant_decimals_455() -> ret {
                let expr_454 := 0x00
                let _2 := convert_t_rational_0_by_1_to_t_uint8(expr_454)

                ret := _2
            }

            function constant_name_449() -> ret_mpos {
                let _1_mpos := convert_t_stringliteral_0fb24ed5ea499fde70cb1fd29f89ef2627e5af42875d4eecb4f0e83915754068_to_t_string_memory_ptr()

                ret_mpos := _1_mpos
            }

            function constant_symbol_452() -> ret_mpos {
                let _3_mpos := convert_t_stringliteral_b328e7d573ed54fea94aaaa93c04dbdc63a379138457c28be8f760a82e5097b5_to_t_string_memory_ptr()

                ret_mpos := _3_mpos
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

            function convert_t_rational_0_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_stringliteral_0fb24ed5ea499fde70cb1fd29f89ef2627e5af42875d4eecb4f0e83915754068_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 10)

                mstore(add(converted, 32), "CryptoHole")

            }

            function convert_t_stringliteral_b328e7d573ed54fea94aaaa93c04dbdc63a379138457c28be8f760a82e5097b5_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "CRH")

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

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_CryptoHoleToken_459() {

            }

            function fun__493() {

                let expr_465 := caller()
                let vloc_recipient_463 := convert_t_address_payable_to_t_address(expr_465)
                let _172 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_468 := _172
                let expr_469 := 0x01
                let expr_470 := checked_add_t_uint256(expr_468, convert_t_rational_1_by_1_to_t_uint256(expr_469))

                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_470)
                let expr_471 := expr_470
                let _173 := 0x01
                let expr_476 := _173
                let _174 := vloc_recipient_463
                let expr_477 := _174
                let _175 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_476,expr_477)
                let _176 := read_from_storage_split_offset_0_t_uint256(_175)
                let expr_478 := _176
                let expr_479 := 0x01
                let expr_480 := checked_add_t_uint256(expr_478, convert_t_rational_1_by_1_to_t_uint256(expr_479))

                let _177 := 0x01
                let expr_473 := _177
                let _178 := vloc_recipient_463
                let expr_474 := _178
                let _179 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_473,expr_474)
                update_storage_value_offset_0t_uint256_to_t_uint256(_179, expr_480)
                let expr_481 := expr_480
                let expr_486 := 0x00
                let expr_487 := convert_t_rational_0_by_1_to_t_address_payable(expr_486)
                let _180 := vloc_recipient_463
                let expr_488 := _180
                let expr_489 := 0x01
                let _181 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _182 := convert_t_address_payable_to_t_address(expr_487)
                {
                    let _183 := mload(64)
                    let _184 := abi_encode_tuple_t_rational_1_by_1__to_t_uint256__fromStack(_183 , expr_489)
                    log3(_183, sub(_184, _183) , _181, _182, expr_488)
                }
            }

            function fun_add_44(vloc_a_22, vloc_b_24) -> vloc__27 {
                let zero_value_for_type_t_uint256_35 := zero_value_for_split_t_uint256()
                vloc__27 := zero_value_for_type_t_uint256_35

                let _36 := vloc_a_22
                let expr_31 := _36
                let _37 := vloc_b_24
                let expr_32 := _37
                let expr_33 := checked_add_t_uint256(expr_31, expr_32)

                let vloc_c_30 := expr_33
                let _38 := vloc_c_30
                let expr_36 := _38
                let _39 := vloc_a_22
                let expr_37 := _39
                let expr_38 := iszero(lt(cleanup_t_uint256(expr_36), cleanup_t_uint256(expr_37)))
                assert_helper(expr_38)
                let _40 := vloc_c_30
                let expr_41 := _40
                vloc__27 := expr_41
                leave

            }

            function fun_allowance_342(vloc__owner_327, vloc__spender_329) -> vloc__333 {
                let zero_value_for_type_t_uint256_107 := zero_value_for_split_t_uint256()
                vloc__333 := zero_value_for_type_t_uint256_107

                let _108 := 0x02
                let expr_335 := _108
                let _109 := vloc__owner_327
                let expr_336 := _109
                let _110 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_335,expr_336)
                let _111 := _110
                let expr_337 := _111
                let _112 := vloc__spender_329
                let expr_338 := _112
                let _113 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_337,expr_338)
                let _114 := read_from_storage_split_offset_0_t_uint256(_113)
                let expr_339 := _114
                vloc__333 := expr_339
                leave

            }

            function fun_approve_324(vloc__spender_297, vloc__value_299) -> vloc__303 {
                let zero_value_for_type_t_bool_94 := zero_value_for_split_t_bool()
                vloc__303 := zero_value_for_type_t_bool_94

                let _95 := vloc__value_299
                let expr_311 := _95
                let _96 := 0x02
                let expr_305 := _96
                let expr_307 := caller()
                let _97 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_305,expr_307)
                let _98 := _97
                let expr_309 := _98
                let _99 := vloc__spender_297
                let expr_308 := _99
                let _100 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_309,expr_308)
                update_storage_value_offset_0t_uint256_to_t_uint256(_100, expr_311)
                let expr_312 := expr_311
                let expr_316 := caller()
                let _101 := vloc__spender_297
                let expr_317 := _101
                let _102 := vloc__value_299
                let expr_318 := _102
                let _103 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _104 := convert_t_address_payable_to_t_address(expr_316)
                {
                    let _105 := mload(64)
                    let _106 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_105 , expr_318)
                    log3(_105, sub(_106, _105) , _103, _104, expr_317)
                }let expr_321 := 0x01
                vloc__303 := expr_321
                leave

            }

            function fun_balanceOf_157(vloc__owner_146) -> vloc_balance_150 {
                let zero_value_for_type_t_uint256_41 := zero_value_for_split_t_uint256()
                vloc_balance_150 := zero_value_for_type_t_uint256_41

                let _42 := 0x01
                let expr_152 := _42
                let _43 := vloc__owner_146
                let expr_153 := _43
                let _44 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_152,expr_153)
                let _45 := read_from_storage_split_offset_0_t_uint256(_44)
                let expr_154 := _45
                vloc_balance_150 := expr_154
                leave

            }

            function fun_decreaseApproval_443(vloc__spender_386, vloc__subtractedValue_388) -> vloc__391 {
                let zero_value_for_type_t_bool_139 := zero_value_for_split_t_bool()
                vloc__391 := zero_value_for_type_t_bool_139

                let _140 := 0x02
                let expr_395 := _140
                let expr_397 := caller()
                let _141 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_395,expr_397)
                let _142 := _141
                let expr_398 := _142
                let _143 := vloc__spender_386
                let expr_399 := _143
                let _144 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_398,expr_399)
                let _145 := read_from_storage_split_offset_0_t_uint256(_144)
                let expr_400 := _145
                let vloc_oldValue_394 := expr_400
                let _146 := vloc__subtractedValue_388
                let expr_402 := _146
                let _147 := vloc_oldValue_394
                let expr_403 := _147
                let expr_404 := gt(cleanup_t_uint256(expr_402), cleanup_t_uint256(expr_403))
                switch expr_404
                case 0 {
                    let _148 := vloc_oldValue_394
                    let expr_421 := _148
                    let _149 := vloc__subtractedValue_388
                    let expr_422 := _149
                    let expr_423 := checked_sub_t_uint256(expr_421, expr_422)

                    let _150 := 0x02
                    let expr_415 := _150
                    let expr_417 := caller()
                    let _151 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_415,expr_417)
                    let _152 := _151
                    let expr_419 := _152
                    let _153 := vloc__spender_386
                    let expr_418 := _153
                    let _154 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_419,expr_418)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_154, expr_423)
                    let expr_424 := expr_423
                }
                default {
                    let expr_411 := 0x00
                    let _155 := convert_t_rational_0_by_1_to_t_uint256(expr_411)
                    let _156 := 0x02
                    let expr_405 := _156
                    let expr_407 := caller()
                    let _157 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_405,expr_407)
                    let _158 := _157
                    let expr_409 := _158
                    let _159 := vloc__spender_386
                    let expr_408 := _159
                    let _160 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_409,expr_408)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_160, _155)
                    let expr_412 := _155
                }
                let expr_430 := caller()
                let _161 := vloc__spender_386
                let expr_431 := _161
                let _162 := 0x02
                let expr_432 := _162
                let expr_434 := caller()
                let _163 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_432,expr_434)
                let _164 := _163
                let expr_435 := _164
                let _165 := vloc__spender_386
                let expr_436 := _165
                let _166 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_435,expr_436)
                let _167 := read_from_storage_split_offset_0_t_uint256(_166)
                let expr_437 := _167
                let _168 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _169 := convert_t_address_payable_to_t_address(expr_430)
                {
                    let _170 := mload(64)
                    let _171 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_170 , expr_437)
                    log3(_170, sub(_171, _170) , _168, _169, expr_431)
                }let expr_440 := 0x01
                vloc__391 := expr_440
                leave

            }

            function fun_increaseApproval_383(vloc__spender_345, vloc__addedValue_347) -> vloc__350 {
                let zero_value_for_type_t_bool_115 := zero_value_for_split_t_bool()
                vloc__350 := zero_value_for_type_t_bool_115

                let _116 := 0x02
                let expr_358 := _116
                let expr_360 := caller()
                let _117 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_358,expr_360)
                let _118 := _117
                let expr_361 := _118
                let _119 := vloc__spender_345
                let expr_362 := _119
                let _120 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_361,expr_362)
                let _121 := read_from_storage_split_offset_0_t_uint256(_120)
                let expr_363 := _121
                let _122 := vloc__addedValue_347
                let expr_364 := _122
                let expr_365 := checked_add_t_uint256(expr_363, expr_364)

                let _123 := 0x02
                let expr_352 := _123
                let expr_354 := caller()
                let _124 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_352,expr_354)
                let _125 := _124
                let expr_356 := _125
                let _126 := vloc__spender_345
                let expr_355 := _126
                let _127 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_356,expr_355)
                update_storage_value_offset_0t_uint256_to_t_uint256(_127, expr_365)
                let expr_366 := expr_365
                let expr_370 := caller()
                let _128 := vloc__spender_345
                let expr_371 := _128
                let _129 := 0x02
                let expr_372 := _129
                let expr_374 := caller()
                let _130 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_372,expr_374)
                let _131 := _130
                let expr_375 := _131
                let _132 := vloc__spender_345
                let expr_376 := _132
                let _133 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_375,expr_376)
                let _134 := read_from_storage_split_offset_0_t_uint256(_133)
                let expr_377 := _134
                let _135 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _136 := convert_t_address_payable_to_t_address(expr_370)
                {
                    let _137 := mload(64)
                    let _138 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_137 , expr_377)
                    log3(_137, sub(_138, _137) , _135, _136, expr_371)
                }let expr_380 := 0x01
                vloc__350 := expr_380
                leave

            }

            function fun_sub_20(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_30 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_30

                let _31 := vloc_b_4
                let expr_10 := _31
                let _32 := vloc_a_2
                let expr_11 := _32
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                assert_helper(expr_12)
                let _33 := vloc_a_2
                let expr_15 := _33
                let _34 := vloc_b_4
                let expr_16 := _34
                let expr_17 := checked_sub_t_uint256(expr_15, expr_16)

                vloc__7 := expr_17
                leave

            }

            function fun_transferFrom_294(vloc__from_211, vloc__to_213, vloc__value_215) -> vloc__219 {
                let zero_value_for_type_t_bool_46 := zero_value_for_split_t_bool()
                vloc__219 := zero_value_for_type_t_bool_46

                let _47 := vloc__to_213
                let expr_222 := _47
                let expr_225 := 0x00
                let expr_226 := convert_t_rational_0_by_1_to_t_address_payable(expr_225)
                let expr_227 := iszero(eq(cleanup_t_address(expr_222), convert_t_address_payable_to_t_address(expr_226)))
                require_helper(expr_227)
                let _48 := vloc__value_215
                let expr_231 := _48
                let _49 := 0x01
                let expr_232 := _49
                let _50 := vloc__from_211
                let expr_233 := _50
                let _51 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_232,expr_233)
                let _52 := read_from_storage_split_offset_0_t_uint256(_51)
                let expr_234 := _52
                let expr_235 := iszero(gt(cleanup_t_uint256(expr_231), cleanup_t_uint256(expr_234)))
                require_helper(expr_235)
                let _53 := vloc__value_215
                let expr_239 := _53
                let _54 := 0x02
                let expr_240 := _54
                let _55 := vloc__from_211
                let expr_241 := _55
                let _56 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_240,expr_241)
                let _57 := _56
                let expr_242 := _57
                let expr_244 := caller()
                let _58 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_242,expr_244)
                let _59 := read_from_storage_split_offset_0_t_uint256(_58)
                let expr_245 := _59
                let expr_246 := iszero(gt(cleanup_t_uint256(expr_239), cleanup_t_uint256(expr_245)))
                require_helper(expr_246)
                let _60 := 0x01
                let expr_252 := _60
                let _61 := vloc__from_211
                let expr_253 := _61
                let _62 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_252,expr_253)
                let _63 := read_from_storage_split_offset_0_t_uint256(_62)
                let expr_254 := _63
                let _64 := vloc__value_215
                let expr_255 := _64
                let expr_256 := checked_sub_t_uint256(expr_254, expr_255)

                let _65 := 0x01
                let expr_249 := _65
                let _66 := vloc__from_211
                let expr_250 := _66
                let _67 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_249,expr_250)
                update_storage_value_offset_0t_uint256_to_t_uint256(_67, expr_256)
                let expr_257 := expr_256
                let _68 := 0x01
                let expr_262 := _68
                let _69 := vloc__to_213
                let expr_263 := _69
                let _70 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_262,expr_263)
                let _71 := read_from_storage_split_offset_0_t_uint256(_70)
                let expr_264 := _71
                let _72 := vloc__value_215
                let expr_265 := _72
                let expr_266 := checked_add_t_uint256(expr_264, expr_265)

                let _73 := 0x01
                let expr_259 := _73
                let _74 := vloc__to_213
                let expr_260 := _74
                let _75 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_259,expr_260)
                update_storage_value_offset_0t_uint256_to_t_uint256(_75, expr_266)
                let expr_267 := expr_266
                let _76 := 0x02
                let expr_275 := _76
                let _77 := vloc__from_211
                let expr_276 := _77
                let _78 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_275,expr_276)
                let _79 := _78
                let expr_277 := _79
                let expr_279 := caller()
                let _80 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_277,expr_279)
                let _81 := read_from_storage_split_offset_0_t_uint256(_80)
                let expr_280 := _81
                let _82 := vloc__value_215
                let expr_281 := _82
                let expr_282 := checked_sub_t_uint256(expr_280, expr_281)

                let _83 := 0x02
                let expr_269 := _83
                let _84 := vloc__from_211
                let expr_270 := _84
                let _85 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_269,expr_270)
                let _86 := _85
                let expr_273 := _86
                let expr_272 := caller()
                let _87 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_273,expr_272)
                update_storage_value_offset_0t_uint256_to_t_uint256(_87, expr_282)
                let expr_283 := expr_282
                let _88 := vloc__from_211
                let expr_286 := _88
                let _89 := vloc__to_213
                let expr_287 := _89
                let _90 := vloc__value_215
                let expr_288 := _90
                let _91 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                {
                    let _92 := mload(64)
                    let _93 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_92 , expr_288)
                    log3(_92, sub(_93, _92) , _91, expr_286, expr_287)
                }let expr_291 := 0x01
                vloc__219 := expr_291
                leave

            }

            function fun_transfer_144(vloc__to_84, vloc__value_86) -> vloc__90 {
                let zero_value_for_type_t_bool_4 := zero_value_for_split_t_bool()
                vloc__90 := zero_value_for_type_t_bool_4

                let _5 := vloc__to_84
                let expr_93 := _5
                let expr_96 := 0x00
                let expr_97 := convert_t_rational_0_by_1_to_t_address_payable(expr_96)
                let expr_98 := iszero(eq(cleanup_t_address(expr_93), convert_t_address_payable_to_t_address(expr_97)))
                require_helper(expr_98)
                let _6 := vloc__value_86
                let expr_102 := _6
                let _7 := 0x01
                let expr_103 := _7
                let expr_105 := caller()
                let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_103,expr_105)
                let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                let expr_106 := _9
                let expr_107 := iszero(gt(cleanup_t_uint256(expr_102), cleanup_t_uint256(expr_106)))
                require_helper(expr_107)
                let _10 := 0x01
                let expr_114 := _10
                let expr_116 := caller()
                let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_114,expr_116)
                let _12 := read_from_storage_split_offset_0_t_uint256(_11)
                let expr_117 := _12
                let _13 := vloc__value_86
                let expr_119 := _13
                let expr_120 := fun_sub_20(expr_117, expr_119)
                let _14 := 0x01
                let expr_110 := _14
                let expr_112 := caller()
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_110,expr_112)
                update_storage_value_offset_0t_uint256_to_t_uint256(_15, expr_120)
                let expr_121 := expr_120
                let _16 := 0x01
                let expr_126 := _16
                let _17 := vloc__to_84
                let expr_127 := _17
                let _18 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_126,expr_127)
                let _19 := read_from_storage_split_offset_0_t_uint256(_18)
                let expr_128 := _19
                let _20 := vloc__value_86
                let expr_130 := _20
                let expr_131 := fun_add_44(expr_128, expr_130)
                let _21 := 0x01
                let expr_123 := _21
                let _22 := vloc__to_84
                let expr_124 := _22
                let _23 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_123,expr_124)
                update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_131)
                let expr_132 := expr_131
                let expr_136 := caller()
                let _24 := vloc__to_84
                let expr_137 := _24
                let _25 := vloc__value_86
                let expr_138 := _25
                let _26 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _27 := convert_t_address_payable_to_t_address(expr_136)
                {
                    let _28 := mload(64)
                    let _29 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_28 , expr_138)
                    log3(_28, sub(_29, _28) , _26, _27, expr_137)
                }let expr_141 := 0x01
                vloc__90 := expr_141
                leave

            }

            function getter_fun_decimals_455() -> ret_0 {
                ret_0 := constant_decimals_455()
            }

            function getter_fun_name_449() -> ret_0 {
                ret_0 := constant_name_449()
            }

            function getter_fun_symbol_452() -> ret_0 {
                ret_0 := constant_symbol_452()
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

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
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

