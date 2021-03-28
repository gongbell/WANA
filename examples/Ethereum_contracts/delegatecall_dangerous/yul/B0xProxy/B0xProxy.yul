/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "B0xProxy_453" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_B0xProxy_453()

        codecopy(0, dataoffset("B0xProxy_453_deployed"), datasize("B0xProxy_453_deployed"))

        return(0, datasize("B0xProxy_453_deployed"))

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_B0xProxy_453() {

            constructor_B0xStorage_201()

        }

        function constructor_B0xStorage_201() {

            constructor_Debugger_148()
            let expr_163 := 0x00
            update_storage_value_offset_0t_bool_to_t_bool(0x02, expr_163)

        }

        function constructor_Debugger_148() {

            constructor_Ownable_76()
            let expr_78 := 0x00
            update_storage_value_offset_20t_bool_to_t_bool(0x00, expr_78)

        }

        function constructor_Ownable_76() {

            let expr_19 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_19)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_20 := _1

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
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

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_left_160(value) -> newValue {
            newValue :=

            shl(160, value)

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

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

    }
    object "B0xProxy_453_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x00433337
                {
                    // ORACLE_REGISTRY_CONTRACT()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ORACLE_REGISTRY_CONTRACT_170()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x093983bd
                {
                    // orderLender(bytes32)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    let ret_0 :=  getter_fun_orderLender_181(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x16a6bff6
                {
                    // targets(bytes4)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes4(4, calldatasize())
                    let ret_0 :=  getter_fun_targets_207(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1d1742e1
                {
                    // B0X_TOKEN_CONTRACT()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_B0X_TOKEN_CONTRACT_166()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1df04b72
                {
                    // orderTraders(bytes32,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_orderTraders_186(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x50e4b069
                {
                    // set0xExchangeWrapper(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_set0xExchangeWrapper_432(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6817031b
                {
                    // setVault(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setVault_398(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x715018a6
                {
                    // renounceOwnership()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_renounceOwnership_39()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8165354e
                {
                    // setOracleRegistry(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setOracleRegistry_415(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8638aa65
                {
                    // DEBUG_MODE()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_DEBUG_MODE_79()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8811e191
                {
                    // setDebugMode(bool)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bool(4, calldatasize())
                    fun_setDebugMode_364(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa812d41c
                {
                    // interestPaid(bytes32,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_interestPaid_200(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9974338
                {
                    // setB0xToken(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setB0xToken_381(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_func_254()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc11296fc
                {
                    // setTarget(string,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_address(4, calldatasize())
                    let ret_0 :=  fun_setTarget_294(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes4__to_t_bytes4__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc4d66de8
                {
                    // initialize(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_initialize_216(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcce37f3e
                {
                    // orderFilledAmounts(bytes32)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    let ret_0 :=  getter_fun_orderFilledAmounts_190(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd394b6c9
                {
                    // B0XTO0X_CONTRACT()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_B0XTO0X_CONTRACT_172()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd4eb4186
                {
                    // setB0xAddresses(address,address,address,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3 :=  abi_decode_tuple_t_addresst_addresst_addresst_address(4, calldatasize())
                    fun_setB0xAddresses_350(param_0, param_1, param_2, param_3)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd9fd7341
                {
                    // orderCancelledAmounts(bytes32)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    let ret_0 :=  getter_fun_orderCancelledAmounts_194(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xda1b620b
                {
                    // getTarget(string)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    let ret_0 :=  fun_getTarget_452(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf2fde38b
                {
                    // transferOwnership(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_transferOwnership_50(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf4fb9b2f
                {
                    // orderList(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  getter_fun_orderList_177(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf589f106
                {
                    // VAULT_CONTRACT()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_VAULT_CONTRACT_168()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfb08fdaa
                {
                    // replaceContract(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_replaceContract_264(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            35function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_t_bytes4(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes4(value)
            }

            37function abi_decode_t_string_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_string_memory_ptr(length))
                mstore(array, length)
                let src := add(offset, 0x20)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            40function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_addresst_addresst_address(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert(0, 0) }

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
                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 96
                    value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
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

            function abi_decode_tuple_t_bool(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

            }

            45function abi_decode_tuple_t_bytes32t_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bytes32t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bytes4(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes4(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_string_memory_ptr(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            49function abi_decode_tuple_t_string_memory_ptrt_address(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            50function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, length)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_string_memory_ptr__to_t_string_memory_ptr__nonPadded_inplace_fromStack(pos , value0) -> end {

                pos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value0,  pos)

                end := pos
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes4__to_t_bytes4__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes4_t_address__to_t_bytes4_t_address__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_array$_t_address_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_dataslot_t_array$_t_bytes32_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_array$_t_address_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_length_t_array$_t_bytes32_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_bytes32(value) -> cleaned {
                cleaned := value
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

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes4(value) -> cleaned {
                cleaned := and(value, 0xffffffff00000000000000000000000000000000000000000000000000000000)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            87function convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(value, length) -> converted {

                // Copy the array to a free position in memory

                converted := allocate_memory_array_t_bytes_memory_ptr(length)
                copy_calldata_to_memory(value, add(converted, 0x20), length)

            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            90function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_bytes4_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes4(value)
            }

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            95function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            98function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function copy_memory_to_memory(src, dst, length) {
                let i := 0
                for { } lt(i, length) { i := add(i, 32) }
                {
                    mstore(add(dst, i), mload(add(src, i)))
                }
                if gt(i, length)
                {
                    // clear end
                    mstore(add(dst, length), 0)
                }
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bytes32(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_20t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_160_unsigned(slot_value))
            }

            function extract_returndata() -> data {

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

            function fun__replaceContract_237(vloc__target_218) {

                let _18 := vloc__target_218
                let expr_221 := _18
                let expr_223_address := expr_221
                let expr_230 := 0xc4d66de8473e8f74cb05df264ee8262da16b56717ef1f05d73bfdcea3adc85e5
                let expr_231 := convert_t_bytes32_to_t_bytes4(expr_230)
                let _19 := vloc__target_218
                let expr_232 := _19

                let expr_233_mpos := allocateTemporaryMemory()
                let _20 := add(expr_233_mpos, 0x20)

                let _21 := abi_encode_tuple_t_bytes4_t_address__to_t_bytes4_t_address__fromStack(_20, expr_231, expr_232)
                mstore(expr_233_mpos, sub(_21, add(expr_233_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_21))

                let _22 := add(expr_233_mpos, 0x20)
                let _23 := mload(expr_233_mpos)

                let expr_234_component_1 := delegatecall(gas(), expr_223_address,  _22, _23, 0, 0)

                let expr_234_component_2_mpos := extract_returndata()

            }

            function fun__transferOwnership_75(vloc__newOwner_53) {

                let _7 := vloc__newOwner_53
                let expr_57 := _7
                let expr_60 := 0x00
                let expr_61 := convert_t_rational_0_by_1_to_t_address_payable(expr_60)
                let expr_62 := iszero(eq(cleanup_t_address(expr_57), convert_t_address_payable_to_t_address(expr_61)))
                require_helper(expr_62)
                let _8 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_66 := _8
                let _9 := vloc__newOwner_53
                let expr_67 := _9
                let _10 := 0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0
                {
                    let _11 := mload(64)
                    let _12 := abi_encode_tuple__to__fromStack(_11 )
                    log3(_11, sub(_12, _11) , _10, expr_66, expr_67)
                }let _13 := vloc__newOwner_53
                let expr_71 := _13
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_71)
                let expr_72 := expr_71

            }

            109function fun_func_254() {

                let _14 := 0x0c
                let expr_242 := _14
                let expr_244 := and(calldataload(0), 0xffffffff00000000000000000000000000000000000000000000000000000000)
                let _15 := mapping_index_access_t_mapping$_t_bytes4_$_t_address_$_of_t_bytes4(expr_242,expr_244)
                let _16 := read_from_storage_split_offset_0_t_address(_15)
                let expr_245 := _16
                let vloc_target_241 := expr_245
                let expr_250_offset := 0
                let expr_250_length := calldatasize()
                let vloc_data_248_mpos := convert_array_t_bytes_calldata_ptr_to_t_bytes_memory_ptr(expr_250_offset, expr_250_length) 
                //248_mpos = 0
                {
                                   // delegatecall(gas(), 12, 32, 0)
                                   add()返回值是32， 
                                   // 实际上(gas, 12, 96, 256)
                    let usr$result := delegatecall(gas(), vloc_target_241, add(vloc_data_248_mpos, 0x20), mload(vloc_data_248_mpos), 0, 0)
                    let usr$size := returndatasize()
                    let usr$ptr := mload(0x40)
                    returndatacopy(usr$ptr, 0, usr$size)
                    switch usr$result
                    case 0 { revert(usr$ptr, usr$size) }
                    default { return(usr$ptr, usr$size) }
                }

            }

            function fun_getTarget_452(vloc__funcId_434_mpos) -> vloc__437 {
                let zero_value_for_type_t_address_52 := zero_value_for_split_t_address()
                vloc__437 := zero_value_for_type_t_address_52

                let _53 := 0x0c
                let expr_439 := _53
                let _54_mpos := vloc__funcId_434_mpos
                let expr_445_mpos := _54_mpos

                let expr_446_mpos := allocateTemporaryMemory()
                let _55 := add(expr_446_mpos, 0x20)

                let _56 := abi_encode_tuple_packed_t_string_memory_ptr__to_t_string_memory_ptr__nonPadded_inplace_fromStack(_55, expr_445_mpos)
                mstore(expr_446_mpos, sub(_56, add(expr_446_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_56))
                let expr_447 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_446_mpos), array_length_t_bytes_memory_ptr(expr_446_mpos))
                let expr_448 := convert_t_bytes32_to_t_bytes4(expr_447)
                let _57 := mapping_index_access_t_mapping$_t_bytes4_$_t_address_$_of_t_bytes4(expr_439,expr_448)
                let _58 := read_from_storage_split_offset_0_t_address(_57)
                let expr_449 := _58
                vloc__437 := expr_449
                leave

            }

            function fun_initialize_216(vloc__209) {

                revert(0, 0)

            }

            112function fun_renounceOwnership_39() {

                let _1 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_28 := _1
                let _2 := 0xf8df31144d9c2f0f6b59d69b8b98abd5459d07f2742c4df920b25aae33c64820
                {
                    let _3 := mload(64)
                    let _4 := abi_encode_tuple__to__fromStack(_3 )
                    log2(_3, sub(_4, _3) , _2, expr_28)
                }let expr_34 := 0x00
                let expr_35 := convert_t_rational_0_by_1_to_t_address_payable(expr_34)
                let _5 := convert_t_address_payable_to_t_address(expr_35)
                update_storage_value_offset_0t_address_to_t_address(0x00, _5)
                let expr_36 := _5

            }

            function fun_replaceContract_264(vloc__target_256) {

                let expr_259_functionIdentifier := 237
                let _17 := vloc__target_256
                let expr_260 := _17
                fun__replaceContract_237(expr_260)

            }

            function fun_set0xExchangeWrapper_432(vloc__wrapper_417) {

                let _50 := vloc__wrapper_417
                let expr_420 := _50
                let expr_423 := 0x00
                let expr_424 := convert_t_rational_0_by_1_to_t_address_payable(expr_423)
                let expr_425 := iszero(eq(cleanup_t_address(expr_420), convert_t_address_payable_to_t_address(expr_424)))
                if expr_425 {
                    let _51 := vloc__wrapper_417
                    let expr_427 := _51
                    update_storage_value_offset_0t_address_to_t_address(0x05, expr_427)
                    let expr_428 := expr_427
                }

            }

            function fun_setB0xAddresses_350(vloc__b0xToken_296, vloc__vault_298, vloc__oracleregistry_300, vloc__exchange0xWrapper_302) {

                let _33 := vloc__b0xToken_296
                let expr_305 := _33
                let expr_308 := 0x00
                let expr_309 := convert_t_rational_0_by_1_to_t_address_payable(expr_308)
                let expr_310 := iszero(eq(cleanup_t_address(expr_305), convert_t_address_payable_to_t_address(expr_309)))
                let expr_317 := expr_310
                if expr_317 {
                    let _34 := vloc__vault_298
                    let expr_311 := _34
                    let expr_314 := 0x00
                    let expr_315 := convert_t_rational_0_by_1_to_t_address_payable(expr_314)
                    let expr_316 := iszero(eq(cleanup_t_address(expr_311), convert_t_address_payable_to_t_address(expr_315)))
                    expr_317 := expr_316
                }
                let expr_324 := expr_317
                if expr_324 {
                    let _35 := vloc__oracleregistry_300
                    let expr_318 := _35
                    let expr_321 := 0x00
                    let expr_322 := convert_t_rational_0_by_1_to_t_address_payable(expr_321)
                    let expr_323 := iszero(eq(cleanup_t_address(expr_318), convert_t_address_payable_to_t_address(expr_322)))
                    expr_324 := expr_323
                }
                let expr_331 := expr_324
                if expr_331 {
                    let _36 := vloc__exchange0xWrapper_302
                    let expr_325 := _36
                    let expr_328 := 0x00
                    let expr_329 := convert_t_rational_0_by_1_to_t_address_payable(expr_328)
                    let expr_330 := iszero(eq(cleanup_t_address(expr_325), convert_t_address_payable_to_t_address(expr_329)))
                    expr_331 := expr_330
                }
                if expr_331 {
                    let _37 := vloc__b0xToken_296
                    let expr_333 := _37
                    update_storage_value_offset_1t_address_to_t_address(0x02, expr_333)
                    let expr_334 := expr_333
                }
                let _38 := vloc__vault_298
                let expr_338 := _38
                update_storage_value_offset_0t_address_to_t_address(0x03, expr_338)
                let expr_339 := expr_338
                let _39 := vloc__oracleregistry_300
                let expr_342 := _39
                update_storage_value_offset_0t_address_to_t_address(0x04, expr_342)
                let expr_343 := expr_342
                let _40 := vloc__exchange0xWrapper_302
                let expr_346 := _40
                update_storage_value_offset_0t_address_to_t_address(0x05, expr_346)
                let expr_347 := expr_346

            }

            function fun_setB0xToken_381(vloc__token_366) {

                let _44 := vloc__token_366
                let expr_369 := _44
                let expr_372 := 0x00
                let expr_373 := convert_t_rational_0_by_1_to_t_address_payable(expr_372)
                let expr_374 := iszero(eq(cleanup_t_address(expr_369), convert_t_address_payable_to_t_address(expr_373)))
                if expr_374 {
                    let _45 := vloc__token_366
                    let expr_376 := _45
                    update_storage_value_offset_1t_address_to_t_address(0x02, expr_376)
                    let expr_377 := expr_376
                }

            }

            function fun_setDebugMode_364(vloc__debug_352) {

                let _41 := read_from_storage_split_offset_20_t_bool(0x00)
                let expr_355 := _41
                let _42 := vloc__debug_352
                let expr_356 := _42
                let expr_357 := iszero(eq(cleanup_t_bool(expr_355), cleanup_t_bool(expr_356)))
                if expr_357 {
                    let _43 := vloc__debug_352
                    let expr_359 := _43
                    update_storage_value_offset_20t_bool_to_t_bool(0x00, expr_359)
                    let expr_360 := expr_359
                }

            }

            function fun_setOracleRegistry_415(vloc__registry_400) {

                let _48 := vloc__registry_400
                let expr_403 := _48
                let expr_406 := 0x00
                let expr_407 := convert_t_rational_0_by_1_to_t_address_payable(expr_406)
                let expr_408 := iszero(eq(cleanup_t_address(expr_403), convert_t_address_payable_to_t_address(expr_407)))
                if expr_408 {
                    let _49 := vloc__registry_400
                    let expr_410 := _49
                    update_storage_value_offset_0t_address_to_t_address(0x04, expr_410)
                    let expr_411 := expr_410
                }

            }

            function fun_setTarget_294(vloc__funcId_266_mpos, vloc__target_268) -> vloc__271 {
                let zero_value_for_type_t_bytes4_24 := zero_value_for_split_t_bytes4()
                vloc__271 := zero_value_for_type_t_bytes4_24

                let _25_mpos := vloc__funcId_266_mpos
                let expr_280_mpos := _25_mpos

                let expr_281_mpos := allocateTemporaryMemory()
                let _26 := add(expr_281_mpos, 0x20)

                let _27 := abi_encode_tuple_packed_t_string_memory_ptr__to_t_string_memory_ptr__nonPadded_inplace_fromStack(_26, expr_280_mpos)
                mstore(expr_281_mpos, sub(_27, add(expr_281_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_27))
                let expr_282 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_281_mpos), array_length_t_bytes_memory_ptr(expr_281_mpos))
                let expr_283 := convert_t_bytes32_to_t_bytes4(expr_282)
                let vloc_f_274 := expr_283
                let _28 := vloc__target_268
                let expr_288 := _28
                let _29 := 0x0c
                let expr_285 := _29
                let _30 := vloc_f_274
                let expr_286 := _30
                let _31 := mapping_index_access_t_mapping$_t_bytes4_$_t_address_$_of_t_bytes4(expr_285,expr_286)
                update_storage_value_offset_0t_address_to_t_address(_31, expr_288)
                let expr_289 := expr_288
                let _32 := vloc_f_274
                let expr_291 := _32
                vloc__271 := expr_291
                leave

            }

            function fun_setVault_398(vloc__vault_383) {

                let _46 := vloc__vault_383
                let expr_386 := _46
                let expr_389 := 0x00
                let expr_390 := convert_t_rational_0_by_1_to_t_address_payable(expr_389)
                let expr_391 := iszero(eq(cleanup_t_address(expr_386), convert_t_address_payable_to_t_address(expr_390)))
                if expr_391 {
                    let _47 := vloc__vault_383
                    let expr_393 := _47
                    update_storage_value_offset_0t_address_to_t_address(0x03, expr_393)
                    let expr_394 := expr_393
                }

            }

            function fun_transferOwnership_50(vloc__newOwner_42) {

                let expr_45_functionIdentifier := 75
                let _6 := vloc__newOwner_42
                let expr_46 := _6
                fun__transferOwnership_75(expr_46)

            }

            function getter_fun_B0XTO0X_CONTRACT_172() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_B0X_TOKEN_CONTRACT_166() -> ret {

                let slot := 2
                let offset := 1

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_DEBUG_MODE_79() -> ret {

                let slot := 0
                let offset := 20

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_ORACLE_REGISTRY_CONTRACT_170() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_VAULT_CONTRACT_168() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_interestPaid_200(key_0, key_1) -> ret {

                let slot := 11
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_bytes32(slot, key_0)

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_1)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_orderCancelledAmounts_194(key_0) -> ret {

                let slot := 10
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_orderFilledAmounts_190(key_0) -> ret {

                let slot := 9
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_orderLender_181(key_0) -> ret {

                let slot := 7
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_address_$_of_t_bytes32(slot, key_0)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_orderList_177(key_0, key_1) -> ret {

                let slot := 6
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_array$_t_bytes32_$dyn_storage_$_of_t_address(slot, key_0)

                if iszero(lt(key_1, array_length_t_array$_t_bytes32_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_bytes32_$dyn_storage(slot, key_1)

                ret := read_from_storage_split_dynamic_t_bytes32(slot, offset)

            }

            function getter_fun_orderTraders_186(key_0, key_1) -> ret {

                let slot := 8
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes32_$_t_array$_t_address_$dyn_storage_$_of_t_bytes32(slot, key_0)

                if iszero(lt(key_1, array_length_t_array$_t_address_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_address_$dyn_storage(slot, key_1)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_owner_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_targets_207(key_0) -> ret {

                let slot := 12
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_bytes4_$_t_address_$_of_t_bytes4(slot, key_0)

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_array$_t_bytes32_$dyn_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_address_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_array$_t_address_$dyn_storage_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_mapping$_t_address_$_t_uint256_$_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes32_$_t_uint256_$_of_t_bytes32(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes32_to_t_bytes32(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_bytes4_$_t_address_$_of_t_bytes4(slot , key) -> dataSlot {
                mstore(0, convert_t_bytes4_to_t_bytes4(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

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

            function read_from_storage_split_offset_20_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_20t_bool(sload(slot))

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

            function shift_left_8(value) -> newValue {
                newValue :=

                shl(8, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_address_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_address_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_address_$dyn_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function storage_array_index_access_t_array$_t_bytes32_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_bytes32_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_bytes32_$dyn_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

            }

            function update_byte_slice_1_shift_20(value, toInsert) -> result {
                let mask := 0xff0000000000000000000000000000000000000000
                toInsert := shift_left_160(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_20_shift_1(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff00
                toInsert := shift_left_8(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_1t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_1(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function validator_revert_t_bytes4(value) {
                if iszero(eq(value, cleanup_t_bytes4(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes4() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

