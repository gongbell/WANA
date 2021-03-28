/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "CreditDepositBank_168" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_CreditDepositBank_168()

        codecopy(0, dataoffset("CreditDepositBank_168_deployed"), datasize("CreditDepositBank_168_deployed"))

        return(0, datasize("CreditDepositBank_168_deployed"))

        function constructor_CreditDepositBank_168() {

        }

    }
    object "CreditDepositBank_168_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_4(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x43d726d6
                {
                    // close()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_close_167()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x481c6a75
                {
                    // manager()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_manager_25()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x51cff8d9
                {
                    // withdraw(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_withdraw_97(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_6()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa06d083c
                {
                    // credit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_credit_140()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_51()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_73()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0ebdbe7
                {
                    // setManager(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setManager_44(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xed14b6a5
                {
                    // takeOver()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_takeOver_23()
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

            function checked_sub_t_uint256(x, y) -> diff {
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_contract$_CreditDepositBank_$168_to_t_address(value) -> converted {
                converted := convert_t_contract$_CreditDepositBank_$168_to_t_uint160(value)
            }

            function convert_t_contract$_CreditDepositBank_$168_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10000000000000000_by_1_to_t_uint256(value) -> converted {
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

            function fun_close_167() {

                let _26 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_143 := _26
                let expr_145_address := convert_t_address_payable_to_t_address(expr_143)
                let expr_148_address := address()
                let expr_149 := convert_t_contract$_CreditDepositBank_$168_to_t_address(expr_148_address)
                let expr_150 := balance(expr_149)

                let _27 := 0
                if iszero(expr_150) { _27 := 2300 }
                let expr_151 := call(_27, expr_145_address, expr_150, 0, 0, 0, 0)

                let expr_155_address := address()
                let expr_156 := convert_t_contract$_CreditDepositBank_$168_to_t_address(expr_155_address)
                let expr_157 := balance(expr_156)
                let expr_158 := 0x00
                let expr_159 := eq(cleanup_t_uint256(expr_157), convert_t_rational_0_by_1_to_t_uint256(expr_158))
                if expr_159 {
                    let _28 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_161 := _28
                    selfdestruct(expr_161)
                }

            }

            function fun_credit_140() {

                let expr_101 := callvalue()
                let expr_104_address := address()
                let expr_105 := convert_t_contract$_CreditDepositBank_$168_to_t_address(expr_104_address)
                let expr_106 := balance(expr_105)
                let expr_107 := iszero(lt(cleanup_t_uint256(expr_101), cleanup_t_uint256(expr_106)))
                if expr_107 {
                    let expr_114_address := address()
                    let expr_115 := convert_t_contract$_CreditDepositBank_$168_to_t_address(expr_114_address)
                    let expr_116 := balance(expr_115)
                    let expr_118 := callvalue()
                    let expr_119 := checked_add_t_uint256(expr_116, expr_118)

                    let _22 := 0x00
                    let expr_108 := _22
                    let expr_110 := caller()
                    let _23 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_108,expr_110)
                    let _24 := read_from_storage_split_offset_0_t_uint256(_23)
                    expr_119 := checked_sub_t_uint256(_24, expr_119)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_119)
                    let expr_120 := expr_119
                    let expr_125 := caller()
                    let expr_126_address := convert_t_address_payable_to_t_address(expr_125)
                    let expr_129_address := address()
                    let expr_130 := convert_t_contract$_CreditDepositBank_$168_to_t_address(expr_129_address)
                    let expr_131 := balance(expr_130)
                    let expr_133 := callvalue()
                    let expr_134 := checked_add_t_uint256(expr_131, expr_133)

                    let _25 := 0
                    if iszero(expr_134) { _25 := 2300 }
                    let expr_135 := call(_25, expr_126_address, expr_134, 0, 0, 0, 0)

                }

            }

            function fun_deposit_73() {

                let expr_55 := callvalue()
                let expr_58 := 0x2386f26fc10000
                let expr_59 := iszero(lt(cleanup_t_uint256(expr_55), convert_t_rational_10000000000000000_by_1_to_t_uint256(expr_58)))
                switch expr_59
                case 0 {
                    revert(0, 0)
                }
                default {
                    let expr_65 := callvalue()
                    let _10 := 0x00
                    let expr_60 := _10
                    let expr_62 := caller()
                    let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_60,expr_62)
                    let _12 := read_from_storage_split_offset_0_t_uint256(_11)
                    expr_65 := checked_add_t_uint256(_12, expr_65)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_11, expr_65)
                    let expr_66 := expr_65
                }

            }

            function fun_func_51() {

                let expr_47_functionIdentifier := 73
                fun_deposit_73()

            }

            function fun_setManager_44(vloc_manager_27) {

                let _1 := 0x00
                let expr_30 := _1
                let _2 := vloc_manager_27
                let expr_31 := _2
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_30,expr_31)
                let _4 := read_from_storage_split_offset_0_t_uint256(_3)
                let expr_32 := _4
                let expr_35 := 0x016345785d8a0000
                let expr_36 := gt(cleanup_t_uint256(expr_32), convert_t_rational_100000000000000000_by_1_to_t_uint256(expr_35))
                if expr_36 {
                    let _5 := vloc_manager_27
                    let expr_38 := _5
                    vloc_manager_27 := expr_38
                    let expr_39 := expr_38
                }

            }

            function fun_takeOver_23() {

                let _6 := 0x00
                let expr_9 := _6
                let expr_11 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_9,expr_11)
                let _8 := read_from_storage_split_offset_0_t_uint256(_7)
                let expr_12 := _8
                let expr_13 := 0x00
                let expr_14 := gt(cleanup_t_uint256(expr_12), convert_t_rational_0_by_1_to_t_uint256(expr_13))
                if expr_14 {
                    let expr_17 := caller()
                    let _9 := convert_t_address_payable_to_t_address(expr_17)
                    update_storage_value_offset_0t_address_to_t_address(0x01, _9)
                    let expr_18 := _9
                }

            }

            function fun_withdraw_97(vloc_client_75) {

                let _13 := 0x00
                let expr_79 := _13
                let _14 := vloc_client_75
                let expr_80 := _14
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_79,expr_80)
                let _16 := read_from_storage_split_offset_0_t_uint256(_15)
                let expr_81 := _16
                let expr_82 := 0x00
                let expr_83 := gt(cleanup_t_uint256(expr_81), convert_t_rational_0_by_1_to_t_uint256(expr_82))
                require_helper(expr_83)
                let expr_89 := caller()
                let expr_90_address := convert_t_address_payable_to_t_address(expr_89)
                let _17 := 0x00
                let expr_91 := _17
                let _18 := vloc_client_75
                let expr_92 := _18
                let _19 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_91,expr_92)
                let _20 := read_from_storage_split_offset_0_t_uint256(_19)
                let expr_93 := _20

                let _21 := 0
                if iszero(expr_93) { _21 := 2300 }
                let expr_94 := call(_21, expr_90_address, expr_93, 0, 0, 0, 0)

            }

            function getter_fun_balances_4(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_manager_25() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_owner_6() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

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

        }

    }

}

