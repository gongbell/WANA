/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "RaffleStrangeLoop_320" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_RaffleStrangeLoop_320()

        codecopy(0, dataoffset("RaffleStrangeLoop_320_deployed"), datasize("RaffleStrangeLoop_320_deployed"))

        return(0, datasize("RaffleStrangeLoop_320_deployed"))

        function checked_add_t_uint256(x, y) -> sum {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)

            // overflow, if x > (maxValue - y)
            if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

            sum := add(x, y)
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_RaffleStrangeLoop_320() {

            let expr_26 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_26)
            let expr_27 := expr_26
            let expr_31 := timestamp()
            let expr_32 := 0x13c680
            let expr_33 := checked_add_t_uint256(expr_31, convert_t_rational_1296000_by_1_to_t_uint256(expr_32))

            update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_33)
            let expr_34 := expr_33

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_1296000_by_1_to_t_uint256(value) -> converted {
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

        function panic_error() {
            invalid()
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

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "RaffleStrangeLoop_320_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1a170aa1
                {
                    // buyTickets(bytes32)

                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_buyTickets_242(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x353d90ec
                {
                    // numTickets()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_numTickets_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x40e424ee
                {
                    // chooseWinner(bytes32)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_chooseWinner_164(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x50b44712
                {
                    // tickets(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_tickets_9(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7382901e
                {
                    // serverSeedHash()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_serverSeedHash_19()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x806b984f
                {
                    // lastBlock()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_lastBlock_17()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa457c2ae
                {
                    // clientSeed()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_clientSeed_21()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa5a7d086
                {
                    // ethereumFoundationTickets()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ethereumFoundationTickets_13()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb2d5ae44
                {
                    // getRefund()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_getRefund_311()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_319()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdfbf53ae
                {
                    // winner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_winner_5()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe409edf1
                {
                    // chooseWinnerDeadline()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_chooseWinnerDeadline_15()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe7638445
                {
                    // getRaffleTimeLeft()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getRaffleTimeLeft_69()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            35function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            40function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
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

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

            }

            45function abi_encode_tuple_t_bytes32_t_address_payable_t_uint256__to_t_bytes32_t_address_payable_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value1,  add(headStart, 32))

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

            50function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
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

            55function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

                product := mul(x, y)
            }

            56function checked_sub_t_int256(x, y) -> diff {
                x := cleanup_t_int256(x)
                y := cleanup_t_int256(y)

                // underflow, if y >= 0 and x < (minValue + y)
                if and(iszero(slt(y, 0)), slt(x, add(0x8000000000000000000000000000000000000000000000000000000000000000, y))) { panic_error() }
                // overflow, if y < 0 and x > (maxValue + y)
                if and(slt(y, 0), sgt(x, add(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y))) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            60function cleanup_from_storage_t_uint256(value) -> cleaned {
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

            function cleanup_t_int256(value) -> cleaned {
                cleaned := value
            }

            65function cleanup_t_uint160(value) -> cleaned {
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

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            70function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_contract$_RaffleStrangeLoop_$320_to_t_address(value) -> converted {
                converted := convert_t_contract$_RaffleStrangeLoop_$320_to_t_uint160(value)
            }

            function convert_t_contract$_RaffleStrangeLoop_$320_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_int256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            75function convert_t_rational_0_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            79function convert_t_rational_minus_86400_by_1_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(value)
            }

            80function convert_t_stringliteral_02016836a56b71f0d02689e69e326f4f4c1b9057164ef592671cf0d37c8040c0_to_t_bytes32() -> converted {
                converted := 0x6f776e6572000000000000000000000000000000000000000000000000000000
            }

            function convert_t_stringliteral_03fdd35df5abdca01d9636bb94d7def6b9ec7b106963b58bf2b62fee59ca7083_to_t_bytes32() -> converted {
                converted := 0x657468657265756d2d666f756e646174696f6e00000000000000000000000000
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            84function convert_t_uint256_to_t_int256(value) -> converted {
                converted := cleanup_t_int256(value)
            }

            85function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bytes32(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            89function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            90function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
            }

            92function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_buyTickets_242(vloc_beneficiary_166) {

                let expr_170_functionIdentifier := 69
                let expr_171 := fun_getRaffleTimeLeft_69()
                let expr_172 := 0x00
                let expr_173 := gt(cleanup_t_uint256(expr_171), convert_t_rational_0_by_1_to_t_uint256(expr_172))
                require_helper(expr_173)
                let expr_179 := callvalue()
                let expr_180 := 0x2386f26fc10000
                let expr_181 := checked_div_t_uint256(expr_179, convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_180))

                let vloc_ticketsBought_177 := expr_181
                let expr_186 := caller()
                let expr_187_address := convert_t_address_payable_to_t_address(expr_186)
                let expr_189 := callvalue()
                let expr_190 := 0x2386f26fc10000
                let expr_191 := checked_mod_t_uint256(expr_189, convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_190))

                let _29 := 0
                if iszero(expr_191) { _29 := 2300 }
                let _30 := call(_29, expr_187_address, expr_191, 0, 0, 0, 0)

                if iszero(_30) { revert_forward_1() }

                let _31 := read_from_storage_split_offset_0_t_bytes32(0x08)
                let expr_198 := _31
                let expr_200 := caller()
                let expr_202 := callvalue()

                let expr_203_mpos := allocateTemporaryMemory()
                let _32 := add(expr_203_mpos, 0x20)

                let _33 := abi_encode_tuple_t_bytes32_t_address_payable_t_uint256__to_t_bytes32_t_address_payable_t_uint256__fromStack(_32, expr_198, expr_200, expr_202)
                mstore(expr_203_mpos, sub(_33, add(expr_203_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_33))
                let expr_204 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_203_mpos), array_length_t_bytes_memory_ptr(expr_203_mpos))
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x08, expr_204)
                let expr_205 := expr_204
                let expr_209 := number()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x06, expr_209)
                let expr_210 := expr_209
                for {
                    let expr_214 := 0x00
                    let vloc_i_213 := convert_t_rational_0_by_1_to_t_uint256(expr_214)
                    } 1 {
                    let _35 := vloc_i_213
                    let _34 := increment_t_uint256(_35)
                    vloc_i_213 := _34
                    let expr_220 := _35
                }
                {
                    let _36 := vloc_i_213
                    let expr_216 := _36
                    let _37 := vloc_ticketsBought_177
                    let expr_217 := _37
                    let expr_218 := lt(cleanup_t_uint256(expr_216), cleanup_t_uint256(expr_217))
                    if iszero(expr_218) { break }
                    let expr_227 := caller()
                    let _38 := convert_t_address_payable_to_t_address(expr_227)
                    let _39 := 0x02
                    let expr_222 := _39
                    let _41 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let _40 := increment_t_uint256(_41)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x03, _40)
                    let expr_224 := _41
                    let _42 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_222,expr_224)
                    update_storage_value_offset_0t_address_to_t_address(_42, _38)
                    let expr_228 := _38
                }
                let _43 := vloc_beneficiary_166
                let expr_232 := _43
                let expr_234 := eq(cleanup_t_bytes32(expr_232), convert_t_stringliteral_03fdd35df5abdca01d9636bb94d7def6b9ec7b106963b58bf2b62fee59ca7083_to_t_bytes32())
                if expr_234 {
                    let _44 := vloc_ticketsBought_177
                    let expr_236 := _44
                    let _45 := read_from_storage_split_offset_0_t_uint256(0x04)
                    expr_236 := checked_add_t_uint256(_45, expr_236)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_236)
                    let expr_237 := expr_236
                }

            }

            94function fun_chooseWinner_164(vloc_seed_71) {

                let _5 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_78 := _5
                let expr_79 := convert_t_uint256_to_t_int256(expr_78)
                let expr_83 := timestamp()
                let expr_84 := convert_t_uint256_to_t_int256(expr_83)
                let expr_85 := checked_sub_t_int256(expr_79, expr_84)

                let vloc_timeLeft_75 := expr_85
                let _6 := vloc_timeLeft_75
                let expr_88 := _6
                let expr_89 := 0x00
                let expr_90 := slt(cleanup_t_int256(expr_88), convert_t_rational_0_by_1_to_t_int256(expr_89))
                let expr_95 := expr_90
                if expr_95 {
                    let _7 := vloc_timeLeft_75
                    let expr_91 := _7
                    let expr_92 := 0x015180
                    let expr_93 := 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeae80
                    let expr_94 := sgt(cleanup_t_int256(expr_91), convert_t_rational_minus_86400_by_1_to_t_int256(expr_93))
                    expr_95 := expr_94
                }
                require_helper(expr_95)
                let _8 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_99 := _8
                let expr_100 := 0x00
                let expr_101 := gt(cleanup_t_uint256(expr_99), convert_t_rational_0_by_1_to_t_uint256(expr_100))
                require_helper(expr_101)
                let _9 := vloc_seed_71
                let expr_109 := _9
                let _10 := read_from_storage_split_offset_0_t_bytes32(0x08)
                let expr_110 := _10

                let expr_111_mpos := allocateTemporaryMemory()
                let _11 := add(expr_111_mpos, 0x20)

                let _12 := abi_encode_tuple_t_bytes32_t_bytes32__to_t_bytes32_t_bytes32__fromStack(_11, expr_109, expr_110)
                mstore(expr_111_mpos, sub(_12, add(expr_111_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_12))
                let expr_112 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_111_mpos), array_length_t_bytes_memory_ptr(expr_111_mpos))
                let vloc_serverClientHash_105 := expr_112
                let _13 := vloc_serverClientHash_105
                let expr_118 := _13
                let expr_119 := convert_t_bytes32_to_t_uint256(expr_118)
                let _14 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_120 := _14
                let expr_121 := xor(expr_119, expr_120)

                let expr_122 := expr_121
                let _15 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_123 := _15
                let expr_124 := checked_mod_t_uint256(expr_122, expr_123)

                let vloc_winnerIdx_115 := expr_124
                let _16 := 0x02
                let expr_127 := _16
                let _17 := vloc_winnerIdx_115
                let expr_128 := _17
                let _18 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_127,expr_128)
                let _19 := read_from_storage_split_offset_0_t_address(_18)
                let expr_129 := _19
                update_storage_value_offset_0t_address_to_t_address(0x01, expr_129)
                let expr_130 := expr_129
                let _20 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_134 := _20
                let expr_135 := 0x2386f26fc10000
                let expr_136 := checked_mul_t_uint256(expr_134, convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_135))

                let vloc_donation_133 := expr_136
                let _21 := vloc_donation_133
                let expr_138 := _21
                let expr_139 := 0x00
                let expr_140 := gt(cleanup_t_uint256(expr_138), convert_t_rational_0_by_1_to_t_uint256(expr_139))
                if expr_140 {
                    let expr_143 := 0xfb6916095ca1df60bb79ce92ce3ea74c37c5d359
                    let vloc_ethereumTipJar_142 := expr_143
                    let _22 := vloc_ethereumTipJar_142
                    let expr_145 := _22
                    let expr_147_address := convert_t_address_payable_to_t_address(expr_145)
                    let _23 := vloc_donation_133
                    let expr_148 := _23

                    let _24 := 0
                    if iszero(expr_148) { _24 := 2300 }
                    let _25 := call(_24, expr_147_address, expr_148, 0, 0, 0, 0)

                    if iszero(_25) { revert_forward_1() }

                }
                let _26 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_153 := _26
                let expr_155_address := convert_t_address_payable_to_t_address(expr_153)
                let expr_158_address := address()
                let expr_159 := convert_t_contract$_RaffleStrangeLoop_$320_to_t_address(expr_158_address)
                let expr_160 := balance(expr_159)

                let _27 := 0
                if iszero(expr_160) { _27 := 2300 }
                let _28 := call(_27, expr_155_address, expr_160, 0, 0, 0, 0)

                if iszero(_28) { revert_forward_1() }

            }

            function fun_func_319() {

                let expr_314_functionIdentifier := 242
                let _65 := convert_t_stringliteral_02016836a56b71f0d02689e69e326f4f4c1b9057164ef592671cf0d37c8040c0_to_t_bytes32()
                fun_buyTickets_242(_65)

            }

            96function fun_getRaffleTimeLeft_69() -> vloc__40 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__40 := zero_value_for_type_t_uint256_1

                let _2 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_46 := _2
                let expr_47 := convert_t_uint256_to_t_int256(expr_46)
                let expr_51 := timestamp()
                let expr_52 := convert_t_uint256_to_t_int256(expr_51)
                let expr_53 := checked_sub_t_int256(expr_47, expr_52)

                let vloc_timeLeft_43 := expr_53
                let _3 := vloc_timeLeft_43
                let expr_55 := _3
                let expr_56 := 0x00
                let expr_57 := sgt(cleanup_t_int256(expr_55), convert_t_rational_0_by_1_to_t_int256(expr_56))
                switch expr_57
                case 0 {
                    let expr_64 := 0x00
                    vloc__40 := convert_t_rational_0_by_1_to_t_uint256(expr_64)
                    leave
                }
                default {
                    let _4 := vloc_timeLeft_43
                    let expr_60 := _4
                    let expr_61 := convert_t_int256_to_t_uint256(expr_60)
                    vloc__40 := expr_61
                    leave
                }

            }

            function fun_getRefund_311() {

                let _46 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_249 := _46
                let expr_250 := convert_t_uint256_to_t_int256(expr_249)
                let expr_254 := timestamp()
                let expr_255 := convert_t_uint256_to_t_int256(expr_254)
                let expr_256 := checked_sub_t_int256(expr_250, expr_255)

                let vloc_timeLeft_246 := expr_256
                let _47 := vloc_timeLeft_246
                let expr_259 := _47
                let expr_260 := 0x015180
                let expr_261 := 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeae80
                let expr_262 := slt(cleanup_t_int256(expr_259), convert_t_rational_minus_86400_by_1_to_t_int256(expr_261))
                require_helper(expr_262)
                let expr_267 := 0x00
                let vloc_amountToRefund_266 := convert_t_rational_0_by_1_to_t_uint256(expr_267)
                for {
                    let expr_271 := 0x00
                    let vloc_i_270 := convert_t_rational_0_by_1_to_t_uint256(expr_271)
                    } 1 {
                    let _49 := vloc_i_270
                    let _48 := increment_t_uint256(_49)
                    vloc_i_270 := _48
                    let expr_277 := _49
                }
                {
                    let _50 := vloc_i_270
                    let expr_273 := _50
                    let _51 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let expr_274 := _51
                    let expr_275 := lt(cleanup_t_uint256(expr_273), cleanup_t_uint256(expr_274))
                    if iszero(expr_275) { break }
                    let _52 := 0x02
                    let expr_279 := _52
                    let _53 := vloc_i_270
                    let expr_280 := _53
                    let _54 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_279,expr_280)
                    let _55 := read_from_storage_split_offset_0_t_address(_54)
                    let expr_281 := _55
                    let expr_283 := caller()
                    let expr_284 := eq(cleanup_t_address(expr_281), convert_t_address_payable_to_t_address(expr_283))
                    if expr_284 {
                        let expr_286 := 0x2386f26fc10000
                        let _56 := convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_286)
                        let _57 := vloc_amountToRefund_266
                        _56 := checked_add_t_uint256(_57, _56)
                        vloc_amountToRefund_266 := _56
                        let expr_287 := _56
                        let expr_294 := 0x00
                        let expr_295 := convert_t_rational_0_by_1_to_t_address_payable(expr_294)
                        let _58 := convert_t_address_payable_to_t_address(expr_295)
                        let _59 := 0x02
                        let expr_289 := _59
                        let _60 := vloc_i_270
                        let expr_290 := _60
                        let _61 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_289,expr_290)
                        update_storage_value_offset_0t_address_to_t_address(_61, _58)
                        let expr_296 := _58
                    }
                }
                let expr_305 := caller()
                let expr_306_address := convert_t_address_payable_to_t_address(expr_305)
                let _62 := vloc_amountToRefund_266
                let expr_307 := _62

                let _63 := 0
                if iszero(expr_307) { _63 := 2300 }
                let _64 := call(_63, expr_306_address, expr_307, 0, 0, 0, 0)

                if iszero(_64) { revert_forward_1() }

            }

            function getter_fun_chooseWinnerDeadline_15() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            100function getter_fun_clientSeed_21() -> ret {

                let slot := 8
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bytes32(slot, offset)

            }

            function getter_fun_ethereumFoundationTickets_13() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_lastBlock_17() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_numTickets_11() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_serverSeedHash_19() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bytes32(slot, offset)

            }

            function getter_fun_tickets_9(key_0) -> ret {

                let slot := 2
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(slot, key_0)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_winner_5() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(slot , key) -> dataSlot {
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

            function prepare_store_t_bytes32(value) -> ret {
                ret := shift_right_0_unsigned(value)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bytes32(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bytes32(sload(slot), offset)

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

            function read_from_storage_split_offset_0_t_bytes32(slot) -> value {
                value := extract_from_storage_value_offset_0t_bytes32(sload(slot))

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

            function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0) {
                let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
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

