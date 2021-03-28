/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TokenBank_150" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_TokenBank_150()

        codecopy(0, dataoffset("TokenBank_150_deployed"), datasize("TokenBank_150_deployed"))

        return(0, datasize("TokenBank_150_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_TokenBank_150() {

            constructor_Token_33()

        }

        function constructor_Token_33() {

            let expr_5 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address(0x01, expr_5)

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

        function prepare_store_t_address(value) -> ret {
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

        function update_storage_value_offset_0t_address_payable_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

    }
    object "TokenBank_150_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x11bcd830
                {
                    // MinDeposit()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_MinDeposit_37()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x290b1e5f
                {
                    // initTokenBank()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_initTokenBank_55()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2e2a51bd
                {
                    // WitdrawTokenToHolder(address,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_addresst_uint256(4, calldatasize())
                    fun_WitdrawTokenToHolder_102(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbea69bb9
                {
                    // Bal()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_Bal_149()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc7de2d13
                {
                    // WithdrawToken(address,uint256,address)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_addresst_uint256t_address(4, calldatasize())
                    fun_WithdrawToken_32(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xed21248c
                {
                    // Deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_Deposit_73()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xeec0ddd7
                {
                    // Holders(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_Holders_41(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf8ff612e
                {
                    // WithdrawToHolder(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_WithdrawToHolder_137(param_0, param_1)
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

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

            function abi_decode_tuple_t_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bytes4_t_address_t_uint256__to_t_bytes4_t_address_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

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

            function allocateTemporaryMemory() -> memPtr {
                memPtr := mload(64)
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

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_bytes4(value) -> cleaned {
                cleaned := and(value, 0xffffffff00000000000000000000000000000000000000000000000000000000)
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

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_contract$_TokenBank_$150_to_t_address(value) -> converted {
                converted := convert_t_contract$_TokenBank_$150_to_t_uint160(value)
            }

            function convert_t_contract$_TokenBank_$150_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1000000000000000000_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
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

            function fun_Bal_149() -> vloc__140 {
                let zero_value_for_type_t_uint256_40 := zero_value_for_split_t_uint256()
                vloc__140 := zero_value_for_type_t_uint256_40

                let expr_144_address := address()
                let expr_145 := convert_t_contract$_TokenBank_$150_to_t_address(expr_144_address)
                let expr_146 := balance(expr_145)
                vloc__140 := expr_146
                leave

            }

            function fun_Deposit_73() {

                let expr_59 := callvalue()
                let _10 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_60 := _10
                let expr_61 := iszero(lt(cleanup_t_uint256(expr_59), cleanup_t_uint256(expr_60)))
                if expr_61 {
                    let expr_67 := callvalue()
                    let _11 := 0x03
                    let expr_62 := _11
                    let expr_64 := caller()
                    let _12 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_62,expr_64)
                    let _13 := read_from_storage_split_offset_0_t_uint256(_12)
                    expr_67 := checked_add_t_uint256(_13, expr_67)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_12, expr_67)
                    let expr_68 := expr_67
                }

            }

            function fun_WitdrawTokenToHolder_102(vloc__to_75, vloc__token_77, vloc__amount_79) {

                let _14 := 0x03
                let expr_82 := _14
                let _15 := vloc__to_75
                let expr_83 := _15
                let _16 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_82,expr_83)
                let _17 := read_from_storage_split_offset_0_t_uint256(_16)
                let expr_84 := _17
                let expr_85 := 0x00
                let expr_86 := gt(cleanup_t_uint256(expr_84), convert_t_rational_0_by_1_to_t_uint256(expr_85))
                if expr_86 {
                    let expr_90 := 0x00
                    let _18 := convert_t_rational_0_by_1_to_t_uint256(expr_90)
                    let _19 := 0x03
                    let expr_87 := _19
                    let _20 := vloc__to_75
                    let expr_88 := _20
                    let _21 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_87,expr_88)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_21, _18)
                    let expr_91 := _18
                    let expr_93_functionIdentifier := 32
                    let _22 := vloc__token_77
                    let expr_94 := _22
                    let _23 := vloc__amount_79
                    let expr_95 := _23
                    let _24 := vloc__to_75
                    let expr_96 := _24
                    fun_WithdrawToken_32(expr_94, expr_95, expr_96)
                }

            }

            function fun_WithdrawToHolder_137(vloc__addr_104, vloc__wei_106) {

                let _25 := 0x03
                let expr_109 := _25
                let expr_111 := caller()
                let _26 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_109,expr_111)
                let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                let expr_112 := _27
                let expr_113 := 0x00
                let expr_114 := gt(cleanup_t_uint256(expr_112), convert_t_rational_0_by_1_to_t_uint256(expr_113))
                if expr_114 {
                    let _28 := 0x03
                    let expr_115 := _28
                    let _29 := vloc__addr_104
                    let expr_116 := _29
                    let _30 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_115,expr_116)
                    let _31 := read_from_storage_split_offset_0_t_uint256(_30)
                    let expr_117 := _31
                    let _32 := vloc__wei_106
                    let expr_118 := _32
                    let expr_119 := iszero(lt(cleanup_t_uint256(expr_117), cleanup_t_uint256(expr_118)))
                    if expr_119 {
                        let _33 := vloc__addr_104
                        let expr_120 := _33
                        let expr_122_address := expr_120
                        let _34 := vloc__wei_106
                        let expr_123 := _34
                        let expr_124_address := expr_122_address
                        let expr_124_value := expr_123
                        let _35 := vloc__wei_106
                        let expr_129 := _35
                        let _36 := 0x03
                        let expr_126 := _36
                        let _37 := vloc__addr_104
                        let expr_127 := _37
                        let _38 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_126,expr_127)
                        let _39 := read_from_storage_split_offset_0_t_uint256(_38)
                        expr_129 := checked_sub_t_uint256(_39, expr_129)
                        update_storage_value_offset_0t_uint256_to_t_uint256(_38, expr_129)
                        let expr_130 := expr_129
                    }
                }

            }

            function fun_WithdrawToken_32(vloc_token_8, vloc_amount_10, vloc_to_12) {

                let _3 := vloc_token_8
                let expr_15 := _3
                let expr_17_address := expr_15
                let expr_24 := 0xa9059cbb2ab09eb219583f4a59a5d0623ade346d962bcd4e46b11da047c9049b
                let expr_25 := convert_t_bytes32_to_t_bytes4(expr_24)
                let _4 := vloc_to_12
                let expr_26 := _4
                let _5 := vloc_amount_10
                let expr_27 := _5

                let expr_28_mpos := allocateTemporaryMemory()
                let _6 := add(expr_28_mpos, 0x20)

                let _7 := abi_encode_tuple_t_bytes4_t_address_t_uint256__to_t_bytes4_t_address_t_uint256__fromStack(_6, expr_25, expr_26, expr_27)
                mstore(expr_28_mpos, sub(_7, add(expr_28_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_7))

                let _8 := add(expr_28_mpos, 0x20)
                let _9 := mload(expr_28_mpos)

                let expr_29_component_1 := call(gas(), expr_17_address,  0,  _8, _9, 0, 0)

                let expr_29_component_2_mpos := extract_returndata()

            }

            function fun_initTokenBank_55() {

                let expr_47 := caller()
                let _1 := convert_t_address_payable_to_t_address(expr_47)
                update_storage_value_offset_0t_address_to_t_address(0x01, _1)
                let expr_48 := _1
                let expr_51 := 0x0de0b6b3a7640000
                let _2 := convert_t_rational_1000000000000000000_by_1_to_t_uint256(expr_51)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _2)
                let expr_52 := _2

            }

            function getter_fun_Holders_41(key_0) -> ret {

                let slot := 3
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_MinDeposit_37() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

