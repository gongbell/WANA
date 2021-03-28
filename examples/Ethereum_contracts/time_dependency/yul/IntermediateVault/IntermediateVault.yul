/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "IntermediateVault_52" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_IntermediateVault_52()

        codecopy(0, dataoffset("IntermediateVault_52_deployed"), datasize("IntermediateVault_52_deployed"))

        return(0, datasize("IntermediateVault_52_deployed"))

        function cleanup_from_storage_t_address_payable(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_address_payable(value) -> cleaned {
            cleaned := cleanup_t_uint160(value)
        }

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_IntermediateVault_52() {

            let expr_4 := 0x01
            update_storage_value_offset_0t_bool_to_t_bool(0x00, expr_4)

            let _1 := read_from_storage_split_offset_1_t_address_payable(0x00)
            let expr_14 := _1
            let expr_17 := 0x00
            let expr_18 := convert_t_rational_0_by_1_to_t_address_payable(expr_17)
            let expr_19 := eq(cleanup_t_address_payable(expr_14), cleanup_t_address_payable(expr_18))
            if expr_19 {
                revert(0, 0)
            }

        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
            converted := convert_t_rational_0_by_1_to_t_uint160(value)
        }

        function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function extract_from_storage_value_offset_1t_address_payable(slot_value) -> value {
            value := cleanup_from_storage_t_address_payable(shift_right_8_unsigned(slot_value))
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function read_from_storage_split_offset_1_t_address_payable(slot) -> value {
            value := extract_from_storage_value_offset_1t_address_payable(sload(slot))

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_right_8_unsigned(value) -> newValue {
            newValue :=

            shr(8, value)

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

    }
    object "IntermediateVault_52_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x4aa47a50
                {
                    // isIntermediateVault()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_isIntermediateVault_5()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8cb1e9c1
                {
                    // unlockedAt()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_unlockedAt_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa69df4b5
                {
                    // unlock()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_unlock_51()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdbc0c085
                {
                    // teamMultisig()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_teamMultisig_8()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address_payable(value) -> cleaned {
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

            function convert_t_contract$_IntermediateVault_$52_to_t_address(value) -> converted {
                converted := convert_t_contract$_IntermediateVault_$52_to_t_uint160(value)
            }

            function convert_t_contract$_IntermediateVault_$52_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_1t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_8_unsigned(slot_value))
            }

            function fun_unlock_51() {

                let expr_30 := timestamp()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_31 := _1
                let expr_32 := lt(cleanup_t_uint256(expr_30), cleanup_t_uint256(expr_31))
                if expr_32 {
                    revert(0, 0)
                }
                let _2 := read_from_storage_split_offset_1_t_address_payable(0x00)
                let expr_37 := _2
                let expr_38_address := convert_t_address_payable_to_t_address(expr_37)
                let expr_41_address := address()
                let expr_42 := convert_t_contract$_IntermediateVault_$52_to_t_address(expr_41_address)
                let expr_43 := balance(expr_42)

                let _3 := 0
                if iszero(expr_43) { _3 := 2300 }
                let expr_44 := call(_3, expr_38_address, expr_43, 0, 0, 0, 0)

                let expr_45 := cleanup_t_bool(iszero(expr_44))
                if expr_45 {
                    revert(0, 0)
                }

            }

            function getter_fun_isIntermediateVault_5() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_teamMultisig_8() -> ret {

                let slot := 0
                let offset := 1

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_unlockedAt_11() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function read_from_storage_split_offset_1_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_1t_address_payable(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_8_unsigned(value) -> newValue {
                newValue :=

                shr(8, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

        }

    }

}

