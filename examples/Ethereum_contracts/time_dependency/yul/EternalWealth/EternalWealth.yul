/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EternalWealth_146" {
    code {
        mstore(64, 128)

        constructor_EternalWealth_146()

        codecopy(0, dataoffset("EternalWealth_146_deployed"), datasize("EternalWealth_146_deployed"))

        return(0, datasize("EternalWealth_146_deployed"))

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

        function constructor_EternalWealth_146() {

            let expr_8 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x03, expr_8)
            let expr_11 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x04, expr_11)
            let expr_14 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x05, expr_14)

            let expr_20 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_20)
            let expr_21 := expr_20
            let expr_25 := timestamp()
            let expr_26 := 0x2a30
            let expr_27 := checked_add_t_uint256(expr_25, convert_t_rational_10800_by_1_to_t_uint256(expr_26))

            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_27)
            let expr_28 := expr_27
            let expr_32 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x02, expr_32)
            let expr_33 := expr_32
            let expr_37 := callvalue()
            let _1 := read_from_storage_split_offset_0_t_uint256(0x03)
            expr_37 := checked_add_t_uint256(_1, expr_37)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_37)
            let expr_38 := expr_37

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_10800_by_1_to_t_uint256(value) -> converted {
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

        function panic_error() {
            invalid()
        }

        function prepare_store_t_address_payable(value) -> ret {
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
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
    object "EternalWealth_146_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3cf3a338
                {
                    // WithdrawTithes()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_WithdrawTithes_145()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6418f643
                {
                    // ClaimBlessings()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_ClaimBlessings_127()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9c0df4f2
                {
                    // blessings()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_blessings_9()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa00c3e72
                {
                    // ExtendLife()

                    abi_decode_tuple_(4, calldatasize())
                    fun_ExtendLife_95()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xacd105d1
                {
                    // doomsday()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_doomsday_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd21d2cd1
                {
                    // lifePoints()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_lifePoints_15()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd8fe511f
                {
                    // tithes()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_tithes_12()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdfa78bf5
                {
                    // savior()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_savior_6()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
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

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
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

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
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

            65function fun_ClaimBlessings_127() {

                let expr_100 := caller()
                let _6 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_101 := _6
                let expr_102 := eq(cleanup_t_address_payable(expr_100), cleanup_t_address_payable(expr_101))
                require_helper(expr_102)
                let expr_107 := timestamp()
                let _7 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_108 := _7
                let expr_109 := gt(cleanup_t_uint256(expr_107), cleanup_t_uint256(expr_108))
                require_helper(expr_109)
                let _8 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_114 := _8
                let vloc_pendingBlessings_113 := expr_114
                let expr_117 := 0x00
                let _9 := convert_t_rational_0_by_1_to_t_uint256(expr_117)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, _9)
                let expr_118 := _9
                let _10 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_120 := _10
                let expr_122_address := convert_t_address_payable_to_t_address(expr_120)
                let _11 := vloc_pendingBlessings_113
                let expr_123 := _11

                let _12 := 0
                if iszero(expr_123) { _12 := 2300 }
                let _13 := call(_12, expr_122_address, expr_123, 0, 0, 0, 0)

                if iszero(_13) { revert_forward_1() }

            }

            function fun_ExtendLife_95() {

                let expr_46 := callvalue()
                let expr_47 := 0x038d7ea4c68000
                let expr_48 := iszero(lt(cleanup_t_uint256(expr_46), convert_t_rational_1000000000000000_by_1_to_t_uint256(expr_47)))
                require_helper(expr_48)
                let expr_52 := timestamp()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_53 := _1
                let expr_54 := gt(cleanup_t_uint256(expr_52), cleanup_t_uint256(expr_53))
                if expr_54 {
                    revert(0, 0)
                }
                let expr_62 := callvalue()
                let expr_63 := 0x08
                let expr_64 := checked_mul_t_uint256(expr_62, convert_t_rational_8_by_1_to_t_uint256(expr_63))

                let expr_65 := 0x0a
                let expr_66 := checked_div_t_uint256(expr_64, convert_t_rational_10_by_1_to_t_uint256(expr_65))

                let _2 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_66 := checked_add_t_uint256(_2, expr_66)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_66)
                let expr_67 := expr_66
                let expr_71 := callvalue()
                let expr_72 := 0x02
                let expr_73 := checked_mul_t_uint256(expr_71, convert_t_rational_2_by_1_to_t_uint256(expr_72))

                let expr_74 := 0x0a
                let expr_75 := checked_div_t_uint256(expr_73, convert_t_rational_10_by_1_to_t_uint256(expr_74))

                let _3 := read_from_storage_split_offset_0_t_uint256(0x04)
                expr_75 := checked_add_t_uint256(_3, expr_75)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_75)
                let expr_76 := expr_75
                let expr_80 := caller()
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x02, expr_80)
                let expr_81 := expr_80
                let expr_85 := timestamp()
                let expr_86 := 0x0708
                let expr_87 := checked_add_t_uint256(expr_85, convert_t_rational_1800_by_1_to_t_uint256(expr_86))

                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_87)
                let expr_88 := expr_87
                let expr_91 := 0x01
                let _4 := convert_t_rational_1_by_1_to_t_uint256(expr_91)
                let _5 := read_from_storage_split_offset_0_t_uint256(0x05)
                _4 := checked_add_t_uint256(_5, _4)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x05, _4)
                let expr_92 := _4

            }

            function fun_WithdrawTithes_145() {

                let _14 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_132 := _14
                let vloc_pendingTithes_131 := expr_132
                let expr_135 := 0x00
                let _15 := convert_t_rational_0_by_1_to_t_uint256(expr_135)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _15)
                let expr_136 := _15
                let _16 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_138 := _16
                let expr_140_address := convert_t_address_payable_to_t_address(expr_138)
                let _17 := vloc_pendingTithes_131
                let expr_141 := _17

                let _18 := 0
                if iszero(expr_141) { _18 := 2300 }
                let _19 := call(_18, expr_140_address, expr_141, 0, 0, 0, 0)

                if iszero(_19) { revert_forward_1() }

            }

            function getter_fun_blessings_9() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_doomsday_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_lifePoints_15() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_savior_6() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_tithes_12() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address_payable(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

            function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
                let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

        }

    }

}

