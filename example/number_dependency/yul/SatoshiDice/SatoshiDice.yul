/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SatoshiDice_189" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_SatoshiDice_189()

        codecopy(0, dataoffset("SatoshiDice_189_deployed"), datasize("SatoshiDice_189_deployed"))

        return(0, datasize("SatoshiDice_189_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_SatoshiDice_189() {

            let expr_25 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x01, expr_25)

            let expr_35 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_35)
            let expr_36 := expr_35

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

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

    }
    object "SatoshiDice_189_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1f7b4f30
                {
                    // roll(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_roll_169(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x22af00fa
                {
                    // bets(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3 :=  getter_fun_bets_30(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_t_uint256_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2, ret_3)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2c4c2719
                {
                    // MAXIMUM_CAP()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MAXIMUM_CAP_18()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x41c0e1b5
                {
                    // kill()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_kill_188()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x41cd47bf
                {
                    // FEE_NUMERATOR()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_FEE_NUMERATOR_12()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x61bc221a
                {
                    // counter()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_counter_26()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb60d4288
                {
                    // fund()

                    abi_decode_tuple_(4, calldatasize())
                    fun_fund_173()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb76b0b99
                {
                    // wager(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_wager_77(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd73792a9
                {
                    // FEE_DENOMINATOR()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_FEE_DENOMINATOR_15()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf94a360d
                {
                    // MAXIMUM_BET_SIZE()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MAXIMUM_BET_SIZE_21()
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

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address_t_uint256_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

            }

            function abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

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

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
            }

            function allocate_memory_struct_t_struct$_Bet_$9_storage_ptr() -> memPtr {
                memPtr := allocateMemory(128)
            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

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

            function checked_mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function constant_FEE_DENOMINATOR_15() -> ret {
                let expr_14 := 0x64
                let _3 := convert_t_rational_100_by_1_to_t_uint256(expr_14)

                ret := _3
            }

            function constant_FEE_NUMERATOR_12() -> ret {
                let expr_11 := 0x01
                let _2 := convert_t_rational_1_by_1_to_t_uint256(expr_11)

                ret := _2
            }

            function constant_MAXIMUM_BET_SIZE_21() -> ret {
                let expr_20 := 0x0de0b6b3a7640000
                let _4 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_20)

                ret := _4
            }

            function constant_MAXIMUM_CAP_18() -> ret {
                let expr_17 := 0x0186a0
                let _1 := convert_t_rational_100000_by_1_to_t_uint256(expr_17)

                ret := _1
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_fund_173() {

            }

            function fun_kill_188() {

                let expr_178 := caller()
                let _60 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_179 := _60
                let expr_180 := eq(cleanup_t_address_payable(expr_178), cleanup_t_address_payable(expr_179))
                require_helper(expr_180)
                let _61 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_184 := _61
                selfdestruct(expr_184)

            }

            function fun_roll_169(vloc_id_79) {

                let expr_84 := caller()
                let _13 := 0x02
                let expr_85 := _13
                let _14 := vloc_id_79
                let expr_86 := _14
                let _15 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_85,expr_86)
                let _16_slot := _15
                let expr_87_slot := _16_slot
                let _17 := add(expr_87_slot, 0)
                let _18 := read_from_storage_split_offset_0_t_address(_17)
                let expr_88 := _18
                let expr_89 := eq(convert_t_address_payable_to_t_address(expr_84), cleanup_t_address(expr_88))
                require_helper(expr_89)
                let expr_94 := number()
                let _19 := 0x02
                let expr_95 := _19
                let _20 := vloc_id_79
                let expr_96 := _20
                let _21 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_95,expr_96)
                let _22_slot := _21
                let expr_97_slot := _22_slot
                let _23 := add(expr_97_slot, 1)
                let _24 := read_from_storage_split_offset_0_t_uint256(_23)
                let expr_98 := _24
                let expr_99 := iszero(lt(cleanup_t_uint256(expr_94), cleanup_t_uint256(expr_98)))
                require_helper(expr_99)
                let _25 := 0x02
                let expr_108 := _25
                let _26 := vloc_id_79
                let expr_109 := _26
                let _27 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_108,expr_109)
                let _28_slot := _27
                let expr_110_slot := _28_slot
                let _29 := add(expr_110_slot, 1)
                let _30 := read_from_storage_split_offset_0_t_uint256(_29)
                let expr_111 := _30
                let expr_112 := blockhash(expr_111)
                let _31 := vloc_id_79
                let expr_113 := _31

                let expr_114_mpos := allocateTemporaryMemory()
                let _32 := add(expr_114_mpos, 0x20)

                let _33 := abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(_32, expr_112, expr_113)
                mstore(expr_114_mpos, sub(_33, add(expr_114_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_33))
                let expr_115 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_114_mpos), array_length_t_bytes_memory_ptr(expr_114_mpos))
                let vloc_random_103 := expr_115
                let _34 := vloc_random_103
                let expr_121 := _34
                let expr_122 := convert_t_bytes32_to_t_uint256(expr_121)
                let expr_123 := constant_MAXIMUM_CAP_18()
                let expr_124 := checked_mod_t_uint256(expr_122, expr_123)

                let vloc_rolled_118 := expr_124
                let _35 := vloc_rolled_118
                let expr_126 := _35
                let _36 := 0x02
                let expr_127 := _36
                let _37 := vloc_id_79
                let expr_128 := _37
                let _38 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_127,expr_128)
                let _39_slot := _38
                let expr_129_slot := _39_slot
                let _40 := add(expr_129_slot, 2)
                let _41 := read_from_storage_split_offset_0_t_uint256(_40)
                let expr_130 := _41
                let expr_131 := lt(cleanup_t_uint256(expr_126), cleanup_t_uint256(expr_130))
                if expr_131 {
                    let _42 := 0x02
                    let expr_134 := _42
                    let _43 := vloc_id_79
                    let expr_135 := _43
                    let _44 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_134,expr_135)
                    let _45_slot := _44
                    let expr_136_slot := _45_slot
                    let _46 := add(expr_136_slot, 3)
                    let _47 := read_from_storage_split_offset_0_t_uint256(_46)
                    let expr_137 := _47
                    let expr_138 := constant_MAXIMUM_CAP_18()
                    let expr_139 := checked_mul_t_uint256(expr_137, expr_138)

                    let _48 := 0x02
                    let expr_140 := _48
                    let _49 := vloc_id_79
                    let expr_141 := _49
                    let _50 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_140,expr_141)
                    let _51_slot := _50
                    let expr_142_slot := _51_slot
                    let _52 := add(expr_142_slot, 2)
                    let _53 := read_from_storage_split_offset_0_t_uint256(_52)
                    let expr_143 := _53
                    let expr_144 := checked_div_t_uint256(expr_139, expr_143)

                    let vloc_payout_133 := expr_144
                    let _54 := vloc_payout_133
                    let expr_148 := _54
                    let expr_149 := constant_FEE_NUMERATOR_12()
                    let expr_150 := checked_mul_t_uint256(expr_148, expr_149)

                    let expr_151 := constant_FEE_DENOMINATOR_15()
                    let expr_152 := checked_div_t_uint256(expr_150, expr_151)

                    let vloc_fee_147 := expr_152
                    let _55 := vloc_fee_147
                    let expr_155 := _55
                    let _56 := vloc_payout_133
                    expr_155 := checked_sub_t_uint256(_56, expr_155)
                    vloc_payout_133 := expr_155
                    let expr_156 := expr_155
                    let expr_161 := caller()
                    let expr_162_address := convert_t_address_payable_to_t_address(expr_161)
                    let _57 := vloc_payout_133
                    let expr_163 := _57

                    let _58 := 0
                    if iszero(expr_163) { _58 := 2300 }
                    let _59 := call(_58, expr_162_address, expr_163, 0, 0, 0, 0)

                    if iszero(_59) { revert_forward_1() }

                }

            }

            function fun_wager_77(vloc_cap_41) {

                let _5 := vloc_cap_41
                let expr_45 := _5
                let expr_46 := constant_MAXIMUM_CAP_18()
                let expr_47 := iszero(gt(cleanup_t_uint256(expr_45), cleanup_t_uint256(expr_46)))
                require_helper(expr_47)
                let expr_52 := callvalue()
                let expr_53 := constant_MAXIMUM_BET_SIZE_21()
                let expr_54 := iszero(gt(cleanup_t_uint256(expr_52), cleanup_t_uint256(expr_53)))
                require_helper(expr_54)
                let _7 := read_from_storage_split_offset_0_t_uint256(0x01)
                let _6 := increment_t_uint256(_7)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _6)
                let expr_58 := _7
                let expr_65 := caller()
                let expr_67 := number()
                let expr_68 := 0x03
                let expr_69 := checked_add_t_uint256(expr_67, convert_t_rational_3_by_1_to_t_uint256(expr_68))

                let _8 := vloc_cap_41
                let expr_70 := _8
                let expr_72 := callvalue()
                let expr_73_mpos := allocate_memory_struct_t_struct$_Bet_$9_storage_ptr()
                let _9 := convert_t_address_payable_to_t_address(expr_65)
                write_to_memory_t_address(add(expr_73_mpos, 0), _9)
                write_to_memory_t_uint256(add(expr_73_mpos, 32), expr_69)
                write_to_memory_t_uint256(add(expr_73_mpos, 64), expr_70)
                write_to_memory_t_uint256(add(expr_73_mpos, 96), expr_72)
                let _10 := 0x02
                let expr_60 := _10
                let _11 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_61 := _11
                let _12 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(expr_60,expr_61)
                update_storage_value_offset_0t_struct$_Bet_$9_memory_ptr_to_t_struct$_Bet_$9_storage(_12, expr_73_mpos)

            }

            function getter_fun_FEE_DENOMINATOR_15() -> ret_0 {
                ret_0 := constant_FEE_DENOMINATOR_15()
            }

            function getter_fun_FEE_NUMERATOR_12() -> ret_0 {
                ret_0 := constant_FEE_NUMERATOR_12()
            }

            function getter_fun_MAXIMUM_BET_SIZE_21() -> ret_0 {
                ret_0 := constant_MAXIMUM_BET_SIZE_21()
            }

            function getter_fun_MAXIMUM_CAP_18() -> ret_0 {
                ret_0 := constant_MAXIMUM_CAP_18()
            }

            function getter_fun_bets_30(key_0) -> ret_0, ret_1, ret_2, ret_3 {

                let slot := 2
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_address(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

                ret_2 := read_from_storage_split_offset_0_t_uint256(add(slot, 2))

                ret_3 := read_from_storage_split_offset_0_t_uint256(add(slot, 3))

            }

            function getter_fun_counter_26() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Bet_$9_storage_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

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

            function update_storage_value_offset_0t_struct$_Bet_$9_memory_ptr_to_t_struct$_Bet_$9_storage(slot, value) {

                {

                    let memberSlot := add(slot, 0)
                    let memberSrcPtr := add(value, 0)

                    let memberValue_0 := read_from_memoryt_address(memberSrcPtr)

                    update_storage_value_offset_0t_address_to_t_address(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 1)
                    let memberSrcPtr := add(value, 32)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 2)
                    let memberSrcPtr := add(value, 64)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 3)
                    let memberSrcPtr := add(value, 96)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function write_to_memory_t_address(memPtr, value) {
                mstore(memPtr, cleanup_t_address(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

        }

    }

}

