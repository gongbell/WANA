/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SafeConditionalHFTransfer_54" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_SafeConditionalHFTransfer_54()

        codecopy(0, dataoffset("SafeConditionalHFTransfer_54_deployed"), datasize("SafeConditionalHFTransfer_54_deployed"))

        return(0, datasize("SafeConditionalHFTransfer_54_deployed"))

        function constructor_SafeConditionalHFTransfer_54() {

        }

    }
    object "SafeConditionalHFTransfer_54_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3e58c58c
                {
                    // send(address)

                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_send_53(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x565a2ecf
                {
                    // classicTransfer(address)

                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_classicTransfer_28(param_0)
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

            function abi_decode_tuple_t_address_payable(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

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

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function fun_classicTransfer_28(vloc_to_4) {

                let _5 := read_from_storage_split_offset_0_t_bool(0x00)
                let expr_7 := _5
                let expr_8 := cleanup_t_bool(iszero(expr_7))
                switch expr_8
                case 0 {
                    let _6 := vloc_to_4
                    let expr_19 := _6
                    let expr_21_address := convert_t_address_payable_to_t_address(expr_19)
                    let expr_23 := callvalue()

                    let _7 := 0
                    if iszero(expr_23) { _7 := 2300 }
                    let expr_24 := call(_7, expr_21_address, expr_23, 0, 0, 0, 0)

                }
                default {
                    let expr_12 := caller()
                    let expr_13 := expr_12
                    let expr_14_address := convert_t_address_payable_to_t_address(expr_13)
                    let expr_16 := callvalue()

                    let _8 := 0
                    if iszero(expr_16) { _8 := 2300 }
                    let expr_17 := call(_8, expr_14_address, expr_16, 0, 0, 0, 0)

                }

            }

            function fun_send_53(vloc_to_30) {

                let _1 := read_from_storage_split_offset_0_t_bool(0x00)
                let expr_33 := _1
                switch expr_33
                case 0 {
                    let _2 := vloc_to_30
                    let expr_44 := _2
                    let expr_46_address := convert_t_address_payable_to_t_address(expr_44)
                    let expr_48 := callvalue()

                    let _3 := 0
                    if iszero(expr_48) { _3 := 2300 }
                    let expr_49 := call(_3, expr_46_address, expr_48, 0, 0, 0, 0)

                }
                default {
                    let expr_37 := caller()
                    let expr_38 := expr_37
                    let expr_39_address := convert_t_address_payable_to_t_address(expr_38)
                    let expr_41 := callvalue()

                    let _4 := 0
                    if iszero(expr_41) { _4 := 2300 }
                    let expr_42 := call(_4, expr_39_address, expr_41, 0, 0, 0, 0)

                }

            }

            function panic_error() {
                invalid()
            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

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

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

        }

    }

}

