/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "HashBet_162" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_HashBet_162()

        codecopy(0, dataoffset("HashBet_162_deployed"), datasize("HashBet_162_deployed"))

        return(0, datasize("HashBet_162_deployed"))

        function constructor_HashBet_162() {

        }

    }
    object "HashBet_162_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x561e91a1
                {
                    // makeBet()

                    abi_decode_tuple_(4, calldatasize())
                    fun_makeBet_59()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8fced626
                {
                    // resolveBet()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_resolveBet_161()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_uint16_to_t_uint16_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint16(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_uint256_t_uint16__to_t_uint256_t_uint16__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint16_to_t_uint16_fromStack(value1,  add(headStart, 32))

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

            function allocate_memory_struct_t_struct$_Bet_$19_memory_ptr() -> memPtr {
                memPtr := allocateMemory(64)
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

            function checked_mod_t_uint16(x, y) -> r {
                x := cleanup_t_uint16(x)
                y := cleanup_t_uint16(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
            }

            48function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            50function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            53function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            55function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_contract$_HashBet_$162_to_t_address(value) -> converted {
                converted := convert_t_contract$_HashBet_$162_to_t_uint160(value)
            }

            function convert_t_contract$_HashBet_$162_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            60function convert_t_rational_1000_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_115792089237316195423570985008687907853269984665640564039457584007913129640_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            62function convert_t_rational_255_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_495_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            65function convert_t_struct$_Bet_$19_storage_to_t_struct$_Bet_$19_memory_ptr(value) -> converted {

                converted := read_from_storage_reference_type_t_struct$_Bet_$19_memory_ptr(value)

            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            70function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_makeBet_59() {

                let _1 := 0x00
                let expr_23 := _1
                let expr_25 := caller()
                let _2 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Bet_$19_storage_$_of_t_address_payable(expr_23,expr_25)
                let _3_slot := _2
                let expr_26_slot := _3_slot
                let _4 := add(expr_26_slot, 1)
                let _5 := read_from_storage_split_offset_0_t_uint256(_4)
                let expr_27 := _5
                let expr_28 := 0x00
                let expr_29 := eq(cleanup_t_uint256(expr_27), convert_t_rational_0_by_1_to_t_uint256(expr_28))
                let expr_34 := expr_29
                if expr_34 {
                    let expr_31 := callvalue()
                    let expr_32 := 0x2710
                    let expr_33 := gt(cleanup_t_uint256(expr_31), convert_t_rational_10000_by_1_to_t_uint256(expr_32))
                    expr_34 := expr_33
                }
                require_helper(expr_34)
                let _6 := 0x00
                let expr_39 := _6
                let expr_41 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Bet_$19_storage_$_of_t_address_payable(expr_39,expr_41)
                let _8_slot := _7
                let expr_42_slot := _8_slot
                let vloc_newBet_38_mpos := convert_t_struct$_Bet_$19_storage_to_t_struct$_Bet_$19_memory_ptr(expr_42_slot)
                let expr_48 := callvalue()
                let _9_mpos := vloc_newBet_38_mpos
                let expr_44_mpos := _9_mpos
                let _10 := add(expr_44_mpos, 0)
                let _11 := expr_48
                write_to_memory_t_uint256(_10, _11)
                let expr_49 := expr_48
                let expr_55 := number()
                let _12_mpos := vloc_newBet_38_mpos
                let expr_51_mpos := _12_mpos
                let _13 := add(expr_51_mpos, 32)
                let _14 := expr_55
                write_to_memory_t_uint256(_13, _14)
                let expr_56 := expr_55

            }

            73function fun_resolveBet_161() {

                let _15 := 0x00
                let expr_64 := _15
                let expr_66 := caller()
                let _16 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Bet_$19_storage_$_of_t_address_payable(expr_64,expr_66)
                let _17_slot := _16
                let expr_67_slot := _17_slot
                let vloc_bet_63_mpos := convert_t_struct$_Bet_$19_storage_to_t_struct$_Bet_$19_memory_ptr(expr_67_slot)
                let expr_72 := number()
                let _18_mpos := vloc_bet_63_mpos
                let expr_73_mpos := _18_mpos
                let _19 := add(expr_73_mpos, 32)
                let _20 := read_from_memoryt_uint256(_19)
                let expr_74 := _20
                let expr_75 := checked_sub_t_uint256(expr_72, expr_74)

                let vloc_dist_70 := expr_75
                let _21 := vloc_dist_70
                let expr_78 := _21
                let expr_79 := 0xff
                let expr_80 := lt(cleanup_t_uint256(expr_78), convert_t_rational_255_by_1_to_t_uint256(expr_79))
                let expr_84 := expr_80
                if expr_84 {
                    let _22 := vloc_dist_70
                    let expr_81 := _22
                    let expr_82 := 0x03
                    let expr_83 := gt(cleanup_t_uint256(expr_81), convert_t_rational_3_by_1_to_t_uint256(expr_82))
                    expr_84 := expr_83
                }
                require_helper(expr_84)
                let _23_mpos := vloc_bet_63_mpos
                let expr_90_mpos := _23_mpos
                let _24 := add(expr_90_mpos, 32)
                let _25 := read_from_memoryt_uint256(_24)
                let expr_91 := _25
                let expr_92 := blockhash(expr_91)
                let vloc_h1_88 := expr_92
                let _26_mpos := vloc_bet_63_mpos
                let expr_97_mpos := _26_mpos
                let _27 := add(expr_97_mpos, 32)
                let _28 := read_from_memoryt_uint256(_27)
                let expr_98 := _28
                let expr_99 := 0x03
                let expr_100 := checked_add_t_uint256(expr_98, convert_t_rational_3_by_1_to_t_uint256(expr_99))

                let expr_101 := blockhash(expr_100)
                let vloc_h2_95 := expr_101
                let _29 := vloc_h1_88
                let expr_110 := _29
                let _30 := vloc_h2_95
                let expr_111 := _30

                let expr_112_mpos := allocateTemporaryMemory()
                let _31 := add(expr_112_mpos, 0x20)

                let _32 := abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(_31, expr_110, expr_111)
                mstore(expr_112_mpos, sub(_32, add(expr_112_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_32))
                let expr_113 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_112_mpos), array_length_t_bytes_memory_ptr(expr_112_mpos))
                let expr_114 := convert_t_bytes32_to_t_uint256(expr_113)
                let vloc_hashVal_104 := expr_114
                let expr_118 := 0x4189374bc6a7ef9db22d0e5604189374bc6a7ef9db22d0e5604189374bc6a8
                let vloc_FACTOR_117 := convert_t_rational_115792089237316195423570985008687907853269984665640564039457584007913129640_by_1_to_t_uint256(expr_118)
                let _33 := vloc_hashVal_104
                let expr_124 := _33
                let _34 := vloc_FACTOR_117
                let expr_125 := _34
                let expr_126 := checked_div_t_uint256(expr_124, expr_125)

                let expr_127 := expr_126
                let expr_128 := convert_t_uint256_to_t_uint16(expr_127)
                let expr_129 := 0x03e8
                let expr_130 := checked_mod_t_uint16(expr_128, convert_t_rational_1000_by_1_to_t_uint16(expr_129))

                let vloc_result_121 := expr_130
                let expr_135 := 0x00
                let _35 := convert_t_rational_0_by_1_to_t_uint256(expr_135)
                let _36_mpos := vloc_bet_63_mpos
                let expr_132_mpos := _36_mpos
                let _37 := add(expr_132_mpos, 32)
                let _38 := _35
                write_to_memory_t_uint256(_37, _38)
                let expr_136 := _35
                let _39 := vloc_result_121
                let expr_138 := _39
                let expr_139 := 0x01ef
                let expr_140 := iszero(gt(cleanup_t_uint16(expr_138), convert_t_rational_495_by_1_to_t_uint16(expr_139)))
                if expr_140 {
                    let expr_144 := caller()
                    let expr_145_address := convert_t_address_payable_to_t_address(expr_144)
                    let expr_148_address := address()
                    let expr_149 := convert_t_contract$_HashBet_$162_to_t_address(expr_148_address)
                    let expr_150 := balance(expr_149)

                    let _40 := 0
                    if iszero(expr_150) { _40 := 2300 }
                    let _41 := call(_40, expr_145_address, expr_150, 0, 0, 0, 0)

                    if iszero(_41) { revert_forward_1() }

                }
                let _42 := vloc_hashVal_104
                let expr_156 := _42
                let _43 := vloc_result_121
                let expr_157 := _43
                let _44 := 0x178326fbf5c20c61275cbe6563cde7202341acc72645c1cd56985aba438e403b
                {
                    let _45 := mload(64)
                    let _46 := abi_encode_tuple_t_uint256_t_uint16__to_t_uint256_t_uint16__fromStack(_45 , expr_156, expr_157)
                    log1(_45, sub(_46, _45) , _44)
                }
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Bet_$19_storage_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            75function panic_error() {
                invalid()
            }

            76function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            77function read_from_storage_reference_type_t_struct$_Bet_$19_memory_ptr(slot) -> value {
                value := allocate_memory_struct_t_struct$_Bet_$19_memory_ptr()

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 0), 0)
                    write_to_memory_t_uint256(add(value, 0), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint256(add(slot, 1), 0)
                    write_to_memory_t_uint256(add(value, 32), memberValue_0)
                }

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            80function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            85function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            86function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

        }

    }

}

