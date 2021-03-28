/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "UserWallet_19" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_UserWallet_19()

        codecopy(0, dataoffset("UserWallet_19_deployed"), datasize("UserWallet_19_deployed"))

        return(0, datasize("UserWallet_19_deployed"))

        function constructor_UserWallet_19() {

        }

    }
    object "UserWallet_19_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x35faa416
                {
                    // sweep()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_sweep_18()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            // bytes -> bytes
            function abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(start, length, pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length)

                copy_calldata_to_memory(start, pos, length)
                end := add(pos, length)
            }

            function abi_encode_tuple_packed_t_bytes_calldata_ptr__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                pos := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value0, value1,  pos)

                end := pos
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_returndata() -> data {

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

            function fun_sweep_18() -> vloc__5 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__5 := zero_value_for_type_t_bool_1

                let _2 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_9 := _2
                let expr_10_address := expr_9
                
                let expr_12_offset := 0
                let expr_12_length := calldatasize()

                let _3 := mload(64)
                let _4 := sub(abi_encode_tuple_packed_t_bytes_calldata_ptr__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_3 , expr_12_offset, expr_12_length), _3)

                let expr_13_component_1 := delegatecall(gas(), expr_10_address,  _3, _4, 0, 0)

                let expr_13_component_2_mpos := extract_returndata()

                let vloc_success_8 := expr_13_component_1
                let _5 := vloc_success_8
                let expr_15 := _5
                vloc__5 := expr_15
                leave

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

