/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "InkPublicPresale_931" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_InkPublicPresale_931()

        codecopy(0, dataoffset("InkPublicPresale_931_deployed"), datasize("InkPublicPresale_931_deployed"))

        return(0, datasize("InkPublicPresale_931_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_InkPublicPresale_931() {

            constructor_Ownable_142()

            let expr_179 := 0x0de0b6b3a7640000
            let _1 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_179)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _1)
            let expr_180 := _1
            let expr_183 := 0x016345785d8a0000
            let _2 := convert_t_rational_100000000000000000_by_1_to_t_uint256(expr_183)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _2)
            let expr_184 := _2
            let expr_187 := 0x09502f9000
            let _3 := convert_t_rational_40000000000_by_1_to_t_uint256(expr_187)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x07, _3)
            let expr_188 := _3

        }

        function constructor_Ownable_142() {

            let expr_112 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_112)
            let expr_113 := expr_112

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_100000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_40000000000_by_1_to_t_uint256(value) -> converted {
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

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "InkPublicPresale_931_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x01501347
                {
                    // disableRefund()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_disableRefund_340()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x02fb0c5e
                {
                    // active()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_active_146()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x046f7da2
                {
                    // resume()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_resume_315()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x21860a05
                {
                    // airdrop(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_airdrop_706(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2e0fc7a6
                {
                    // updateContributor(address,uint256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_uint256t_uint256(4, calldatasize())
                    fun_updateContributor_494(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3de39c11
                {
                    // maxGasPrice()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_maxGasPrice_162()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x48146341
                {
                    // updateMaxGasPrice(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_updateMaxGasPrice_207(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4ef39b75
                {
                    // finalize(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_finalize_725(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x590e1ae3
                {
                    // refund()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_refund_696()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6691461a
                {
                    // updateTokenAddress(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_updateTokenAddress_290(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_619(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7228b9db
                {
                    // etherCap()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_etherCap_154()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x83ccc8b8
                {
                    // getEtherContributed()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getEtherContributed_215()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8456cb59
                {
                    // pause()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_pause_302()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x89e42346
                {
                    // enableRefund()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_enableRefund_328()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_100()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x93627f42
                {
                    // globalMax()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_globalMax_152()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x99c27d40
                {
                    // updateGlobalMin(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_updateGlobalMin_271(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9d76ea58
                {
                    // tokenAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_tokenAddress_160()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa311d157
                {
                    // addContributor(address,uint256,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_uint256t_uint256(4, calldatasize())
                    fun_addContributor_400(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa34560be
                {
                    // updateEtherCap(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_updateEtherCap_233(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xaf933b57
                {
                    // withdrawEther(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_withdrawEther_597(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb3f3ab5c
                {
                    // removeContributor(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_removeContributor_565(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_770()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc1b8b704
                {
                    // updateGlobalMax(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_updateGlobalMax_249(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd979e906
                {
                    // getXNKPurchased()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getXNKPurchased_223()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf2fde38b
                {
                    // transferOwnership(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_transferOwnership_141(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf9c638ea
                {
                    // globalMin()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_globalMin_150()
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

            function abi_decode_tuple_t_addresst_uint256t_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            40function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, 0)

                end := add(pos, 0)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            45function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos ) -> end {

                pos := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack( pos)

                end := pos
            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            50function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function assert_helper(condition) {
                if iszero(condition) { panic_error() }
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            54function checked_mul_t_uint256(x, y) -> product {
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

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_contract$_InkPublicPresale_$931_to_t_address(value) -> converted {
                converted := convert_t_contract$_InkPublicPresale_$931_to_t_uint160(value)
            }

            function convert_t_contract$_InkPublicPresale_$931_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
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

            function extract_from_storage_value_offset_20t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_160_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_21t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_168_unsigned(slot_value))
            }

            85function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    // allocate some memory into data of size returndatasize() + PADDING
                    data := allocateMemory(round_up_to_mul_of_32(add(returndatasize(), 0x20)))

                    // store array length into the front
                    mstore(data, returndatasize())

                    // append to data
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            86function fun__processContribution_887() {

                let expr_775 := callvalue()
                let expr_776 := 0x00
                let expr_777 := gt(cleanup_t_uint256(expr_775), convert_t_rational_0_by_1_to_t_uint256(expr_776))
                require_helper(expr_777)
                let expr_782 := gasprice()
                let _208 := read_from_storage_split_offset_0_t_uint256(0x07)
                let expr_783 := _208
                let expr_784 := iszero(gt(cleanup_t_uint256(expr_782), cleanup_t_uint256(expr_783)))
                require_helper(expr_784)
                let _209 := 0x08
                let expr_788 := _209
                let expr_790 := caller()
                let _210 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_788,expr_790)
                let _211_slot := _210
                let expr_791_slot := _211_slot
                let _212 := add(expr_791_slot, 3)
                let _213 := read_from_storage_split_offset_0_t_uint256(_212)
                let expr_792 := _213
                let expr_794 := callvalue()
                let expr_795 := expr_794
                let expr_796 := checked_add_t_uint256(expr_792, expr_795)

                let _214 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_797 := _214
                let expr_798 := iszero(lt(cleanup_t_uint256(expr_796), cleanup_t_uint256(expr_797)))
                require_helper(expr_798)
                let _215 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_802 := _215
                let _216 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_803 := _216
                let expr_804 := gt(cleanup_t_uint256(expr_802), cleanup_t_uint256(expr_803))
                require_helper(expr_804)
                let expr_809 := callvalue()
                let _217 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_810 := _217
                let _218 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_811 := _218
                let expr_812 := expr_811
                let expr_813 := checked_sub_t_uint256(expr_810, expr_812)

                let expr_814 := iszero(gt(cleanup_t_uint256(expr_809), cleanup_t_uint256(expr_813)))
                require_helper(expr_814)
                let _219 := 0x08
                let expr_819 := _219
                let expr_821 := caller()
                let _220 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_819,expr_821)
                let _221_slot := _220
                let expr_822_slot := _221_slot
                let _222 := add(expr_822_slot, 3)
                let _223 := read_from_storage_split_offset_0_t_uint256(_222)
                let expr_823 := _223
                let expr_825 := callvalue()
                let expr_826 := expr_825
                let expr_827 := checked_add_t_uint256(expr_823, expr_826)

                let vloc_newBalance_818 := expr_827
                let _224 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_829 := _224
                let _225 := 0x08
                let expr_830 := _225
                let expr_832 := caller()
                let _226 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_830,expr_832)
                let _227_slot := _226
                let expr_833_slot := _227_slot
                let _228 := add(expr_833_slot, 2)
                let _229 := read_from_storage_split_offset_0_t_uint256(_228)
                let expr_834 := _229
                let expr_835 := iszero(gt(cleanup_t_uint256(expr_829), cleanup_t_uint256(expr_834)))
                switch expr_835
                case 0 {
                    let _230 := vloc_newBalance_818
                    let expr_844 := _230
                    let _231 := 0x08
                    let expr_845 := _231
                    let expr_847 := caller()
                    let _232 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_845,expr_847)
                    let _233_slot := _232
                    let expr_848_slot := _233_slot
                    let _234 := add(expr_848_slot, 2)
                    let _235 := read_from_storage_split_offset_0_t_uint256(_234)
                    let expr_849 := _235
                    let expr_850 := iszero(gt(cleanup_t_uint256(expr_844), cleanup_t_uint256(expr_849)))
                    require_helper(expr_850)
                }
                default {
                    let _236 := vloc_newBalance_818
                    let expr_837 := _236
                    let _237 := read_from_storage_split_offset_0_t_uint256(0x02)
                    let expr_838 := _237
                    let expr_839 := iszero(gt(cleanup_t_uint256(expr_837), cleanup_t_uint256(expr_838)))
                    require_helper(expr_839)
                }
                let _238 := vloc_newBalance_818
                let expr_860 := _238
                let _239 := 0x08
                let expr_855 := _239
                let expr_857 := caller()
                let _240 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_855,expr_857)
                let _241_slot := _240
                let expr_858_slot := _241_slot
                let _242 := add(expr_858_slot, 3)
                update_storage_value_offset_0t_uint256_to_t_uint256(_242, expr_860)
                let expr_861 := expr_860
                let _243 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_864 := _243
                let expr_866 := callvalue()
                let expr_867 := expr_866
                let expr_868 := checked_sub_t_uint256(expr_864, expr_867)

                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_868)
                let expr_869 := expr_868
                let _244 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_872 := _244
                let expr_874 := callvalue()
                let _245 := 0x08
                let expr_875 := _245
                let expr_877 := caller()
                let _246 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_875,expr_877)
                let _247_slot := _246
                let expr_878_slot := _247_slot
                let _248 := add(expr_878_slot, 1)
                let _249 := read_from_storage_split_offset_0_t_uint256(_248)
                let expr_879 := _249
                let expr_880 := expr_879
                let expr_881 := checked_mul_t_uint256(expr_874, expr_880)

                let expr_882 := expr_881
                let expr_883 := checked_add_t_uint256(expr_872, expr_882)

                update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_883)
                let expr_884 := expr_883

            }

            87function fun__processPayout_930(vloc__recipient_889) {

                let expr_894 := callvalue()
                let expr_895 := 0x00
                let expr_896 := eq(cleanup_t_uint256(expr_894), convert_t_rational_0_by_1_to_t_uint256(expr_895))
                require_helper(expr_896)
                let _250 := 0x08
                let expr_901 := _250
                let _251 := vloc__recipient_889
                let expr_902 := _251
                let _252 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_901,expr_902)
                let _253_slot := _252
                let expr_903_slot := _253_slot
                let _254 := add(expr_903_slot, 3)
                let _255 := read_from_storage_split_offset_0_t_uint256(_254)
                let expr_904 := _255
                let vloc_balance_900 := expr_904
                let _256 := vloc_balance_900
                let expr_907 := _256
                let expr_908 := 0x00
                let expr_909 := gt(cleanup_t_uint256(expr_907), convert_t_rational_0_by_1_to_t_uint256(expr_908))
                require_helper(expr_909)
                let _257 := vloc_balance_900
                let expr_914 := _257
                let _258 := 0x08
                let expr_915 := _258
                let _259 := vloc__recipient_889
                let expr_916 := _259
                let _260 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_915,expr_916)
                let _261_slot := _260
                let expr_917_slot := _261_slot
                let _262 := add(expr_917_slot, 1)
                let _263 := read_from_storage_split_offset_0_t_uint256(_262)
                let expr_918 := _263
                let expr_919 := expr_918
                let expr_920 := checked_mul_t_uint256(expr_914, expr_919)

                let vloc_amount_913 := expr_920
                let expr_926 := 0x00
                let _264 := convert_t_rational_0_by_1_to_t_uint256(expr_926)
                let _265 := 0x08
                let expr_922 := _265
                let _266 := vloc__recipient_889
                let expr_923 := _266
                let _267 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_922,expr_923)
                let _268_slot := _267
                let expr_924_slot := _268_slot
                let _269 := add(expr_924_slot, 3)
                update_storage_value_offset_0t_uint256_to_t_uint256(_269, _264)
                let expr_927 := _264

            }

            88function fun_addContributor_400(vloc__account_342, vloc__rate_344, vloc__max_346) {

                let _29 := vloc__account_342
                let expr_350 := _29
                let expr_353 := 0x00
                let expr_354 := convert_t_rational_0_by_1_to_t_address_payable(expr_353)
                let expr_355 := iszero(eq(cleanup_t_address(expr_350), convert_t_address_payable_to_t_address(expr_354)))
                require_helper(expr_355)
                let _30 := vloc__rate_344
                let expr_359 := _30
                let expr_360 := 0x00
                let expr_361 := gt(cleanup_t_uint256(expr_359), convert_t_rational_0_by_1_to_t_uint256(expr_360))
                require_helper(expr_361)
                let _31 := vloc__max_346
                let expr_365 := _31
                let _32 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_366 := _32
                let expr_367 := iszero(lt(cleanup_t_uint256(expr_365), cleanup_t_uint256(expr_366)))
                require_helper(expr_367)
                let _33 := 0x08
                let expr_371 := _33
                let _34 := vloc__account_342
                let expr_372 := _34
                let _35 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_371,expr_372)
                let _36_slot := _35
                let expr_373_slot := _36_slot
                let _37 := add(expr_373_slot, 0)
                let _38 := read_from_storage_split_offset_0_t_bool(_37)
                let expr_374 := _38
                let expr_375 := cleanup_t_bool(iszero(expr_374))
                require_helper(expr_375)
                
                let expr_382 := 0x01
                let _39 := 0x08
                let expr_378 := _39
                let _40 := vloc__account_342
                let expr_379 := _40
                let _41 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_378,expr_379)
                let _42_slot := _41
                let expr_380_slot := _42_slot
                let _43 := add(expr_380_slot, 0)
                update_storage_value_offset_0t_bool_to_t_bool(_43, expr_382)
                let expr_383 := expr_382
                let _44 := vloc__max_346
                let expr_389 := _44
                let _45 := 0x08
                let expr_385 := _45
                let _46 := vloc__account_342
                let expr_386 := _46
                let _47 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_385,expr_386)
                let _48_slot := _47
                let expr_387_slot := _48_slot
                let _49 := add(expr_387_slot, 2)
                update_storage_value_offset_0t_uint256_to_t_uint256(_49, expr_389)
                let expr_390 := expr_389
                let _50 := vloc__rate_344
                let expr_396 := _50
                let _51 := 0x08
                let expr_392 := _51
                let _52 := vloc__account_342
                let expr_393 := _52
                let _53 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_392,expr_393)
                let _54_slot := _53
                let expr_394_slot := _54_slot
                let _55 := add(expr_394_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_55, expr_396)
                let expr_397 := expr_396

            }

            89function fun_airdrop_706(vloc__account_698) {

                let expr_701_functionIdentifier := 930
                let _196 := vloc__account_698
                let expr_702 := _196
                fun__processPayout_930(expr_702)

            }

            90function fun_balanceOf_619(vloc__account_599) -> vloc__602 {
                let zero_value_for_type_t_uint256_157 := zero_value_for_split_t_uint256()
                vloc__602 := zero_value_for_type_t_uint256_157

                let _158 := vloc__account_599
                let expr_605 := _158
                let expr_608 := 0x00
                let expr_609 := convert_t_rational_0_by_1_to_t_address_payable(expr_608)
                let expr_610 := iszero(eq(cleanup_t_address(expr_605), convert_t_address_payable_to_t_address(expr_609)))
                require_helper(expr_610)
                let _159 := 0x08
                let expr_613 := _159
                let _160 := vloc__account_599
                let expr_614 := _160
                let _161 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_613,expr_614)
                let _162_slot := _161
                let expr_615_slot := _162_slot
                let _163 := add(expr_615_slot, 3)
                let _164 := read_from_storage_split_offset_0_t_uint256(_163)
                let expr_616 := _164
                vloc__602 := expr_616
                leave

            }

            91function fun_disableRefund_340() {

                let _28 := read_from_storage_split_offset_21_t_bool(0x00)
                let expr_332 := _28
                require_helper(expr_332)
                let expr_336 := 0x00
                update_storage_value_offset_21t_bool_to_t_bool(0x00, expr_336)
                let expr_337 := expr_336

            }

            92function fun_enableRefund_328() {

                let _27 := read_from_storage_split_offset_21_t_bool(0x00)
                let expr_319 := _27
                let expr_320 := cleanup_t_bool(iszero(expr_319))
                require_helper(expr_320)
                let expr_324 := 0x01
                update_storage_value_offset_21t_bool_to_t_bool(0x00, expr_324)
                let expr_325 := expr_324

            }

            93function fun_finalize_725(vloc__tokenAddress_708) {

                let _197 := vloc__tokenAddress_708
                let expr_712 := _197
                let expr_715 := 0x00
                let expr_716 := convert_t_rational_0_by_1_to_t_address_payable(expr_715)
                let expr_717 := iszero(eq(cleanup_t_address_payable(expr_712), cleanup_t_address_payable(expr_716)))
                require_helper(expr_717)
                let _198 := vloc__tokenAddress_708
                let expr_721 := _198
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x06, expr_721)
                let expr_722 := expr_721

            }

            94function fun_func_770() {

                let expr_729 := caller()
                let _199 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_730 := _199
                let expr_731 := eq(cleanup_t_address_payable(expr_729), cleanup_t_address_payable(expr_730))
                let expr_736 := expr_731
                if expr_736 {
                    let expr_733 := callvalue()
                    let expr_734 := 0x00
                    let expr_735 := gt(cleanup_t_uint256(expr_733), convert_t_rational_0_by_1_to_t_uint256(expr_734))
                    expr_736 := expr_735
                }
                if expr_736 {
                    leave
                }
                let _200 := read_from_storage_split_offset_20_t_bool(0x00)
                let expr_741 := _200
                require_helper(expr_741)
                let _201 := 0x08
                let expr_745 := _201
                let expr_747 := caller()
                let _202 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_745,expr_747)
                let _203_slot := _202
                let expr_748_slot := _203_slot
                let _204 := add(expr_748_slot, 0)
                let _205 := read_from_storage_split_offset_0_t_bool(_204)
                let expr_749 := _205
                require_helper(expr_749)
                let _206 := read_from_storage_split_offset_0_t_address_payable(0x06)
                let expr_752 := _206
                let expr_755 := 0x00
                let expr_756 := convert_t_rational_0_by_1_to_t_address_payable(expr_755)
                let expr_757 := eq(cleanup_t_address_payable(expr_752), cleanup_t_address_payable(expr_756))
                switch expr_757
                case 0 {
                    let expr_762_functionIdentifier := 930
                    let expr_764 := caller()
                    let _207 := convert_t_address_payable_to_t_address(expr_764)
                    fun__processPayout_930(_207)
                }
                default {
                    let expr_758_functionIdentifier := 887
                    fun__processContribution_887()
                }

            }

            95function fun_getEtherContributed_215() -> vloc__210 {
                let zero_value_for_type_t_uint256_11 := zero_value_for_split_t_uint256()
                vloc__210 := zero_value_for_type_t_uint256_11

                let _12 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_212 := _12
                vloc__210 := expr_212
                leave

            }

            96function fun_getXNKPurchased_223() -> vloc__218 {
                let zero_value_for_type_t_uint256_13 := zero_value_for_split_t_uint256()
                vloc__218 := zero_value_for_type_t_uint256_13

                let _14 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_220 := _14
                vloc__218 := expr_220
                leave

            }

            97function fun_pause_302() {

                let _25 := read_from_storage_split_offset_20_t_bool(0x00)
                let expr_294 := _25
                require_helper(expr_294)
                let expr_298 := 0x00
                update_storage_value_offset_20t_bool_to_t_bool(0x00, expr_298)
                let expr_299 := expr_298

            }

            98function fun_refund_696() {

                let _165 := read_from_storage_split_offset_20_t_bool(0x00)
                let expr_623 := _165
                require_helper(expr_623)
                let _166 := read_from_storage_split_offset_21_t_bool(0x00)
                let expr_627 := _166
                require_helper(expr_627)
                let _167 := 0x08
                let expr_631 := _167
                let expr_633 := caller()
                let _168 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_631,expr_633)
                let _169_slot := _168
                let expr_634_slot := _169_slot
                let _170 := add(expr_634_slot, 0)
                let _171 := read_from_storage_split_offset_0_t_bool(_170)
                let expr_635 := _171
                require_helper(expr_635)
                let _172 := 0x08
                let expr_640 := _172
                let expr_642 := caller()
                let _173 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_640,expr_642)
                let _174_slot := _173
                let expr_643_slot := _174_slot
                let _175 := add(expr_643_slot, 3)
                let _176 := read_from_storage_split_offset_0_t_uint256(_175)
                let expr_644 := _176
                let vloc_balance_639 := expr_644
                let _177 := vloc_balance_639
                let expr_647 := _177
                let expr_648 := 0x00
                let expr_649 := gt(cleanup_t_uint256(expr_647), convert_t_rational_0_by_1_to_t_uint256(expr_648))
                require_helper(expr_649)
                let expr_657 := 0x00
                let _178 := convert_t_rational_0_by_1_to_t_uint256(expr_657)
                let _179 := 0x08
                let expr_652 := _179
                let expr_654 := caller()
                let _180 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_652,expr_654)
                let _181_slot := _180
                let expr_655_slot := _181_slot
                let _182 := add(expr_655_slot, 3)
                update_storage_value_offset_0t_uint256_to_t_uint256(_182, _178)
                let expr_658 := _178
                let _183 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_661 := _183
                let _184 := vloc_balance_639
                let expr_662 := _184
                let expr_663 := expr_662
                let expr_664 := checked_sub_t_uint256(expr_661, expr_663)

                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_664)
                let expr_665 := expr_664
                let _185 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_668 := _185
                let _186 := vloc_balance_639
                let expr_669 := _186
                let _187 := 0x08
                let expr_670 := _187
                let expr_672 := caller()
                let _188 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(expr_670,expr_672)
                let _189_slot := _188
                let expr_673_slot := _189_slot
                let _190 := add(expr_673_slot, 1)
                let _191 := read_from_storage_split_offset_0_t_uint256(_190)
                let expr_674 := _191
                let expr_675 := expr_674
                let expr_676 := checked_mul_t_uint256(expr_669, expr_675)

                let expr_677 := expr_676
                let expr_678 := checked_sub_t_uint256(expr_668, expr_677)

                update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_678)
                let expr_679 := expr_678
                let expr_684 := caller()
                let expr_685_address := convert_t_address_payable_to_t_address(expr_684)
                let _192 := vloc_balance_639
                let expr_686 := _192
                let expr_687_address := expr_685_address
                let expr_687_value := expr_686

                let _193 := mload(64)
                let _194 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_193  ), _193)

                let expr_689_component_1 := call(gas(), expr_687_address,  expr_687_value,  _193, _194, 0, 0)

                let expr_689_component_2_mpos := extract_returndata()

                let vloc_success_682 := expr_689_component_1
                let _195 := vloc_success_682
                let expr_692 := _195
                assert_helper(expr_692)

            }

            99function fun_removeContributor_565(vloc__account_496) {

                let _112 := vloc__account_496
                let expr_500 := _112
                let expr_503 := 0x00
                let expr_504 := convert_t_rational_0_by_1_to_t_address_payable(expr_503)
                let expr_505 := iszero(eq(cleanup_t_address(expr_500), convert_t_address_payable_to_t_address(expr_504)))
                require_helper(expr_505)
                let _113 := 0x08
                let expr_509 := _113
                let _114 := vloc__account_496
                let expr_510 := _114
                let _115 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_509,expr_510)
                let _116_slot := _115
                let expr_511_slot := _116_slot
                let _117 := add(expr_511_slot, 0)
                let _118 := read_from_storage_split_offset_0_t_bool(_117)
                let expr_512 := _118
                require_helper(expr_512)
                let expr_519 := 0x00
                let _119 := 0x08
                let expr_515 := _119
                let _120 := vloc__account_496
                let expr_516 := _120
                let _121 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_515,expr_516)
                let _122_slot := _121
                let expr_517_slot := _122_slot
                let _123 := add(expr_517_slot, 0)
                update_storage_value_offset_0t_bool_to_t_bool(_123, expr_519)
                let expr_520 := expr_519
                let _124 := 0x08
                let expr_522 := _124
                let _125 := vloc__account_496
                let expr_523 := _125
                let _126 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_522,expr_523)
                let _127_slot := _126
                let expr_524_slot := _127_slot
                let _128 := add(expr_524_slot, 3)
                let _129 := read_from_storage_split_offset_0_t_uint256(_128)
                let expr_525 := _129
                let expr_526 := 0x00
                let expr_527 := gt(cleanup_t_uint256(expr_525), convert_t_rational_0_by_1_to_t_uint256(expr_526))
                if expr_527 {
                    let _130 := 0x08
                    let expr_530 := _130
                    let _131 := vloc__account_496
                    let expr_531 := _131
                    let _132 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_530,expr_531)
                    let _133_slot := _132
                    let expr_532_slot := _133_slot
                    let _134 := add(expr_532_slot, 3)
                    let _135 := read_from_storage_split_offset_0_t_uint256(_134)
                    let expr_533 := _135
                    let vloc_balance_529 := expr_533
                    let expr_539 := 0x00
                    let _136 := convert_t_rational_0_by_1_to_t_uint256(expr_539)
                    let _137 := 0x08
                    let expr_535 := _137
                    let _138 := vloc__account_496
                    let expr_536 := _138
                    let _139 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_535,expr_536)
                    let _140_slot := _139
                    let expr_537_slot := _140_slot
                    let _141 := add(expr_537_slot, 3)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_141, _136)
                    let expr_540 := _136
                    let _142 := read_from_storage_split_offset_0_t_uint256(0x05)
                    let expr_543 := _142
                    let _143 := vloc_balance_529
                    let expr_544 := _143
                    let _144 := 0x08
                    let expr_545 := _144
                    let _145 := vloc__account_496
                    let expr_546 := _145
                    let _146 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_545,expr_546)
                    let _147_slot := _146
                    let expr_547_slot := _147_slot
                    let _148 := add(expr_547_slot, 1)
                    let _149 := read_from_storage_split_offset_0_t_uint256(_148)
                    let expr_548 := _149
                    let expr_549 := expr_548
                    let expr_550 := checked_mul_t_uint256(expr_544, expr_549)

                    let expr_551 := expr_550
                    let expr_552 := checked_sub_t_uint256(expr_543, expr_551)

                    update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_552)
                    let expr_553 := expr_552
                    let _150 := read_from_storage_split_offset_0_t_uint256(0x04)
                    let expr_556 := _150
                    let _151 := vloc_balance_529
                    let expr_557 := _151
                    let expr_558 := expr_557
                    let expr_559 := checked_sub_t_uint256(expr_556, expr_558)

                    update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_559)
                    let expr_560 := expr_559
                }

            }

            100function fun_resume_315() {

                let _26 := read_from_storage_split_offset_20_t_bool(0x00)
                let expr_306 := _26
                let expr_307 := cleanup_t_bool(iszero(expr_306))
                require_helper(expr_307)
                let expr_311 := 0x01
                update_storage_value_offset_20t_bool_to_t_bool(0x00, expr_311)
                let expr_312 := expr_311

            }

            101function fun_transferOwnership_141(vloc_newOwner_119) {

                let _1 := vloc_newOwner_119
                let expr_123 := _1
                let expr_126 := 0x00
                let expr_127 := convert_t_rational_0_by_1_to_t_address_payable(expr_126)
                let expr_128 := iszero(eq(cleanup_t_address_payable(expr_123), cleanup_t_address_payable(expr_127)))
                require_helper(expr_128)
                let _2 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_132 := _2
                let _3 := vloc_newOwner_119
                let expr_133 := _3
                let _4 := 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0
                let _5 := convert_t_address_payable_to_t_address(expr_133)
                {
                    let _6 := mload(64)
                    let _7 := abi_encode_tuple__to__fromStack(_6 )
                    log3(_6, sub(_7, _6) , _4, expr_132, _5)
                }let _8 := vloc_newOwner_119
                let expr_137 := _8
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_137)
                let expr_138 := expr_137

            }

            102function fun_updateContributor_494(vloc__account_402, vloc__newRate_404, vloc__newMax_406) {

                let _56 := vloc__account_402
                let expr_410 := _56
                let expr_413 := 0x00
                let expr_414 := convert_t_rational_0_by_1_to_t_address_payable(expr_413)
                let expr_415 := iszero(eq(cleanup_t_address(expr_410), convert_t_address_payable_to_t_address(expr_414)))
                require_helper(expr_415)
                let _57 := vloc__newRate_404
                let expr_419 := _57
                let expr_420 := 0x00
                let expr_421 := gt(cleanup_t_uint256(expr_419), convert_t_rational_0_by_1_to_t_uint256(expr_420))
                require_helper(expr_421)
                let _58 := vloc__newMax_406
                let expr_425 := _58
                let _59 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_426 := _59
                let expr_427 := iszero(lt(cleanup_t_uint256(expr_425), cleanup_t_uint256(expr_426)))
                require_helper(expr_427)
                let _60 := 0x08
                let expr_431 := _60
                let _61 := vloc__account_402
                let expr_432 := _61
                let _62 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_431,expr_432)
                let _63_slot := _62
                let expr_433_slot := _63_slot
                let _64 := add(expr_433_slot, 0)
                let _65 := read_from_storage_split_offset_0_t_bool(_64)
                let expr_434 := _65
                require_helper(expr_434)
                let _66 := 0x08
                let expr_437 := _66
                let _67 := vloc__account_402
                let expr_438 := _67
                let _68 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_437,expr_438)
                let _69_slot := _68
                let expr_439_slot := _69_slot
                let _70 := add(expr_439_slot, 3)
                let _71 := read_from_storage_split_offset_0_t_uint256(_70)
                let expr_440 := _71
                let expr_441 := 0x00
                let expr_442 := gt(cleanup_t_uint256(expr_440), convert_t_rational_0_by_1_to_t_uint256(expr_441))
                let expr_449 := expr_442
                if expr_449 {
                    let _72 := 0x08
                    let expr_443 := _72
                    let _73 := vloc__account_402
                    let expr_444 := _73
                    let _74 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_443,expr_444)
                    let _75_slot := _74
                    let expr_445_slot := _75_slot
                    let _76 := add(expr_445_slot, 1)
                    let _77 := read_from_storage_split_offset_0_t_uint256(_76)
                    let expr_446 := _77
                    let _78 := vloc__newRate_404
                    let expr_447 := _78
                    let expr_448 := iszero(eq(cleanup_t_uint256(expr_446), cleanup_t_uint256(expr_447)))
                    expr_449 := expr_448
                }
                if expr_449 {
                    let _79 := read_from_storage_split_offset_0_t_uint256(0x05)
                    let expr_451 := _79
                    let _80 := 0x08
                    let expr_452 := _80
                    let _81 := vloc__account_402
                    let expr_453 := _81
                    let _82 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_452,expr_453)
                    let _83_slot := _82
                    let expr_454_slot := _83_slot
                    let _84 := add(expr_454_slot, 3)
                    let _85 := read_from_storage_split_offset_0_t_uint256(_84)
                    let expr_455 := _85
                    let _86 := 0x08
                    let expr_456 := _86
                    let _87 := vloc__account_402
                    let expr_457 := _87
                    let _88 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_456,expr_457)
                    let _89_slot := _88
                    let expr_458_slot := _89_slot
                    let _90 := add(expr_458_slot, 1)
                    let _91 := read_from_storage_split_offset_0_t_uint256(_90)
                    let expr_459 := _91
                    let expr_460 := checked_mul_t_uint256(expr_455, expr_459)

                    let expr_461 := checked_sub_t_uint256(expr_451, expr_460)

                    update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_461)
                    let expr_462 := expr_461
                    let _92 := read_from_storage_split_offset_0_t_uint256(0x05)
                    let expr_465 := _92
                    let _93 := 0x08
                    let expr_466 := _93
                    let _94 := vloc__account_402
                    let expr_467 := _94
                    let _95 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_466,expr_467)
                    let _96_slot := _95
                    let expr_468_slot := _96_slot
                    let _97 := add(expr_468_slot, 3)
                    let _98 := read_from_storage_split_offset_0_t_uint256(_97)
                    let expr_469 := _98
                    let _99 := vloc__newRate_404
                    let expr_470 := _99
                    let expr_471 := expr_470
                    let expr_472 := checked_mul_t_uint256(expr_469, expr_471)

                    let expr_473 := expr_472
                    let expr_474 := checked_add_t_uint256(expr_465, expr_473)

                    update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_474)
                    let expr_475 := expr_474
                }
                let _100 := vloc__newRate_404
                let expr_483 := _100
                let _101 := 0x08
                let expr_479 := _101
                let _102 := vloc__account_402
                let expr_480 := _102
                let _103 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_479,expr_480)
                let _104_slot := _103
                let expr_481_slot := _104_slot
                let _105 := add(expr_481_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_105, expr_483)
                let expr_484 := expr_483
                let _106 := vloc__newMax_406
                let expr_490 := _106
                let _107 := 0x08
                let expr_486 := _107
                let _108 := vloc__account_402
                let expr_487 := _108
                let _109 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(expr_486,expr_487)
                let _110_slot := _109
                let expr_488_slot := _110_slot
                let _111 := add(expr_488_slot, 2)
                update_storage_value_offset_0t_uint256_to_t_uint256(_111, expr_490)
                let expr_491 := expr_490

            }

            103function fun_updateEtherCap_233(vloc__newEtherCap_225) {

                let _15 := vloc__newEtherCap_225
                let expr_229 := _15
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_229)
                let expr_230 := expr_229

            }

            104function fun_updateGlobalMax_249(vloc__globalMax_235) {

                let _16 := vloc__globalMax_235
                let expr_239 := _16
                let _17 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_240 := _17
                let expr_241 := gt(cleanup_t_uint256(expr_239), cleanup_t_uint256(expr_240))
                require_helper(expr_241)
                let _18 := vloc__globalMax_235
                let expr_245 := _18
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_245)
                let expr_246 := expr_245

            }

            105function fun_updateGlobalMin_271(vloc__globalMin_251) {

                let _19 := vloc__globalMin_251
                let expr_255 := _19
                let expr_256 := 0x00
                let expr_257 := gt(cleanup_t_uint256(expr_255), convert_t_rational_0_by_1_to_t_uint256(expr_256))
                require_helper(expr_257)
                let _20 := vloc__globalMin_251
                let expr_261 := _20
                let _21 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_262 := _21
                let expr_263 := lt(cleanup_t_uint256(expr_261), cleanup_t_uint256(expr_262))
                require_helper(expr_263)
                let _22 := vloc__globalMin_251
                let expr_267 := _22
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_267)
                let expr_268 := expr_267

            }

            106function fun_updateMaxGasPrice_207(vloc__maxGasPrice_193) {

                let _9 := vloc__maxGasPrice_193
                let expr_197 := _9
                let expr_198 := 0x00
                let expr_199 := gt(cleanup_t_uint256(expr_197), convert_t_rational_0_by_1_to_t_uint256(expr_198))
                require_helper(expr_199)
                let _10 := vloc__maxGasPrice_193
                let expr_203 := _10
                update_storage_value_offset_0t_uint256_to_t_uint256(0x07, expr_203)
                let expr_204 := expr_203

            }

            107function fun_updateTokenAddress_290(vloc__tokenAddress_273) {

                let _23 := vloc__tokenAddress_273
                let expr_277 := _23
                let expr_280 := 0x00
                let expr_281 := convert_t_rational_0_by_1_to_t_address_payable(expr_280)
                let expr_282 := iszero(eq(cleanup_t_address_payable(expr_277), cleanup_t_address_payable(expr_281)))
                require_helper(expr_282)
                let _24 := vloc__tokenAddress_273
                let expr_286 := _24
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x06, expr_286)
                let expr_287 := expr_286

            }

            108function fun_withdrawEther_597(vloc__to_567) {

                let _152 := vloc__to_567
                let expr_571 := _152
                let expr_574 := 0x00
                let expr_575 := convert_t_rational_0_by_1_to_t_address_payable(expr_574)
                let expr_576 := iszero(eq(cleanup_t_address(expr_571), convert_t_address_payable_to_t_address(expr_575)))
                require_helper(expr_576)
                let _153 := vloc__to_567
                let expr_581 := _153
                let expr_582_address := expr_581
                let expr_585_address := address()
                let expr_586 := convert_t_contract$_InkPublicPresale_$931_to_t_address(expr_585_address)
                let expr_587 := balance(expr_586)
                let expr_588_address := expr_582_address
                let expr_588_value := expr_587

                let _154 := mload(64)
                let _155 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_154  ), _154)

                let expr_590_component_1 := call(gas(), expr_588_address,  expr_588_value,  _154, _155, 0, 0)

                let expr_590_component_2_mpos := extract_returndata()

                let vloc_success_580 := expr_590_component_1
                let _156 := vloc_success_580
                let expr_593 := _156
                assert_helper(expr_593)

            }

            109function getter_fun_active_146() -> ret {

                let slot := 0
                let offset := 20

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            110function getter_fun_etherCap_154() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            111function getter_fun_globalMax_152() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            112function getter_fun_globalMin_150() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            113function getter_fun_maxGasPrice_162() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            114function getter_fun_owner_100() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            115function getter_fun_tokenAddress_160() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Contributor_$175_storage_$_of_t_address_payable(slot , key) -> dataSlot {
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

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

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

            function read_from_storage_split_offset_20_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_20t_bool(sload(slot))

            }

            function read_from_storage_split_offset_21_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_21t_bool(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_160(value) -> newValue {
                newValue :=

                shl(160, value)

            }

            function shift_left_168(value) -> newValue {
                newValue :=

                shl(168, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function shift_right_168_unsigned(value) -> newValue {
                newValue :=

                shr(168, value)

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

            function update_byte_slice_1_shift_20(value, toInsert) -> result {
                let mask := 0xff0000000000000000000000000000000000000000
                toInsert := shift_left_160(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_1_shift_21(value, toInsert) -> result {
                let mask := 0xff000000000000000000000000000000000000000000
                toInsert := shift_left_168(toInsert)
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

            function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_21t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_21(sload(slot), prepare_store_t_bool(convertedValue_0)))
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

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

