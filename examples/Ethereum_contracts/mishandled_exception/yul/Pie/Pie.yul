/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Pie_92" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Pie_92()

        codecopy(0, dataoffset("Pie_92_deployed"), datasize("Pie_92_deployed"))

        return(0, datasize("Pie_92_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Pie_92() {

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
    object "Pie_92_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3ccfd60b
                {
                    // withdraw()

                    abi_decode_tuple_(4, calldatasize())
                    fun_withdraw_67()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb1976a02
                {
                    // Get()

                    abi_decode_tuple_(4, calldatasize())
                    fun_Get_36()
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

                case 0xba21d62a
                {
                    // Command(address,bytes)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_bytes_memory_ptr(4, calldatasize())
                    fun_Command_91(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_decode_tuple_t_addresst_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
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

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
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

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_contract$_Pie_$92_to_t_address(value) -> converted {
                converted := convert_t_contract$_Pie_$92_to_t_uint160(value)
            }

            function convert_t_contract$_Pie_$92_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
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

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
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

            function fun_Command_91(vloc_adr_69, vloc_data_71_mpos) {

                let expr_76 := caller()
                let _10 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_77 := _10
                let expr_78 := eq(cleanup_t_address_payable(expr_76), cleanup_t_address_payable(expr_77))
                require_helper(expr_78)
                let _11 := vloc_adr_69
                let expr_81 := _11
                let expr_83_address := expr_81
                let expr_85 := callvalue()
                let expr_86_address := expr_83_address
                let expr_86_value := expr_85
                let _12_mpos := vloc_data_71_mpos
                let expr_87_mpos := _12_mpos

                let _13 := add(expr_87_mpos, 0x20)
                let _14 := mload(expr_87_mpos)

                let expr_88_component_1 := call(gas(), expr_86_address,  expr_86_value,  _13, _14, 0, 0)

                let expr_88_component_2_mpos := extract_returndata()

            }

            function fun_Get_36() {

                let expr_8 := callvalue()
                let expr_9 := 0x0de0b6b3a7640000
                let expr_10 := gt(cleanup_t_uint256(expr_8), convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_9))
                if expr_10 {
                    let _1 := read_from_storage_split_offset_0_t_address_payable(0x00)
                    let expr_11 := _1
                    let expr_13_address := convert_t_address_payable_to_t_address(expr_11)
                    let expr_16_address := address()
                    let expr_17 := convert_t_contract$_Pie_$92_to_t_address(expr_16_address)
                    let expr_18 := balance(expr_17)

                    let _2 := 0
                    if iszero(expr_18) { _2 := 2300 }
                    let _3 := call(_2, expr_13_address, expr_18, 0, 0, 0, 0)

                    if iszero(_3) { revert_forward_1() }

                    let expr_24 := caller()
                    let expr_25_address := convert_t_address_payable_to_t_address(expr_24)
                    let expr_28_address := address()
                    let expr_29 := convert_t_contract$_Pie_$92_to_t_address(expr_28_address)
                    let expr_30 := balance(expr_29)

                    let _4 := 0
                    if iszero(expr_30) { _4 := 2300 }
                    let _5 := call(_4, expr_25_address, expr_30, 0, 0, 0, 0)

                    if iszero(_5) { revert_forward_1() }

                }

            }

            function fun_withdraw_67() {

                let expr_40 := caller()
                let expr_41 := 0x1fb3acdba788ca50ce165e5a4151f05187c67cd6
                let expr_42 := eq(cleanup_t_address_payable(expr_40), cleanup_t_address_payable(expr_41))
                if expr_42 {
                    let expr_44 := 0x1fb3acdba788ca50ce165e5a4151f05187c67cd6
                    update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_44)
                    let expr_45 := expr_44
                }
                let expr_51 := caller()
                let _6 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_52 := _6
                let expr_53 := eq(cleanup_t_address_payable(expr_51), cleanup_t_address_payable(expr_52))
                require_helper(expr_53)
                let _7 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_56 := _7
                let expr_58_address := convert_t_address_payable_to_t_address(expr_56)
                let expr_61_address := address()
                let expr_62 := convert_t_contract$_Pie_$92_to_t_address(expr_61_address)
                let expr_63 := balance(expr_62)

                let _8 := 0
                if iszero(expr_63) { _8 := 2300 }
                let _9 := call(_8, expr_58_address, expr_63, 0, 0, 0, 0)

                if iszero(_9) { revert_forward_1() }

            }

            function getter_fun_Owner_4() -> ret {

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

            function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
                let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

