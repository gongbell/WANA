/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "FNBToken_259" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_FNBToken_259()

        codecopy(0, dataoffset("FNBToken_259_deployed"), datasize("FNBToken_259_deployed"))

        return(0, datasize("FNBToken_259_deployed"))

        function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
            exponent := cleanup_t_uint256(exponent)

            if gt(exponent, 77) { panic_error() }

            power := exp(10, exponent)
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

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function constant_decimals_73() -> ret {
            let expr_72 := 0x12
            let _3 := convert_t_rational_18_by_1_to_t_uint8(expr_72)

            ret := _3
        }

        function constructor_FNBToken_259() {

            constructor_Ownable_68()

            let expr_101 := 0x9502f900
            let _1 := convert_t_rational_2500000000_by_1_to_t_uint256(expr_101)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _1)
            let expr_102 := _1
            let _2 := read_from_storage_split_offset_0_t_uint256(0x02)
            let expr_105 := _2
            let expr_106 := 0x0a
            let expr_109 := constant_decimals_73()
            let expr_110 := convert_t_uint8_to_t_uint256(expr_109)
            let _4 := convert_t_rational_10_by_1_to_t_uint256(expr_106)
            let expr_111 := checked_exp_t_rational_10_by_1_t_uint256(expr_110)
            let expr_112 := checked_mul_t_uint256(expr_105, expr_111)

            update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_112)
            let expr_113 := expr_112
            let _5 := read_from_storage_split_offset_0_t_uint256(0x03)
            let expr_118 := _5
            let _6 := 0x04
            let expr_115 := _6
            let _7 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_116 := _7
            let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_115,expr_116)
            update_storage_value_offset_0t_uint256_to_t_uint256(_8, expr_118)
            let expr_119 := expr_118

        }

        function constructor_Ownable_68() {

            let expr_15 := caller()
            let _9 := convert_t_address_payable_to_t_address(expr_15)
            update_storage_value_offset_0t_address_to_t_address(0x00, _9)
            let expr_16 := _9
            let expr_21 := 0x00
            let expr_22 := convert_t_rational_0_by_1_to_t_address_payable(expr_21)
            let _10 := convert_t_address_payable_to_t_address(expr_22)
            update_storage_value_offset_0t_address_to_t_address(0x01, _10)
            let expr_23 := _10

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

        function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function convert_t_rational_2500000000_by_1_to_t_uint256(value) -> converted {
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

        function convert_t_uint8_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function extract_from_storage_value_offset_0t_address(slot_value) -> value {
            value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
        }

        function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
            value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
        }

        function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
            mstore(0, convert_t_address_to_t_address(key))
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
    object "FNBToken_259_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x095ea7b3
                {
                    // approve(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_approve_212(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_totalSupply_147()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x23b872dd
                {
                    // transferFrom(address,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transferFrom_199(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_decimals_73()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3659cfe6
                {
                    // upgradeTo(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_upgradeTo_138(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5c60da1b
                {
                    // implementation()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_implementation_97()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_158(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x79ba5097
                {
                    // acceptOwnership()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_acceptOwnership_67()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_184(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_230()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0516650
                {
                    // frozen(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_frozen_89(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd4ee1d90
                {
                    // newOwner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_newOwner_4()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdd62ed3e
                {
                    // allowance(address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_address(4, calldatasize())
                    let ret_0 :=  fun_allowance_171(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf2fde38b
                {
                    // transferOwnership(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_transferOwnership_45(param_0)
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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
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

            function constant_decimals_73() -> ret {
                let expr_72 := 0x12
                let _1 := convert_t_rational_18_by_1_to_t_uint8(expr_72)

                ret := _1
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

            function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function fun__setImplementation_258(vloc__newImp_250) {

                let _25 := vloc__newImp_250
                let expr_254 := _25
                update_storage_value_offset_0t_address_to_t_address(0x08, expr_254)
                let expr_255 := expr_254

            }

            function fun_acceptOwnership_67() -> vloc__48 {
                let zero_value_for_type_t_bool_4 := zero_value_for_split_t_bool()
                vloc__48 := zero_value_for_type_t_bool_4

                let _5 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_51 := _5
                let _6 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_52 := _6
                let _7 := 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0
                {
                    let _8 := mload(64)
                    let _9 := abi_encode_tuple__to__fromStack(_8 )
                    log3(_8, sub(_9, _8) , _7, expr_51, expr_52)
                }let _10 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_56 := _10
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_56)
                let expr_57 := expr_56
                let expr_62 := 0x00
                let expr_63 := convert_t_rational_0_by_1_to_t_address_payable(expr_62)
                let _11 := convert_t_address_payable_to_t_address(expr_63)
                update_storage_value_offset_0t_address_to_t_address(0x01, _11)
                let expr_64 := _11

            }

            function fun_allowance_171(vloc_owner_160, vloc_spender_162) -> vloc__165 {
                let zero_value_for_type_t_uint256_17 := zero_value_for_split_t_uint256()
                vloc__165 := zero_value_for_type_t_uint256_17

                let expr_167_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_approve_212(vloc_spender_201, vloc_value_203) -> vloc__206 {
                let zero_value_for_type_t_bool_20 := zero_value_for_split_t_bool()
                vloc__206 := zero_value_for_type_t_bool_20

                let expr_208_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_balanceOf_158(vloc_who_149) -> vloc__152 {
                let zero_value_for_type_t_uint256_16 := zero_value_for_split_t_uint256()
                vloc__152 := zero_value_for_type_t_uint256_16

                let expr_154_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_func_230() {

                let _21 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_217 := _21
                let vloc_impl_216 := expr_217
                let _22 := vloc_impl_216
                let expr_220 := _22
                let expr_223 := 0x00
                let expr_224 := convert_t_rational_0_by_1_to_t_address_payable(expr_223)
                let expr_225 := iszero(eq(cleanup_t_address(expr_220), convert_t_address_payable_to_t_address(expr_224)))
                require_helper(expr_225)
                {
                    let usr$ptr := mload(0x40)
                    calldatacopy(usr$ptr, 0, calldatasize())
                    let usr$result := delegatecall(gas(), vloc_impl_216, usr$ptr, calldatasize(), 0, 0)
                    let usr$size := returndatasize()
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function fun_implementationCall_248() {

                let _23 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_235 := _23
                let vloc_impl_234 := expr_235
                let _24 := vloc_impl_234
                let expr_238 := _24
                let expr_241 := 0x00
                let expr_242 := convert_t_rational_0_by_1_to_t_address_payable(expr_241)
                let expr_243 := iszero(eq(cleanup_t_address(expr_238), convert_t_address_payable_to_t_address(expr_242)))
                require_helper(expr_243)
                {
                    let usr$ptr := mload(0x40)
                    calldatacopy(usr$ptr, 0, calldatasize())
                    let usr$result := delegatecall(gas(), vloc_impl_234, usr$ptr, calldatasize(), 0, 0)
                    let usr$size := returndatasize()
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function fun_totalSupply_147() -> vloc__141 {
                let zero_value_for_type_t_uint256_15 := zero_value_for_split_t_uint256()
                vloc__141 := zero_value_for_type_t_uint256_15

                let expr_143_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_transferFrom_199(vloc_from_186, vloc_to_188, vloc_value_190) -> vloc__193 {
                let zero_value_for_type_t_bool_19 := zero_value_for_split_t_bool()
                vloc__193 := zero_value_for_type_t_bool_19

                let expr_195_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_transferOwnership_45(vloc__newOwner_28) {

                let _2 := vloc__newOwner_28
                let expr_32 := _2
                let expr_35 := 0x00
                let expr_36 := convert_t_rational_0_by_1_to_t_address_payable(expr_35)
                let expr_37 := iszero(eq(cleanup_t_address(expr_32), convert_t_address_payable_to_t_address(expr_36)))
                require_helper(expr_37)
                let _3 := vloc__newOwner_28
                let expr_41 := _3
                update_storage_value_offset_0t_address_to_t_address(0x01, expr_41)
                let expr_42 := expr_41

            }

            function fun_transfer_184(vloc_to_173, vloc_value_175) -> vloc__178 {
                let zero_value_for_type_t_bool_18 := zero_value_for_split_t_bool()
                vloc__178 := zero_value_for_type_t_bool_18

                let expr_180_functionIdentifier := 248
                fun_implementationCall_248()

            }

            function fun_upgradeTo_138(vloc__newImplementation_124) {

                let _12 := read_from_storage_split_offset_0_t_address(0x08)
                let expr_128 := _12
                let _13 := vloc__newImplementation_124
                let expr_129 := _13
                let expr_130 := iszero(eq(cleanup_t_address(expr_128), cleanup_t_address(expr_129)))
                require_helper(expr_130)
                let expr_133_functionIdentifier := 258
                let _14 := vloc__newImplementation_124
                let expr_134 := _14
                fun__setImplementation_258(expr_134)

            }

            function getter_fun_decimals_73() -> ret_0 {
                ret_0 := constant_decimals_73()
            }

            function getter_fun_frozen_89(key_0) -> ret {

                let slot := 6
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_implementation_97() -> ret {

                let slot := 8
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_newOwner_4() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
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

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
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

