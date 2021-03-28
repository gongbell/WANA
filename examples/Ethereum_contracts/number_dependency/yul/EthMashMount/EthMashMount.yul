/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EthMashMount_209" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EthMashMount_209()

        codecopy(0, dataoffset("EthMashMount_209_deployed"), datasize("EthMashMount_209_deployed"))

        return(0, datasize("EthMashMount_209_deployed"))

        function array_dataslot_t_array$_t_address_$3_storage(ptr) -> data {
            data := ptr

        }

        function array_length_t_array$_t_address_$3_storage(value) -> length {

            length := 0x03

        }

        function cleanup_from_storage_t_address(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_int256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_EthMashMount_209() {

            let expr_19 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_19)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_20 := _1
            let expr_23 := 0x01
            let _2 := convert_t_rational_1_by_1_to_t_int256(expr_23)
            update_storage_value_offset_0t_int256_to_t_int256(0x02, _2)
            let expr_24 := _2
            let _3 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_31 := _3
            let _4 := 0x03
            let expr_26 := _4
            let expr_27 := 0x01
            let _5 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_rational_1_by_1(expr_26,expr_27)
            let _6_slot := _5
            let expr_29_slot := _6_slot
            let expr_28 := 0x00

            let _7, _8 := storage_array_index_access_t_array$_t_address_$3_storage(expr_29_slot, expr_28)
            update_storage_value_t_address_to_t_address(_7, _8, expr_31)
            let expr_32 := expr_31

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_int256_to_t_int256(value) -> converted {
            converted := cleanup_t_int256(value)
        }

        function convert_t_rational_1_by_1_to_t_int256(value) -> converted {
            converted := cleanup_t_int256(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function extract_from_storage_value_offset_0t_address(slot_value) -> value {
            value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
        }

        function mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_rational_1_by_1(slot , key) -> dataSlot {
            mstore(0, convert_t_rational_1_by_1_to_t_int256(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function panic_error() {
            invalid()
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function prepare_store_t_int256(value) -> ret {
            ret := value
        }

        function read_from_storage_split_offset_0_t_address(slot) -> value {
            value := extract_from_storage_value_offset_0t_address(sload(slot))

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

        function storage_array_index_access_t_array$_t_address_$3_storage(array, index) -> slot, offset {
            let arrayLength := array_length_t_array$_t_address_$3_storage(array)
            if iszero(lt(index, arrayLength)) { panic_error() }

            let dataArea := array_dataslot_t_array$_t_address_$3_storage(array)
            slot := add(dataArea, mul(index, 1))
            offset := 0

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

        function update_byte_slice_dynamic20(value, shiftBytes, toInsert) -> result {
            let shiftBits := mul(shiftBytes, 8)
            let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffff)
            toInsert := shift_left_dynamic(shiftBits, toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_int256_to_t_int256(slot, value_0) {
            let convertedValue_0 := convert_t_int256_to_t_int256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_int256(convertedValue_0)))
        }

        function update_storage_value_t_address_to_t_address(slot, offset, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_dynamic20(sload(slot), offset, prepare_store_t_address(convertedValue_0)))
        }

    }
    object "EthMashMount_209_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x64d9be0b
                {
                    // participants(int256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_int256t_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_participants_14(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6c6f360e
                {
                    // userRegister()

                    abi_decode_tuple_(4, calldatasize())
                    fun_userRegister_208()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7a9262a2
                {
                    // withdrawals(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_withdrawals_6(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa646f9ad
                {
                    // userWithdraw()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_userWithdraw_82()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd4300225
                {
                    // publicGetBalance(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_publicGetBalance_47(param_0)
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

            function abi_decode_t_int256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_int256(value)
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

            function abi_decode_tuple_t_int256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_int256(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

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

            function array_dataslot_t_array$_t_address_$3_storage(ptr) -> data {
                data := ptr

            }

            function array_length_t_array$_t_address_$3_storage(value) -> length {

                length := 0x03

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
            }

            function checked_sub_t_int256(x, y) -> diff {
                x := cleanup_t_int256(x)
                y := cleanup_t_int256(y)

                // underflow, if y >= 0 and x < (minValue + y)
                if and(iszero(slt(y, 0)), slt(x, add(0x8000000000000000000000000000000000000000000000000000000000000000, y))) { panic_error() }
                // overflow, if y < 0 and x > (maxValue + y)
                if and(slt(y, 0), sgt(x, add(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y))) { panic_error() }

                diff := sub(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_int256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_int256(value) -> cleaned {
                cleaned := value
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

            function convert_t_address_to_t_uint256(value) -> converted {
                converted := convert_t_uint160_to_t_uint256(value)
            }

            function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_int256_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_105_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_int256(slot_value) -> value {
                value := cleanup_from_storage_t_int256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_publicGetBalance_47(vloc_player_37) -> vloc__40 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__40 := zero_value_for_type_t_uint256_1

                let _2 := 0x01
                let expr_42 := _2
                let _3 := vloc_player_37
                let expr_43 := _3
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_42,expr_43)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_44 := _5
                vloc__40 := expr_44
                leave

            }

            function fun_userRegister_208() {

                let expr_87 := callvalue()
                let expr_88 := 0x69
                let expr_89 := eq(cleanup_t_uint256(expr_87), convert_t_rational_105_by_1_to_t_uint256(expr_88))
                require_helper(expr_89)
                let expr_95 := 0x05
                let _18 := convert_t_rational_5_by_1_to_t_uint256(expr_95)
                let _19 := 0x01
                let expr_92 := _19
                let _20 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_93 := _20
                let _21 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_92,expr_93)
                let _22 := read_from_storage_split_offset_0_t_uint256(_21)
                _18 := checked_add_t_uint256(_22, _18)
                update_storage_value_offset_0t_uint256_to_t_uint256(_21, _18)
                let expr_96 := _18
                let expr_104 := caller()
                let _23 := convert_t_address_payable_to_t_address(expr_104)
                let _24 := 0x03
                let expr_98 := _24
                let _25 := read_from_storage_split_offset_0_t_int256(0x02)
                let expr_99 := _25
                let _26 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_98,expr_99)
                let _27_slot := _26
                let expr_101_slot := _27_slot
                let expr_100 := 0x01

                let _28, _29 := storage_array_index_access_t_array$_t_address_$3_storage(expr_101_slot, expr_100)
                update_storage_value_t_address_to_t_address(_28, _29, _23)
                let expr_105 := _23
                let expr_113 := number()
                let expr_114 := 0x01
                let expr_115 := checked_sub_t_uint256(expr_113, convert_t_rational_1_by_1_to_t_uint256(expr_114))

                let expr_116 := blockhash(expr_115)
                let expr_117 := convert_t_bytes32_to_t_uint256(expr_116)
                let _30 := 0x03
                let expr_120 := _30
                let _31 := read_from_storage_split_offset_0_t_int256(0x02)
                let expr_121 := _31
                let _32 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_120,expr_121)
                let _33_slot := _32
                let expr_122_slot := _33_slot
                let expr_123 := 0x00

                let _34, _35 := storage_array_index_access_t_array$_t_address_$3_storage(expr_122_slot, expr_123)
                let _36 := read_from_storage_split_dynamic_t_address(_34, _35)
                let expr_124 := _36
                let expr_125 := convert_t_address_to_t_uint256(expr_124)
                let expr_126 := checked_add_t_uint256(expr_117, expr_125)

                let _37 := 0x03
                let expr_129 := _37
                let _38 := read_from_storage_split_offset_0_t_int256(0x02)
                let expr_130 := _38
                let _39 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_129,expr_130)
                let _40_slot := _39
                let expr_131_slot := _40_slot
                let expr_132 := 0x01

                let _41, _42 := storage_array_index_access_t_array$_t_address_$3_storage(expr_131_slot, expr_132)
                let _43 := read_from_storage_split_dynamic_t_address(_41, _42)
                let expr_133 := _43
                let expr_134 := convert_t_address_to_t_uint256(expr_133)
                let expr_135 := checked_add_t_uint256(expr_126, expr_134)

                let expr_136 := expr_135
                let vloc_random_108 := expr_136
                let _44 := vloc_random_108
                let expr_138 := _44
                let expr_139 := 0x02
                let expr_140 := checked_mod_t_uint256(expr_138, convert_t_rational_2_by_1_to_t_uint256(expr_139))

                let expr_141 := 0x00
                let expr_142 := eq(cleanup_t_uint256(expr_140), convert_t_rational_0_by_1_to_t_uint256(expr_141))
                switch expr_142
                case 0 {
                    let _45 := 0x03
                    let expr_171 := _45
                    let _46 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_172 := _46
                    let _47 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_171,expr_172)
                    let _48_slot := _47
                    let expr_173_slot := _48_slot
                    let expr_174 := 0x01

                    let _49, _50 := storage_array_index_access_t_array$_t_address_$3_storage(expr_173_slot, expr_174)
                    let _51 := read_from_storage_split_dynamic_t_address(_49, _50)
                    let expr_175 := _51
                    let _52 := 0x03
                    let expr_166 := _52
                    let _53 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_167 := _53
                    let _54 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_166,expr_167)
                    let _55_slot := _54
                    let expr_169_slot := _55_slot
                    let expr_168 := 0x02

                    let _56, _57 := storage_array_index_access_t_array$_t_address_$3_storage(expr_169_slot, expr_168)
                    update_storage_value_t_address_to_t_address(_56, _57, expr_175)
                    let expr_176 := expr_175
                    let expr_185 := 0x64
                    let _58 := convert_t_rational_100_by_1_to_t_uint256(expr_185)
                    let _59 := 0x01
                    let expr_178 := _59
                    let _60 := 0x03
                    let expr_179 := _60
                    let _61 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_180 := _61
                    let _62 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_179,expr_180)
                    let _63_slot := _62
                    let expr_181_slot := _63_slot
                    let expr_182 := 0x01

                    let _64, _65 := storage_array_index_access_t_array$_t_address_$3_storage(expr_181_slot, expr_182)
                    let _66 := read_from_storage_split_dynamic_t_address(_64, _65)
                    let expr_183 := _66
                    let _67 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_178,expr_183)
                    let _68 := read_from_storage_split_offset_0_t_uint256(_67)
                    _58 := checked_add_t_uint256(_68, _58)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_67, _58)
                    let expr_186 := _58
                }
                default {
                    let _69 := 0x03
                    let expr_148 := _69
                    let _70 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_149 := _70
                    let _71 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_148,expr_149)
                    let _72_slot := _71
                    let expr_150_slot := _72_slot
                    let expr_151 := 0x00

                    let _73, _74 := storage_array_index_access_t_array$_t_address_$3_storage(expr_150_slot, expr_151)
                    let _75 := read_from_storage_split_dynamic_t_address(_73, _74)
                    let expr_152 := _75
                    let _76 := 0x03
                    let expr_143 := _76
                    let _77 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_144 := _77
                    let _78 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_143,expr_144)
                    let _79_slot := _78
                    let expr_146_slot := _79_slot
                    let expr_145 := 0x02

                    let _80, _81 := storage_array_index_access_t_array$_t_address_$3_storage(expr_146_slot, expr_145)
                    update_storage_value_t_address_to_t_address(_80, _81, expr_152)
                    let expr_153 := expr_152
                    let expr_162 := 0x64
                    let _82 := convert_t_rational_100_by_1_to_t_uint256(expr_162)
                    let _83 := 0x01
                    let expr_155 := _83
                    let _84 := 0x03
                    let expr_156 := _84
                    let _85 := read_from_storage_split_offset_0_t_int256(0x02)
                    let expr_157 := _85
                    let _86 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_156,expr_157)
                    let _87_slot := _86
                    let expr_158_slot := _87_slot
                    let expr_159 := 0x00

                    let _88, _89 := storage_array_index_access_t_array$_t_address_$3_storage(expr_158_slot, expr_159)
                    let _90 := read_from_storage_split_dynamic_t_address(_88, _89)
                    let expr_160 := _90
                    let _91 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_155,expr_160)
                    let _92 := read_from_storage_split_offset_0_t_uint256(_91)
                    _82 := checked_add_t_uint256(_92, _82)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_91, _82)
                    let expr_163 := _82
                }
                let _94 := read_from_storage_split_offset_0_t_int256(0x02)
                let _93 := increment_t_int256(_94)
                update_storage_value_offset_0t_int256_to_t_int256(0x02, _93)
                let expr_191 := _94
                let _95 := 0x03
                let expr_198 := _95
                let _96 := read_from_storage_split_offset_0_t_int256(0x02)
                let expr_199 := _96
                let expr_200 := 0x01
                let expr_201 := checked_sub_t_int256(expr_199, convert_t_rational_1_by_1_to_t_int256(expr_200))

                let _97 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_198,expr_201)
                let _98_slot := _97
                let expr_202_slot := _98_slot
                let expr_203 := 0x02

                let _99, _100 := storage_array_index_access_t_array$_t_address_$3_storage(expr_202_slot, expr_203)
                let _101 := read_from_storage_split_dynamic_t_address(_99, _100)
                let expr_204 := _101
                let _102 := 0x03
                let expr_193 := _102
                let _103 := read_from_storage_split_offset_0_t_int256(0x02)
                let expr_194 := _103
                let _104 := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(expr_193,expr_194)
                let _105_slot := _104
                let expr_196_slot := _105_slot
                let expr_195 := 0x00

                let _106, _107 := storage_array_index_access_t_array$_t_address_$3_storage(expr_196_slot, expr_195)
                update_storage_value_t_address_to_t_address(_106, _107, expr_204)
                let expr_205 := expr_204

            }

            function fun_userWithdraw_82() {

                let _6 := 0x01
                let expr_51 := _6
                let expr_53 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_51,expr_53)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_54 := _8
                let expr_55 := 0x00
                let expr_56 := gt(cleanup_t_uint256(expr_54), convert_t_rational_0_by_1_to_t_uint256(expr_55))
                require_helper(expr_56)
                let _9 := 0x01
                let expr_61 := _9
                let expr_63 := caller()
                let _10 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_61,expr_63)
                let _11 := read_from_storage_split_offset_0_t_uint256(_10)
                let expr_64 := _11
                let vloc_amount_60 := expr_64
                let expr_70 := 0x00
                let _12 := convert_t_rational_0_by_1_to_t_uint256(expr_70)
                let _13 := 0x01
                let expr_66 := _13
                let expr_68 := caller()
                let _14 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_66,expr_68)
                update_storage_value_offset_0t_uint256_to_t_uint256(_14, _12)
                let expr_71 := _12
                let expr_76 := caller()
                let expr_77_address := convert_t_address_payable_to_t_address(expr_76)
                let _15 := vloc_amount_60
                let expr_78 := _15

                let _16 := 0
                if iszero(expr_78) { _16 := 2300 }
                let _17 := call(_16, expr_77_address, expr_78, 0, 0, 0, 0)

                if iszero(_17) { revert_forward_1() }

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_participants_14(key_0, key_1) -> ret {

                let slot := 3
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(slot, key_0)

                if iszero(lt(key_1, array_length_t_array$_t_address_$3_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_address_$3_storage(slot, key_1)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_withdrawals_6(key_0) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_int256(value) -> ret {
                value := cleanup_t_int256(value)
                if sgt(value, 0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
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

            function mapping_index_access_t_mapping$_t_int256_$_t_array$_t_address_$3_storage_$_of_t_int256(slot , key) -> dataSlot {
                mstore(0, convert_t_int256_to_t_int256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_int256(value) -> ret {
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

            function read_from_storage_split_offset_0_t_int256(slot) -> value {
                value := extract_from_storage_value_offset_0t_int256(sload(slot))

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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_address_$3_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_address_$3_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_address_$3_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_dynamic20(value, shiftBytes, toInsert) -> result {
                let shiftBits := mul(shiftBytes, 8)
                let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffff)
                toInsert := shift_left_dynamic(shiftBits, toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_int256_to_t_int256(slot, value_0) {
                let convertedValue_0 := convert_t_int256_to_t_int256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_int256(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_t_address_to_t_address(slot, offset, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_dynamic20(sload(slot), offset, prepare_store_t_address(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_int256(value) {
                if iszero(eq(value, cleanup_t_int256(value))) { revert(0, 0) }
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

