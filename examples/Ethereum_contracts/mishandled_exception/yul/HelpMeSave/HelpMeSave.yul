/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "HelpMeSave_102" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_HelpMeSave_102()

        codecopy(0, dataoffset("HelpMeSave_102_deployed"), datasize("HelpMeSave_102_deployed"))

        return(0, datasize("HelpMeSave_102_deployed"))

        function constructor_HelpMeSave_102() {

        }

    }
    object "HelpMeSave_102_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x06b5ad18
                {
                    // recovery(string,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_string_memory_ptrt_address_payable(4, calldatasize())
                    let ret_0 :=  fun_recovery_101(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x22d122a9
                {
                    // MyTestWallet7()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_MyTestWallet7_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_withdraw_51()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_15()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_decode_t_string_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_string_memory_ptr(length))
                mstore(array, length)
                let src := add(offset, 0x20)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_string_memory_ptrt_address_payable(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
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

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
            }

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function checked_mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_contract$_HelpMeSave_$102_to_t_address(value) -> converted {
                converted := convert_t_contract$_HelpMeSave_$102_to_t_uint160(value)
            }

            function convert_t_contract$_HelpMeSave_$102_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1000000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_94865382827780_by_1_to_t_uint256(value) -> converted {
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

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function fun_MyTestWallet7_11() {

                let expr_7 := caller()
                let _1 := convert_t_address_payable_to_t_address(expr_7)
                update_storage_value_offset_0t_address_to_t_address(0x00, _1)
                let expr_8 := _1

            }

            function fun_deposit_15() {

            }

            function fun_recovery_101(vloc__password_62_mpos, vloc__return_addr_64) -> vloc__67 {
                let zero_value_for_type_t_uint256_7 := zero_value_for_split_t_uint256()
                vloc__67 := zero_value_for_type_t_uint256_7

                let _8 := vloc__return_addr_64
                let expr_74 := _8

                let expr_75_mpos := allocateTemporaryMemory()
                let _9 := add(expr_75_mpos, 0x20)

                let _10 := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(_9, expr_74)
                mstore(expr_75_mpos, sub(_10, add(expr_75_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_10))
                let expr_76 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_75_mpos), array_length_t_bytes_memory_ptr(expr_75_mpos))
                let expr_77 := convert_t_bytes32_to_t_uint256(expr_76)
                let expr_78 := 0x5af3107a4000
                let expr_79 := checked_mod_t_uint256(expr_77, convert_t_rational_100000000000000_by_1_to_t_uint256(expr_78))

                let expr_80 := 0x56479171e704
                let expr_81 := eq(cleanup_t_uint256(expr_79), convert_t_rational_94865382827780_by_1_to_t_uint256(expr_80))
                if expr_81 {
                    let _11 := vloc__return_addr_64
                    let expr_83 := _11
                    selfdestruct(expr_83)
                }
                let _12 := vloc__return_addr_64
                let expr_93 := _12

                let expr_94_mpos := allocateTemporaryMemory()
                let _13 := add(expr_94_mpos, 0x20)

                let _14 := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(_13, expr_93)
                mstore(expr_94_mpos, sub(_14, add(expr_94_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_14))
                let expr_95 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_94_mpos), array_length_t_bytes_memory_ptr(expr_94_mpos))
                let expr_96 := convert_t_bytes32_to_t_uint256(expr_95)
                let expr_97 := 0x5af3107a4000
                let expr_98 := checked_mod_t_uint256(expr_96, convert_t_rational_100000000000000_by_1_to_t_uint256(expr_97))

                vloc__67 := expr_98
                leave

            }

            function fun_withdraw_51() {

                let expr_24_address := address()
                let expr_25 := convert_t_contract$_HelpMeSave_$102_to_t_address(expr_24_address)
                let expr_26 := balance(expr_25)
                let vloc_withdraw_amt_21 := expr_26
                let expr_29 := caller()
                let _2 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_30 := _2
                let expr_31 := iszero(eq(convert_t_address_payable_to_t_address(expr_29), cleanup_t_address(expr_30)))
                let expr_35 := expr_31
                if iszero(expr_35) {
                    let _3 := vloc_withdraw_amt_21
                    let expr_32 := _3
                    let expr_33 := 0x3635c9adc5dea00000
                    let expr_34 := lt(cleanup_t_uint256(expr_32), convert_t_rational_1000000000000000000000_by_1_to_t_uint256(expr_33))
                    expr_35 := expr_34
                }
                if expr_35 {
                    let expr_37 := 0x00
                    let _4 := convert_t_rational_0_by_1_to_t_uint256(expr_37)
                    vloc_withdraw_amt_21 := _4
                    let expr_38 := _4
                }
                let expr_45 := caller()
                let expr_46_address := convert_t_address_payable_to_t_address(expr_45)
                let _5 := vloc_withdraw_amt_21
                let expr_47 := _5

                let _6 := 0
                if iszero(expr_47) { _6 := 2300 }
                let expr_48 := call(_6, expr_46_address, expr_47, 0, 0, 0, 0)

            }

            function getter_fun_owner_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

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

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

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

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

