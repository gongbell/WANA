/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Store_87" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Store_87()

        codecopy(0, dataoffset("Store_87_deployed"), datasize("Store_87_deployed"))

        return(0, datasize("Store_87_deployed"))

        function constructor_Store_87() {

        }

    }
    object "Store_87_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x63bd1d4a
                {
                    // payout()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_payout_86()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_56()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

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

            function array_dataslot_t_array$_t_address_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_address_$dyn_storage(value) -> length {

                length := sload(value)

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

            function checked_mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_deposit_56() {

                let expr_17 := callvalue()
                let _1_slot := 0x00
                let expr_18_slot := _1_slot
                let expr_19 := array_length_t_array$_t_address_$dyn_storage(expr_18_slot)
                let expr_20 := checked_div_t_uint256(expr_17, expr_19)

                let vloc_ownerShare_15 := expr_20
                let expr_28 := callvalue()
                let _2_slot := 0x00
                let expr_29_slot := _2_slot
                let expr_30 := array_length_t_array$_t_address_$dyn_storage(expr_29_slot)
                let expr_31 := checked_mod_t_uint256(expr_28, expr_30)

                let _3 := 0x01
                let expr_22 := _3
                let _4_slot := 0x00
                let expr_23_slot := _4_slot
                let expr_24 := 0x00

                let _5, _6 := storage_array_index_access_t_array$_t_address_$dyn_storage(expr_23_slot, expr_24)
                let _7 := read_from_storage_split_dynamic_t_address(_5, _6)
                let expr_25 := _7
                let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_22,expr_25)
                let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                expr_31 := checked_add_t_uint256(_9, expr_31)
                update_storage_value_offset_0t_uint256_to_t_uint256(_8, expr_31)
                let expr_32 := expr_31
                for {
                    let expr_36 := 0x00
                    let vloc_i_35 := convert_t_rational_0_by_1_to_t_uint256(expr_36)
                    } 1 {
                    let _11 := vloc_i_35
                    let _10 := increment_t_uint256(_11)
                    vloc_i_35 := _10
                    let expr_43 := _11
                }
                {
                    let _12 := vloc_i_35
                    let expr_38 := _12
                    let _13_slot := 0x00
                    let expr_39_slot := _13_slot
                    let expr_40 := array_length_t_array$_t_address_$dyn_storage(expr_39_slot)
                    let expr_41 := lt(cleanup_t_uint256(expr_38), cleanup_t_uint256(expr_40))
                    if iszero(expr_41) { break }
                    let _14 := vloc_ownerShare_15
                    let expr_50 := _14
                    let _15 := 0x01
                    let expr_45 := _15
                    let _16_slot := 0x00
                    let expr_46_slot := _16_slot
                    let _17 := vloc_i_35
                    let expr_47 := _17

                    let _18, _19 := storage_array_index_access_t_array$_t_address_$dyn_storage(expr_46_slot, expr_47)
                    let _20 := read_from_storage_split_dynamic_t_address(_18, _19)
                    let expr_48 := _20
                    let _21 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_45,expr_48)
                    let _22 := read_from_storage_split_offset_0_t_uint256(_21)
                    expr_50 := checked_add_t_uint256(_22, expr_50)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_21, expr_50)
                    let expr_51 := expr_50
                }

            }

            function fun_payout_86() -> vloc__59 {
                let zero_value_for_type_t_uint256_23 := zero_value_for_split_t_uint256()
                vloc__59 := zero_value_for_type_t_uint256_23

                let _24 := 0x01
                let expr_63 := _24
                let expr_65 := caller()
                let _25 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_63,expr_65)
                let _26 := read_from_storage_split_offset_0_t_uint256(_25)
                let expr_66 := _26
                let vloc_amount_62 := expr_66
                let expr_72 := 0x00
                let _27 := convert_t_rational_0_by_1_to_t_uint256(expr_72)
                let _28 := 0x01
                let expr_68 := _28
                let expr_70 := caller()
                let _29 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_68,expr_70)
                update_storage_value_offset_0t_uint256_to_t_uint256(_29, _27)
                let expr_73 := _27
                let expr_78 := caller()
                let expr_79_address := convert_t_address_payable_to_t_address(expr_78)
                let _30 := vloc_amount_62
                let expr_80 := _30

                let _31 := 0
                if iszero(expr_80) { _31 := 2300 }
                let expr_81 := call(_31, expr_79_address, expr_80, 0, 0, 0, 0)

                let _32 := vloc_amount_62
                let expr_83 := _32
                vloc__59 := expr_83
                leave

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
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

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

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

            function storage_array_index_access_t_array$_t_address_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_address_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_address_$dyn_storage(array)
                slot := add(dataArea, mul(index, 1))
                offset := 0

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

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

