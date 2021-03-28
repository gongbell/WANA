/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ERC20_115" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ERC20_115()

        codecopy(0, dataoffset("ERC20_115_deployed"), datasize("ERC20_115_deployed"))

        return(0, datasize("ERC20_115_deployed"))

        function constructor_ERC20_115() {

        }

    }
    object "ERC20_115_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_totalSupply_66()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_56(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3eaaf86b
                {
                    // _totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun__totalSupply_58()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_78(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_114(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
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

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_add_48(vloc_a_26, vloc_b_28) -> vloc__31 {
                let zero_value_for_type_t_uint256_24 := zero_value_for_split_t_uint256()
                vloc__31 := zero_value_for_type_t_uint256_24

                let _25 := vloc_a_26
                let expr_35 := _25
                let _26 := vloc_b_28
                let expr_36 := _26
                let expr_37 := checked_add_t_uint256(expr_35, expr_36)

                let vloc_c_34 := expr_37
                let _27 := vloc_c_34
                let expr_40 := _27
                let _28 := vloc_a_26
                let expr_41 := _28
                let expr_42 := iszero(lt(cleanup_t_uint256(expr_40), cleanup_t_uint256(expr_41)))
                require_helper(expr_42)
                let _29 := vloc_c_34
                let expr_45 := _29
                vloc__31 := expr_45
                leave

            }

            function fun_balanceOf_78(vloc_owner_68) -> vloc__71 {
                let zero_value_for_type_t_uint256_30 := zero_value_for_split_t_uint256()
                vloc__71 := zero_value_for_type_t_uint256_30

                let _31 := 0x00
                let expr_73 := _31
                let _32 := vloc_owner_68
                let expr_74 := _32
                let _33 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_73,expr_74)
                let _34 := read_from_storage_split_offset_0_t_uint256(_33)
                let expr_75 := _34
                vloc__71 := expr_75
                leave

            }

            function fun_sub_24(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_18 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_18

                let _19 := vloc_b_4
                let expr_10 := _19
                let _20 := vloc_a_2
                let expr_11 := _20
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                require_helper(expr_12)
                let _21 := vloc_a_2
                let expr_17 := _21
                let _22 := vloc_b_4
                let expr_18 := _22
                let expr_19 := checked_sub_t_uint256(expr_17, expr_18)

                let vloc_c_16 := expr_19
                let _23 := vloc_c_16
                let expr_21 := _23
                vloc__7 := expr_21
                leave

            }

            function fun_totalSupply_66() -> vloc__61 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__61 := zero_value_for_type_t_uint256_1

                let _2 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_63 := _2
                vloc__61 := expr_63
                leave

            }

            function fun_transfer_114(vloc__to_80, vloc__value_82) -> vloc_success_85 {
                let zero_value_for_type_t_bool_3 := zero_value_for_split_t_bool()
                vloc_success_85 := zero_value_for_type_t_bool_3

                let _4 := 0x00
                let expr_91 := _4
                let expr_93 := caller()
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_91,expr_93)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                let expr_94 := _6
                let _7 := vloc__value_82
                let expr_96 := _7
                let expr_97 := fun_sub_24(expr_94, expr_96)
                let _8 := 0x00
                let expr_87 := _8
                let expr_89 := caller()
                let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_87,expr_89)
                update_storage_value_offset_0t_uint256_to_t_uint256(_9, expr_97)
                let expr_98 := expr_97
                let _10 := 0x00
                let expr_103 := _10
                let _11 := vloc__to_80
                let expr_104 := _11
                let _12 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_103,expr_104)
                let _13 := read_from_storage_split_offset_0_t_uint256(_12)
                let expr_105 := _13
                let _14 := vloc__value_82
                let expr_107 := _14
                let expr_108 := fun_add_48(expr_105, expr_107)
                let _15 := 0x00
                let expr_100 := _15
                let _16 := vloc__to_80
                let expr_101 := _16
                let _17 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_100,expr_101)
                update_storage_value_offset_0t_uint256_to_t_uint256(_17, expr_108)
                let expr_109 := expr_108
                let expr_111 := 0x01
                vloc_success_85 := expr_111
                leave

            }

            function getter_fun__totalSupply_58() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_balances_56(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

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

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
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

