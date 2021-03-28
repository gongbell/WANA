/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EthBird_164" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EthBird_164()

        codecopy(0, dataoffset("EthBird_164_deployed"), datasize("EthBird_164_deployed"))

        return(0, datasize("EthBird_164_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_EthBird_164() {

            let expr_6 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x02, expr_6)
            let expr_10 := timestamp()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_10)

            let expr_20 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_20)
            let expr_21 := expr_20

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

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
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

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "EthBird_164_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x184018c6
                {
                    // awardHighScore()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_awardHighScore_163()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x28d08142
                {
                    // getCurrentHighscoreUser()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getCurrentHighscoreUser_57()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7037ec6f
                {
                    // payEntryFee()

                    abi_decode_tuple_(4, calldatasize())
                    fun_payEntryFee_41()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x80a37e23
                {
                    // recordHighScore(uint256,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_address_payable(4, calldatasize())
                    let ret_0 :=  fun_recordHighScore_128(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9f57d16e
                {
                    // getCurrentJackpot()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getCurrentJackpot_69()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc5cf8c7e
                {
                    // getCurrentHighscore()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getCurrentHighscore_49()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd69a1a5f
                {
                    // getNextPayoutEstimation()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getNextPayoutEstimation_83()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_uint256t_address_payable(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
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

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_contract$_EthBird_$164_to_t_address(value) -> converted {
                converted := convert_t_contract$_EthBird_$164_to_t_uint160(value)
            }

            function convert_t_contract$_EthBird_$164_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_awardHighScore_163() {

                let expr_135_address := address()
                let expr_136 := convert_t_contract$_EthBird_$164_to_t_address(expr_135_address)
                let expr_137 := balance(expr_136)
                let expr_138 := 0x0a
                let expr_139 := checked_div_t_uint256(expr_137, convert_t_rational_10_by_1_to_t_uint256(expr_138))

                let vloc_ownerCommision_132 := expr_139
                let _22 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_141 := _22
                let expr_143_address := convert_t_address_payable_to_t_address(expr_141)
                let _23 := vloc_ownerCommision_132
                let expr_144 := _23

                let _24 := 0
                if iszero(expr_144) { _24 := 2300 }
                let _25 := call(_24, expr_143_address, expr_144, 0, 0, 0, 0)

                if iszero(_25) { revert_forward_1() }

                let _26 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_147 := _26
                let expr_149_address := convert_t_address_payable_to_t_address(expr_147)
                let expr_152_address := address()
                let expr_153 := convert_t_contract$_EthBird_$164_to_t_address(expr_152_address)
                let expr_154 := balance(expr_153)

                let _27 := 0
                if iszero(expr_154) { _27 := 2300 }
                let _28 := call(_27, expr_149_address, expr_154, 0, 0, 0, 0)

                if iszero(_28) { revert_forward_1() }

                let expr_159 := timestamp()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_159)
                let expr_160 := expr_159

            }

            function fun_getCurrentHighscoreUser_57() -> vloc__52 {
                let zero_value_for_type_t_address_1 := zero_value_for_split_t_address()
                vloc__52 := zero_value_for_type_t_address_1

                let _2 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_54 := _2
                vloc__52 := convert_t_address_payable_to_t_address(expr_54)
                leave

            }

            function fun_getCurrentHighscore_49() -> vloc__44 {
                let zero_value_for_type_t_uint256_6 := zero_value_for_split_t_uint256()
                vloc__44 := zero_value_for_type_t_uint256_6

                let _7 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_46 := _7
                vloc__44 := expr_46
                leave

            }

            function fun_getCurrentJackpot_69() -> vloc__60 {
                let zero_value_for_type_t_uint256_3 := zero_value_for_split_t_uint256()
                vloc__60 := zero_value_for_type_t_uint256_3

                let expr_64_address := address()
                let expr_65 := convert_t_contract$_EthBird_$164_to_t_address(expr_64_address)
                let expr_66 := balance(expr_65)
                vloc__60 := expr_66
                leave

            }

            function fun_getNextPayoutEstimation_83() -> vloc__72 {
                let zero_value_for_type_t_uint256_8 := zero_value_for_split_t_uint256()
                vloc__72 := zero_value_for_type_t_uint256_8

                let _9 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_74 := _9
                let expr_75 := 0x015180
                let expr_76 := checked_add_t_uint256(expr_74, convert_t_rational_86400_by_1_to_t_uint256(expr_75))

                let expr_77 := expr_76
                let expr_79 := timestamp()
                let expr_80 := checked_sub_t_uint256(expr_77, expr_79)

                vloc__72 := expr_80
                leave

            }

            function fun_payEntryFee_41() {

                let expr_28 := callvalue()
                let expr_29 := 0x038d7ea4c68000
                let expr_30 := iszero(lt(cleanup_t_uint256(expr_28), convert_t_rational_1000000000000000_by_1_to_t_uint256(expr_29)))
                if expr_30 {
                    let expr_35 := 0x01
                    let _4 := 0x04
                    let expr_31 := _4
                    let expr_33 := caller()
                    let _5 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_31,expr_33)
                    update_storage_value_offset_0t_bool_to_t_bool(_5, expr_35)
                    let expr_36 := expr_35
                }

            }

            function fun_recordHighScore_128(vloc_score_85, vloc_userToScore_87) -> vloc__90 {
                let zero_value_for_type_t_address_10 := zero_value_for_split_t_address()
                vloc__90 := zero_value_for_type_t_address_10

                let _11 := 0x04
                let expr_92 := _11
                let _12 := vloc_userToScore_87
                let expr_93 := _12
                let _13 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_92,expr_93)
                let _14 := read_from_storage_split_offset_0_t_bool(_13)
                let expr_94 := _14
                if expr_94 {
                    let _15 := vloc_score_85
                    let expr_95 := _15
                    let expr_96 := 0x00
                    let expr_97 := gt(cleanup_t_uint256(expr_95), convert_t_rational_0_by_1_to_t_uint256(expr_96))
                    let expr_101 := expr_97
                    if expr_101 {
                        let _16 := vloc_score_85
                        let expr_98 := _16
                        let _17 := read_from_storage_split_offset_0_t_uint256(0x02)
                        let expr_99 := _17
                        let expr_100 := iszero(lt(cleanup_t_uint256(expr_98), cleanup_t_uint256(expr_99)))
                        expr_101 := expr_100
                    }
                    if expr_101 {
                        let _18 := vloc_userToScore_87
                        let expr_103 := _18
                        update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_103)
                        let expr_104 := expr_103
                        let _19 := vloc_score_85
                        let expr_107 := _19
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_107)
                        let expr_108 := expr_107
                    }
                    let expr_113 := timestamp()
                    let _20 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let expr_114 := _20
                    let expr_115 := 0x015180
                    let expr_116 := checked_add_t_uint256(expr_114, convert_t_rational_86400_by_1_to_t_uint256(expr_115))

                    let expr_117 := iszero(lt(cleanup_t_uint256(expr_113), cleanup_t_uint256(expr_116)))
                    if expr_117 {
                        let expr_118_functionIdentifier := 163
                        fun_awardHighScore_163()
                    }
                }
                let _21 := vloc_userToScore_87
                let expr_125 := _21
                vloc__90 := convert_t_address_payable_to_t_address(expr_125)
                leave

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

