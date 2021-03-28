/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EthTermDeposits_127" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EthTermDeposits_127()

        codecopy(0, dataoffset("EthTermDeposits_127_deployed"), datasize("EthTermDeposits_127_deployed"))

        return(0, datasize("EthTermDeposits_127_deployed"))

        function constructor_EthTermDeposits_127() {

        }

    }
    object "EthTermDeposits_127_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x29750e85
                {
                    // depositEndTime(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_depositEndTime_8(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x57ea89b6
                {
                    // Withdraw()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_Withdraw_126()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd45baeab
                {
                    // Deposit(uint8)

                    let param_0 :=  abi_decode_tuple_t_uint8(4, calldatasize())
                    let ret_0 :=  fun_Deposit_70(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfc7e286d
                {
                    // deposits(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_deposits_4(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function abi_decode_t_uint8(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint8(value)
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

            function abi_decode_tuple_t_uint8(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
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

            function checked_mul_t_uint24(x, y) -> product {
                x := cleanup_t_uint24(x)
                y := cleanup_t_uint24(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffff, x))) { panic_error() }

                product := mul(x, y)
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

            function cleanup_t_uint24(value) -> cleaned {
                cleaned := and(value, 0xffffff)
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

            function convert_t_rational_604800_by_1_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint24(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint24_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint24(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint8_to_t_uint24(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_Deposit_70(vloc_numberOfWeeks_14) -> vloc__17 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__17 := zero_value_for_type_t_bool_1

                let expr_22 := caller()
                let vloc_owner_20 := convert_t_address_payable_to_t_address(expr_22)
                let expr_27 := callvalue()
                let vloc_amount_25 := expr_27
                let expr_32 := timestamp()
                let _2 := vloc_numberOfWeeks_14
                let expr_33 := _2
                let expr_34 := 0x093a80
                let expr_35 := checked_mul_t_uint24(convert_t_uint8_to_t_uint24(expr_33), convert_t_rational_604800_by_1_to_t_uint24(expr_34))

                let expr_36 := checked_add_t_uint256(expr_32, convert_t_uint24_to_t_uint256(expr_35))

                let vloc__time_30 := expr_36
                let _3 := 0x00
                let expr_38 := _3
                let _4 := vloc_owner_20
                let expr_39 := _4
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_38,expr_39)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                let expr_40 := _6
                let expr_41 := 0x00
                let expr_42 := gt(cleanup_t_uint256(expr_40), convert_t_rational_0_by_1_to_t_uint256(expr_41))
                if expr_42 {
                    let _7 := 0x01
                    let expr_44 := _7
                    let _8 := vloc_owner_20
                    let expr_45 := _8
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_44,expr_45)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    let expr_46 := _10
                    let _11 := vloc_numberOfWeeks_14
                    let expr_47 := _11
                    let expr_48 := 0x093a80
                    let expr_49 := checked_mul_t_uint24(convert_t_uint8_to_t_uint24(expr_47), convert_t_rational_604800_by_1_to_t_uint24(expr_48))

                    let expr_50 := checked_add_t_uint256(expr_46, convert_t_uint24_to_t_uint256(expr_49))

                    vloc__time_30 := expr_50
                    let expr_51 := expr_50
                }
                let _12 := vloc__time_30
                let expr_58 := _12
                let _13 := 0x01
                let expr_55 := _13
                let _14 := vloc_owner_20
                let expr_56 := _14
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_55,expr_56)
                update_storage_value_offset_0t_uint256_to_t_uint256(_15, expr_58)
                let expr_59 := expr_58
                let _16 := vloc_amount_25
                let expr_64 := _16
                let _17 := 0x00
                let expr_61 := _17
                let _18 := vloc_owner_20
                let expr_62 := _18
                let _19 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_61,expr_62)
                let _20 := read_from_storage_split_offset_0_t_uint256(_19)
                expr_64 := checked_add_t_uint256(_20, expr_64)
                update_storage_value_offset_0t_uint256_to_t_uint256(_19, expr_64)
                let expr_65 := expr_64
                let expr_67 := 0x01
                vloc__17 := expr_67
                leave

            }

            function fun_Withdraw_126() -> vloc__73 {
                let zero_value_for_type_t_bool_21 := zero_value_for_split_t_bool()
                vloc__73 := zero_value_for_type_t_bool_21

                let expr_78 := caller()
                let vloc_owner_76 := convert_t_address_payable_to_t_address(expr_78)
                let _22 := 0x01
                let expr_80 := _22
                let _23 := vloc_owner_76
                let expr_81 := _23
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_80,expr_81)
                let _25 := read_from_storage_split_offset_0_t_uint256(_24)
                let expr_82 := _25
                let expr_83 := 0x00
                let expr_84 := gt(cleanup_t_uint256(expr_82), convert_t_rational_0_by_1_to_t_uint256(expr_83))
                let expr_91 := expr_84
                if expr_91 {
                    let expr_86 := timestamp()
                    let _26 := 0x01
                    let expr_87 := _26
                    let _27 := vloc_owner_76
                    let expr_88 := _27
                    let _28 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_87,expr_88)
                    let _29 := read_from_storage_split_offset_0_t_uint256(_28)
                    let expr_89 := _29
                    let expr_90 := gt(cleanup_t_uint256(expr_86), cleanup_t_uint256(expr_89))
                    expr_91 := expr_90
                }
                let expr_97 := expr_91
                if expr_97 {
                    let _30 := 0x00
                    let expr_92 := _30
                    let _31 := vloc_owner_76
                    let expr_93 := _31
                    let _32 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_92,expr_93)
                    let _33 := read_from_storage_split_offset_0_t_uint256(_32)
                    let expr_94 := _33
                    let expr_95 := 0x00
                    let expr_96 := gt(cleanup_t_uint256(expr_94), convert_t_rational_0_by_1_to_t_uint256(expr_95))
                    expr_97 := expr_96
                }
                switch expr_97
                case 0 {
                    let expr_121 := 0x00
                    vloc__73 := expr_121
                    leave
                }
                default {
                    let _34 := 0x00
                    let expr_100 := _34
                    let _35 := vloc_owner_76
                    let expr_101 := _35
                    let _36 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_100,expr_101)
                    let _37 := read_from_storage_split_offset_0_t_uint256(_36)
                    let expr_102 := _37
                    let vloc_amount_99 := expr_102
                    let expr_107 := 0x00
                    let _38 := convert_t_rational_0_by_1_to_t_uint256(expr_107)
                    let _39 := 0x00
                    let expr_104 := _39
                    let _40 := vloc_owner_76
                    let expr_105 := _40
                    let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_104,expr_105)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_41, _38)
                    let expr_108 := _38
                    let expr_113 := caller()
                    let expr_114_address := convert_t_address_payable_to_t_address(expr_113)
                    let _42 := vloc_amount_99
                    let expr_115 := _42

                    let _43 := 0
                    if iszero(expr_115) { _43 := 2300 }
                    let _44 := call(_43, expr_114_address, expr_115, 0, 0, 0, 0)

                    if iszero(_44) { revert_forward_1() }

                    let expr_118 := 0x01
                    vloc__73 := expr_118
                    leave
                }

            }

            function getter_fun_depositEndTime_8(key_0) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_deposits_4(key_0) -> ret {

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

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

        }

    }

}

