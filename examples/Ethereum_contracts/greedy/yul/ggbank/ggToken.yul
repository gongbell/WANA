/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ggToken_167" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ggToken_167()

        codecopy(0, dataoffset("ggToken_167_deployed"), datasize("ggToken_167_deployed"))

        return(0, datasize("ggToken_167_deployed"))

        function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
            exponent := cleanup_t_uint256(exponent)

            if gt(exponent, 77) { panic_error() }

            power := exp(10, exponent)
        }

        function checked_mul_t_uint256(x, y) -> product {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)

            // overflow, if x != 0 and y > (maxValue / x)
            if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

            product := mul(x, y)
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

        function constant_INITIAL_SUPPLY_140() -> ret {
            let expr_131 := 0x04a817c800
            let expr_132 := 0x0a
            let expr_135 := constant_decimals_126()
            let expr_136 := convert_t_uint8_to_t_uint256(expr_135)
            let _4 := convert_t_rational_10_by_1_to_t_uint256(expr_132)
            let expr_137 := checked_exp_t_rational_10_by_1_t_uint256(expr_136)
            let expr_138 := expr_137
            let expr_139 := checked_mul_t_uint256(convert_t_rational_20000000000_by_1_to_t_uint256(expr_131), expr_138)

            let _5 := expr_139

            ret := _5
        }

        function constant_decimals_126() -> ret {
            let expr_125 := 0x12
            let _3 := convert_t_rational_18_by_1_to_t_uint8(expr_125)

            ret := _3
        }

        function constructor_ERC20_115() {

        }

        function constructor_ggToken_167() {

            constructor_ERC20_115()

            let expr_151 := 0x01
            let _1 := 0x02
            let expr_147 := _1
            let expr_149 := caller()
            let _2 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_147,expr_149)
            update_storage_value_offset_0t_bool_to_t_bool(_2, expr_151)
            let expr_152 := expr_151
            let expr_155 := constant_INITIAL_SUPPLY_140()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_155)
            let expr_156 := expr_155
            let expr_162 := constant_INITIAL_SUPPLY_140()
            let _6 := 0x00
            let expr_158 := _6
            let expr_160 := caller()
            let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_158,expr_160)
            update_storage_value_offset_0t_uint256_to_t_uint256(_7, expr_162)
            let expr_163 := expr_162

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function convert_t_rational_20000000000_by_1_to_t_uint256(value) -> converted {
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

        function convert_t_uint8_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(slot , key) -> dataSlot {
            mstore(0, convert_t_address_payable_to_t_address(key))
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

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
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

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "ggToken_167_deployed" {
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
                    let ret_0 :=  getter_fun_name_120()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_totalSupply_66()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_56(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2ff2e9dc
                {
                    // INITIAL_SUPPLY()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_INITIAL_SUPPLY_140()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_decimals_126()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3eaaf86b
                {
                    // _totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun__totalSupply_58()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x47d6cd6b
                {
                    // _airdropAmount()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun__airdropAmount_129()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_78(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x95d89b41
                {
                    // symbol()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_symbol_123()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_114(param_0, param_1)
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

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
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

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

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

            function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
                exponent := cleanup_t_uint256(exponent)

                if gt(exponent, 77) { panic_error() }

                power := exp(10, exponent)
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

            function constant_INITIAL_SUPPLY_140() -> ret {
                let expr_131 := 0x04a817c800
                let expr_132 := 0x0a
                let expr_135 := constant_decimals_126()
                let expr_136 := convert_t_uint8_to_t_uint256(expr_135)
                let _3 := convert_t_rational_10_by_1_to_t_uint256(expr_132)
                let expr_137 := checked_exp_t_rational_10_by_1_t_uint256(expr_136)
                let expr_138 := expr_137
                let expr_139 := checked_mul_t_uint256(convert_t_rational_20000000000_by_1_to_t_uint256(expr_131), expr_138)

                let _4 := expr_139

                ret := _4
            }

            function constant__airdropAmount_129() -> ret {
                let expr_128 := 0x03e8
                let _5 := convert_t_rational_1000_by_1_to_t_uint256(expr_128)

                ret := _5
            }

            function constant_decimals_126() -> ret {
                let expr_125 := 0x12
                let _2 := convert_t_rational_18_by_1_to_t_uint8(expr_125)

                ret := _2
            }

            function constant_name_120() -> ret_mpos {
                let _1_mpos := convert_t_stringliteral_e89799872416a62940a671d2617fca8be0977d1f52289bc3bc94933421343c70_to_t_string_memory_ptr()

                ret_mpos := _1_mpos
            }

            function constant_symbol_123() -> ret_mpos {
                let _6_mpos := convert_t_stringliteral_e12a787be240346e45d09eaa9359fd7a7962820c2ded8f05a5a859bcdd303579_to_t_string_memory_ptr()

                ret_mpos := _6_mpos
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_1000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_20000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_stringliteral_e12a787be240346e45d09eaa9359fd7a7962820c2ded8f05a5a859bcdd303579_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "666")

            }

            function convert_t_stringliteral_e89799872416a62940a671d2617fca8be0977d1f52289bc3bc94933421343c70_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "777")

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

            function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint8(value)
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

            function fun_add_48(vloc_a_26, vloc_b_28) -> vloc__31 {
                let zero_value_for_type_t_uint256_30 := zero_value_for_split_t_uint256()
                vloc__31 := zero_value_for_type_t_uint256_30

                let _31 := vloc_a_26
                let expr_35 := _31
                let _32 := vloc_b_28
                let expr_36 := _32
                let expr_37 := checked_add_t_uint256(expr_35, expr_36)

                let vloc_c_34 := expr_37
                let _33 := vloc_c_34
                let expr_40 := _33
                let _34 := vloc_a_26
                let expr_41 := _34
                let expr_42 := iszero(lt(cleanup_t_uint256(expr_40), cleanup_t_uint256(expr_41)))
                require_helper(expr_42)
                let _35 := vloc_c_34
                let expr_45 := _35
                vloc__31 := expr_45
                leave

            }

            function fun_balanceOf_78(vloc_owner_68) -> vloc__71 {
                let zero_value_for_type_t_uint256_36 := zero_value_for_split_t_uint256()
                vloc__71 := zero_value_for_type_t_uint256_36

                let _37 := 0x00
                let expr_73 := _37
                let _38 := vloc_owner_68
                let expr_74 := _38
                let _39 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_73,expr_74)
                let _40 := read_from_storage_split_offset_0_t_uint256(_39)
                let expr_75 := _40
                vloc__71 := expr_75
                leave

            }

            function fun_sub_24(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_24 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_24

                let _25 := vloc_b_4
                let expr_10 := _25
                let _26 := vloc_a_2
                let expr_11 := _26
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                require_helper(expr_12)
                let _27 := vloc_a_2
                let expr_17 := _27
                let _28 := vloc_b_4
                let expr_18 := _28
                let expr_19 := checked_sub_t_uint256(expr_17, expr_18)

                let vloc_c_16 := expr_19
                let _29 := vloc_c_16
                let expr_21 := _29
                vloc__7 := expr_21
                leave

            }

            function fun_totalSupply_66() -> vloc__61 {
                let zero_value_for_type_t_uint256_7 := zero_value_for_split_t_uint256()
                vloc__61 := zero_value_for_type_t_uint256_7

                let _8 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_63 := _8
                vloc__61 := expr_63
                leave

            }

            function fun_transfer_114(vloc__to_80, vloc__value_82) -> vloc_success_85 {
                let zero_value_for_type_t_bool_9 := zero_value_for_split_t_bool()
                vloc_success_85 := zero_value_for_type_t_bool_9

                let _10 := 0x00
                let expr_91 := _10
                let expr_93 := caller()
                let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_91,expr_93)
                let _12 := read_from_storage_split_offset_0_t_uint256(_11)
                let expr_94 := _12
                let _13 := vloc__value_82
                let expr_96 := _13
                let expr_97 := fun_sub_24(expr_94, expr_96)
                let _14 := 0x00
                let expr_87 := _14
                let expr_89 := caller()
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_87,expr_89)
                update_storage_value_offset_0t_uint256_to_t_uint256(_15, expr_97)
                let expr_98 := expr_97
                let _16 := 0x00
                let expr_103 := _16
                let _17 := vloc__to_80
                let expr_104 := _17
                let _18 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_103,expr_104)
                let _19 := read_from_storage_split_offset_0_t_uint256(_18)
                let expr_105 := _19
                let _20 := vloc__value_82
                let expr_107 := _20
                let expr_108 := fun_add_48(expr_105, expr_107)
                let _21 := 0x00
                let expr_100 := _21
                let _22 := vloc__to_80
                let expr_101 := _22
                let _23 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_100,expr_101)
                update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_108)
                let expr_109 := expr_108
                let expr_111 := 0x01
                vloc_success_85 := expr_111
                leave

            }

            function getter_fun_INITIAL_SUPPLY_140() -> ret_0 {
                ret_0 := constant_INITIAL_SUPPLY_140()
            }

            function getter_fun__airdropAmount_129() -> ret_0 {
                ret_0 := constant__airdropAmount_129()
            }

            function getter_fun__totalSupply_58() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_balances_56(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_decimals_126() -> ret_0 {
                ret_0 := constant_decimals_126()
            }

            function getter_fun_name_120() -> ret_0 {
                ret_0 := constant_name_120()
            }

            function getter_fun_symbol_123() -> ret_0 {
                ret_0 := constant_symbol_123()
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

