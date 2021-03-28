/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "HodlerInvestmentClub_178" {
    code {
        mstore(64, 128)

        constructor_HodlerInvestmentClub_178()

        codecopy(0, dataoffset("HodlerInvestmentClub_178_deployed"), datasize("HodlerInvestmentClub_178_deployed"))

        return(0, datasize("HodlerInvestmentClub_178_deployed"))

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

        function constructor_HodlerInvestmentClub_178() {

            let expr_3 := 0x01e13380
            update_storage_value_offset_0t_rational_31536000_by_1_to_t_uint256(0x00, expr_3)
            let expr_6 := 0x01
            update_storage_value_offset_0t_rational_1_by_1_to_t_uint256(0x01, expr_6)

            let expr_20 := callvalue()
            let expr_21 := 0x00
            let expr_22 := gt(cleanup_t_uint256(expr_20), convert_t_rational_0_by_1_to_t_uint256(expr_21))
            if expr_22 {
                let expr_29 := callvalue()
                let _1 := 0x02
                let expr_23 := _1
                let expr_25 := caller()
                let _2 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_23,expr_25)
                let _3_slot := _2
                let expr_26_slot := _3_slot
                let _4 := add(expr_26_slot, 0)
                update_storage_value_offset_0t_uint256_to_t_uint256(_4, expr_29)
                let expr_30 := expr_29
                let expr_38 := timestamp()
                let _5 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_39 := _5
                let expr_40 := checked_add_t_uint256(expr_38, expr_39)

                let _6 := 0x02
                let expr_32 := _6
                let expr_34 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_32,expr_34)
                let _8_slot := _7
                let expr_35_slot := _8_slot
                let _9 := add(expr_35_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_9, expr_40)
                let expr_41 := expr_40
            }

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_31536000_by_1_to_t_uint256(value) -> converted {
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

        function mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(slot , key) -> dataSlot {
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

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_rational_1_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_1_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_31536000_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_31536000_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "HodlerInvestmentClub_178_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0b2f6cef
                {
                    // m_hodlers()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_m_hodlers_7()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_withdraw_134()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4a3f17e7
                {
                    // hodlers(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1 :=  getter_fun_hodlers_16(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbaf05a87
                {
                    // hodl_interval()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_hodl_interval_4()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_177()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf340fa01
                {
                    // deposit(address)

                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_deposit_100(param_0)
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

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256_t_uint256__to_t_uint256_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

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

            function decrement_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if lt(value, 0x01) { panic_error() }
                ret := sub(value, 1)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_deposit_100(vloc__to_48) {

                let expr_53 := callvalue()
                let expr_54 := 0x00
                let expr_55 := gt(cleanup_t_uint256(expr_53), convert_t_rational_0_by_1_to_t_uint256(expr_54))
                require_helper(expr_55)
                let _1 := vloc__to_48
                let expr_58 := _1
                let expr_61 := 0x00
                let expr_62 := convert_t_rational_0_by_1_to_t_address_payable(expr_61)
                let expr_63 := eq(cleanup_t_address(expr_58), convert_t_address_payable_to_t_address(expr_62))
                if expr_63 {
                    let expr_66 := caller()
                    let _2 := convert_t_address_payable_to_t_address(expr_66)
                    vloc__to_48 := _2
                    let expr_67 := _2
                }
                let _3 := 0x02
                let expr_70 := _3
                let _4 := vloc__to_48
                let expr_71 := _4
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address(expr_70,expr_71)
                let _6_slot := _5
                let expr_72_slot := _6_slot
                let _7 := add(expr_72_slot, 1)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_73 := _8
                let expr_74 := 0x00
                let expr_75 := eq(cleanup_t_uint256(expr_73), convert_t_rational_0_by_1_to_t_uint256(expr_74))
                if expr_75 {
                    let expr_81 := timestamp()
                    let _9 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let expr_82 := _9
                    let expr_83 := checked_add_t_uint256(expr_81, expr_82)

                    let _10 := 0x02
                    let expr_76 := _10
                    let _11 := vloc__to_48
                    let expr_77 := _11
                    let _12 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address(expr_76,expr_77)
                    let _13_slot := _12
                    let expr_78_slot := _13_slot
                    let _14 := add(expr_78_slot, 1)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_14, expr_83)
                    let expr_84 := expr_83
                    let _16 := read_from_storage_split_offset_0_t_uint256(0x01)
                    let _15 := increment_t_uint256(_16)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _15)
                    let expr_87 := _16
                }
                let expr_96 := callvalue()
                let _17 := 0x02
                let expr_91 := _17
                let _18 := vloc__to_48
                let expr_92 := _18
                let _19 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address(expr_91,expr_92)
                let _20_slot := _19
                let expr_93_slot := _20_slot
                let _21 := add(expr_93_slot, 0)
                let _22 := read_from_storage_split_offset_0_t_uint256(_21)
                expr_96 := checked_add_t_uint256(_22, expr_96)
                update_storage_value_offset_0t_uint256_to_t_uint256(_21, expr_96)
                let expr_97 := expr_96

            }

            function fun_func_177() {

                let expr_139 := callvalue()
                let expr_140 := 0x00
                let expr_141 := gt(cleanup_t_uint256(expr_139), convert_t_rational_0_by_1_to_t_uint256(expr_140))
                require_helper(expr_141)
                let expr_150 := callvalue()
                let _37 := 0x02
                let expr_144 := _37
                let expr_146 := caller()
                let _38 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_144,expr_146)
                let _39_slot := _38
                let expr_147_slot := _39_slot
                let _40 := add(expr_147_slot, 0)
                let _41 := read_from_storage_split_offset_0_t_uint256(_40)
                expr_150 := checked_add_t_uint256(_41, expr_150)
                update_storage_value_offset_0t_uint256_to_t_uint256(_40, expr_150)
                let expr_151 := expr_150
                let _42 := 0x02
                let expr_153 := _42
                let expr_155 := caller()
                let _43 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_153,expr_155)
                let _44_slot := _43
                let expr_156_slot := _44_slot
                let _45 := add(expr_156_slot, 1)
                let _46 := read_from_storage_split_offset_0_t_uint256(_45)
                let expr_157 := _46
                let expr_158 := 0x00
                let expr_159 := eq(cleanup_t_uint256(expr_157), convert_t_rational_0_by_1_to_t_uint256(expr_158))
                if expr_159 {
                    let expr_166 := timestamp()
                    let _47 := read_from_storage_split_offset_0_t_uint256(0x00)
                    let expr_167 := _47
                    let expr_168 := checked_add_t_uint256(expr_166, expr_167)

                    let _48 := 0x02
                    let expr_160 := _48
                    let expr_162 := caller()
                    let _49 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_160,expr_162)
                    let _50_slot := _49
                    let expr_163_slot := _50_slot
                    let _51 := add(expr_163_slot, 1)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_51, expr_168)
                    let expr_169 := expr_168
                    let _53 := read_from_storage_split_offset_0_t_uint256(0x01)
                    let _52 := increment_t_uint256(_53)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _52)
                    let expr_172 := _53
                }

            }

            function fun_withdraw_134() {

                let _23 := 0x02
                let expr_104 := _23
                let expr_106 := caller()
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_104,expr_106)
                let _25_slot := _24
                let expr_107_slot := _25_slot
                let _26 := add(expr_107_slot, 1)
                let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                let expr_108 := _27
                let expr_110 := timestamp()
                let expr_111 := iszero(gt(cleanup_t_uint256(expr_108), cleanup_t_uint256(expr_110)))
                require_helper(expr_111)
                let _28 := 0x02
                let expr_116 := _28
                let expr_118 := caller()
                let _29 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(expr_116,expr_118)
                let _30_slot := _29
                let expr_119_slot := _30_slot
                let _31 := add(expr_119_slot, 0)
                let _32 := read_from_storage_split_offset_0_t_uint256(_31)
                let expr_120 := _32
                let vloc_value_115 := expr_120
                let _34 := read_from_storage_split_offset_0_t_uint256(0x01)
                let _33 := decrement_t_uint256(_34)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _33)
                let expr_123 := _34
                let expr_127 := caller()
                let expr_128_address := convert_t_address_payable_to_t_address(expr_127)
                let _35 := vloc_value_115
                let expr_129 := _35

                let _36 := 0
                if iszero(expr_129) { _36 := 2300 }
                let expr_130 := call(_36, expr_128_address, expr_129, 0, 0, 0, 0)

                require_helper(expr_130)

            }

            function getter_fun_hodl_interval_4() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_hodlers_16(key_0) -> ret_0, ret_1 {

                let slot := 2
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

            }

            function getter_fun_m_hodlers_7() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Hodler_$12_storage_$_of_t_address_payable(slot , key) -> dataSlot {
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

        }

    }

}

