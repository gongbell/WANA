/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "viewMessageNumPayable_134" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_viewMessageNumPayable_134()

        codecopy(0, dataoffset("viewMessageNumPayable_134_deployed"), datasize("viewMessageNumPayable_134_deployed"))

        return(0, datasize("viewMessageNumPayable_134_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_viewMessageNumPayable_134() {

            let expr_12 := 0x038d7ea4c68000
            update_storage_value_offset_0t_rational_1000000000000000_by_1_to_t_uint256(0x05, expr_12)

            let expr_18 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_18)
            update_storage_value_offset_0t_address_to_t_address(0x02, _1)
            let expr_19 := _1
            let expr_22 := 0x64
            let _2 := convert_t_rational_100_by_1_to_t_uint256(expr_22)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x04, _2)
            let expr_23 := _2
            let expr_26 := 0x00
            let _3 := convert_t_rational_0_by_1_to_t_uint256(expr_26)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x03, _3)
            let expr_27 := _3

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

        function convert_t_rational_1000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
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

        function prepare_store_t_address(value) -> ret {
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

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_1000000000000000_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_1000000000000000_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "viewMessageNumPayable_134_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x14bafeab
                {
                    // getMessage2()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getMessage2_125()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5deaa8f6
                {
                    // setNewMessage(bytes32)

                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_setNewMessage_45(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x71849f8f
                {
                    // setNewMessageNumber(bytes32,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                    fun_setNewMessageNumber_73(param_0, param_1)
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

                case 0xa035b1fe
                {
                    // price()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_price_13()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6216910
                {
                    // setNewMessageNumber2(bytes32,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_bytes32t_uint256(4, calldatasize())
                    fun_setNewMessageNumber2_94(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xce6d41de
                {
                    // getMessage()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getMessage_117()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe8ecea05
                {
                    // getSpecialNum()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getSpecialNum_133()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfe1feecd
                {
                    // setNewMessage2(bytes32)

                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_setNewMessage2_109(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
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

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_getMessage2_125() -> vloc__120 {
                let zero_value_for_type_t_bytes32_14 := zero_value_for_split_t_bytes32()
                vloc__120 := zero_value_for_type_t_bytes32_14

                let _15 := read_from_storage_split_offset_0_t_bytes32(0x01)
                let expr_122 := _15
                vloc__120 := expr_122
                leave

            }

            function fun_getMessage_117() -> vloc__112 {
                let zero_value_for_type_t_bytes32_12 := zero_value_for_split_t_bytes32()
                vloc__112 := zero_value_for_type_t_bytes32_12

                let _13 := read_from_storage_split_offset_0_t_bytes32(0x00)
                let expr_114 := _13
                vloc__112 := expr_114
                leave

            }

            function fun_getSpecialNum_133() -> vloc__128 {
                let zero_value_for_type_t_uint256_16 := zero_value_for_split_t_uint256()
                vloc__128 := zero_value_for_type_t_uint256_16

                let _17 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_130 := _17
                vloc__128 := expr_130
                leave

            }

            function fun_setNewMessage2_109(vloc_meg_96) {

                let _10 := vloc_meg_96
                let expr_100 := _10
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x01, expr_100)
                let expr_101 := expr_100
                let expr_105 := callvalue()
                let _11 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_105 := checked_add_t_uint256(_11, expr_105)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_105)
                let expr_106 := expr_105

            }

            function fun_setNewMessageNumber2_94(vloc_m_75, vloc_num_77) {

                let _7 := vloc_m_75
                let expr_81 := _7
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x00, expr_81)
                let expr_82 := expr_81
                let _8 := vloc_num_77
                let expr_85 := _8
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_85)
                let expr_86 := expr_85
                let expr_90 := callvalue()
                let _9 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_90 := checked_add_t_uint256(_9, expr_90)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_90)
                let expr_91 := expr_90

            }

            function fun_setNewMessageNumber_73(vloc_m_47, vloc_num_49) {

                let expr_54 := callvalue()
                let _3 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_55 := _3
                let expr_56 := iszero(lt(cleanup_t_uint256(expr_54), cleanup_t_uint256(expr_55)))
                require_helper(expr_56)
                let _4 := vloc_m_47
                let expr_60 := _4
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x00, expr_60)
                let expr_61 := expr_60
                let _5 := vloc_num_49
                let expr_64 := _5
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_64)
                let expr_65 := expr_64
                let expr_69 := callvalue()
                let _6 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_69 := checked_add_t_uint256(_6, expr_69)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_69)
                let expr_70 := expr_69

            }

            function fun_setNewMessage_45(vloc_newMsg_32) {

                let _1 := vloc_newMsg_32
                let expr_36 := _1
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x00, expr_36)
                let expr_37 := expr_36
                let expr_41 := callvalue()
                let _2 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_41 := checked_add_t_uint256(_2, expr_41)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_41)
                let expr_42 := expr_41

            }

            function getter_fun_owner_6() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_price_13() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_bytes32(value) -> ret {
                ret := shift_right_0_unsigned(value)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_bytes32(slot) -> value {
                value := extract_from_storage_value_offset_0t_bytes32(sload(slot))

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

            function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0) {
                let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

