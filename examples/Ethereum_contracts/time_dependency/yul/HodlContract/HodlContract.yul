/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "HodlContract_186" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_HodlContract_186()

        codecopy(0, dataoffset("HodlContract_186_deployed"), datasize("HodlContract_186_deployed"))

        return(0, datasize("HodlContract_186_deployed"))

        function constructor_HodlContract_186() {

        }

    }
    object "HodlContract_186_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0de94e4a
                {
                    // HodlEth(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_HodlEth_89(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x216be181
                {
                    // hodls(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3 :=  getter_fun_hodls_6(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_t_uint256_t_uint256_t_bool__to_t_address_t_uint256_t_uint256_t_bool__fromStack(memPos , ret_0, ret_1, ret_2, ret_3)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc2f7c50a
                {
                    // FindID(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_FindID_185(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd6b2b242
                {
                    // Realize(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_Realize_144(param_0)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_address_t_uint256_t_uint256_t_bool__to_t_address_t_uint256_t_uint256_t_bool__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_bool_to_t_bool_fromStack(value3,  add(headStart, 96))

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

            function array_dataslot_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(value) -> length {

                length := sload(value)

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

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_99_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
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

            function fun_FindID_185(vloc_beneficiary_146) -> vloc_hodlID_149 {
                let zero_value_for_type_t_uint256_78 := zero_value_for_split_t_uint256()
                vloc_hodlID_149 := zero_value_for_type_t_uint256_78

                for {
                    let expr_153 := 0x00
                    let vloc_i_152 := convert_t_rational_0_by_1_to_t_uint256(expr_153)
                    } 1 {
                    let _80 := vloc_i_152
                    let _79 := increment_t_uint256(_80)
                    vloc_i_152 := _79
                    let expr_160 := _79
                }
                {
                    let _81 := vloc_i_152
                    let expr_155 := _81
                    let _82_slot := 0x00
                    let expr_156_slot := _82_slot
                    let expr_157 := array_length_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_156_slot)
                    let expr_158 := lt(cleanup_t_uint256(expr_155), cleanup_t_uint256(expr_157))
                    if iszero(expr_158) { break }
                    let _83_slot := 0x00
                    let expr_162_slot := _83_slot
                    let _84 := vloc_hodlID_149
                    let expr_163 := _84

                    let _85, _86 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_162_slot, expr_163)
                    let _87_slot := _85
                    let expr_164_slot := _87_slot
                    let _88 := add(expr_164_slot, 0)
                    let _89 := read_from_storage_split_offset_0_t_address(_88)
                    let expr_165 := _89
                    let _90 := vloc_beneficiary_146
                    let expr_166 := _90
                    let expr_167 := eq(cleanup_t_address(expr_165), cleanup_t_address(expr_166))
                    let expr_173 := expr_167
                    if expr_173 {
                        let _91_slot := 0x00
                        let expr_168_slot := _91_slot
                        let _92 := vloc_hodlID_149
                        let expr_169 := _92

                        let _93, _94 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_168_slot, expr_169)
                        let _95_slot := _93
                        let expr_170_slot := _95_slot
                        let _96 := add(expr_170_slot, 3)
                        let _97 := read_from_storage_split_offset_0_t_bool(_96)
                        let expr_171 := _97
                        let expr_172 := cleanup_t_bool(iszero(expr_171))
                        expr_173 := expr_172
                    }
                    switch expr_173
                    case 0 {
                        revert(0, 0)
                    }
                    default {
                        let _98 := vloc_hodlID_149
                        let expr_174 := _98
                        vloc_hodlID_149 := expr_174
                        leave
                    }
                }

            }

            function fun_HodlEth_89(vloc_beneficiary_19, vloc_daysWait_21) -> vloc_hodlID_24 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc_hodlID_24 := zero_value_for_type_t_uint256_1

                let vloc_FeeAmount_27
                let zero_value_for_type_t_uint256_2 := zero_value_for_split_t_uint256()
                vloc_FeeAmount_27 := zero_value_for_type_t_uint256_2
                let expr_30 := 0x9979ccff79de92fbc1fb43bcd2a3a97bb86b6920
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_30)
                let expr_31 := expr_30
                let expr_35 := callvalue()
                let expr_36 := 0x01
                let expr_37 := checked_mul_t_uint256(expr_35, convert_t_rational_1_by_1_to_t_uint256(expr_36))

                let expr_38 := 0x64
                let expr_39 := checked_div_t_uint256(expr_37, convert_t_rational_100_by_1_to_t_uint256(expr_38))

                vloc_FeeAmount_27 := expr_39
                let expr_40 := expr_39
                let _3 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_42 := _3
                let expr_44_address := convert_t_address_payable_to_t_address(expr_42)
                let _4 := vloc_FeeAmount_27
                let expr_45 := _4

                let _5 := 0
                if iszero(expr_45) { _5 := 2300 }
                let _6 := call(_5, expr_44_address, expr_45, 0, 0, 0, 0)

                if iszero(_6) { revert_forward_1() }

                let expr_53 := timestamp()
                let _7 := vloc_daysWait_21
                let expr_54 := _7
                let expr_55 := 0x015180
                let expr_56 := checked_mul_t_uint256(expr_54, convert_t_rational_86400_by_1_to_t_uint256(expr_55))

                let expr_57 := checked_add_t_uint256(expr_53, expr_56)

                let _8_slot := 0x00
                let expr_48_slot := _8_slot
                let _9 := vloc_hodlID_24
                let expr_49 := _9

                let _10, _11 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_48_slot, expr_49)
                let _12_slot := _10
                let expr_50_slot := _12_slot
                let _13 := add(expr_50_slot, 2)
                update_storage_value_offset_0t_uint256_to_t_uint256(_13, expr_57)
                let expr_58 := expr_57
                let _14 := vloc_beneficiary_19
                let expr_64 := _14
                let _15_slot := 0x00
                let expr_60_slot := _15_slot
                let _16 := vloc_hodlID_24
                let expr_61 := _16

                let _17, _18 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_60_slot, expr_61)
                let _19_slot := _17
                let expr_62_slot := _19_slot
                let _20 := add(expr_62_slot, 0)
                update_storage_value_offset_0t_address_to_t_address(_20, expr_64)
                let expr_65 := expr_64
                let expr_72 := callvalue()
                let expr_73 := 0x63
                let expr_74 := checked_mul_t_uint256(expr_72, convert_t_rational_99_by_1_to_t_uint256(expr_73))

                let expr_75 := 0x64
                let expr_76 := checked_div_t_uint256(expr_74, convert_t_rational_100_by_1_to_t_uint256(expr_75))

                let _21_slot := 0x00
                let expr_67_slot := _21_slot
                let _22 := vloc_hodlID_24
                let expr_68 := _22

                let _23, _24 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_67_slot, expr_68)
                let _25_slot := _23
                let expr_69_slot := _25_slot
                let _26 := add(expr_69_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_26, expr_76)
                let expr_77 := expr_76
                let expr_83 := 0x00
                let _27_slot := 0x00
                let expr_79_slot := _27_slot
                let _28 := vloc_hodlID_24
                let expr_80 := _28

                let _29, _30 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_79_slot, expr_80)
                let _31_slot := _29
                let expr_81_slot := _31_slot
                let _32 := add(expr_81_slot, 3)
                update_storage_value_offset_0t_bool_to_t_bool(_32, expr_83)
                let expr_84 := expr_83
                let _33 := vloc_hodlID_24
                let expr_86 := _33
                vloc_hodlID_24 := expr_86
                leave

            }

            function fun_Realize_144(vloc_hodlID_91) -> vloc_amount_94 {
                let zero_value_for_type_t_uint256_34 := zero_value_for_split_t_uint256()
                vloc_amount_94 := zero_value_for_type_t_uint256_34

                let expr_98 := timestamp()
                let _35_slot := 0x00
                let expr_99_slot := _35_slot
                let _36 := vloc_hodlID_91
                let expr_100 := _36

                let _37, _38 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_99_slot, expr_100)
                let _39_slot := _37
                let expr_101_slot := _39_slot
                let _40 := add(expr_101_slot, 2)
                let _41 := read_from_storage_split_offset_0_t_uint256(_40)
                let expr_102 := _41
                let expr_103 := gt(cleanup_t_uint256(expr_98), cleanup_t_uint256(expr_102))
                let expr_109 := expr_103
                if expr_109 {
                    let _42_slot := 0x00
                    let expr_104_slot := _42_slot
                    let _43 := vloc_hodlID_91
                    let expr_105 := _43

                    let _44, _45 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_104_slot, expr_105)
                    let _46_slot := _44
                    let expr_106_slot := _46_slot
                    let _47 := add(expr_106_slot, 3)
                    let _48 := read_from_storage_split_offset_0_t_bool(_47)
                    let expr_107 := _48
                    let expr_108 := cleanup_t_bool(iszero(expr_107))
                    expr_109 := expr_108
                }
                let expr_117 := expr_109
                if expr_117 {
                    let expr_111 := caller()
                    let _49_slot := 0x00
                    let expr_112_slot := _49_slot
                    let _50 := vloc_hodlID_91
                    let expr_113 := _50

                    let _51, _52 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_112_slot, expr_113)
                    let _53_slot := _51
                    let expr_114_slot := _53_slot
                    let _54 := add(expr_114_slot, 0)
                    let _55 := read_from_storage_split_offset_0_t_address(_54)
                    let expr_115 := _55
                    let expr_116 := eq(convert_t_address_payable_to_t_address(expr_111), cleanup_t_address(expr_115))
                    expr_117 := expr_116
                }
                require_helper(expr_117)
                let expr_123 := caller()
                let expr_124_address := convert_t_address_payable_to_t_address(expr_123)
                let _56_slot := 0x00
                let expr_125_slot := _56_slot
                let _57 := vloc_hodlID_91
                let expr_126 := _57

                let _58, _59 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_125_slot, expr_126)
                let _60_slot := _58
                let expr_127_slot := _60_slot
                let _61 := add(expr_127_slot, 1)
                let _62 := read_from_storage_split_offset_0_t_uint256(_61)
                let expr_128 := _62

                let _63 := 0
                if iszero(expr_128) { _63 := 2300 }
                let _64 := call(_63, expr_124_address, expr_128, 0, 0, 0, 0)

                if iszero(_64) { revert_forward_1() }

                let expr_135 := 0x01
                let _65_slot := 0x00
                let expr_131_slot := _65_slot
                let _66 := vloc_hodlID_91
                let expr_132 := _66

                let _67, _68 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_131_slot, expr_132)
                let _69_slot := _67
                let expr_133_slot := _69_slot
                let _70 := add(expr_133_slot, 3)
                update_storage_value_offset_0t_bool_to_t_bool(_70, expr_135)
                let expr_136 := expr_135
                let _71_slot := 0x00
                let expr_138_slot := _71_slot
                let _72 := vloc_hodlID_91
                let expr_139 := _72

                let _73, _74 := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(expr_138_slot, expr_139)
                let _75_slot := _73
                let expr_140_slot := _75_slot
                let _76 := add(expr_140_slot, 1)
                let _77 := read_from_storage_split_offset_0_t_uint256(_76)
                let expr_141 := _77
                vloc_amount_94 := expr_141
                leave

            }

            function getter_fun_hodls_6(key_0) -> ret_0, ret_1, ret_2, ret_3 {

                let slot := 0
                let offset := 0

                if iszero(lt(key_0, array_length_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_address(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

                ret_2 := read_from_storage_split_offset_0_t_uint256(add(slot, 2))

                ret_3 := read_from_storage_split_offset_0_t_bool(add(slot, 3))

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
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

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

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

            function storage_array_index_access_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_struct$_HodlStruct_$17_storage_$dyn_storage(array)
                slot := add(dataArea, mul(index, 4))
                offset := 0

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

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
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

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

