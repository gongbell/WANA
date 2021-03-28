/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TranferInTwoPart_33" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_TranferInTwoPart_33()

        codecopy(0, dataoffset("TranferInTwoPart_33_deployed"), datasize("TranferInTwoPart_33_deployed"))

        return(0, datasize("TranferInTwoPart_33_deployed"))

        function constructor_TranferInTwoPart_33() {

        }

    }
    object "TranferInTwoPart_33_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1a695230
                {
                    // transfer(address)

                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_transfer_32(param_0)
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

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }

                r := div(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
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

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function fun_transfer_32(vloc__to_2) {

                let expr_8 := callvalue()
                let expr_9 := 0x02
                let expr_10 := checked_div_t_uint256(expr_8, convert_t_rational_2_by_1_to_t_uint256(expr_9))

                let vloc_half_6 := expr_10
                let expr_15 := callvalue()
                let _1 := vloc_half_6
                let expr_16 := _1
                let expr_17 := checked_sub_t_uint256(expr_15, expr_16)

                let vloc_halfRemain_13 := expr_17
                let _2 := vloc__to_2
                let expr_19 := _2
                let expr_21_address := convert_t_address_payable_to_t_address(expr_19)
                let _3 := vloc_half_6
                let expr_22 := _3

                let _4 := 0
                if iszero(expr_22) { _4 := 2300 }
                let expr_23 := call(_4, expr_21_address, expr_22, 0, 0, 0, 0)

                let _5 := vloc__to_2
                let expr_25 := _5
                let expr_27_address := convert_t_address_payable_to_t_address(expr_25)
                let _6 := vloc_halfRemain_13
                let expr_28 := _6

                let _7 := 0
                if iszero(expr_28) { _7 := 2300 }
                let expr_29 := call(_7, expr_27_address, expr_28, 0, 0, 0, 0)

            }

            function panic_error() {
                invalid()
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
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

