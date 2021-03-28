/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "eth666_329" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_eth666_329()

        codecopy(0, dataoffset("eth666_329_deployed"), datasize("eth666_329_deployed"))

        return(0, datasize("eth666_329_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_eth666_329() {

            let expr_23 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x06, expr_23)
            let expr_26 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x07, expr_26)
            let expr_29 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x08, expr_29)

            let expr_43 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_43)
            let expr_44 := expr_43
            let expr_48 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_48)
            let expr_49 := expr_48
            let expr_52 := 0x00
            let _1 := convert_t_rational_0_by_1_to_t_uint256(expr_52)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x09, _1)
            let expr_53 := _1

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
    object "eth666_329_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1b68adff
                {
                    // userDividendsWei(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_userDividendsWei_307(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x544b255a
                {
                    // investorNum()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_investorNum_30()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8a55d36e
                {
                    // isStart()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_isStart_32()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa16d5960
                {
                    // setPartner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_setPartner_66(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb781e47d
                {
                    // totalWithdrewWei()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_totalWithdrewWei_27()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb8a5368a
                {
                    // gameStart(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_gameStart_76(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbe10862b
                {
                    // partner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_partner_5()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_237()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc8d1c6cf
                {
                    // userDepositedWei(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_userDepositedWei_269(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe557498b
                {
                    // reFund(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_address_payablet_uint256(4, calldatasize())
                    fun_reFund_257(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xee12d4f2
                {
                    // totalDepositedWei()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_totalDepositedWei_24()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xee1596e5
                {
                    // userReferralsWei(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_userReferralsWei_319(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfc4fcc5a
                {
                    // userWithdrewWei(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_userWithdrewWei_281(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            35function abi_decode_t_uint256(offset, end) -> value {
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

            function abi_decode_tuple_t_address_payable(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_address_payablet_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
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

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

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

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
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

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(value, length) -> converted {

                // Copy the array to a free position in memory

                converted := allocate_memory_array_t_bytes_memory_ptr(length)
                copy_calldata_to_memory(value, add(converted, 0x20), length)

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

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_20_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5900_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_666_by_1_to_t_uint256(value) -> converted {
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

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
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

            function fun_bytesToAddress_328(vloc_bys_321_mpos) -> vloc_addr_324 {
                let zero_value_for_type_t_address_payable_91 := zero_value_for_split_t_address_payable()
                vloc_addr_324 := zero_value_for_type_t_address_payable_91

                {
                    vloc_addr_324 := mload(add(vloc_bys_321_mpos, 20))
                }

            }

            function fun_func_237() {

                let expr_81 := caller()
                let expr_83 := callvalue()
                let _3 := 0xb9b8c2461485ea1cc7d37d2326748846e4e65a93a395281a0a9c742764449982
                let _4 := convert_t_address_payable_to_t_address(expr_81)
                {
                    let _5 := mload(64)
                    let _6 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_5 , expr_83)
                    log2(_5, sub(_6, _5) , _3, _4)
                }let expr_89 := callvalue()
                let expr_90 := 0x0a
                let expr_91 := checked_div_t_uint256(expr_89, convert_t_rational_10_by_1_to_t_uint256(expr_90))

                let vloc_admRefPerc_87 := expr_91
                let expr_96 := callvalue()
                let expr_97 := 0x14
                let expr_98 := checked_div_t_uint256(expr_96, convert_t_rational_20_by_1_to_t_uint256(expr_97))

                let vloc_advPerc_94 := expr_98
                let _7 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_100 := _7
                let expr_102_address := convert_t_address_payable_to_t_address(expr_100)
                let _8 := vloc_admRefPerc_87
                let expr_103 := _8

                let _9 := 0
                if iszero(expr_103) { _9 := 2300 }
                let _10 := call(_9, expr_102_address, expr_103, 0, 0, 0, 0)

                if iszero(_10) { revert_forward_1() }

                let _11 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_106 := _11
                let expr_108_address := convert_t_address_payable_to_t_address(expr_106)
                let _12 := vloc_advPerc_94
                let expr_109 := _12

                let _13 := 0
                if iszero(expr_109) { _13 := 2300 }
                let _14 := call(_13, expr_108_address, expr_109, 0, 0, 0, 0)

                if iszero(_14) { revert_forward_1() }

                let _15 := 0x02
                let expr_112 := _15
                let expr_114 := caller()
                let _16 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_112,expr_114)
                let _17 := read_from_storage_split_offset_0_t_uint256(_16)
                let expr_115 := _17
                let expr_116 := 0x00
                let expr_117 := iszero(eq(cleanup_t_uint256(expr_115), convert_t_rational_0_by_1_to_t_uint256(expr_116)))
                let expr_121 := expr_117
                if expr_121 {
                    let _18 := read_from_storage_split_offset_0_t_uint256(0x09)
                    let expr_118 := _18
                    let expr_119 := 0x00
                    let expr_120 := iszero(eq(cleanup_t_uint256(expr_118), convert_t_rational_0_by_1_to_t_uint256(expr_119)))
                    expr_121 := expr_120
                }
                switch expr_121
                case 0 {
                    let _19 := 0x02
                    let expr_167 := _19
                    let expr_169 := caller()
                    let _20 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_167,expr_169)
                    let _21 := read_from_storage_split_offset_0_t_uint256(_20)
                    let expr_170 := _21
                    let expr_171 := 0x00
                    let expr_172 := eq(cleanup_t_uint256(expr_170), convert_t_rational_0_by_1_to_t_uint256(expr_171))
                    let expr_176 := expr_172
                    if expr_176 {
                        let _22 := read_from_storage_split_offset_0_t_uint256(0x09)
                        let expr_173 := _22
                        let expr_174 := 0x00
                        let expr_175 := iszero(eq(cleanup_t_uint256(expr_173), convert_t_rational_0_by_1_to_t_uint256(expr_174)))
                        expr_176 := expr_175
                    }
                    if expr_176 {
                        let expr_178 := 0x01
                        let _23 := convert_t_rational_1_by_1_to_t_uint256(expr_178)
                        let _24 := read_from_storage_split_offset_0_t_uint256(0x08)
                        _23 := checked_add_t_uint256(_24, _23)
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x08, _23)
                        let expr_179 := _23
                    }
                }
                default {
                    let expr_125 := caller()
                    let vloc_investor_123 := expr_125
                    let _25 := 0x02
                    let expr_129 := _25
                    let expr_131 := caller()
                    let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_129,expr_131)
                    let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                    let expr_132 := _27
                    let expr_133 := 0x029a
                    let expr_134 := checked_mul_t_uint256(expr_132, convert_t_rational_666_by_1_to_t_uint256(expr_133))

                    let expr_135 := 0x2710
                    let expr_136 := checked_div_t_uint256(expr_134, convert_t_rational_10000_by_1_to_t_uint256(expr_135))

                    let expr_138 := number()
                    let _28 := 0x05
                    let expr_139 := _28
                    let expr_141 := caller()
                    let _29 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_139,expr_141)
                    let _30 := read_from_storage_split_offset_0_t_uint256(_29)
                    let expr_142 := _30
                    let expr_143 := checked_sub_t_uint256(expr_138, expr_142)

                    let expr_144 := expr_143
                    let expr_145 := checked_mul_t_uint256(expr_136, expr_144)

                    let expr_146 := 0x170c
                    let expr_147 := checked_div_t_uint256(expr_145, convert_t_rational_5900_by_1_to_t_uint256(expr_146))

                    let vloc_depositsPercents_128 := expr_147
                    let _31 := vloc_investor_123
                    let expr_149 := _31
                    let expr_151_address := convert_t_address_payable_to_t_address(expr_149)
                    let _32 := vloc_depositsPercents_128
                    let expr_152 := _32

                    let _33 := 0
                    if iszero(expr_152) { _33 := 2300 }
                    let _34 := call(_33, expr_151_address, expr_152, 0, 0, 0, 0)

                    if iszero(_34) { revert_forward_1() }

                    let _35 := vloc_depositsPercents_128
                    let expr_159 := _35
                    let _36 := 0x03
                    let expr_155 := _36
                    let expr_157 := caller()
                    let _37 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_155,expr_157)
                    let _38 := read_from_storage_split_offset_0_t_uint256(_37)
                    expr_159 := checked_add_t_uint256(_38, expr_159)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_37, expr_159)
                    let expr_160 := expr_159
                    let _39 := vloc_depositsPercents_128
                    let expr_163 := _39
                    let _40 := read_from_storage_split_offset_0_t_uint256(0x07)
                    expr_163 := checked_add_t_uint256(_40, expr_163)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x07, expr_163)
                    let expr_164 := expr_163
                }
                let expr_185_functionIdentifier := 328
                let expr_187_offset := 0
                let expr_187_length := calldatasize()
                let _41_mpos := convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(expr_187_offset, expr_187_length)
                let expr_188 := fun_bytesToAddress_328(_41_mpos)
                let vloc_referrer_184 := expr_188
                let _42 := vloc_referrer_184
                let expr_190 := _42
                let expr_193 := 0x00
                let expr_194 := convert_t_rational_0_by_1_to_t_address_payable(expr_193)
                let expr_195 := gt(cleanup_t_address_payable(expr_190), cleanup_t_address_payable(expr_194))
                let expr_200 := expr_195
                if expr_200 {
                    let _43 := vloc_referrer_184
                    let expr_196 := _43
                    let expr_198 := caller()
                    let expr_199 := iszero(eq(cleanup_t_address_payable(expr_196), cleanup_t_address_payable(expr_198)))
                    expr_200 := expr_199
                }
                if expr_200 {
                    let _44 := vloc_referrer_184
                    let expr_201 := _44
                    let expr_203_address := convert_t_address_payable_to_t_address(expr_201)
                    let _45 := vloc_admRefPerc_87
                    let expr_204 := _45

                    let _46 := 0
                    if iszero(expr_204) { _46 := 2300 }
                    let _47 := call(_46, expr_203_address, expr_204, 0, 0, 0, 0)

                    if iszero(_47) { revert_forward_1() }

                    let _48 := vloc_advPerc_94
                    let expr_210 := _48
                    let _49 := 0x04
                    let expr_207 := _49
                    let _50 := vloc_referrer_184
                    let expr_208 := _50
                    let _51 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_207,expr_208)
                    let _52 := read_from_storage_split_offset_0_t_uint256(_51)
                    expr_210 := checked_add_t_uint256(_52, expr_210)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_51, expr_210)
                    let expr_211 := expr_210
                }
                let expr_220 := number()
                let _53 := 0x05
                let expr_215 := _53
                let expr_217 := caller()
                let _54 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_215,expr_217)
                update_storage_value_offset_0t_uint256_to_t_uint256(_54, expr_220)
                let expr_221 := expr_220
                let expr_228 := callvalue()
                let _55 := 0x02
                let expr_223 := _55
                let expr_225 := caller()
                let _56 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_223,expr_225)
                let _57 := read_from_storage_split_offset_0_t_uint256(_56)
                expr_228 := checked_add_t_uint256(_57, expr_228)
                update_storage_value_offset_0t_uint256_to_t_uint256(_56, expr_228)
                let expr_229 := expr_228
                let expr_233 := callvalue()
                let _58 := read_from_storage_split_offset_0_t_uint256(0x06)
                expr_233 := checked_add_t_uint256(_58, expr_233)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x06, expr_233)
                let expr_234 := expr_233

            }

            function fun_gameStart_76(vloc_num_68) {

                let _2 := vloc_num_68
                let expr_72 := _2
                update_storage_value_offset_0t_uint256_to_t_uint256(0x09, expr_72)
                let expr_73 := expr_72

            }

            function fun_reFund_257(vloc_exitUser_239, vloc_a_241) {

                let _59 := vloc_exitUser_239
                let expr_244 := _59
                let expr_246_address := convert_t_address_payable_to_t_address(expr_244)
                let _60 := vloc_a_241
                let expr_247 := _60

                let _61 := 0
                if iszero(expr_247) { _61 := 2300 }
                let _62 := call(_61, expr_246_address, expr_247, 0, 0, 0, 0)

                if iszero(_62) { revert_forward_1() }

                let expr_253 := 0x00
                let _63 := convert_t_rational_0_by_1_to_t_uint256(expr_253)
                let _64 := 0x02
                let expr_250 := _64
                let _65 := vloc_exitUser_239
                let expr_251 := _65
                let _66 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_250,expr_251)
                update_storage_value_offset_0t_uint256_to_t_uint256(_66, _63)
                let expr_254 := _63

            }

            function fun_setPartner_66(vloc_newPartner_58) {

                let _1 := vloc_newPartner_58
                let expr_62 := _1
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_62)
                let expr_63 := expr_62

            }

            function fun_userDepositedWei_269(vloc__address_259) -> vloc__262 {
                let zero_value_for_type_t_uint256_67 := zero_value_for_split_t_uint256()
                vloc__262 := zero_value_for_type_t_uint256_67

                let _68 := 0x02
                let expr_264 := _68
                let _69 := vloc__address_259
                let expr_265 := _69
                let _70 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_264,expr_265)
                let _71 := read_from_storage_split_offset_0_t_uint256(_70)
                let expr_266 := _71
                vloc__262 := expr_266
                leave

            }

            function fun_userDividendsWei_307(vloc__address_283) -> vloc__286 {
                let zero_value_for_type_t_uint256_77 := zero_value_for_split_t_uint256()
                vloc__286 := zero_value_for_type_t_uint256_77

                let _78 := 0x02
                let expr_288 := _78
                let _79 := vloc__address_283
                let expr_289 := _79
                let _80 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_288,expr_289)
                let _81 := read_from_storage_split_offset_0_t_uint256(_80)
                let expr_290 := _81
                let expr_291 := 0x029a
                let expr_292 := checked_mul_t_uint256(expr_290, convert_t_rational_666_by_1_to_t_uint256(expr_291))

                let expr_293 := 0x2710
                let expr_294 := checked_div_t_uint256(expr_292, convert_t_rational_10000_by_1_to_t_uint256(expr_293))

                let expr_296 := number()
                let _82 := 0x05
                let expr_297 := _82
                let _83 := vloc__address_283
                let expr_298 := _83
                let _84 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_297,expr_298)
                let _85 := read_from_storage_split_offset_0_t_uint256(_84)
                let expr_299 := _85
                let expr_300 := checked_sub_t_uint256(expr_296, expr_299)

                let expr_301 := expr_300
                let expr_302 := checked_mul_t_uint256(expr_294, expr_301)

                let expr_303 := 0x170c
                let expr_304 := checked_div_t_uint256(expr_302, convert_t_rational_5900_by_1_to_t_uint256(expr_303))

                vloc__286 := expr_304
                leave

            }

            function fun_userReferralsWei_319(vloc__address_309) -> vloc__312 {
                let zero_value_for_type_t_uint256_86 := zero_value_for_split_t_uint256()
                vloc__312 := zero_value_for_type_t_uint256_86

                let _87 := 0x04
                let expr_314 := _87
                let _88 := vloc__address_309
                let expr_315 := _88
                let _89 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_314,expr_315)
                let _90 := read_from_storage_split_offset_0_t_uint256(_89)
                let expr_316 := _90
                vloc__312 := expr_316
                leave

            }

            function fun_userWithdrewWei_281(vloc__address_271) -> vloc__274 {
                let zero_value_for_type_t_uint256_72 := zero_value_for_split_t_uint256()
                vloc__274 := zero_value_for_type_t_uint256_72

                let _73 := 0x03
                let expr_276 := _73
                let _74 := vloc__address_271
                let expr_277 := _74
                let _75 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_276,expr_277)
                let _76 := read_from_storage_split_offset_0_t_uint256(_75)
                let expr_278 := _76
                vloc__274 := expr_278
                leave

            }

            function getter_fun_investorNum_30() -> ret {

                let slot := 8
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_isStart_32() -> ret {

                let slot := 9
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_owner_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_partner_5() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_totalDepositedWei_24() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_totalWithdrewWei_27() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

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

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_address_payable() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

