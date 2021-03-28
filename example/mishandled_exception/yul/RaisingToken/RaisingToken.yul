/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "RaisingToken_286" {
    code {
        mstore(64, 128)

        constructor_RaisingToken_286()

        codecopy(0, dataoffset("RaisingToken_286_deployed"), datasize("RaisingToken_286_deployed"))

        return(0, datasize("RaisingToken_286_deployed"))

        function abi_encode_t_rational_1_by_1_to_t_uint256_fromStack(value, pos) {
            mstore(pos, convert_t_rational_1_by_1_to_t_uint256(value))
        }

        function abi_encode_tuple_t_rational_1_by_1__to_t_uint256__fromStack(headStart , value0) -> tail {
            tail := add(headStart, 32)

            abi_encode_t_rational_1_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_RaisingToken_286() {

            let expr_19 := callvalue()
            let expr_20 := 0x00
            let expr_21 := gt(cleanup_t_uint256(expr_19), convert_t_rational_0_by_1_to_t_uint256(expr_20))
            require_helper(expr_21)
            let expr_25 := 0x01
            let _1 := convert_t_rational_1_by_1_to_t_uint256(expr_25)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _1)
            let expr_26 := _1
            let expr_32 := 0x01
            let _2 := convert_t_rational_1_by_1_to_t_uint256(expr_32)
            let _3 := 0x01
            let expr_28 := _3
            let expr_30 := caller()
            let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_28,expr_30)
            update_storage_value_offset_0t_uint256_to_t_uint256(_4, _2)
            let expr_33 := _2
            let expr_38 := 0x00
            let expr_39 := convert_t_rational_0_by_1_to_t_address_payable(expr_38)
            let expr_41 := caller()
            let expr_42 := 0x01
            let _5 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
            let _6 := convert_t_address_payable_to_t_address(expr_39)
            let _7 := convert_t_address_payable_to_t_address(expr_41)
            {
                let _8 := mload(64)
                let _9 := abi_encode_tuple_t_rational_1_by_1__to_t_uint256__fromStack(_8 , expr_42)
                log3(_8, sub(_9, _8) , _5, _6, _7)
            }
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

        function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(slot , key) -> dataSlot {
            mstore(0, convert_t_address_payable_to_t_address(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function require_helper(condition) {
            if iszero(condition) { revert(0, 0) }
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

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "RaisingToken_286_deployed" {
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
                    let ret_0 :=  fun_name_157()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x095ea7b3
                {
                    // approve(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_approve_267(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_totalSupply_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_decimals_175()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balanceOf_7(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x95d89b41
                {
                    // symbol()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_symbol_166()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6f2ae3a
                {
                    // buy()

                    abi_decode_tuple_(4, calldatasize())
                    fun_buy_91()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_240(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe4849b32
                {
                    // sell(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_sell_148(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_contract$_RaisingToken_$286_to_t_address(value) -> converted {
                converted := convert_t_contract$_RaisingToken_$286_to_t_uint160(value)
            }

            function convert_t_contract$_RaisingToken_$286_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function convert_t_stringliteral_0af42cac966919ef79ba44f6cec50685edf9101565ef6849b5ff6f2ef8b56451_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 12)

                mstore(add(converted, 32), "RaisingToken")

            }

            function convert_t_stringliteral_4fd857f6d227262bffbde9ebe65f9b5ac0adeeb79e87f3187c3489e1fbd55649_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "RAT")

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

            function fun_approve_267(vloc__spender_243, vloc__value_245) -> vloc__248 {
                let zero_value_for_type_t_bool_65 := zero_value_for_split_t_bool()
                vloc__248 := zero_value_for_type_t_bool_65

                let _66 := vloc__value_245
                let expr_256 := _66
                let _67 := 0x02
                let expr_250 := _67
                let expr_252 := caller()
                let _68 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_250,expr_252)
                let _69 := _68
                let expr_254 := _69
                let _70 := vloc__spender_243
                let expr_253 := _70
                let _71 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_254,expr_253)
                update_storage_value_offset_0t_uint256_to_t_uint256(_71, expr_256)
                let expr_257 := expr_256
                let expr_261 := caller()
                let _72 := vloc__spender_243
                let expr_262 := _72
                let _73 := vloc__value_245
                let expr_263 := _73
                let _74 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _75 := convert_t_address_payable_to_t_address(expr_261)
                {
                    let _76 := mload(64)
                    let _77 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_76 , expr_263)
                    log3(_76, sub(_77, _76) , _74, _75, expr_262)
                }
            }

            function fun_buy_91() {

                let expr_53 := callvalue()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_54 := _1
                let expr_55 := checked_mul_t_uint256(expr_53, expr_54)

                let expr_58_address := address()
                let expr_59 := convert_t_contract$_RaisingToken_$286_to_t_address(expr_58_address)
                let expr_60 := balance(expr_59)
                let expr_61 := checked_div_t_uint256(expr_55, expr_60)

                let vloc_count_51 := expr_61
                let _2 := vloc_count_51
                let expr_64 := _2
                let expr_65 := 0x00
                let expr_66 := gt(cleanup_t_uint256(expr_64), convert_t_rational_0_by_1_to_t_uint256(expr_65))
                require_helper(expr_66)
                let _3 := vloc_count_51
                let expr_70 := _3
                let _4 := read_from_storage_split_offset_0_t_uint256(0x00)
                expr_70 := checked_add_t_uint256(_4, expr_70)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_70)
                let expr_71 := expr_70
                let _5 := vloc_count_51
                let expr_77 := _5
                let _6 := 0x01
                let expr_73 := _6
                let expr_75 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_73,expr_75)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                expr_77 := checked_add_t_uint256(_8, expr_77)
                update_storage_value_offset_0t_uint256_to_t_uint256(_7, expr_77)
                let expr_78 := expr_77
                let expr_83 := 0x00
                let expr_84 := convert_t_rational_0_by_1_to_t_address_payable(expr_83)
                let expr_86 := caller()
                let _9 := vloc_count_51
                let expr_87 := _9
                let _10 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _11 := convert_t_address_payable_to_t_address(expr_84)
                let _12 := convert_t_address_payable_to_t_address(expr_86)
                {
                    let _13 := mload(64)
                    let _14 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_13 , expr_87)
                    log3(_13, sub(_14, _13) , _10, _11, _12)
                }
            }

            function fun_decimals_175() -> vloc__170 {
                let zero_value_for_type_t_uint8_34 := zero_value_for_split_t_uint8()
                vloc__170 := zero_value_for_type_t_uint8_34

                let expr_172 := 0x00
                vloc__170 := convert_t_rational_0_by_1_to_t_uint8(expr_172)
                leave

            }

            function fun_name_157() -> vloc__152_mpos {
                let zero_value_for_type_t_string_memory_ptr_32_mpos := zero_value_for_split_t_string_memory_ptr()
                vloc__152_mpos := zero_value_for_type_t_string_memory_ptr_32_mpos

                vloc__152_mpos := convert_t_stringliteral_0af42cac966919ef79ba44f6cec50685edf9101565ef6849b5ff6f2ef8b56451_to_t_string_memory_ptr()
                leave

            }

            84function fun_sell_148(vloc__value_94) -> vloc__97 {
                let zero_value_for_type_t_bool_15 := zero_value_for_split_t_bool()
                vloc__97 := zero_value_for_type_t_bool_15

                let _16 := vloc__value_94
                let expr_99 := _16
                let expr_100 := 0x00
                let expr_101 := gt(cleanup_t_uint256(expr_99), convert_t_rational_0_by_1_to_t_uint256(expr_100))
                switch expr_101
                case 0 {
                    let expr_144 := 0x00
                    vloc__97 := expr_144
                    leave
                }
                default {
                    let _17 := vloc__value_94
                    let expr_104 := _17
                    let expr_107_address := address()
                    let expr_108 := convert_t_contract$_RaisingToken_$286_to_t_address(expr_107_address)
                    let expr_109 := balance(expr_108)
                    let expr_110 := checked_mul_t_uint256(expr_104, expr_109)

                    let vloc_toSend_103 := expr_110
                    let expr_115 := caller()
                    let expr_116_address := convert_t_address_payable_to_t_address(expr_115)
                    let _18 := vloc_toSend_103
                    let expr_117 := _18

                    let _19 := 0
                    if iszero(expr_117) { _19 := 2300 }
                    let expr_118 := call(_19, expr_116_address, expr_117, 0, 0, 0, 0)

                    let _20 := vloc__value_94
                    let expr_124 := _20
                    let _21 := 0x01
                    let expr_120 := _21
                    let expr_122 := caller()
                    let _22 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_120,expr_122)
                    let _23 := read_from_storage_split_offset_0_t_uint256(_22)
                    expr_124 := checked_sub_t_uint256(_23, expr_124)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_22, expr_124)
                    let expr_125 := expr_124
                    let _24 := vloc__value_94
                    let expr_128 := _24
                    let _25 := read_from_storage_split_offset_0_t_uint256(0x00)
                    expr_128 := checked_sub_t_uint256(_25, expr_128)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_128)
                    let expr_129 := expr_128
                    let expr_133 := caller()
                    let expr_136 := 0x00
                    let expr_137 := convert_t_rational_0_by_1_to_t_address_payable(expr_136)
                    let _26 := vloc__value_94
                    let expr_138 := _26
                    let _27 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                    let _28 := convert_t_address_payable_to_t_address(expr_133)
                    let _29 := convert_t_address_payable_to_t_address(expr_137)
                    {
                        let _30 := mload(64)
                        let _31 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_30 , expr_138)
                        log3(_30, sub(_31, _30) , _27, _28, _29)
                    }let expr_141 := 0x01
                    vloc__97 := expr_141
                    leave
                }

            }

            function fun_symbol_166() -> vloc__161_mpos {
                let zero_value_for_type_t_string_memory_ptr_33_mpos := zero_value_for_split_t_string_memory_ptr()
                vloc__161_mpos := zero_value_for_type_t_string_memory_ptr_33_mpos

                vloc__161_mpos := convert_t_stringliteral_4fd857f6d227262bffbde9ebe65f9b5ac0adeeb79e87f3187c3489e1fbd55649_to_t_string_memory_ptr()
                leave

            }

            function fun_transfer_240(vloc__to_178, vloc__value_180) -> vloc__183 {
                let zero_value_for_type_t_bool_35 := zero_value_for_split_t_bool()
                vloc__183 := zero_value_for_type_t_bool_35

                let _36 := vloc__value_180
                let expr_185 := _36
                let expr_186 := 0x01
                let expr_187 := gt(cleanup_t_uint256(expr_185), convert_t_rational_1_by_1_to_t_uint256(expr_186))
                let expr_194 := expr_187
                if expr_194 {
                    let _37 := vloc__value_180
                    let expr_188 := _37
                    let _38 := 0x01
                    let expr_189 := _38
                    let expr_191 := caller()
                    let _39 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_189,expr_191)
                    let _40 := read_from_storage_split_offset_0_t_uint256(_39)
                    let expr_192 := _40
                    let expr_193 := iszero(lt(cleanup_t_uint256(expr_188), cleanup_t_uint256(expr_192)))
                    expr_194 := expr_193
                }
                switch expr_194
                case 0 {
                    let expr_236 := 0x00
                    vloc__183 := expr_236
                    leave
                }
                default {
                    let _41 := vloc__value_180
                    let expr_199 := _41
                    let _42 := 0x01
                    let expr_195 := _42
                    let expr_197 := caller()
                    let _43 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_195,expr_197)
                    let _44 := read_from_storage_split_offset_0_t_uint256(_43)
                    expr_199 := checked_sub_t_uint256(_44, expr_199)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_43, expr_199)
                    let expr_200 := expr_199
                    let expr_203 := 0x01
                    let _45 := convert_t_rational_1_by_1_to_t_uint256(expr_203)
                    let _46 := vloc__value_180
                    _45 := checked_sub_t_uint256(_46, _45)
                    vloc__value_180 := _45
                    let expr_204 := _45
                    let _47 := vloc__value_180
                    let expr_209 := _47
                    let _48 := 0x01
                    let expr_206 := _48
                    let _49 := vloc__to_178
                    let expr_207 := _49
                    let _50 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_206,expr_207)
                    let _51 := read_from_storage_split_offset_0_t_uint256(_50)
                    expr_209 := checked_add_t_uint256(_51, expr_209)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_50, expr_209)
                    let expr_210 := expr_209
                    let expr_213 := 0x01
                    let _52 := convert_t_rational_1_by_1_to_t_uint256(expr_213)
                    let _53 := read_from_storage_split_offset_0_t_uint256(0x00)
                    _52 := checked_sub_t_uint256(_53, _52)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _52)
                    let expr_214 := _52
                    let expr_218 := caller()
                    let _54 := vloc__to_178
                    let expr_219 := _54
                    let _55 := vloc__value_180
                    let expr_220 := _55
                    let _56 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                    let _57 := convert_t_address_payable_to_t_address(expr_218)
                    {
                        let _58 := mload(64)
                        let _59 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_58 , expr_220)
                        log3(_58, sub(_59, _58) , _56, _57, expr_219)
                    }let expr_225 := caller()
                    let expr_228 := 0x00
                    let expr_229 := convert_t_rational_0_by_1_to_t_address_payable(expr_228)
                    let expr_230 := 0x01
                    let _60 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                    let _61 := convert_t_address_payable_to_t_address(expr_225)
                    let _62 := convert_t_address_payable_to_t_address(expr_229)
                    {
                        let _63 := mload(64)
                        let _64 := abi_encode_tuple_t_rational_1_by_1__to_t_uint256__fromStack(_63 , expr_230)
                        log3(_63, sub(_64, _63) , _60, _61, _62)
                    }let expr_233 := 0x01
                    vloc__183 := expr_233
                    leave
                }

            }

            function getter_fun_balanceOf_7(key_0) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_totalSupply_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

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

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
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

            function zero_value_for_split_t_string_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

        }

    }

}

