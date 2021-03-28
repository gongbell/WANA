/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "BasicToken_158" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_BasicToken_158()

        codecopy(0, dataoffset("BasicToken_158_deployed"), datasize("BasicToken_158_deployed"))

        return(0, datasize("BasicToken_158_deployed"))

        function constructor_BasicToken_158() {

            constructor_ERC20Basic_72()

        }

        function constructor_ERC20Basic_72() {

        }

    }
    object "BasicToken_158_deployed" {
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
                    let ret_0 :=  getter_fun_totalSupply_47()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_157(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_144(param_0, param_1)
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

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function fun_add_44(vloc_a_22, vloc_b_24) -> vloc__27 {
                let zero_value_for_type_t_uint256_32 := zero_value_for_split_t_uint256()
                vloc__27 := zero_value_for_type_t_uint256_32

                let _33 := vloc_a_22
                let expr_31 := _33
                let _34 := vloc_b_24
                let expr_32 := _34
                let expr_33 := checked_add_t_uint256(expr_31, expr_32)

                let vloc_c_30 := expr_33
                let _35 := vloc_c_30
                let expr_36 := _35
                let _36 := vloc_a_22
                let expr_37 := _36
                let expr_38 := iszero(lt(cleanup_t_uint256(expr_36), cleanup_t_uint256(expr_37)))
                assert_helper(expr_38)
                let _37 := vloc_c_30
                let expr_41 := _37
                vloc__27 := expr_41
                leave

            }

            function fun_balanceOf_157(vloc__owner_146) -> vloc_balance_150 {
                let zero_value_for_type_t_uint256_38 := zero_value_for_split_t_uint256()
                vloc_balance_150 := zero_value_for_type_t_uint256_38

                let _39 := 0x01
                let expr_152 := _39
                let _40 := vloc__owner_146
                let expr_153 := _40
                let _41 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_152,expr_153)
                let _42 := read_from_storage_split_offset_0_t_uint256(_41)
                let expr_154 := _42
                vloc_balance_150 := expr_154
                leave

            }

            function fun_sub_20(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_27 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_27

                let _28 := vloc_b_4
                let expr_10 := _28
                let _29 := vloc_a_2
                let expr_11 := _29
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                assert_helper(expr_12)
                let _30 := vloc_a_2
                let expr_15 := _30
                let _31 := vloc_b_4
                let expr_16 := _31
                let expr_17 := checked_sub_t_uint256(expr_15, expr_16)

                vloc__7 := expr_17
                leave

            }

            function fun_transfer_144(vloc__to_84, vloc__value_86) -> vloc__90 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__90 := zero_value_for_type_t_bool_1

                let _2 := vloc__to_84
                let expr_93 := _2
                let expr_96 := 0x00
                let expr_97 := convert_t_rational_0_by_1_to_t_address_payable(expr_96)
                let expr_98 := iszero(eq(cleanup_t_address(expr_93), convert_t_address_payable_to_t_address(expr_97)))
                require_helper(expr_98)
                let _3 := vloc__value_86
                let expr_102 := _3
                let _4 := 0x01
                let expr_103 := _4
                let expr_105 := caller()
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_103,expr_105)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                let expr_106 := _6
                let expr_107 := iszero(gt(cleanup_t_uint256(expr_102), cleanup_t_uint256(expr_106)))
                require_helper(expr_107)
                let _7 := 0x01
                let expr_114 := _7
                let expr_116 := caller()
                let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_114,expr_116)
                let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                let expr_117 := _9
                let _10 := vloc__value_86
                let expr_119 := _10
                let expr_120 := fun_sub_20(expr_117, expr_119)
                let _11 := 0x01
                let expr_110 := _11
                let expr_112 := caller()
                let _12 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_110,expr_112)
                update_storage_value_offset_0t_uint256_to_t_uint256(_12, expr_120)
                let expr_121 := expr_120
                let _13 := 0x01
                let expr_126 := _13
                let _14 := vloc__to_84
                let expr_127 := _14
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_126,expr_127)
                let _16 := read_from_storage_split_offset_0_t_uint256(_15)
                let expr_128 := _16
                let _17 := vloc__value_86
                let expr_130 := _17
                let expr_131 := fun_add_44(expr_128, expr_130)
                let _18 := 0x01
                let expr_123 := _18
                let _19 := vloc__to_84
                let expr_124 := _19
                let _20 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_123,expr_124)
                update_storage_value_offset_0t_uint256_to_t_uint256(_20, expr_131)
                let expr_132 := expr_131
                let expr_136 := caller()
                let _21 := vloc__to_84
                let expr_137 := _21
                let _22 := vloc__value_86
                let expr_138 := _22
                let _23 := 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
                let _24 := convert_t_address_payable_to_t_address(expr_136)
                {
                    let _25 := mload(64)
                    let _26 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_25 , expr_138)
                    log3(_25, sub(_26, _25) , _23, _24, expr_137)
                }let expr_141 := 0x01
                vloc__90 := expr_141
                leave

            }

            function getter_fun_totalSupply_47() -> ret {

                let slot := 0
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

