/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Payee_283" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Payee_283()

        codecopy(0, dataoffset("Payee_283_deployed"), datasize("Payee_283_deployed"))

        return(0, datasize("Payee_283_deployed"))

        function cleanup_from_storage_t_address_payable(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

        function constructor_Payee_283() {

            let expr_147 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x02, expr_147)
            let expr_148 := expr_147
            let expr_151 := 0x0aa87bee538000
            let _1 := convert_t_rational_3000000000000000_by_1_to_t_uint256(expr_151)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _1)
            let expr_152 := _1
            let expr_157 := 0x01
            let _2 := 0x03
            let expr_154 := _2
            let _3 := read_from_storage_split_offset_0_t_address_payable(0x02)
            let expr_155 := _3
            let _4 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_154,expr_155)
            update_storage_value_offset_0t_bool_to_t_bool(_4, expr_157)
            let expr_158 := expr_157
            let _5 := read_from_storage_split_offset_0_t_address_payable(0x01)
            let expr_162 := _5
            let expr_163_address := convert_t_address_payable_to_t_contract$_Storage_$113(expr_162)
            update_storage_value_offset_0t_contract$_Storage_$113_to_t_contract$_Storage_$113(0x04, expr_163_address)
            let expr_164_address := expr_163_address
            let expr_167 := 0x01
            update_storage_value_offset_20t_bool_to_t_bool(0x02, expr_167)
            let expr_168 := expr_167

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_address_payable_to_t_contract$_Storage_$113(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_Storage_$113(value)
        }

        function convert_t_bool_to_t_bool(value) -> converted {
            converted := cleanup_t_bool(value)
        }

        function convert_t_contract$_Storage_$113_to_t_contract$_Storage_$113(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_rational_3000000000000000_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_contract$_Storage_$113(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
            value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
        }

        function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(slot , key) -> dataSlot {
            mstore(0, convert_t_address_payable_to_t_address(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function prepare_store_t_contract$_Storage_$113(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
            value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_left_160(value) -> newValue {
            newValue :=

            shl(160, value)

        }

        function shift_right_0_unsigned(value) -> newValue {
            newValue :=

            shr(0, value)

        }

        function update_byte_slice_1_shift_0(value, toInsert) -> result {
            let mask := 255
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_byte_slice_1_shift_20(value, toInsert) -> result {
            let mask := 0xff0000000000000000000000000000000000000000
            toInsert := shift_left_160(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_0t_contract$_Storage_$113_to_t_contract$_Storage_$113(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_Storage_$113_to_t_contract$_Storage_$113(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_Storage_$113(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

    }
    object "Payee_283_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3e4a89d1
                {
                    // adminStatus(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_adminStatus_125(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4d853ee5
                {
                    // founder()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_founder_119()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x59b910d6
                {
                    // setStorageAddress(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address_payable(4, calldatasize())
                    fun_setStorageAddress_197(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5ed7ca5b
                {
                    // halt()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_halt_206()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x63a846f8
                {
                    // admin(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_admin_142(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x85aa92a7
                {
                    // storageAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_storageAddress_117()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x91b7f5ed
                {
                    // setPrice(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_setPrice_181(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x951b26a3
                {
                    // changeable()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_changeable_121()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa035b1fe
                {
                    // price()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_price_115()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_282()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xc4076876
                {
                    // pay(address,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    fun_pay_272(param_0, param_1)
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

            function abi_decode_tuple__fromMemory(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_address_payable(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address_payable(add(headStart, offset), dataEnd)
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

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, 0)

                end := add(pos, 0)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos ) -> end {

                pos := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack( pos)

                end := pos
            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

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

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function assert_helper(condition) {
                if iszero(condition) { panic_error() }
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

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_contract$_Storage_$113(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_address_payable_to_t_contract$_Storage_$113(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_Storage_$113(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_contract$_Storage_$113_to_t_address(value) -> converted {
                converted := convert_t_contract$_Storage_$113_to_t_uint160(value)
            }

            function convert_t_contract$_Storage_$113_to_t_contract$_Storage_$113(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_Storage_$113_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_contract$_Storage_$113(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
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

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_Storage_$113(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_Storage_$113(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_20t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_160_unsigned(slot_value))
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

            function fun_admin_142(vloc_addr_129) {

                let _1 := 0x03
                let expr_135 := _1
                let _2 := vloc_addr_129
                let expr_136 := _2
                let _3 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_135,expr_136)
                let _4 := read_from_storage_split_offset_0_t_bool(_3)
                let expr_137 := _4
                let expr_138 := cleanup_t_bool(iszero(expr_137))
                let _5 := 0x03
                let expr_132 := _5
                let _6 := vloc_addr_129
                let expr_133 := _6
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_132,expr_133)
                update_storage_value_offset_0t_bool_to_t_bool(_7, expr_138)
                let expr_139 := expr_138

            }

            function fun_func_282() {

                let expr_275_functionIdentifier := 272
                let expr_277 := caller()
                let expr_278 := 0x01
                let _32 := convert_t_address_payable_to_t_address(expr_277)
                let _33 := convert_t_rational_1_by_1_to_t_uint256(expr_278)
                fun_pay_272(_32, _33)

            }

            function fun_halt_206() {

                let _11 := read_from_storage_split_offset_20_t_bool(0x02)
                let expr_201 := _11
                let expr_202 := cleanup_t_bool(iszero(expr_201))
                update_storage_value_offset_20t_bool_to_t_bool(0x02, expr_202)
                let expr_203 := expr_202

            }

            function fun_pay_272(vloc__addr_208, vloc_count_210) {

                let _12 := read_from_storage_split_offset_20_t_bool(0x02)
                let expr_214 := _12
                let expr_215 := 0x01
                let expr_216 := eq(cleanup_t_bool(expr_214), cleanup_t_bool(expr_215))
                assert_helper(expr_216)
                let expr_221 := callvalue()
                let _13 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_222 := _13
                let _14 := vloc_count_210
                let expr_223 := _14
                let expr_224 := checked_mul_t_uint256(expr_222, expr_223)

                let expr_225 := iszero(lt(cleanup_t_uint256(expr_221), cleanup_t_uint256(expr_224)))
                assert_helper(expr_225)
                let _15 := read_from_storage_split_offset_0_t_address_payable(0x02)
                let expr_230 := _15
                let expr_231_address := convert_t_address_payable_to_t_address(expr_230)
                let _16 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_232 := _16
                let _17 := vloc_count_210
                let expr_233 := _17
                let expr_234 := checked_mul_t_uint256(expr_232, expr_233)

                let expr_235_address := expr_231_address
                let expr_235_value := expr_234

                let _18 := mload(64)
                let _19 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_18  ), _18)

                let expr_237_component_1 := call(gas(), expr_235_address,  expr_235_value,  _18, _19, 0, 0)

                let expr_237_component_2_mpos := extract_returndata()

                let vloc_success1_229 := expr_237_component_1
                let expr_242 := caller()
                let expr_243_address := convert_t_address_payable_to_t_address(expr_242)
                let expr_245 := callvalue()
                let _20 := read_from_storage_split_offset_0_t_uint256(0x00)
                let expr_246 := _20
                let _21 := vloc_count_210
                let expr_247 := _21
                let expr_248 := checked_mul_t_uint256(expr_246, expr_247)

                let expr_249 := checked_sub_t_uint256(expr_245, expr_248)

                let expr_250_address := expr_243_address
                let expr_250_value := expr_249

                let _22 := mload(64)
                let _23 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_22  ), _22)

                let expr_252_component_1 := call(gas(), expr_250_address,  expr_250_value,  _22, _23, 0, 0)

                let expr_252_component_2_mpos := extract_returndata()

                let vloc_success2_240 := expr_252_component_1
                let _24 := vloc_success1_229
                let expr_254 := _24
                let expr_255 := cleanup_t_bool(iszero(expr_254))
                let expr_258 := expr_255
                if iszero(expr_258) {
                    let _25 := vloc_success2_240
                    let expr_256 := _25
                    let expr_257 := cleanup_t_bool(iszero(expr_256))
                    expr_258 := expr_257
                }
                if expr_258 {
                    revert(0, 0)
                }
                let _26_address := read_from_storage_split_offset_0_t_contract$_Storage_$113(0x04)
                let expr_264_address := _26_address
                let expr_266_address := convert_t_contract$_Storage_$113_to_t_address(expr_264_address)
                let expr_266_functionSelector := 0xa2d83b5e
                let _27 := vloc__addr_208
                let expr_267 := _27
                let _28 := vloc_count_210
                let expr_268 := _28

                if iszero(extcodesize(expr_266_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _29 := mload(64)
                mstore(_29, shift_left_224(expr_266_functionSelector))
                let _30 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(add(_29, 4) , expr_267, expr_268)

                let _31 := call(gas(), expr_266_address,  0,  _29, sub(_30, _29), _29, 0)

                if iszero(_31) { revert_forward_1() }

                if _31 {

                    // update freeMemoryPointer according to dynamic return size
                    mstore(64, add(_29, round_up_to_mul_of_32(returndatasize())))

                    // decode return parameters from external try-call into retVars
                    abi_decode_tuple__fromMemory(_29, add(_29, returndatasize()))
                }

            }

            function fun_setPrice_181(vloc__price_173) {

                let _8 := vloc__price_173
                let expr_177 := _8
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_177)
                let expr_178 := expr_177

            }

            function fun_setStorageAddress_197(vloc__addr_183) {

                let _9 := vloc__addr_183
                let expr_187 := _9
                update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_187)
                let expr_188 := expr_187
                let _10 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_192 := _10
                let expr_193_address := convert_t_address_payable_to_t_contract$_Storage_$113(expr_192)
                update_storage_value_offset_0t_contract$_Storage_$113_to_t_contract$_Storage_$113(0x04, expr_193_address)
                let expr_194_address := expr_193_address

            }

            function getter_fun_adminStatus_125(key_0) -> ret {

                let slot := 3
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_changeable_121() -> ret {

                let slot := 2
                let offset := 20

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_founder_119() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_price_115() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_storageAddress_117() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address_payable(value) -> ret {
                ret := value
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_contract$_Storage_$113(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_contract$_Storage_$113(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_Storage_$113(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function read_from_storage_split_offset_20_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_20t_bool(sload(slot))

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

            function shift_left_160(value) -> newValue {
                newValue :=

                shl(160, value)

            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_1_shift_20(value, toInsert) -> result {
                let mask := 0xff0000000000000000000000000000000000000000
                toInsert := shift_left_160(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
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

            function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
                let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
            }

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_0t_contract$_Storage_$113_to_t_contract$_Storage_$113(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_Storage_$113_to_t_contract$_Storage_$113(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_Storage_$113(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_offset_20t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_bool(convertedValue_0)))
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

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

