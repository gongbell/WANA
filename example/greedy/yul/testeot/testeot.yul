/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "testeot_320" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_testeot_320()

        codecopy(0, dataoffset("testeot_320_deployed"), datasize("testeot_320_deployed"))

        return(0, datasize("testeot_320_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function constructor_testeot_320() {

            let expr_2 := 0x2c781f708c509f400000
            update_storage_value_offset_0t_rational_210000000000000000000000_by_1_to_t_uint256(0x00, expr_2)
            let expr_5 := 0x2c781f708c509f400000
            update_storage_value_offset_0t_rational_210000000000000000000000_by_1_to_t_uint256(0x01, expr_5)
            let expr_8 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x02, expr_8)
            let expr_11 := 0x12
            update_storage_value_offset_0t_rational_18_by_1_to_t_uint8(0x03, expr_11)
            let expr_14 := 0x64
            update_storage_value_offset_0t_rational_100_by_1_to_t_uint256(0x04, expr_14)
            let expr_17 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x05, expr_17)
            let expr_21 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address(0x06, expr_21)
            let expr_25 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address(0x07, expr_25)

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function convert_t_rational_210000000000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint8(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

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

        function update_storage_value_offset_0t_address_payable_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_100_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_100_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_18_by_1_to_t_uint8(slot, value_0) {
            let convertedValue_0 := convert_t_rational_18_by_1_to_t_uint8(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_uint8(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_210000000000000000000000_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_210000000000000000000000_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "testeot_320_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x05540534
                {
                    // setMultisigAddress(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setMultisigAddress_319(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x095ea7b3
                {
                    // approve(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_approve_203(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1207bb8e
                {
                    // crowdsalePrice()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_crowdsalePrice_15()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1240adc8
                {
                    // stoppCrowdsale(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_stoppCrowdsale_309(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_totalSupply_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transferFrom_163(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_decimals_12()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_175(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7ecc2b56
                {
                    // availableSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_availableSupply_6()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_26()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x91b7f5ed
                {
                    // setPrice(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_setPrice_299(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9358928b
                {
                    // circulatingSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_circulatingSupply_9()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_99(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc0d0aa69
                {
                    // daoMultisig()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_daoMultisig_22()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xccb07cef
                {
                    // crowdsaleClosed()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_crowdsaleClosed_18()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdd62ed3e
                {
                    // allowance(address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    let ret_0 :=  fun_allowance_219(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf2fde38b
                {
                    // transferOwnership(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_transferOwnership_229(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            fun__289() stop()

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
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

            function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint8__to_t_uint8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_from_storage_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
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

            function convert_t_uint160_to_t_address(value) -> converted {
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

            function extract_from_storage_value_dynamict_uint8(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun__289() {

                let _86 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_232 := _86
                let expr_233 := 0x00
                let expr_234 := gt(cleanup_t_uint256(expr_232), convert_t_rational_0_by_1_to_t_uint256(expr_233))
                if expr_234 {
                    revert(0, 0)
                }
                let expr_240 := callvalue()
                let expr_241 := 0x00
                let expr_242 := eq(cleanup_t_uint256(expr_240), convert_t_rational_0_by_1_to_t_uint256(expr_241))
                if expr_242 {
                    revert(0, 0)
                }
                let expr_250 := caller()
                let _87 := read_from_storage_split_offset_0_t_address(0x06)
                let expr_251 := _87
                let expr_253 := callvalue()
                let _88 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _89 := convert_t_address_payable_to_t_address(expr_250)
                {
                    let _90 := mload(64)
                    let _91 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_90 , expr_253)
                    log3(_90, sub(_91, _90) , _88, _89, expr_251)
                }let expr_259 := callvalue()
                let _92 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_260 := _92
                let expr_261 := checked_mul_t_uint256(expr_259, expr_260)

                let vloc_token_257 := expr_261
                let _93 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_264 := _93
                let _94 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_265 := _94
                let expr_266 := checked_sub_t_uint256(expr_264, expr_265)

                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_266)
                let expr_267 := expr_266
                let _95 := vloc_token_257
                let expr_269 := _95
                let _96 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_270 := _96
                let expr_271 := gt(cleanup_t_uint256(expr_269), cleanup_t_uint256(expr_270))
                if expr_271 {
                    revert(0, 0)
                }
                let _97 := vloc_token_257
                let expr_278 := _97
                let _98 := read_from_storage_split_offset_0_t_uint256(0x02)
                expr_278 := checked_add_t_uint256(_98, expr_278)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_278)
                let expr_279 := expr_278
                let _99 := vloc_token_257
                let expr_285 := _99
                let _100 := 0x08
                let expr_281 := _100
                let expr_283 := caller()
                let _101 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_281,expr_283)
                let _102 := read_from_storage_split_offset_0_t_uint256(_101)
                expr_285 := checked_add_t_uint256(_102, expr_285)
                update_storage_value_offset_0t_uint256_to_t_uint256(_101, expr_285)
                let expr_286 := expr_285

            }

            function fun_allowance_219(vloc__owner_205, vloc__spender_207) -> vloc_remaining_210 {
                let zero_value_for_type_t_uint256_77 := zero_value_for_split_t_uint256()
                vloc_remaining_210 := zero_value_for_type_t_uint256_77

                let _78 := 0x09
                let expr_212 := _78
                let _79 := vloc__owner_205
                let expr_213 := _79
                let _80 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_212,expr_213)
                let _81 := _80
                let expr_214 := _81
                let _82 := vloc__spender_207
                let expr_215 := _82
                let _83 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_214,expr_215)
                let _84 := read_from_storage_split_offset_0_t_uint256(_83)
                let expr_216 := _84
                vloc_remaining_210 := expr_216
                leave

            }

            function fun_approve_203(vloc__spender_177, vloc__value_179) -> vloc_success_182 {
                let zero_value_for_type_t_bool_64 := zero_value_for_split_t_bool()
                vloc_success_182 := zero_value_for_type_t_bool_64

                let _65 := vloc__value_179
                let expr_190 := _65
                let _66 := 0x09
                let expr_184 := _66
                let expr_186 := caller()
                let _67 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(expr_184,expr_186)
                let _68 := _67
                let expr_188 := _68
                let _69 := vloc__spender_177
                let expr_187 := _69
                let _70 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_188,expr_187)
                update_storage_value_offset_0t_uint256_to_t_uint256(_70, expr_190)
                let expr_191 := expr_190
                let expr_195 := caller()
                let _71 := vloc__spender_177
                let expr_196 := _71
                let _72 := vloc__value_179
                let expr_197 := _72
                let _73 := 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
                let _74 := convert_t_address_payable_to_t_address(expr_195)
                {
                    let _75 := mload(64)
                    let _76 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_75 , expr_197)
                    log3(_75, sub(_76, _75) , _73, _74, expr_196)
                }let expr_200 := 0x01
                vloc_success_182 := expr_200
                leave

            }

            function fun_balanceOf_175(vloc__owner_165) -> vloc_balance_168 {
                let zero_value_for_type_t_uint256_59 := zero_value_for_split_t_uint256()
                vloc_balance_168 := zero_value_for_type_t_uint256_59

                let _60 := 0x08
                let expr_170 := _60
                let _61 := vloc__owner_165
                let expr_171 := _61
                let _62 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_170,expr_171)
                let _63 := read_from_storage_split_offset_0_t_uint256(_62)
                let expr_172 := _63
                vloc_balance_168 := expr_172
                leave

            }

            function fun_setMultisigAddress_319(vloc_newMultisig_311) {

                let _105 := vloc_newMultisig_311
                let expr_315 := _105
                update_storage_value_offset_0t_address_to_t_address(0x06, expr_315)
                let expr_316 := expr_315

            }

            function fun_setPrice_299(vloc_newSellPrice_291) {

                let _103 := vloc_newSellPrice_291
                let expr_295 := _103
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_295)
                let expr_296 := expr_295

            }

            function fun_stoppCrowdsale_309(vloc_newStoppSign_301) {

                let _104 := vloc_newStoppSign_301
                let expr_305 := _104
                update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_305)
                let expr_306 := expr_305

            }

            function fun_transferFrom_163(vloc__from_101, vloc__to_103, vloc__value_105) -> vloc_success_108 {
                let zero_value_for_type_t_bool_22 := zero_value_for_split_t_bool()
                vloc_success_108 := zero_value_for_type_t_bool_22

                let _23 := 0x08
                let expr_110 := _23
                let _24 := vloc__from_101
                let expr_111 := _24
                let _25 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_110,expr_111)
                let _26 := read_from_storage_split_offset_0_t_uint256(_25)
                let expr_112 := _26
                let _27 := vloc__value_105
                let expr_113 := _27
                let expr_114 := iszero(lt(cleanup_t_uint256(expr_112), cleanup_t_uint256(expr_113)))
                let expr_123 := expr_114
                if expr_123 {
                    let _28 := 0x09
                    let expr_115 := _28
                    let _29 := vloc__from_101
                    let expr_116 := _29
                    let _30 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_115,expr_116)
                    let _31 := _30
                    let expr_117 := _31
                    let expr_119 := caller()
                    let _32 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_117,expr_119)
                    let _33 := read_from_storage_split_offset_0_t_uint256(_32)
                    let expr_120 := _33
                    let _34 := vloc__value_105
                    let expr_121 := _34
                    let expr_122 := iszero(lt(cleanup_t_uint256(expr_120), cleanup_t_uint256(expr_121)))
                    expr_123 := expr_122
                }
                let expr_127 := expr_123
                if expr_127 {
                    let _35 := vloc__value_105
                    let expr_124 := _35
                    let expr_125 := 0x00
                    let expr_126 := gt(cleanup_t_uint256(expr_124), convert_t_rational_0_by_1_to_t_uint256(expr_125))
                    expr_127 := expr_126
                }
                switch expr_127
                case 0 {
                    let expr_158 := 0x00
                    vloc_success_108 := expr_158
                    leave
                }
                default {
                    let _36 := vloc__value_105
                    let expr_131 := _36
                    let _37 := 0x08
                    let expr_128 := _37
                    let _38 := vloc__to_103
                    let expr_129 := _38
                    let _39 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_128,expr_129)
                    let _40 := read_from_storage_split_offset_0_t_uint256(_39)
                    expr_131 := checked_add_t_uint256(_40, expr_131)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_39, expr_131)
                    let expr_132 := expr_131
                    let _41 := vloc__value_105
                    let expr_137 := _41
                    let _42 := 0x08
                    let expr_134 := _42
                    let _43 := vloc__from_101
                    let expr_135 := _43
                    let _44 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_134,expr_135)
                    let _45 := read_from_storage_split_offset_0_t_uint256(_44)
                    expr_137 := checked_sub_t_uint256(_45, expr_137)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_44, expr_137)
                    let expr_138 := expr_137
                    let _46 := vloc__value_105
                    let expr_146 := _46
                    let _47 := 0x09
                    let expr_140 := _47
                    let _48 := vloc__from_101
                    let expr_141 := _48
                    let _49 := mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(expr_140,expr_141)
                    let _50 := _49
                    let expr_144 := _50
                    let expr_143 := caller()
                    let _51 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_144,expr_143)
                    let _52 := read_from_storage_split_offset_0_t_uint256(_51)
                    expr_146 := checked_sub_t_uint256(_52, expr_146)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_51, expr_146)
                    let expr_147 := expr_146
                    let _53 := vloc__from_101
                    let expr_150 := _53
                    let _54 := vloc__to_103
                    let expr_151 := _54
                    let _55 := vloc__value_105
                    let expr_152 := _55
                    let _56 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                    {
                        let _57 := mload(64)
                        let _58 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_57 , expr_152)
                        log3(_57, sub(_58, _57) , _56, expr_150, expr_151)
                    }let expr_155 := 0x01
                    vloc_success_108 := expr_155
                    leave
                }

            }

            function fun_transferOwnership_229(vloc_newOwner_221) {

                let _85 := vloc_newOwner_221
                let expr_225 := _85
                update_storage_value_offset_0t_address_to_t_address(0x07, expr_225)
                let expr_226 := expr_225

            }

            function fun_transfer_99(vloc__to_54, vloc__value_56) -> vloc_success_59 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc_success_59 := zero_value_for_type_t_bool_1

                let _2 := 0x08
                let expr_61 := _2
                let expr_63 := caller()
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_61,expr_63)
                let _4 := read_from_storage_split_offset_0_t_uint256(_3)
                let expr_64 := _4
                let _5 := vloc__value_56
                let expr_65 := _5
                let expr_66 := iszero(lt(cleanup_t_uint256(expr_64), cleanup_t_uint256(expr_65)))
                let expr_70 := expr_66
                if expr_70 {
                    let _6 := vloc__value_56
                    let expr_67 := _6
                    let expr_68 := 0x00
                    let expr_69 := gt(cleanup_t_uint256(expr_67), convert_t_rational_0_by_1_to_t_uint256(expr_68))
                    expr_70 := expr_69
                }
                switch expr_70
                case 0 {
                    let expr_94 := 0x00
                    vloc_success_59 := expr_94
                    leave
                }
                default {
                    let _7 := vloc__value_56
                    let expr_75 := _7
                    let _8 := 0x08
                    let expr_71 := _8
                    let expr_73 := caller()
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_71,expr_73)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    expr_75 := checked_sub_t_uint256(_10, expr_75)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_9, expr_75)
                    let expr_76 := expr_75
                    let _11 := vloc__value_56
                    let expr_81 := _11
                    let _12 := 0x08
                    let expr_78 := _12
                    let _13 := vloc__to_54
                    let expr_79 := _13
                    let _14 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_78,expr_79)
                    let _15 := read_from_storage_split_offset_0_t_uint256(_14)
                    expr_81 := checked_add_t_uint256(_15, expr_81)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_14, expr_81)
                    let expr_82 := expr_81
                    let expr_86 := caller()
                    let _16 := vloc__to_54
                    let expr_87 := _16
                    let _17 := vloc__value_56
                    let expr_88 := _17
                    let _18 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                    let _19 := convert_t_address_payable_to_t_address(expr_86)
                    {
                        let _20 := mload(64)
                        let _21 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_20 , expr_88)
                        log3(_20, sub(_21, _20) , _18, _19, expr_87)
                    }let expr_91 := 0x01
                    vloc_success_59 := expr_91
                    leave
                }

            }

            function getter_fun_availableSupply_6() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_circulatingSupply_9() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_crowdsaleClosed_18() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_crowdsalePrice_15() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_daoMultisig_22() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_decimals_12() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint8(slot, offset)

            }

            function getter_fun_owner_26() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_totalSupply_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
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

            function read_from_storage_split_dynamic_t_uint8(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint8(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

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

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

