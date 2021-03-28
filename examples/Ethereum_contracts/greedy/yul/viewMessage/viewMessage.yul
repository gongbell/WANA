/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "viewMessage_25" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_viewMessage_25()

        codecopy(0, dataoffset("viewMessage_25_deployed"), datasize("viewMessage_25_deployed"))

        return(0, datasize("viewMessage_25_deployed"))

        function constructor_viewMessage_25() {

        }

    }
    object "viewMessage_25_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x5deaa8f6
                {
                    // setNewMessage(bytes32)

                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_setNewMessage_16(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xce6d41de
                {
                    // getMessage()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getMessage_24()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos , ret_0)
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

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function cleanup_from_storage_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
            }

            function fun_getMessage_24() -> vloc__19 {
                let zero_value_for_type_t_bytes32_2 := zero_value_for_split_t_bytes32()
                vloc__19 := zero_value_for_type_t_bytes32_2

                let _3 := read_from_storage_split_offset_0_t_bytes32(0x00)
                let expr_21 := _3
                vloc__19 := expr_21
                leave

            }

            function fun_setNewMessage_16(vloc_newMsg_8) {

                let _1 := vloc_newMsg_8
                let expr_12 := _1
                update_storage_value_offset_0t_bytes32_to_t_bytes32(0x00, expr_12)
                let expr_13 := expr_12

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_bytes32(value) -> ret {
                ret := shift_right_0_unsigned(value)
            }

            function read_from_storage_split_offset_0_t_bytes32(slot) -> value {
                value := extract_from_storage_value_offset_0t_bytes32(sload(slot))

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

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

        }

    }

}

