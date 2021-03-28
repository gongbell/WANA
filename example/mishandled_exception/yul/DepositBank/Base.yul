/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Base_156" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Base_156()

        codecopy(0, dataoffset("Base_156_deployed"), datasize("Base_156_deployed"))

        return(0, datasize("Base_156_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Base_156() {

            let expr_5 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address(0x01, expr_5)
            let expr_9 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x02, expr_9)

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
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

        function prepare_store_t_address(value) -> ret {
            ret := value
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

        function update_storage_value_offset_0t_address_payable_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

    }
    object "Base_156_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x326b7a14
                {
                    // WthdrawTo(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_address_payablet_uint256(4, calldatasize())
                    fun_WthdrawTo_125(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x547dfaf5
                {
                    // WthdrawAllToCreator()

                    abi_decode_tuple_(4, calldatasize())
                    fun_WthdrawAllToCreator_87()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70f5d3de
                {
                    // WthdrawToCreator(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_WthdrawToCreator_105(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x992ee874
                {
                    // WithdrawToken(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_WithdrawToken_155(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6f9dae1
                {
                    // changeOwner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_changeOwner_35(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbd9b6d86
                {
                    // confirmOwner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_confirmOwner_49()
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

            function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
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

            function abi_decode_tuple_t_address_payablet_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
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

            function abi_encode_tuple_t_bytes4_t_address_payable_t_uint256__to_t_bytes4_t_address_payable_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_contract$_Base_$156_to_t_address(value) -> converted {
                converted := convert_t_contract$_Base_$156_to_t_uint160(value)
            }

            function convert_t_contract$_Base_$156_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
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

            function fun_WithdrawToken_155(vloc_token_127, vloc_amount_129) {

                let expr_133 := caller()
                let _20 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_134 := _20
                let expr_135 := eq(cleanup_t_address_payable(expr_133), cleanup_t_address_payable(expr_134))
                if expr_135 {
                    let _21 := vloc_token_127
                    let expr_136 := _21
                    let expr_138_address := expr_136
                    let expr_145 := 0xa9059cbb2ab09eb219583f4a59a5d0623ade346d962bcd4e46b11da047c9049b
                    let expr_146 := convert_t_bytes32_to_t_bytes4(expr_145)
                    let _22 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_147 := _22
                    let _23 := vloc_amount_129
                    let expr_148 := _23

                    let expr_149_mpos := allocateTemporaryMemory()
                    let _24 := add(expr_149_mpos, 0x20)

                    let _25 := abi_encode_tuple_t_bytes4_t_address_payable_t_uint256__to_t_bytes4_t_address_payable_t_uint256__fromStack(_24, expr_146, expr_147, expr_148)
                    mstore(expr_149_mpos, sub(_25, add(expr_149_mpos, 0x20)))
                    mstore(64, round_up_to_mul_of_32(_25))

                    let _26 := add(expr_149_mpos, 0x20)
                    let _27 := mload(expr_149_mpos)

                    let expr_150_component_1 := call(gas(), expr_138_address,  0,  _26, _27, 0, 0)

                    let expr_150_component_2_mpos := extract_returndata()

                }

            }

            function fun_WthdrawAllToCreator_87() {

                let expr_71 := caller()
                let _6 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_72 := _6
                let expr_73 := eq(cleanup_t_address_payable(expr_71), cleanup_t_address_payable(expr_72))
                if expr_73 {
                    let _7 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_74 := _7
                    let expr_76_address := convert_t_address_payable_to_t_address(expr_74)
                    let expr_79_address := address()
                    let expr_80 := convert_t_contract$_Base_$156_to_t_address(expr_79_address)
                    let expr_81 := balance(expr_80)

                    let _8 := 0
                    if iszero(expr_81) { _8 := 2300 }
                    let _9 := call(_8, expr_76_address, expr_81, 0, 0, 0, 0)

                    if iszero(_9) { revert_forward_1() }

                }

            }

            function fun_WthdrawToCreator_105(vloc_val_89) {

                let expr_93 := caller()
                let _10 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_94 := _10
                let expr_95 := eq(cleanup_t_address_payable(expr_93), cleanup_t_address_payable(expr_94))
                if expr_95 {
                    let _11 := read_from_storage_split_offset_0_t_address_payable(0x02)
                    let expr_96 := _11
                    let expr_98_address := convert_t_address_payable_to_t_address(expr_96)
                    let _12 := vloc_val_89
                    let expr_99 := _12

                    let _13 := 0
                    if iszero(expr_99) { _13 := 2300 }
                    let _14 := call(_13, expr_98_address, expr_99, 0, 0, 0, 0)

                    if iszero(_14) { revert_forward_1() }

                }

            }

            function fun_WthdrawTo_125(vloc_addr_107, vloc_val_109) {

                let expr_113 := caller()
                let _15 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_114 := _15
                let expr_115 := eq(cleanup_t_address_payable(expr_113), cleanup_t_address_payable(expr_114))
                if expr_115 {
                    let _16 := vloc_addr_107
                    let expr_116 := _16
                    let expr_118_address := convert_t_address_payable_to_t_address(expr_116)
                    let _17 := vloc_val_109
                    let expr_119 := _17

                    let _18 := 0
                    if iszero(expr_119) { _18 := 2300 }
                    let _19 := call(_18, expr_118_address, expr_119, 0, 0, 0, 0)

                    if iszero(_19) { revert_forward_1() }

                }

            }

            function fun_changeOwner_35(vloc_addr_23) {

                let expr_26_functionIdentifier := 21
                let expr_27 := fun_isOwner_21()
                if expr_27 {
                    let _1 := vloc_addr_23
                    let expr_29 := _1
                    update_storage_value_offset_0t_address_to_t_address(0x00, expr_29)
                    let expr_30 := expr_29
                }

            }

            function fun_confirmOwner_49() {

                let expr_39 := caller()
                let _4 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_40 := _4
                let expr_41 := eq(convert_t_address_payable_to_t_address(expr_39), cleanup_t_address(expr_40))
                if expr_41 {
                    let _5 := read_from_storage_split_offset_0_t_address(0x00)
                    let expr_43 := _5
                    update_storage_value_offset_0t_address_to_t_address(0x01, expr_43)
                    let expr_44 := expr_43
                }

            }

            function fun_isOwner_21() -> vloc__13 {
                let zero_value_for_type_t_bool_2 := zero_value_for_split_t_bool()
                vloc__13 := zero_value_for_type_t_bool_2

                let _3 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_15 := _3
                let expr_17 := caller()
                let expr_18 := eq(cleanup_t_address(expr_15), convert_t_address_payable_to_t_address(expr_17))
                vloc__13 := expr_18
                leave

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

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

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
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

