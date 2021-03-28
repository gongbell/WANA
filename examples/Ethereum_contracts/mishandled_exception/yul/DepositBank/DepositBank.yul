/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "DepositBank_474" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_DepositBank_474()

        codecopy(0, dataoffset("DepositBank_474_deployed"), datasize("DepositBank_474_deployed"))

        return(0, datasize("DepositBank_474_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_Base_156() {

            let expr_5 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address(0x01, expr_5)
            let expr_9 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x02, expr_9)

        }

        function constructor_DepositBank_474() {

            constructor_Base_156()
            let expr_166 := 0x03
            update_storage_value_offset_0t_rational_3_by_1_to_t_uint256(0x06, expr_166)

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
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

        function prepare_store_t_address(value) -> ret {
            ret := value
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

        function update_storage_value_offset_0t_address_payable_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_3_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_3_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "DepositBank_474_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1fc0e5e9
                {
                    // StartPaymens()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_StartPaymens_403()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x21a91d2b
                {
                    // PrcntRate()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_PrcntRate_167()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x230c50fe
                {
                    // AuthorizePayments(bool)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bool(4, calldatasize())
                    fun_AuthorizePayments_384(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x326b7a14
                {
                    // WthdrawTo(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_address_payablet_uint256(4, calldatasize())
                    fun_WthdrawTo_125(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4dfdebe9
                {
                    // ClientQty()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ClientQty_164()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x547dfaf5
                {
                    // WthdrawAllToCreator()

                    abi_decode_tuple_(4, calldatasize())
                    fun_WthdrawAllToCreator_87()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5af95010
                {
                    // Lenders(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1, ret_2 :=  getter_fun_Lenders_186(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_uint256_t_uint256__to_t_uint256_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6006f178
                {
                    // WitdrawLenderProfit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_WitdrawLenderProfit_337()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70f5d3de
                {
                    // WthdrawToCreator(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_WthdrawToCreator_105(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7a2c1b71
                {
                    // CheckProfit(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_CheckProfit_270(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8386927a 8386927a
                {
                    // ToSponsor()

                    abi_decode_tuple_(4, calldatasize())
                    fun_ToSponsor_370()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x992ee874 2569988212
                {
                    // WithdrawToken(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_WithdrawToken_155(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9fc6ceac
                {
                    // SponsorsQty()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_SponsorsQty_160()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6f9dae1
                {
                    // changeOwner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_changeOwner_35(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xae1345c4
                {
                    // CharterCapital()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_CharterCapital_162()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xae8e3b70
                {
                    // Fin()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_Fin_473()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb0a77ef7
                {
                    // WithdrawToSponsor(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_address_payablet_uint256(4, calldatasize())
                    fun_WithdrawToSponsor_459(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb0a91659
                {
                    // FixProfit()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_FixProfit_303()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb16d22a0
                {
                    // StopPaymens()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_StopPaymens_422()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb9793dca
                {
                    // Sponsors(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_Sponsors_182(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbd9b6d86
                {
                    // confirmOwner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_confirmOwner_49()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_205()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe1c7392a
                {
                    // init()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_init_223()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xec2efe40
                {
                    // MinPayment()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MinPayment_169()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xed21248c
                {
                    // Deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_Deposit_239()
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

            function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            36function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            38function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            39function abi_decode_tuple_t_address_payablet_uint256(headStart, dataEnd) -> value0, value1 {
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

            40function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
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

            41function abi_decode_tuple_t_bool(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

            }

            42function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            47function abi_encode_tuple_t_bytes4_t_address_payable_t_uint256__to_t_bytes4_t_address_payable_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256_t_uint256_t_uint256__to_t_uint256_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            50function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
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

            55function checked_sub_t_uint256(x, y) -> diff {
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

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            60function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            61function cleanup_t_address_payable(value) -> cleaned {
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            68function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            70function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_contract$_Base_$156_to_t_address(value) -> converted {
                converted := convert_t_contract$_Base_$156_to_t_uint160(value)
            }

            function convert_t_contract$_Base_$156_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            75function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            80function convert_t_uint256_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            85function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            86function extract_returndata() -> data {

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

            87function fun_AuthorizePayments_384(vloc_val_372) {

                let expr_375_functionIdentifier := 21
                let expr_376 := fun_isOwner_21()
                if expr_376 {
                    let _89 := vloc_val_372
                    let expr_378 := _89
                    update_storage_value_offset_0t_bool_to_t_bool(0x08, expr_378)
                    let expr_379 := expr_378
                }

            }

            88function fun_CheckProfit_270(vloc_addr_241) -> vloc__244 {
                let zero_value_for_type_t_uint256_36 := zero_value_for_split_t_uint256()
                vloc__244 := zero_value_for_type_t_uint256_36

                let _37 := 0x0a
                let expr_246 := _37
                let _38 := vloc_addr_241
                let expr_247 := _38
                let _39 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address(expr_246,expr_247)
                let _40_slot := _39
                let expr_248_slot := _40_slot
                let _41 := add(expr_248_slot, 1)
                let _42 := read_from_storage_split_offset_0_t_uint256(_41)
                let expr_249 := _42
                let expr_250 := 0x64
                let expr_251 := checked_div_t_uint256(expr_249, convert_t_rational_100_by_1_to_t_uint256(expr_250))

                let expr_252 := expr_251
                let _43 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_253 := _43
                let expr_254 := checked_mul_t_uint256(expr_252, expr_253)

                let expr_255 := expr_254
                let expr_257 := timestamp()
                let _44 := 0x0a
                let expr_258 := _44
                let _45 := vloc_addr_241
                let expr_259 := _45
                let _46 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address(expr_258,expr_259)
                let _47_slot := _46
                let expr_260_slot := _47_slot
                let _48 := add(expr_260_slot, 0)
                let _49 := read_from_storage_split_offset_0_t_uint256(_48)
                let expr_261 := _49
                let expr_262 := checked_sub_t_uint256(expr_257, expr_261)

                let expr_263 := expr_262
                let expr_264 := 0x015180
                let expr_265 := checked_div_t_uint256(expr_263, convert_t_rational_86400_by_1_to_t_uint256(expr_264))

                let expr_266 := expr_265
                let expr_267 := checked_mul_t_uint256(expr_255, expr_266)

                vloc__244 := expr_267
                leave

            }

            89function fun_Deposit_239() {

                let expr_226_functionIdentifier := 303
                fun_FixProfit_303()
                let expr_235 := callvalue()
                let _31 := 0x0a
                let expr_229 := _31
                let expr_231 := caller()
                let _32 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_229,expr_231)
                let _33_slot := _32
                let expr_232_slot := _33_slot
                let _34 := add(expr_232_slot, 1)
                let _35 := read_from_storage_split_offset_0_t_uint256(_34)
                expr_235 := checked_add_t_uint256(_35, expr_235)
                update_storage_value_offset_0t_uint256_to_t_uint256(_34, expr_235)
                let expr_236 := expr_235

            }

            90function fun_Fin_473() {

                let expr_464_functionIdentifier := 21
                let expr_465 := fun_isOwner_21()
                if expr_465 {
                    let expr_467 := 0x01
                    update_storage_value_offset_0t_bool_to_t_bool(0x0b, expr_467)
                    let expr_468 := expr_467
                }

            }

            91function fun_FixProfit_303() {

                let _50 := 0x0a
                let expr_273 := _50
                let expr_275 := caller()
                let _51 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_273,expr_275)
                let _52_slot := _51
                let expr_276_slot := _52_slot
                let _53 := add(expr_276_slot, 1)
                let _54 := read_from_storage_split_offset_0_t_uint256(_53)
                let expr_277 := _54
                let expr_278 := 0x00
                let expr_279 := gt(cleanup_t_uint256(expr_277), convert_t_rational_0_by_1_to_t_uint256(expr_278))
                if expr_279 {
                    let expr_285_functionIdentifier := 270
                    let expr_287 := caller()
                    let _55 := convert_t_address_payable_to_t_address(expr_287)
                    let expr_288 := fun_CheckProfit_270(_55)
                    let _56 := 0x0a
                    let expr_280 := _56
                    let expr_282 := caller()
                    let _57 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_280,expr_282)
                    let _58_slot := _57
                    let expr_283_slot := _58_slot
                    let _59 := add(expr_283_slot, 2)
                    let _60 := read_from_storage_split_offset_0_t_uint256(_59)
                    expr_288 := checked_add_t_uint256(_60, expr_288)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_59, expr_288)
                    let expr_289 := expr_288
                }
                let expr_299 := timestamp()
                let _61 := 0x0a
                let expr_293 := _61
                let expr_295 := caller()
                let _62 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_293,expr_295)
                let _63_slot := _62
                let expr_296_slot := _63_slot
                let _64 := add(expr_296_slot, 0)
                update_storage_value_offset_0t_uint256_to_t_uint256(_64, expr_299)
                let expr_300 := expr_299

            }

            92function fun_StartPaymens_403() {

                let expr_387_functionIdentifier := 21
                let expr_388 := fun_isOwner_21()
                if expr_388 {
                    let expr_389_functionIdentifier := 384
                    let expr_390 := 0x01
                    fun_AuthorizePayments_384(expr_390)
                    let expr_395 := caller()
                    let expr_397 := timestamp()
                    let _90 := 0xaf9cb8c082d497f25197d688303034bf5fde66e3faa3bdc1ef832e47088bde93
                    let _91 := convert_t_address_payable_to_t_address(expr_395)
                    {
                        let _92 := mload(64)
                        let _93 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_92 , expr_397)
                        log2(_92, sub(_93, _92) , _90, _91)
                }}

            }

            93function fun_StopPaymens_422() {

                let expr_406_functionIdentifier := 21
                let expr_407 := fun_isOwner_21()
                if expr_407 {
                    let expr_408_functionIdentifier := 384
                    let expr_409 := 0x00
                    fun_AuthorizePayments_384(expr_409)
                    let expr_414 := caller()
                    let expr_416 := timestamp()
                    let _94 := 0x191313aeddac1904c3453ef2898668c642135419a28b905f260bca51cf1b909a
                    let _95 := convert_t_address_payable_to_t_address(expr_414)
                    {
                        let _96 := mload(64)
                        let _97 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_96 , expr_416)
                        log2(_96, sub(_97, _96) , _94, _95)
                }}

            }

            94function fun_ToSponsor_370() {

                let expr_341 := callvalue()
                let _79 := read_from_storage_split_offset_0_t_uint256(0x07)
                let expr_342 := _79
                let expr_343 := iszero(lt(cleanup_t_uint256(expr_341), cleanup_t_uint256(expr_342)))
                if expr_343 {
                    let _80 := 0x09
                    let expr_344 := _80
                    let expr_346 := caller()
                    let _81 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_344,expr_346)
                    let _82 := read_from_storage_split_offset_0_t_uint256(_81)
                    let expr_347 := _82
                    let expr_348 := 0x00
                    let expr_349 := eq(cleanup_t_uint256(expr_347), convert_t_rational_0_by_1_to_t_uint256(expr_348))
                    if expr_349 {
                        let _84 := read_from_storage_split_offset_0_t_uint256(0x03)
                        let _83 := increment_t_uint256(_84)
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x03, _83)
                        let expr_351 := _84
                    }
                    let expr_359 := callvalue()
                    let _85 := 0x09
                    let expr_354 := _85
                    let expr_356 := caller()
                    let _86 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_354,expr_356)
                    let _87 := read_from_storage_split_offset_0_t_uint256(_86)
                    expr_359 := checked_add_t_uint256(_87, expr_359)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_86, expr_359)
                    let expr_360 := expr_359
                    let expr_364 := callvalue()
                    let _88 := read_from_storage_split_offset_0_t_uint256(0x04)
                    expr_364 := checked_add_t_uint256(_88, expr_364)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_364)
                    let expr_365 := expr_364
                }

            }

            95function fun_WitdrawLenderProfit_337() {

                let _65 := read_from_storage_split_offset_0_t_bool(0x08)
                let expr_306 := _65
                if expr_306 {
                    let expr_307_functionIdentifier := 303
                    fun_FixProfit_303()
                    let _66 := 0x0a
                    let expr_312 := _66
                    let expr_314 := caller()
                    let _67 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_312,expr_314)
                    let _68_slot := _67
                    let expr_315_slot := _68_slot
                    let _69 := add(expr_315_slot, 2)
                    let _70 := read_from_storage_split_offset_0_t_uint256(_69)
                    let expr_316 := _70
                    let vloc_profit_311 := expr_316
                    let expr_323 := 0x00
                    let _71 := convert_t_rational_0_by_1_to_t_uint256(expr_323)
                    let _72 := 0x0a
                    let expr_318 := _72
                    let expr_320 := caller()
                    let _73 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(expr_318,expr_320)
                    let _74_slot := _73
                    let expr_321_slot := _74_slot
                    let _75 := add(expr_321_slot, 2)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_75, _71)
                    let expr_324 := _71
                    let expr_329 := caller()
                    let expr_330_address := convert_t_address_payable_to_t_address(expr_329)
                    let _76 := vloc_profit_311
                    let expr_331 := _76

                    let _77 := 0
                    if iszero(expr_331) { _77 := 2300 }
                    let _78 := call(_77, expr_330_address, expr_331, 0, 0, 0, 0)

                    if iszero(_78) { revert_forward_1() }

                }

            }

            96function fun_WithdrawToSponsor_459(vloc__addr_424, vloc__wei_426) {

                let _98 := 0x09
                let expr_429 := _98
                let _99 := vloc__addr_424
                let expr_430 := _99
                let _100 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_429,expr_430)
                let _101 := read_from_storage_split_offset_0_t_uint256(_100)
                let expr_431 := _101
                let expr_432 := 0x00
                let expr_433 := gt(cleanup_t_uint256(expr_431), convert_t_rational_0_by_1_to_t_uint256(expr_432))
                if expr_433 {
                    let expr_434_functionIdentifier := 21
                    let expr_435 := fun_isOwner_21()
                    if expr_435 {
                        let _102 := vloc__addr_424
                        let expr_436 := _102
                        let expr_437_address := convert_t_address_payable_to_t_address(expr_436)
                        let _103 := vloc__wei_426
                        let expr_438 := _103

                        let _104 := 0
                        if iszero(expr_438) { _104 := 2300 }
                        let expr_439 := call(_104, expr_437_address, expr_438, 0, 0, 0, 0)

                        if expr_439 {
                            let _105 := read_from_storage_split_offset_0_t_uint256(0x04)
                            let expr_440 := _105
                            let _106 := vloc__wei_426
                            let expr_441 := _106
                            let expr_442 := iszero(lt(cleanup_t_uint256(expr_440), cleanup_t_uint256(expr_441)))
                            switch expr_442
                            case 0 {
                                let expr_448 := 0x00
                                let _107 := convert_t_rational_0_by_1_to_t_uint256(expr_448)
                                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _107)
                                let expr_449 := _107
                            }
                            default {
                                let _108 := vloc__wei_426
                                let expr_444 := _108
                                let _109 := read_from_storage_split_offset_0_t_uint256(0x04)
                                expr_444 := checked_sub_t_uint256(_109, expr_444)
                                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_444)
                                let expr_445 := expr_444
                            }
                        }
                    }
                }

            }

            97function fun_WithdrawToken_155(vloc_token_127, vloc_amount_129) {

                let expr_133 := caller()
                let _20 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_134 := _20
                let expr_135 := eq(cleanup_t_address_payable(expr_133), cleanup_t_address_payable(expr_134))
                if expr_135 {
                    let _21 := vloc_token_127
                    let expr_136 := _21
                    let expr_138_address := expr_136
                    let expr_145 := 0xa9059cbb2ab09eb219583f4a59a5d0623ade346d962bcd4e46b11da047c9049b
                    let expr_146 := convert_t_bytes32_to_t_bytes4(expr_145)
                    let _22 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_147 := _22
                    let _23 := vloc_amount_129
                    let expr_148 := _23

                    let expr_149_mpos := allocateTemporaryMemory()
                    let _24 := add(expr_149_mpos, 0x20)

                    let _25 := abi_encode_tuple_t_bytes4_t_address_payable_t_uint256__to_t_bytes4_t_address_payable_t_uint256__fromStack(_24, expr_146, expr_147, expr_148)
                    mstore(expr_149_mpos, sub(_25, add(expr_149_mpos, 0x20)))
                    mstore(64, round_up_to_mul_of_32(_25))

                    let _26 := add(expr_149_mpos, 0x20)
                    let _27 := mload(expr_149_mpos)

                    let expr_150_component_1 := call(gas(), expr_138_address,  0,  _26, _27, 0, 0)

                    let expr_150_component_2_mpos := extract_returndata()

                }

            }

            98function fun_WthdrawAllToCreator_87() {

                let expr_71 := caller()
                let _6 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_72 := _6
                let expr_73 := eq(cleanup_t_address_payable(expr_71), cleanup_t_address_payable(expr_72))
                if expr_73 {
                    let _7 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_74 := _7
                    let expr_76_address := convert_t_address_payable_to_t_address(expr_74)
                    let expr_79_address := address()
                    let expr_80 := convert_t_contract$_Base_$156_to_t_address(expr_79_address)
                    let expr_81 := balance(expr_80)

                    let _8 := 0
                    if iszero(expr_81) { _8 := 2300 }
                    let _9 := call(_8, expr_76_address, expr_81, 0, 0, 0, 0)

                    if iszero(_9) { revert_forward_1() }

                }

            }

            function fun_WthdrawToCreator_105(vloc_val_89) {

                let expr_93 := caller()
                let _10 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_94 := _10
                let expr_95 := eq(cleanup_t_address_payable(expr_93), cleanup_t_address_payable(expr_94))
                if expr_95 {
                    let _11 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_96 := _11
                    let expr_98_address := convert_t_address_payable_to_t_address(expr_96)
                    let _12 := vloc_val_89
                    let expr_99 := _12

                    let _13 := 0
                    if iszero(expr_99) { _13 := 2300 }
                    let _14 := call(_13, expr_98_address, expr_99, 0, 0, 0, 0)

                    if iszero(_14) { revert_forward_1() }

                }

            }

            function fun_WthdrawTo_125(vloc_addr_107, vloc_val_109) {

                let expr_113 := caller()
                let _15 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_114 := _15
                let expr_115 := eq(cleanup_t_address_payable(expr_113), cleanup_t_address_payable(expr_114))
                if expr_115 {
                    let _16 := vloc_addr_107
                    let expr_116 := _16
                    let expr_118_address := convert_t_address_payable_to_t_address(expr_116)
                    let _17 := vloc_val_109
                    let expr_119 := _17

                    let _18 := 0
                    if iszero(expr_119) { _18 := 2300 }
                    let _19 := call(_18, expr_118_address, expr_119, 0, 0, 0, 0)

                    if iszero(_19) { revert_forward_1() }

                }

            }

            function fun_changeOwner_35(vloc_addr_23) {

                let expr_26_functionIdentifier := 21
                let expr_27 := fun_isOwner_21()
                if expr_27 {
                    let _1 := vloc_addr_23
                    let expr_29 := _1
                    update_storage_value_offset_0t_address_to_t_address(0x00, expr_29)
                    let expr_30 := expr_29
                }

            }

            function fun_confirmOwner_49() {

                let expr_39 := caller()
                let _4 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_40 := _4
                let expr_41 := eq(convert_t_address_payable_to_t_address(expr_39), cleanup_t_address(expr_40))
                if expr_41 {
                    let _5 := read_from_storage_split_offset_0_t_address(0x00)
                    let expr_43 := _5
                    update_storage_value_offset_0t_address_to_t_address(0x01, expr_43)
                    let expr_44 := expr_43
                }

            }

            function fun_func_205() {

                let expr_201_functionIdentifier := 370
                fun_ToSponsor_370()

            }

            function fun_init_223() {

                let expr_211 := caller()
                let _28 := convert_t_address_payable_to_t_address(expr_211)
                update_storage_value_offset_0t_address_to_t_address(0x01, _28)
                let expr_212 := _28
                let expr_215 := 0x05
                let _29 := convert_t_rational_5_by_1_to_t_uint256(expr_215)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x06, _29)
                let expr_216 := _29
                let expr_219 := 0x0de0b6b3a7640000
                let _30 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_219)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x07, _30)
                let expr_220 := _30

            }

            function fun_isOwner_21() -> vloc__13 {
                let zero_value_for_type_t_bool_2 := zero_value_for_split_t_bool()
                vloc__13 := zero_value_for_type_t_bool_2

                let _3 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_15 := _3
                let expr_17 := caller()
                let expr_18 := eq(cleanup_t_address(expr_15), convert_t_address_payable_to_t_address(expr_17))
                vloc__13 := expr_18
                leave

            }

            function getter_fun_CharterCapital_162() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_ClientQty_164() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_Lenders_186(key_0) -> ret_0, ret_1, ret_2 {

                let slot := 10
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

                ret_2 := read_from_storage_split_offset_0_t_uint256(add(slot, 2))

            }

            function getter_fun_MinPayment_169() -> ret {

                let slot := 7
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_PrcntRate_167() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_SponsorsQty_160() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_Sponsors_182(key_0) -> ret {

                let slot := 9
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Lender_$178_storage_$_of_t_address_payable(slot , key) -> dataSlot {
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

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
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

