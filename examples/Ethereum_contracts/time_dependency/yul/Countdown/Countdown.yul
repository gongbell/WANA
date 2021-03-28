/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Countdown_143" {
    code {
        mstore(64, 128)

        constructor_Countdown_143()

        codecopy(0, dataoffset("Countdown_143_deployed"), datasize("Countdown_143_deployed"))

        return(0, datasize("Countdown_143_deployed"))

        function checked_add_t_uint256(x, y) -> sum {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)

            // overflow, if x > (maxValue - y)
            if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

            sum := add(x, y)
        }

        function cleanup_from_storage_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_Countdown_143() {

            let expr_9 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x03, expr_9)
            let expr_12 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x04, expr_12)
            let expr_15 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x05, expr_15)

            let expr_21 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_21)
            update_storage_value_offset_0t_address_to_t_address(0x01, _1)
            let expr_22 := _1
            let expr_26 := timestamp()
            let expr_27 := 0x2a30
            let expr_28 := checked_add_t_uint256(expr_26, convert_t_rational_10800_by_1_to_t_uint256(expr_27))

            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_28)
            let expr_29 := expr_28
            let expr_33 := caller()
            let _2 := convert_t_address_payable_to_t_address(expr_33)
            update_storage_value_offset_0t_address_to_t_address(0x02, _2)
            let expr_34 := _2
            let expr_38 := callvalue()
            let _3 := read_from_storage_split_offset_0_t_uint256(0x03)
            expr_38 := checked_add_t_uint256(_3, expr_38)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_38)
            let expr_39 := expr_38

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_10800_by_1_to_t_uint256(value) -> converted {
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

        function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
            value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
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

        function read_from_storage_split_offset_0_t_uint256(slot) -> value {
            value := extract_from_storage_value_offset_0t_uint256(sload(slot))

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_right_0_unsigned(value) -> newValue {
            newValue :=

            shr(0, value)

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

        function update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "Countdown_143_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1a4e1e78
                {
                    // tips()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_tips_13()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x228cb733
                {
                    // reward()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_reward_10()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x29822734
                {
                    // Win()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_Win_126()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x29dcb0cf
                {
                    // deadline()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_deadline_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3aaa74b2
                {
                    // withdrawTips()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_withdrawTips_142()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8bde7fc3
                {
                    // ClickButton()

                    abi_decode_tuple_(4, calldatasize())
                    fun_ClickButton_96()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa73b60f4
                {
                    // buttonClicks()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_buttonClicks_16()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdfbf53ae
                {
                    // winner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_winner_7()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
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

            function convert_t_address_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1800_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_8_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            66function fun_ClickButton_96() {

                let expr_47 := callvalue()
                let expr_48 := 0x038d7ea4c68000
                let expr_49 := iszero(lt(cleanup_t_uint256(expr_47), convert_t_rational_1000000000000000_by_1_to_t_uint256(expr_48)))
                require_helper(expr_49)
                let expr_53 := timestamp()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_54 := _1
                let expr_55 := gt(cleanup_t_uint256(expr_53), cleanup_t_uint256(expr_54))
                if expr_55 {
                    revert(0, 0)
                }
                let expr_63 := callvalue()
                let expr_64 := 0x08
                let expr_65 := checked_mul_t_uint256(expr_63, convert_t_rational_8_by_1_to_t_uint256(expr_64))

                let expr_66 := 0x0a
                let expr_67 := checked_div_t_uint256(expr_65, convert_t_rational_10_by_1_to_t_uint256(expr_66))

                let _2 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_67 := checked_add_t_uint256(_2, expr_67)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_67)
                let expr_68 := expr_67
                let expr_72 := callvalue()
                let expr_73 := 0x02
                let expr_74 := checked_mul_t_uint256(expr_72, convert_t_rational_2_by_1_to_t_uint256(expr_73))

                let expr_75 := 0x0a
                let expr_76 := checked_div_t_uint256(expr_74, convert_t_rational_10_by_1_to_t_uint256(expr_75))

                let _3 := read_from_storage_split_offset_0_t_uint256(0x04)
                expr_76 := checked_add_t_uint256(_3, expr_76)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_76)
                let expr_77 := expr_76
                let expr_81 := caller()
                let _4 := convert_t_address_payable_to_t_address(expr_81)
                update_storage_value_offset_0t_address_to_t_address(0x02, _4)
                let expr_82 := _4
                let expr_86 := timestamp()
                let expr_87 := 0x0708
                let expr_88 := checked_add_t_uint256(expr_86, convert_t_rational_1800_by_1_to_t_uint256(expr_87))

                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_88)
                let expr_89 := expr_88
                let expr_92 := 0x01
                let _5 := convert_t_rational_1_by_1_to_t_uint256(expr_92)
                let _6 := read_from_storage_split_offset_0_t_uint256(0x05)
                _5 := checked_add_t_uint256(_6, _5)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x05, _5)
                let expr_93 := _5

            }

            67function fun_Win_126() {

                let expr_101 := caller()
                let _7 := read_from_storage_split_offset_0_t_address(0x02)
                let expr_102 := _7
                let expr_103 := eq(convert_t_address_payable_to_t_address(expr_101), cleanup_t_address(expr_102))
                require_helper(expr_103)
                let expr_108 := timestamp()
                let _8 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_109 := _8
                let expr_110 := gt(cleanup_t_uint256(expr_108), cleanup_t_uint256(expr_109))
                require_helper(expr_110)
                let expr_114 := 0x00
                let _9 := convert_t_rational_0_by_1_to_t_uint256(expr_114)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, _9)
                let expr_115 := _9
                let _10 := read_from_storage_split_offset_0_t_address(0x02)
                let expr_119 := _10
                let expr_120 := convert_t_address_to_t_address_payable(expr_119)
                let expr_121_address := convert_t_address_payable_to_t_address(expr_120)
                let _11 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_122 := _11

                let _12 := 0
                if iszero(expr_122) { _12 := 2300 }
                let _13 := call(_12, expr_121_address, expr_122, 0, 0, 0, 0)

                if iszero(_13) { revert_forward_1() }

            }

            68function fun_withdrawTips_142() {

                let expr_130 := 0x00
                let _14 := convert_t_rational_0_by_1_to_t_uint256(expr_130)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _14)
                let expr_131 := _14
                let _15 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_135 := _15
                let expr_136 := convert_t_address_to_t_address_payable(expr_135)
                let expr_137_address := convert_t_address_payable_to_t_address(expr_136)
                let _16 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_138 := _16

                let _17 := 0
                if iszero(expr_138) { _17 := 2300 }
                let _18 := call(_17, expr_137_address, expr_138, 0, 0, 0, 0)

                if iszero(_18) { revert_forward_1() }

            }

            function getter_fun_buttonClicks_16() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            70function getter_fun_deadline_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_reward_10() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_tips_13() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_winner_7() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            75function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            80function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            82function revert_forward_1() {
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

        }

    }

}

