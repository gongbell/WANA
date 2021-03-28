/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "AMBROSUSFund_140" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_AMBROSUSFund_140()

        codecopy(0, dataoffset("AMBROSUSFund_140_deployed"), datasize("AMBROSUSFund_140_deployed"))

        return(0, datasize("AMBROSUSFund_140_deployed"))

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_AMBROSUSFund_140() {

            let expr_13 := 0x4075be
            update_storage_value_offset_0t_rational_4224446_by_1_to_t_uint256(0x03, expr_13)

        }

        function convert_t_rational_4224446_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_rational_4224446_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_4224446_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "AMBROSUSFund_140_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_4(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x28b8e9cf
                {
                    // buy_the_tokens()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_buy_the_tokens_92()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2a2fbd4b
                {
                    // min_required_amount()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_min_required_amount_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5259347d
                {
                    // default_helper()

                    abi_decode_tuple_(4, calldatasize())
                    fun_default_helper_139()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x62568d83
                {
                    // min_buy_block()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_min_buy_block_14()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6360fc3f
                {
                    // bought_tokens()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_bought_tokens_6()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6ad1fe02
                {
                    // sale()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_sale_17()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x81702c34
                {
                    // refund_me()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_refund_me_48()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc42bb1e4
                {
                    // contract_eth_value()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_contract_eth_value_8()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            35function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

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

            40function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
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

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
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

            function constant_min_required_amount_11() -> ret {
                let expr_10 := 0x1043561a8829300000
                let _1 := convert_t_rational_300000000000000000000_by_1_to_t_uint256(expr_10)

                ret := _1
            }

            function constant_sale_17() -> ret {
                let expr_16 := 0x54e80390434b8bfcabc823e9656c57d018c1dc77
                let _2 := expr_16

                ret := _2
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_contract$_AMBROSUSFund_$140_to_t_address(value) -> converted {
                converted := convert_t_contract$_AMBROSUSFund_$140_to_t_uint160(value)
            }

            function convert_t_contract$_AMBROSUSFund_$140_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_300000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            68function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            69function fun_buy_the_tokens_92() {

                let _13 := read_from_storage_split_offset_0_t_bool(0x01)
                let expr_51 := _13
                if expr_51 {
                    leave
                }
                let expr_56_address := address()
                let expr_57 := convert_t_contract$_AMBROSUSFund_$140_to_t_address(expr_56_address)
                let expr_58 := balance(expr_57)
                let expr_59 := constant_min_required_amount_11()
                let expr_60 := iszero(eq(cleanup_t_uint256(expr_58), cleanup_t_uint256(expr_59)))
                if expr_60 {
                    revert(0, 0)
                }
                let expr_66 := number()
                let _14 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_67 := _14
                let expr_68 := lt(cleanup_t_uint256(expr_66), cleanup_t_uint256(expr_67))
                if expr_68 {
                    revert(0, 0)
                }
                let expr_74 := 0x01
                update_storage_value_offset_0t_bool_to_t_bool(0x01, expr_74)
                let expr_75 := expr_74
                let expr_80_address := address()
                let expr_81 := convert_t_contract$_AMBROSUSFund_$140_to_t_address(expr_80_address)
                let expr_82 := balance(expr_81)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_82)
                let expr_83 := expr_82
                let expr_85 := constant_sale_17()
                let expr_87_address := convert_t_address_payable_to_t_address(expr_85)
                let _15 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_88 := _15

                let _16 := 0
                if iszero(expr_88) { _16 := 2300 }
                let _17 := call(_16, expr_87_address, expr_88, 0, 0, 0, 0)

                if iszero(_17) { revert_forward_1() }

            }

            70function fun_default_helper_139() {

                let expr_98 := callvalue()
                let vloc_deposit_96 := expr_98
                let expr_102_address := address()
                let expr_103 := convert_t_contract$_AMBROSUSFund_$140_to_t_address(expr_102_address)
                let expr_104 := balance(expr_103)
                let expr_105 := constant_min_required_amount_11()
                let expr_106 := gt(cleanup_t_uint256(expr_104), cleanup_t_uint256(expr_105))
                if expr_106 {
                    let expr_111_address := address()
                    let expr_112 := convert_t_contract$_AMBROSUSFund_$140_to_t_address(expr_111_address)
                    let expr_113 := balance(expr_112)
                    let expr_114 := constant_min_required_amount_11()
                    let expr_115 := checked_sub_t_uint256(expr_113, expr_114)

                    let vloc_refund_108 := expr_115
                    let _18 := vloc_refund_108
                    let expr_118 := _18
                    let _19 := vloc_deposit_96
                    expr_118 := checked_sub_t_uint256(_19, expr_118)
                    vloc_deposit_96 := expr_118
                    let expr_119 := expr_118
                    let expr_124 := caller()
                    let expr_125_address := convert_t_address_payable_to_t_address(expr_124)
                    let _20 := vloc_refund_108
                    let expr_126 := _20

                    let _21 := 0
                    if iszero(expr_126) { _21 := 2300 }
                    let _22 := call(_21, expr_125_address, expr_126, 0, 0, 0, 0)

                    if iszero(_22) { revert_forward_1() }

                }
                let _23 := vloc_deposit_96
                let expr_135 := _23
                let _24 := 0x00
                let expr_131 := _24
                let expr_133 := caller()
                let _25 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_131,expr_133)
                let _26 := read_from_storage_split_offset_0_t_uint256(_25)
                expr_135 := checked_add_t_uint256(_26, expr_135)
                update_storage_value_offset_0t_uint256_to_t_uint256(_25, expr_135)
                let expr_136 := expr_135

            }

            function fun_refund_me_48() {

                let _3 := read_from_storage_split_offset_0_t_bool(0x01)
                let expr_20 := _3
                if expr_20 {
                    revert(0, 0)
                }
                let _4 := 0x00
                let expr_27 := _4
                let expr_29 := caller()
                let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_27,expr_29)
                let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                let expr_30 := _6
                let vloc_eth_to_withdraw_26 := expr_30
                let expr_36 := 0x00
                let _7 := convert_t_rational_0_by_1_to_t_uint256(expr_36)
                let _8 := 0x00
                let expr_32 := _8
                let expr_34 := caller()
                let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_32,expr_34)
                update_storage_value_offset_0t_uint256_to_t_uint256(_9, _7)
                let expr_37 := _7
                let expr_42 := caller()
                let expr_43_address := convert_t_address_payable_to_t_address(expr_42)
                let _10 := vloc_eth_to_withdraw_26
                let expr_44 := _10

                let _11 := 0
                if iszero(expr_44) { _11 := 2300 }
                let _12 := call(_11, expr_43_address, expr_44, 0, 0, 0, 0)

                if iszero(_12) { revert_forward_1() }

            }

            function getter_fun_balances_4(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_bought_tokens_6() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_contract_eth_value_8() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            75function getter_fun_min_buy_block_14() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_min_required_amount_11() -> ret_0 {
                ret_0 := constant_min_required_amount_11()
            }

            function getter_fun_sale_17() -> ret_0 {
                ret_0 := constant_sale_17()
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            79function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            80function panic_error() {
                invalid()
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            85function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            86function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            88function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            90function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            93function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            94function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

        }

    }

}

