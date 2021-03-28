/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ClassicCheck_31" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ClassicCheck_31()

        codecopy(0, dataoffset("ClassicCheck_31_deployed"), datasize("ClassicCheck_31_deployed"))

        return(0, datasize("ClassicCheck_31_deployed"))

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_ClassicCheck_31() {

            let expr_7 := 0xbf4ed7b27f1d666546e30d74d50d173d20bca754
            let expr_8 := convert_t_rational_1092175485233539987016990039969331462132880680788_by_1_to_t_address_payable(expr_7)
            let expr_9 := balance(convert_t_address_payable_to_t_address(expr_8))
            let expr_10 := 0xd3c21bcecceda1000000
            let expr_11 := gt(cleanup_t_uint256(expr_9), convert_t_rational_1000000000000000000000000_by_1_to_t_uint256(expr_10))
            switch expr_11
            case 0 {
                let expr_17 := 0x01
                update_storage_value_offset_0t_bool_to_t_bool(0x00, expr_17)
                let expr_18 := expr_17
            }
            default {
                let expr_13 := 0x00
                update_storage_value_offset_0t_bool_to_t_bool(0x00, expr_13)
                let expr_14 := expr_13
            }

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function convert_t_rational_1000000000000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_1092175485233539987016990039969331462132880680788_by_1_to_t_address_payable(value) -> converted {
            converted := convert_t_rational_1092175485233539987016990039969331462132880680788_by_1_to_t_uint160(value)
        }

        function convert_t_rational_1092175485233539987016990039969331462132880680788_by_1_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

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
    object "ClassicCheck_31_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x37b0574a
                {
                    // isClassic()

                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_isClassic_30()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x74439ca7
                {
                    // classic()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_classic_2()
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

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function fun_isClassic_30() -> vloc_isClassic_25 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc_isClassic_25 := zero_value_for_type_t_bool_1

                let _2 := read_from_storage_split_offset_0_t_bool(0x00)
                let expr_27 := _2
                vloc_isClassic_25 := expr_27
                leave

            }

            function getter_fun_classic_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

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

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

        }

    }

}

