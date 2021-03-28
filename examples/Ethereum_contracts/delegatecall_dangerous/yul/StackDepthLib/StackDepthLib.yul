/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "StackDepthLib_73" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("StackDepthLib_73_deployed"), datasize("StackDepthLib_73_deployed"))

        return(0, datasize("StackDepthLib_73_deployed"))

        function constructor_StackDepthLib_73() {

        }

    }
    object "StackDepthLib_73_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x21835af6
                {
                    // __dig(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun___dig_72(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x32921690
                {
                    // checkDepth(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_checkDepth_39(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_rational_562256630_by_1_to_t_uint32_fromStack(value, pos) {
                mstore(pos, convert_t_rational_562256630_by_1_to_t_uint32(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_rational_562256630_by_1_t_uint256__to_t_uint32_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_rational_562256630_by_1_to_t_uint32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

                product := mul(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_t_address(value) -> cleaned {
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

            function cleanup_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function constant_GAS_PER_DEPTH_3() -> ret {
                let expr_2 := 0x0190
                let _4 := convert_t_rational_400_by_1_to_t_uint256(expr_2)

                ret := _4
            }

            function convert_t_contract$_StackDepthLib_$73_to_t_address(value) -> converted {
                converted := convert_t_contract$_StackDepthLib_$73_to_t_uint160(value)
            }

            function convert_t_contract$_StackDepthLib_$73_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_562256630_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(value)
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

            function fun___dig_72(vloc_n_41) {

                let _12 := vloc_n_41
                let expr_44 := _12
                let expr_45 := 0x00
                let expr_46 := eq(cleanup_t_uint256(expr_44), convert_t_rational_0_by_1_to_t_uint256(expr_45))
                if expr_46 {
                    leave
                }
                let expr_53_address := address()
                let expr_54 := convert_t_contract$_StackDepthLib_$73_to_t_address(expr_53_address)
                let expr_55_address := expr_54
                let expr_58 := 0x21835af6
                let _13 := vloc_n_41
                let expr_59 := _13
                let expr_60 := 0x01
                let expr_61 := checked_sub_t_uint256(expr_59, convert_t_rational_1_by_1_to_t_uint256(expr_60))

                let expr_62_mpos := allocateTemporaryMemory()
                let _14 := add(expr_62_mpos, 0x20)

                let _15 := abi_encode_tuple_t_rational_562256630_by_1_t_uint256__to_t_uint32_t_uint256__fromStack(_14, expr_58, expr_61)
                mstore(expr_62_mpos, sub(_15, add(expr_62_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_15))

                let _16 := add(expr_62_mpos, 0x20)
                let _17 := mload(expr_62_mpos)

                let expr_63_component_1 := delegatecall(gas(), expr_55_address,  _16, _17, 0, 0)

                let expr_63_component_2_mpos := extract_returndata()

                let vloc_success_50 := expr_63_component_1
                let _18 := vloc_success_50
                let expr_65 := _18
                let expr_66 := cleanup_t_bool(iszero(expr_65))
                if expr_66 {
                    revert(0, 0)
                }

            }

            function fun_checkDepth_39(vloc_self_5, vloc_n_7) -> vloc__10 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__10 := zero_value_for_type_t_bool_1

                let _2 := vloc_n_7
                let expr_12 := _2
                let expr_13 := 0x00
                let expr_14 := eq(cleanup_t_uint256(expr_12), convert_t_rational_0_by_1_to_t_uint256(expr_13))
                if expr_14 {
                    let expr_15 := 0x01
                    vloc__10 := expr_15
                    leave
                }
                let _3 := vloc_self_5
                let expr_20 := _3
                let expr_21_address := expr_20
                let expr_22 := constant_GAS_PER_DEPTH_3()
                let _5 := vloc_n_7
                let expr_23 := _5
                let expr_24 := checked_mul_t_uint256(expr_22, expr_23)

                let expr_25 := expr_24
                let expr_26_address := expr_21_address
                let expr_26_gas := expr_25
                let expr_29 := 0x21835af6
                let _6 := vloc_n_7
                let expr_30 := _6
                let expr_31 := 0x01
                let expr_32 := checked_sub_t_uint256(expr_30, convert_t_rational_1_by_1_to_t_uint256(expr_31))

                let expr_33_mpos := allocateTemporaryMemory()
                let _7 := add(expr_33_mpos, 0x20)

                let _8 := abi_encode_tuple_t_rational_562256630_by_1_t_uint256__to_t_uint32_t_uint256__fromStack(_7, expr_29, expr_32)
                mstore(expr_33_mpos, sub(_8, add(expr_33_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_8))

                let _9 := add(expr_33_mpos, 0x20)
                let _10 := mload(expr_33_mpos)

                let expr_34_component_1 := call(expr_26_gas, expr_26_address,  0,  _9, _10, 0, 0)

                let expr_34_component_2_mpos := extract_returndata()

                let vloc_success_19 := expr_34_component_1
                let _11 := vloc_success_19
                let expr_36 := _11
                vloc__10 := expr_36
                leave

            }

            function panic_error() {
                invalid()
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
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

