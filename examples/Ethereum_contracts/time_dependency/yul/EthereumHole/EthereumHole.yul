/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EthereumHole_156" {
    code {
        mstore(64, 128)

        constructor_EthereumHole_156()

        codecopy(0, dataoffset("EthereumHole_156_deployed"), datasize("EthereumHole_156_deployed"))

        return(0, datasize("EthereumHole_156_deployed"))

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

        function cleanup_from_storage_t_uint256(value) -> cleaned {
            cleaned := value
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

        function constant_BASE_DURATION_7() -> ret {
            let expr_6 := 0x02255100
            let _8 := convert_t_rational_36000000_by_1_to_t_uint256(expr_6)

            ret := _8
        }

        function constant_DURATION_DECREASE_PER_ETHER_10() -> ret {
            let expr_9 := 0x012c
            let _2 := convert_t_rational_300_by_1_to_t_uint256(expr_9)

            ret := _2
        }

        function constant_MINIMUM_DURATION_13() -> ret {
            let expr_12 := 0x012c
            let _6 := convert_t_rational_300_by_1_to_t_uint256(expr_12)

            ret := _6
        }

        function constructor_EthereumHole_156() {

            let expr_29 := callvalue()
            let expr_30 := 0x00
            let expr_31 := gt(cleanup_t_uint256(expr_29), convert_t_rational_0_by_1_to_t_uint256(expr_30))
            require_helper(expr_31)
            let expr_35 := 0x00
            update_storage_value_offset_0t_bool_to_t_bool(0x03, expr_35)
            let expr_36 := expr_35
            let expr_40 := callvalue()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_40)
            let expr_41 := expr_40
            let expr_45 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_45)
            let expr_46 := expr_45
            let expr_49_functionIdentifier := 99
            let expr_50 := fun_computeDeadline_99()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_50)
            let expr_51 := expr_50

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_300_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_36000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
            value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
        }

        function fun_add_256(vloc_a_234, vloc_b_236) -> vloc__239 {
            let zero_value_for_type_t_uint256_28 := zero_value_for_split_t_uint256()
            vloc__239 := zero_value_for_type_t_uint256_28

            let _29 := vloc_a_234
            let expr_243 := _29
            let _30 := vloc_b_236
            let expr_244 := _30
            let expr_245 := checked_add_t_uint256(expr_243, expr_244)

            let vloc_c_242 := expr_245
            let _31 := vloc_c_242
            let expr_248 := _31
            let _32 := vloc_a_234
            let expr_249 := _32
            let expr_250 := iszero(lt(cleanup_t_uint256(expr_248), cleanup_t_uint256(expr_249)))
            assert_helper(expr_250)
            let _33 := vloc_c_242
            let expr_253 := _33
            vloc__239 := expr_253
            leave

        }

        function fun_computeDeadline_99() -> vloc__57 {
            let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
            vloc__57 := zero_value_for_type_t_uint256_1

            let expr_61 := constant_DURATION_DECREASE_PER_ETHER_10()
            let _3 := read_from_storage_split_offset_0_t_uint256(0x00)
            let expr_63 := _3
            let expr_65 := 0x0de0b6b3a7640000
            let _4 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_65)
            let expr_66 := fun_div_210(expr_63, _4)
            let expr_67 := fun_mul_191(expr_61, expr_66)
            let vloc__durationDecrease_60 := expr_67
            let vloc__duration_70
            let zero_value_for_type_t_uint256_5 := zero_value_for_split_t_uint256()
            vloc__duration_70 := zero_value_for_type_t_uint256_5
            let expr_72 := constant_MINIMUM_DURATION_13()
            let _7 := vloc__durationDecrease_60
            let expr_74 := _7
            let expr_75 := fun_add_256(expr_72, expr_74)
            let expr_76 := constant_BASE_DURATION_7()
            let expr_77 := gt(cleanup_t_uint256(expr_75), cleanup_t_uint256(expr_76))
            switch expr_77
            case 0 {
                let expr_84 := constant_BASE_DURATION_7()
                let _9 := vloc__durationDecrease_60
                let expr_86 := _9
                let expr_87 := fun_sub_231(expr_84, expr_86)
                vloc__duration_70 := expr_87
                let expr_88 := expr_87
            }
            default {
                let expr_79 := constant_MINIMUM_DURATION_13()
                vloc__duration_70 := expr_79
                let expr_80 := expr_79
            }
            let expr_93 := timestamp()
            let _10 := vloc__duration_70
            let expr_95 := _10
            let expr_96 := fun_add_256(expr_93, expr_95)
            vloc__57 := expr_96
            leave

        }

        function fun_div_210(vloc_a_194, vloc_b_196) -> vloc__199 {
            let zero_value_for_type_t_uint256_19 := zero_value_for_split_t_uint256()
            vloc__199 := zero_value_for_type_t_uint256_19

            let _20 := vloc_a_194
            let expr_203 := _20
            let _21 := vloc_b_196
            let expr_204 := _21
            let expr_205 := checked_div_t_uint256(expr_203, expr_204)

            let vloc_c_202 := expr_205
            let _22 := vloc_c_202
            let expr_207 := _22
            vloc__199 := expr_207
            leave

        }

        function fun_mul_191(vloc_a_160, vloc_b_162) -> vloc__165 {
            let zero_value_for_type_t_uint256_11 := zero_value_for_split_t_uint256()
            vloc__165 := zero_value_for_type_t_uint256_11

            let _12 := vloc_a_160
            let expr_167 := _12
            let expr_168 := 0x00
            let expr_169 := eq(cleanup_t_uint256(expr_167), convert_t_rational_0_by_1_to_t_uint256(expr_168))
            if expr_169 {
                let expr_170 := 0x00
                vloc__165 := convert_t_rational_0_by_1_to_t_uint256(expr_170)
                leave
            }
            let _13 := vloc_a_160
            let expr_176 := _13
            let _14 := vloc_b_162
            let expr_177 := _14
            let expr_178 := checked_mul_t_uint256(expr_176, expr_177)

            let vloc_c_175 := expr_178
            let _15 := vloc_c_175
            let expr_181 := _15
            let _16 := vloc_a_160
            let expr_182 := _16
            let expr_183 := checked_div_t_uint256(expr_181, expr_182)

            let _17 := vloc_b_162
            let expr_184 := _17
            let expr_185 := eq(cleanup_t_uint256(expr_183), cleanup_t_uint256(expr_184))
            assert_helper(expr_185)
            let _18 := vloc_c_175
            let expr_188 := _18
            vloc__165 := expr_188
            leave

        }

        function fun_sub_231(vloc_a_213, vloc_b_215) -> vloc__218 {
            let zero_value_for_type_t_uint256_23 := zero_value_for_split_t_uint256()
            vloc__218 := zero_value_for_type_t_uint256_23

            let _24 := vloc_b_215
            let expr_221 := _24
            let _25 := vloc_a_213
            let expr_222 := _25
            let expr_223 := iszero(gt(cleanup_t_uint256(expr_221), cleanup_t_uint256(expr_222)))
            assert_helper(expr_223)
            let _26 := vloc_a_213
            let expr_226 := _26
            let _27 := vloc_b_215
            let expr_227 := _27
            let expr_228 := checked_sub_t_uint256(expr_226, expr_227)

            vloc__218 := expr_228
            leave

        }

        function panic_error() {
            invalid()
        }

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
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

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function zero_value_for_split_t_uint256() -> ret {
            ret := 0
        }

    }
    object "EthereumHole_156_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e7ebce4
                {
                    // min_bid()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_min_bid_16()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x11997dc6
                {
                    // BASE_DURATION()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_BASE_DURATION_7()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1998aeef
                {
                    // bid()

                    abi_decode_tuple_(4, calldatasize())
                    fun_bid_155()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1d012c8e
                {
                    // gameIsOver()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_gameIsOver_24()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x29dcb0cf
                {
                    // deadline()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_deadline_22()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2d28e89d
                {
                    // MINIMUM_DURATION()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MINIMUM_DURATION_13()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x40eedabb
                {
                    // leader()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_leader_20()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4ba2363a
                {
                    // pot()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_pot_18()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf141d076
                {
                    // DURATION_DECREASE_PER_ETHER()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_DURATION_DECREASE_PER_ETHER_10()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
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

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address_payable(value) -> cleaned {
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

            function constant_BASE_DURATION_7() -> ret {
                let expr_6 := 0x02255100
                let _2 := convert_t_rational_36000000_by_1_to_t_uint256(expr_6)

                ret := _2
            }

            function constant_DURATION_DECREASE_PER_ETHER_10() -> ret {
                let expr_9 := 0x012c
                let _4 := convert_t_rational_300_by_1_to_t_uint256(expr_9)

                ret := _4
            }

            function constant_MINIMUM_DURATION_13() -> ret {
                let expr_12 := 0x012c
                let _3 := convert_t_rational_300_by_1_to_t_uint256(expr_12)

                ret := _3
            }

            function constant_min_bid_16() -> ret {
                let expr_15 := 0x09184e72a000
                let _1 := convert_t_rational_10000000000000_by_1_to_t_uint256(expr_15)

                ret := _1
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_300_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_36000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_address_payable(value) -> converted {
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

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_add_256(vloc_a_234, vloc_b_236) -> vloc__239 {
                let zero_value_for_type_t_uint256_37 := zero_value_for_split_t_uint256()
                vloc__239 := zero_value_for_type_t_uint256_37

                let _38 := vloc_a_234
                let expr_243 := _38
                let _39 := vloc_b_236
                let expr_244 := _39
                let expr_245 := checked_add_t_uint256(expr_243, expr_244)

                let vloc_c_242 := expr_245
                let _40 := vloc_c_242
                let expr_248 := _40
                let _41 := vloc_a_234
                let expr_249 := _41
                let expr_250 := iszero(lt(cleanup_t_uint256(expr_248), cleanup_t_uint256(expr_249)))
                assert_helper(expr_250)
                let _42 := vloc_c_242
                let expr_253 := _42
                vloc__239 := expr_253
                leave

            }

            function fun_bid_155() {

                let expr_103 := timestamp()
                let _5 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_104 := _5
                let expr_105 := gt(cleanup_t_uint256(expr_103), cleanup_t_uint256(expr_104))
                let expr_108 := expr_105
                if expr_108 {
                    let _6 := read_from_storage_split_offset_0_t_bool(0x03)
                    let expr_106 := _6
                    let expr_107 := cleanup_t_bool(iszero(expr_106))
                    expr_108 := expr_107
                }
                if expr_108 {
                    let _7 := read_from_storage_split_offset_0_t_address_payable(0x01)
                    let expr_109 := _7
                    let expr_111_address := convert_t_address_payable_to_t_address(expr_109)
                    let _8 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let expr_112 := _8

                    let _9 := 0
                    if iszero(expr_112) { _9 := 2300 }
                    let _10 := call(_9, expr_111_address, expr_112, 0, 0, 0, 0)

                    if iszero(_10) { revert_forward_1() }

                    let expr_116 := 0x01
                    update_storage_value_offset_0t_bool_to_t_bool(0x03, expr_116)
                    let expr_117 := expr_116
                }
                let expr_122 := callvalue()
                let expr_123 := 0x00
                let expr_124 := gt(cleanup_t_uint256(expr_122), convert_t_rational_0_by_1_to_t_uint256(expr_123))
                let expr_127 := expr_124
                if expr_127 {
                    let _11 := read_from_storage_split_offset_0_t_bool(0x03)
                    let expr_125 := _11
                    let expr_126 := cleanup_t_bool(iszero(expr_125))
                    expr_127 := expr_126
                }
                if expr_127 {
                    let _12 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let expr_129 := _12
                    let expr_132 := callvalue()
                    let expr_133 := fun_add_256(expr_129, expr_132)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_133)
                    let expr_134 := expr_133
                    let expr_137 := callvalue()
                    let expr_138 := constant_min_bid_16()
                    let expr_139 := iszero(lt(cleanup_t_uint256(expr_137), cleanup_t_uint256(expr_138)))
                    if expr_139 {
                        let expr_142 := caller()
                        update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_142)
                        let expr_143 := expr_142
                        let expr_146_functionIdentifier := 99
                        let expr_147 := fun_computeDeadline_99()
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_147)
                        let expr_148 := expr_147
                    }
                }

            }

            function fun_computeDeadline_99() -> vloc__57 {
                let zero_value_for_type_t_uint256_13 := zero_value_for_split_t_uint256()
                vloc__57 := zero_value_for_type_t_uint256_13

                let expr_61 := constant_DURATION_DECREASE_PER_ETHER_10()
                let _14 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_63 := _14
                let expr_65 := 0x0de0b6b3a7640000
                let _15 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_65)
                let expr_66 := fun_div_210(expr_63, _15)
                let expr_67 := fun_mul_191(expr_61, expr_66)
                let vloc__durationDecrease_60 := expr_67
                let vloc__duration_70
                let zero_value_for_type_t_uint256_16 := zero_value_for_split_t_uint256()
                vloc__duration_70 := zero_value_for_type_t_uint256_16
                let expr_72 := constant_MINIMUM_DURATION_13()
                let _17 := vloc__durationDecrease_60
                let expr_74 := _17
                let expr_75 := fun_add_256(expr_72, expr_74)
                let expr_76 := constant_BASE_DURATION_7()
                let expr_77 := gt(cleanup_t_uint256(expr_75), cleanup_t_uint256(expr_76))
                switch expr_77
                case 0 {
                    let expr_84 := constant_BASE_DURATION_7()
                    let _18 := vloc__durationDecrease_60
                    let expr_86 := _18
                    let expr_87 := fun_sub_231(expr_84, expr_86)
                    vloc__duration_70 := expr_87
                    let expr_88 := expr_87
                }
                default {
                    let expr_79 := constant_MINIMUM_DURATION_13()
                    vloc__duration_70 := expr_79
                    let expr_80 := expr_79
                }
                let expr_93 := timestamp()
                let _19 := vloc__duration_70
                let expr_95 := _19
                let expr_96 := fun_add_256(expr_93, expr_95)
                vloc__57 := expr_96
                leave

            }

            function fun_div_210(vloc_a_194, vloc_b_196) -> vloc__199 {
                let zero_value_for_type_t_uint256_28 := zero_value_for_split_t_uint256()
                vloc__199 := zero_value_for_type_t_uint256_28

                let _29 := vloc_a_194
                let expr_203 := _29
                let _30 := vloc_b_196
                let expr_204 := _30
                let expr_205 := checked_div_t_uint256(expr_203, expr_204)

                let vloc_c_202 := expr_205
                let _31 := vloc_c_202
                let expr_207 := _31
                vloc__199 := expr_207
                leave

            }

            function fun_mul_191(vloc_a_160, vloc_b_162) -> vloc__165 {
                let zero_value_for_type_t_uint256_20 := zero_value_for_split_t_uint256()
                vloc__165 := zero_value_for_type_t_uint256_20

                let _21 := vloc_a_160
                let expr_167 := _21
                let expr_168 := 0x00
                let expr_169 := eq(cleanup_t_uint256(expr_167), convert_t_rational_0_by_1_to_t_uint256(expr_168))
                if expr_169 {
                    let expr_170 := 0x00
                    vloc__165 := convert_t_rational_0_by_1_to_t_uint256(expr_170)
                    leave
                }
                let _22 := vloc_a_160
                let expr_176 := _22
                let _23 := vloc_b_162
                let expr_177 := _23
                let expr_178 := checked_mul_t_uint256(expr_176, expr_177)

                let vloc_c_175 := expr_178
                let _24 := vloc_c_175
                let expr_181 := _24
                let _25 := vloc_a_160
                let expr_182 := _25
                let expr_183 := checked_div_t_uint256(expr_181, expr_182)

                let _26 := vloc_b_162
                let expr_184 := _26
                let expr_185 := eq(cleanup_t_uint256(expr_183), cleanup_t_uint256(expr_184))
                assert_helper(expr_185)
                let _27 := vloc_c_175
                let expr_188 := _27
                vloc__165 := expr_188
                leave

            }

            function fun_sub_231(vloc_a_213, vloc_b_215) -> vloc__218 {
                let zero_value_for_type_t_uint256_32 := zero_value_for_split_t_uint256()
                vloc__218 := zero_value_for_type_t_uint256_32

                let _33 := vloc_b_215
                let expr_221 := _33
                let _34 := vloc_a_213
                let expr_222 := _34
                let expr_223 := iszero(gt(cleanup_t_uint256(expr_221), cleanup_t_uint256(expr_222)))
                assert_helper(expr_223)
                let _35 := vloc_a_213
                let expr_226 := _35
                let _36 := vloc_b_215
                let expr_227 := _36
                let expr_228 := checked_sub_t_uint256(expr_226, expr_227)

                vloc__218 := expr_228
                leave

            }

            function getter_fun_BASE_DURATION_7() -> ret_0 {
                ret_0 := constant_BASE_DURATION_7()
            }

            function getter_fun_DURATION_DECREASE_PER_ETHER_10() -> ret_0 {
                ret_0 := constant_DURATION_DECREASE_PER_ETHER_10()
            }

            function getter_fun_MINIMUM_DURATION_13() -> ret_0 {
                ret_0 := constant_MINIMUM_DURATION_13()
            }

            function getter_fun_deadline_22() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_gameIsOver_24() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_leader_20() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_min_bid_16() -> ret_0 {
                ret_0 := constant_min_bid_16()
            }

            function getter_fun_pot_18() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address_payable(value) -> ret {
                ret := value
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
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

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
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

            function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
                let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
            }

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

