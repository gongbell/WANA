/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Ownable_142" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Ownable_142()

        codecopy(0, dataoffset("Ownable_142_deployed"), datasize("Ownable_142_deployed"))

        return(0, datasize("Ownable_142_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Ownable_142() {

            let expr_112 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_112)
            let expr_113 := expr_112

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_address_payable(value) -> ret {
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

    }
    object "Ownable_142_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

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

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address_payable(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
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

            function convert_t_uint160_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function fun_transferOwnership_141(vloc_newOwner_119) {

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

            function getter_fun_owner_100() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address_payable(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

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

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
                let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
            }

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

        }

    }

}

