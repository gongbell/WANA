/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SimpleMathTest003_89" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_SimpleMathTest003_89()

        codecopy(0, dataoffset("SimpleMathTest003_89_deployed"), datasize("SimpleMathTest003_89_deployed"))

        return(0, datasize("SimpleMathTest003_89_deployed"))

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_SimpleMathTest003_89() {

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
    object "SimpleMathTest003_89_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x771602f7
                {
                    // add(uint256,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_add_34(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa391c15b
                {
                    // div(uint256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_div_70(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb67d77c5
                {
                    // sub(uint256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_sub_88(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc8a4ac9c
                {
                    // mul(uint256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_mul_52(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
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

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function fun_add_34(vloc_a_16, vloc_b_18) -> vloc__23 {
                let zero_value_for_type_t_uint256_5 := zero_value_for_split_t_uint256()
                vloc__23 := zero_value_for_type_t_uint256_5

                let _6 := vloc_a_16
                let expr_27 := _6
                let _7 := vloc_b_18
                let expr_28 := _7
                let expr_29 := checked_add_t_uint256(expr_27, expr_28)

                let vloc_c_26 := expr_29
                let _8 := vloc_c_26
                let expr_31 := _8
                vloc__23 := expr_31
                leave

            }

            function fun_div_70(vloc_a_54, vloc_b_56) -> vloc__59 {
                let zero_value_for_type_t_uint256_9 := zero_value_for_split_t_uint256()
                vloc__59 := zero_value_for_type_t_uint256_9

                let _10 := vloc_a_54
                let expr_63 := _10
                let _11 := vloc_b_56
                let expr_64 := _11
                let expr_65 := checked_div_t_uint256(expr_63, expr_64)

                let vloc_c_62 := expr_65
                let _12 := vloc_c_62
                let expr_67 := _12
                vloc__59 := expr_67
                leave

            }

            function fun_mul_52(vloc_a_36, vloc_b_38) -> vloc__41 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__41 := zero_value_for_type_t_uint256_1

                let _2 := vloc_a_36
                let expr_45 := _2
                let _3 := vloc_b_38
                let expr_46 := _3
                let expr_47 := checked_mul_t_uint256(expr_45, expr_46)

                let vloc_c_44 := expr_47
                let _4 := vloc_c_44
                let expr_49 := _4
                vloc__41 := expr_49
                leave

            }

            function fun_sub_88(vloc_a_72, vloc_b_74) -> vloc__77 {
                let zero_value_for_type_t_uint256_13 := zero_value_for_split_t_uint256()
                vloc__77 := zero_value_for_type_t_uint256_13

                let _14 := vloc_a_72
                let expr_81 := _14
                let _15 := vloc_b_74
                let expr_82 := _15
                let expr_83 := checked_sub_t_uint256(expr_81, expr_82)

                let vloc_c_80 := expr_83
                let _16 := vloc_c_80
                let expr_85 := _16
                vloc__77 := expr_85
                leave

            }

            function panic_error() {
                invalid()
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

