/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "MultiplicatorX4_79" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_MultiplicatorX4_79()

        codecopy(0, dataoffset("MultiplicatorX4_79_deployed"), datasize("MultiplicatorX4_79_deployed"))

        return(0, datasize("MultiplicatorX4_79_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_MultiplicatorX4_79() {

            let expr_3 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_3)

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
    object "MultiplicatorX4_79_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1ac9f70d
                {
                    // multiplicate(address)

                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_multiplicate_78(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()

                    abi_decode_tuple_(4, calldatasize())
                    fun_withdraw_25()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb4a99a4e
                {
                    // Owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_Owner_4()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xba21d62a 3122779690
                {
                    // Command(address,bytes)

                    let param_0, param_1 :=  abi_decode_tuple_t_address_payablet_bytes_memory_ptr(4, calldatasize())
                    fun_Command_49(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_bytes_memory_ptr(length))
                mstore(array, length)
                let src := add(offset, 0x20)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
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

            37function abi_decode_tuple_t_address_payablet_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := 33abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            38function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            40function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            41function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            42function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            45function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            48function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_contract$_MultiplicatorX4_$79_to_t_address(value) -> converted {
                converted := convert_t_contract$_MultiplicatorX4_$79_to_t_uint160(value)
            }

            50function convert_t_contract$_MultiplicatorX4_$79_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            55function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
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

            57function fun_Command_49(vloc_adr_27, vloc_data_29_mpos) {

                let expr_34 := caller()
                let _5 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_35 := _5
                let expr_36 := eq(cleanup_t_address_payable(expr_34), cleanup_t_address_payable(expr_35))
                require_helper(expr_36)
                let _6 := vloc_adr_27
                let expr_39 := _6
                let expr_41_address := convert_t_address_payable_to_t_address(expr_39)
                let expr_43 := callvalue()
                let expr_44_address := expr_41_address
                let expr_44_value := expr_43
                let _7_mpos := vloc_data_29_mpos
                let expr_45_mpos := _7_mpos

                let _8 := add(expr_45_mpos, 0x20)
                let _9 := mload(expr_45_mpos)

                let expr_46_component_1 := call(gas(), expr_44_address,  expr_44_value,  _8, _9, 0, 0)

                let expr_46_component_2_mpos := extract_returndata()

            }

            58function fun_multiplicate_78(vloc_adr_51) {

                let expr_55 := callvalue()
                let expr_58_address := address()
                let expr_59 := convert_t_contract$_MultiplicatorX4_$79_to_t_address(expr_58_address)
                let expr_60 := balance(expr_59)
                let expr_61 := iszero(lt(cleanup_t_uint256(expr_55), cleanup_t_uint256(expr_60)))
                if expr_61 {
                    let _10 := vloc_adr_51
                    let expr_62 := _10
                    let expr_64_address := convert_t_address_payable_to_t_address(expr_62)
                    let expr_67_address := address()
                    let expr_68 := convert_t_contract$_MultiplicatorX4_$79_to_t_address(expr_67_address)
                    let expr_69 := balance(expr_68)
                    let expr_71 := callvalue()
                    let expr_72 := checked_add_t_uint256(expr_69, expr_71)

                    let _11 := 0
                    if iszero(expr_72) { _11 := 2300 }
                    let _12 := call(_11, expr_64_address, expr_72, 0, 0, 0, 0)

                    if iszero(_12) { revert_forward_1() }

                }

            }

            function fun_withdraw_25() {

                let expr_9 := caller()
                let _1 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_10 := _1
                let expr_11 := eq(cleanup_t_address_payable(expr_9), cleanup_t_address_payable(expr_10))
                require_helper(expr_11)
                let _2 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_14 := _2
                let expr_16_address := convert_t_address_payable_to_t_address(expr_14)
                let expr_19_address := address()
                let expr_20 := convert_t_contract$_MultiplicatorX4_$79_to_t_address(expr_19_address)
                let expr_21 := balance(expr_20)

                let _3 := 0
                if iszero(expr_21) { _3 := 2300 }
                let _4 := call(_3, expr_16_address, expr_21, 0, 0, 0, 0)

                if iszero(_4) { revert_forward_1() }

            }

            60function getter_fun_Owner_4() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            64function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            66function round_up_to_mul_of_32(value) -> result {
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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            70function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

