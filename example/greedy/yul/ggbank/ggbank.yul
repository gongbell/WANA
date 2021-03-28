/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "ggbank_398" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_ggbank_398()

        codecopy(0, dataoffset("ggbank_398_deployed"), datasize("ggbank_398_deployed"))

        return(0, datasize("ggbank_398_deployed"))

        function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
            exponent := cleanup_t_uint256(exponent)

            if gt(exponent, 77) { panic_error() }

            power := exp(10, exponent)
        }

        function checked_mul_t_uint256(x, y) -> product {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)

            // overflow, if x != 0 and y > (maxValue / x)
            if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

            product := mul(x, y)
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

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function constant_INITIAL_SUPPLY_140() -> ret {
            let expr_131 := 0x04a817c800
            let expr_132 := 0x0a
            let expr_135 := constant_decimals_126()
            let expr_136 := convert_t_uint8_to_t_uint256(expr_135)
            let _5 := convert_t_rational_10_by_1_to_t_uint256(expr_132)
            let expr_137 := checked_exp_t_rational_10_by_1_t_uint256(expr_136)
            let expr_138 := expr_137
            let expr_139 := checked_mul_t_uint256(convert_t_rational_20000000000_by_1_to_t_uint256(expr_131), expr_138)

            let _6 := expr_139

            ret := _6
        }

        function constant_decimals_126() -> ret {
            let expr_125 := 0x12
            let _4 := convert_t_rational_18_by_1_to_t_uint8(expr_125)

            ret := _4
        }

        function constructor_ERC20_115() {

        }

        function constructor_ggToken_167() {

            constructor_ERC20_115()

            let expr_151 := 0x01
            let _2 := 0x02
            let expr_147 := _2
            let expr_149 := caller()
            let _3 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_147,expr_149)
            update_storage_value_offset_0t_bool_to_t_bool(_3, expr_151)
            let expr_152 := expr_151
            let expr_155 := constant_INITIAL_SUPPLY_140()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_155)
            let expr_156 := expr_155
            let expr_162 := constant_INITIAL_SUPPLY_140()
            let _7 := 0x00
            let expr_158 := _7
            let expr_160 := caller()
            let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_158,expr_160)
            update_storage_value_offset_0t_uint256_to_t_uint256(_8, expr_162)
            let expr_163 := expr_162

        }

        function constructor_ggbank_398() {

            constructor_ggToken_167()

            let expr_197 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_197)
            update_storage_value_offset_0t_address_to_t_address(0x03, _1)
            let expr_198 := _1

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

        function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function convert_t_rational_20000000000_by_1_to_t_uint256(value) -> converted {
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

        function convert_t_uint8_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(slot , key) -> dataSlot {
            mstore(0, convert_t_address_payable_to_t_address(key))
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

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
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

        function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "ggbank_398_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x06fdde03
                {
                    // name()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_name_120()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x18160ddd
                {
                    // totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_totalSupply_66()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x27e235e3
                {
                    // balances(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_balances_56(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2ff2e9dc
                {
                    // INITIAL_SUPPLY()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_INITIAL_SUPPLY_140()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x313ce567
                {
                    // decimals()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_decimals_126()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3eaaf86b
                {
                    // _totalSupply()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun__totalSupply_58()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x47d6cd6b
                {
                    // _airdropAmount()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun__airdropAmount_129()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x70a08231
                {
                    // balanceOf(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_balanceOf_78(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_171()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x95d89b41
                {
                    // symbol()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_symbol_123()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa9059cbb
                {
                    // transfer(address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0 :=  fun_transfer_114(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xcd09039b
                {
                    // PayForFlag(string)

                    let param_0 :=  abi_decode_tuple_t_string_memory_ptr(4, calldatasize())
                    let ret_0 :=  fun_PayForFlag_397(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd25f82a0
                {
                    // getAirdrop()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getAirdrop_290()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf353ae48
                {
                    // goodluck()

                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_goodluck_373()
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

            function abi_decode_t_string_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_string_memory_ptr(length))
                mstore(array, length)
                let src := add(offset, 0x20)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
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

            function abi_decode_tuple_t_string_memory_ptr(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_address_payable(cleanup_t_address_payable(value)))
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
                let length := array_length_t_string_memory_ptr(value)
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
                copy_memory_to_memory(add(value, 0x20), pos, length)
                end := add(pos, round_up_to_mul_of_32(length))
            }

            function abi_encode_t_stringliteral_de72329802d2bd422f3e87e2aa43c9f0a5fc5ef028d7546606f61f86beaa5242_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 9)

                mstore(add(pos, 0), "Get flag!")

                end := add(pos, 32)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple_packed_t_address_payable__to_t_address_payable__nonPadded_inplace_fromStack(pos , value0) -> end {

                abi_encode_t_address_payable_to_t_address_payable_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 20)

                end := pos
            }

            function abi_encode_tuple_packed_t_uint256__to_t_uint256__nonPadded_inplace_fromStack(pos , value0) -> end {

                abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 32)

                end := pos
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

            }

            function abi_encode_tuple_t_string_memory_ptr_t_stringliteral_de72329802d2bd422f3e87e2aa43c9f0a5fc5ef028d7546606f61f86beaa5242__to_t_string_memory_ptr_t_string_memory_ptr__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 64)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

                mstore(add(headStart, 32), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_de72329802d2bd422f3e87e2aa43c9f0a5fc5ef028d7546606f61f86beaa5242_to_t_string_memory_ptr_fromStack( tail)

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint8__to_t_uint8__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

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

            function array_allocation_size_t_string_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                // round up
                size := and(add(length, 0x1f), not(0x1f))

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_string_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
                exponent := cleanup_t_uint256(exponent)

                if gt(exponent, 77) { panic_error() }

                power := exp(10, exponent)
            }

            function checked_mod_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function constant_INITIAL_SUPPLY_140() -> ret {
                let expr_131 := 0x04a817c800
                let expr_132 := 0x0a
                let expr_135 := constant_decimals_126()
                let expr_136 := convert_t_uint8_to_t_uint256(expr_135)
                let _3 := convert_t_rational_10_by_1_to_t_uint256(expr_132)
                let expr_137 := checked_exp_t_rational_10_by_1_t_uint256(expr_136)
                let expr_138 := expr_137
                let expr_139 := checked_mul_t_uint256(convert_t_rational_20000000000_by_1_to_t_uint256(expr_131), expr_138)

                let _4 := expr_139

                ret := _4
            }

            function constant__airdropAmount_129() -> ret {
                let expr_128 := 0x03e8
                let _5 := convert_t_rational_1000_by_1_to_t_uint256(expr_128)

                ret := _5
            }

            function constant_decimals_126() -> ret {
                let expr_125 := 0x12
                let _2 := convert_t_rational_18_by_1_to_t_uint8(expr_125)

                ret := _2
            }

            function constant_name_120() -> ret_mpos {
                let _1_mpos := convert_t_stringliteral_e89799872416a62940a671d2617fca8be0977d1f52289bc3bc94933421343c70_to_t_string_memory_ptr()

                ret_mpos := _1_mpos
            }

            function constant_symbol_123() -> ret_mpos {
                let _6_mpos := convert_t_stringliteral_e12a787be240346e45d09eaa9359fd7a7962820c2ded8f05a5a859bcdd303579_to_t_string_memory_ptr()

                ret_mpos := _6_mpos
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

            function convert_t_bytes32_to_t_uint256(value) -> converted {
                converted := convert_t_uint256_to_t_uint256(shift_right_0_unsigned(value))
            }

            function convert_t_rational_1000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_18_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_20000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_200000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_20000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_stringliteral_e12a787be240346e45d09eaa9359fd7a7962820c2ded8f05a5a859bcdd303579_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "666")

            }

            function convert_t_stringliteral_e89799872416a62940a671d2617fca8be0977d1f52289bc3bc94933421343c70_to_t_string_memory_ptr() -> converted {
                converted := allocateMemory(64)
                mstore(converted, 3)

                mstore(add(converted, 32), "777")

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

            function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function copy_memory_to_memory(src, dst, length) {
                let i := 0
                for { } lt(i, length) { i := add(i, 32) }
                {
                    mstore(add(dst, i), mload(add(src, i)))
                }
                if gt(i, length)
                {
                    // clear end
                    mstore(add(dst, length), 0)
                }
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_PayForFlag_397(vloc_b64email_375_mpos) -> vloc__380 {
                let zero_value_for_type_t_bool_74 := zero_value_for_split_t_bool()
                vloc__380 := zero_value_for_type_t_bool_74

                let _75 := 0x00
                let expr_383 := _75
                let expr_385 := caller()
                let _76 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_383,expr_385)
                let _77 := read_from_storage_split_offset_0_t_uint256(_76)
                let expr_386 := _77
                let expr_387 := 0x030d40
                let expr_388 := gt(cleanup_t_uint256(expr_386), convert_t_rational_200000_by_1_to_t_uint256(expr_387))
                require_helper(expr_388)
                let _78_mpos := vloc_b64email_375_mpos
                let expr_392_mpos := _78_mpos
                let _79 := 0xdb476abde9678304917d1d7094570a616c0d8a4ee4956de1b2ade393ddcdfaa9
                {
                    let _80 := mload(64)
                    let _81 := abi_encode_tuple_t_string_memory_ptr_t_stringliteral_de72329802d2bd422f3e87e2aa43c9f0a5fc5ef028d7546606f61f86beaa5242__to_t_string_memory_ptr_t_string_memory_ptr__fromStack(_80 , expr_392_mpos)
                    log1(_80, sub(_81, _80) , _79)
                }
            }

            function fun_add_48(vloc_a_26, vloc_b_28) -> vloc__31 {
                let zero_value_for_type_t_uint256_30 := zero_value_for_split_t_uint256()
                vloc__31 := zero_value_for_type_t_uint256_30

                let _31 := vloc_a_26
                let expr_35 := _31
                let _32 := vloc_b_28
                let expr_36 := _32
                let expr_37 := checked_add_t_uint256(expr_35, expr_36)

                let vloc_c_34 := expr_37
                let _33 := vloc_c_34
                let expr_40 := _33
                let _34 := vloc_a_26
                let expr_41 := _34
                let expr_42 := iszero(lt(cleanup_t_uint256(expr_40), cleanup_t_uint256(expr_41)))
                require_helper(expr_42)
                let _35 := vloc_c_34
                let expr_45 := _35
                vloc__31 := expr_45
                leave

            }

            function fun_balanceOf_78(vloc_owner_68) -> vloc__71 {
                let zero_value_for_type_t_uint256_36 := zero_value_for_split_t_uint256()
                vloc__71 := zero_value_for_type_t_uint256_36

                let _37 := 0x00
                let expr_73 := _37
                let _38 := vloc_owner_68
                let expr_74 := _38
                let _39 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_73,expr_74)
                let _40 := read_from_storage_split_offset_0_t_uint256(_39)
                let expr_75 := _40
                vloc__71 := expr_75
                leave

            }

            function fun_getAirdrop_290() -> vloc_success_260 {
                let zero_value_for_type_t_bool_41 := zero_value_for_split_t_bool()
                vloc_success_260 := zero_value_for_type_t_bool_41

                let _42 := 0x02
                let expr_262 := _42
                let expr_264 := caller()
                let _43 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_262,expr_264)
                let _44 := read_from_storage_split_offset_0_t_bool(_43)
                let expr_265 := _44
                let expr_266 := cleanup_t_bool(iszero(expr_265))
                if expr_266 {
                    let expr_271 := 0x01
                    let _45 := 0x02
                    let expr_267 := _45
                    let expr_269 := caller()
                    let _46 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(expr_267,expr_269)
                    update_storage_value_offset_0t_bool_to_t_bool(_46, expr_271)
                    let expr_272 := expr_271
                    let expr_278 := constant__airdropAmount_129()
                    let _47 := 0x00
                    let expr_274 := _47
                    let expr_276 := caller()
                    let _48 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_274,expr_276)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_48, expr_278)
                    let expr_279 := expr_278
                    let expr_282 := constant__airdropAmount_129()
                    let _49 := read_from_storage_split_offset_0_t_uint256(0x01)
                    expr_282 := checked_add_t_uint256(_49, expr_282)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_282)
                    let expr_283 := expr_282
                }
                let expr_287 := 0x01
                vloc_success_260 := expr_287
                leave

            }

            function fun_goodluck_373() -> vloc_success_295 {
                let zero_value_for_type_t_bool_50 := zero_value_for_split_t_bool()
                vloc_success_295 := zero_value_for_type_t_bool_50

                let _51 := 0x04
                let expr_298 := _51
                let expr_300 := number()
                let _52 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_298,expr_300)
                let _53 := read_from_storage_split_offset_0_t_bool(_52)
                let expr_301 := _53
                let expr_302 := cleanup_t_bool(iszero(expr_301))
                require_helper(expr_302)
                let _54 := 0x00
                let expr_306 := _54
                let expr_308 := caller()
                let _55 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_306,expr_308)
                let _56 := read_from_storage_split_offset_0_t_uint256(_55)
                let expr_309 := _56
                let expr_310 := 0x64
                let expr_311 := iszero(lt(cleanup_t_uint256(expr_309), convert_t_rational_100_by_1_to_t_uint256(expr_310)))
                require_helper(expr_311)
                let expr_318 := 0x64
                let _57 := convert_t_rational_100_by_1_to_t_uint256(expr_318)
                let _58 := 0x00
                let expr_314 := _58
                let expr_316 := caller()
                let _59 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_314,expr_316)
                let _60 := read_from_storage_split_offset_0_t_uint256(_59)
                _57 := checked_sub_t_uint256(_60, _57)
                update_storage_value_offset_0t_uint256_to_t_uint256(_59, _57)
                let expr_319 := _57
                let expr_329 := number()

                let expr_330_mpos := allocateTemporaryMemory()
                let _61 := add(expr_330_mpos, 0x20)

                let _62 := abi_encode_tuple_packed_t_uint256__to_t_uint256__nonPadded_inplace_fromStack(_61, expr_329)
                mstore(expr_330_mpos, sub(_62, add(expr_330_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_62))
                let expr_331 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_330_mpos), array_length_t_bytes_memory_ptr(expr_330_mpos))
                let expr_332 := convert_t_bytes32_to_t_uint256(expr_331)
                let expr_333 := 0x64
                let expr_334 := checked_mod_t_uint256(expr_332, convert_t_rational_100_by_1_to_t_uint256(expr_333))

                let vloc_random_322 := expr_334
                let expr_342 := caller()

                let expr_343_mpos := allocateTemporaryMemory()
                let _63 := add(expr_343_mpos, 0x20)

                let _64 := abi_encode_tuple_packed_t_address_payable__to_t_address_payable__nonPadded_inplace_fromStack(_63, expr_342)
                mstore(expr_343_mpos, sub(_64, add(expr_343_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_64))
                let expr_344 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_343_mpos), array_length_t_bytes_memory_ptr(expr_343_mpos))
                let expr_345 := convert_t_bytes32_to_t_uint256(expr_344)
                let expr_346 := 0x64
                let expr_347 := checked_mod_t_uint256(expr_345, convert_t_rational_100_by_1_to_t_uint256(expr_346))

                let _65 := vloc_random_322
                let expr_348 := _65
                let expr_349 := eq(cleanup_t_uint256(expr_347), cleanup_t_uint256(expr_348))
                if expr_349 {
                    let expr_354 := 0x4e20
                    let _66 := convert_t_rational_20000_by_1_to_t_uint256(expr_354)
                    let _67 := 0x00
                    let expr_350 := _67
                    let expr_352 := caller()
                    let _68 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_350,expr_352)
                    let _69 := read_from_storage_split_offset_0_t_uint256(_68)
                    _66 := checked_add_t_uint256(_69, _66)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_68, _66)
                    let expr_355 := _66
                    let expr_358 := 0x4e20
                    let _70 := convert_t_rational_20000_by_1_to_t_uint256(expr_358)
                    let _71 := read_from_storage_split_offset_0_t_uint256(0x01)
                    _70 := checked_add_t_uint256(_71, _70)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _70)
                    let expr_359 := _70
                    let expr_365 := 0x01
                    let _72 := 0x04
                    let expr_361 := _72
                    let expr_363 := number()
                    let _73 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_361,expr_363)
                    update_storage_value_offset_0t_bool_to_t_bool(_73, expr_365)
                    let expr_366 := expr_365
                }
                let expr_370 := 0x01
                vloc_success_295 := expr_370
                leave

            }

            function fun_sub_24(vloc_a_2, vloc_b_4) -> vloc__7 {
                let zero_value_for_type_t_uint256_24 := zero_value_for_split_t_uint256()
                vloc__7 := zero_value_for_type_t_uint256_24

                let _25 := vloc_b_4
                let expr_10 := _25
                let _26 := vloc_a_2
                let expr_11 := _26
                let expr_12 := iszero(gt(cleanup_t_uint256(expr_10), cleanup_t_uint256(expr_11)))
                require_helper(expr_12)
                let _27 := vloc_a_2
                let expr_17 := _27
                let _28 := vloc_b_4
                let expr_18 := _28
                let expr_19 := checked_sub_t_uint256(expr_17, expr_18)

                let vloc_c_16 := expr_19
                let _29 := vloc_c_16
                let expr_21 := _29
                vloc__7 := expr_21
                leave

            }

            function fun_totalSupply_66() -> vloc__61 {
                let zero_value_for_type_t_uint256_7 := zero_value_for_split_t_uint256()
                vloc__61 := zero_value_for_type_t_uint256_7

                let _8 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_63 := _8
                vloc__61 := expr_63
                leave

            }

            function fun_transfer_114(vloc__to_80, vloc__value_82) -> vloc_success_85 {
                let zero_value_for_type_t_bool_9 := zero_value_for_split_t_bool()
                vloc_success_85 := zero_value_for_type_t_bool_9

                let _10 := 0x00
                let expr_91 := _10
                let expr_93 := caller()
                let _11 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_91,expr_93)
                let _12 := read_from_storage_split_offset_0_t_uint256(_11)
                let expr_94 := _12
                let _13 := vloc__value_82
                let expr_96 := _13
                let expr_97 := fun_sub_24(expr_94, expr_96)
                let _14 := 0x00
                let expr_87 := _14
                let expr_89 := caller()
                let _15 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_87,expr_89)
                update_storage_value_offset_0t_uint256_to_t_uint256(_15, expr_97)
                let expr_98 := expr_97
                let _16 := 0x00
                let expr_103 := _16
                let _17 := vloc__to_80
                let expr_104 := _17
                let _18 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_103,expr_104)
                let _19 := read_from_storage_split_offset_0_t_uint256(_18)
                let expr_105 := _19
                let _20 := vloc__value_82
                let expr_107 := _20
                let expr_108 := fun_add_48(expr_105, expr_107)
                let _21 := 0x00
                let expr_100 := _21
                let _22 := vloc__to_80
                let expr_101 := _22
                let _23 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_100,expr_101)
                update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_108)
                let expr_109 := expr_108
                let expr_111 := 0x01
                vloc_success_85 := expr_111
                leave

            }

            function getter_fun_INITIAL_SUPPLY_140() -> ret_0 {
                ret_0 := constant_INITIAL_SUPPLY_140()
            }

            function getter_fun__airdropAmount_129() -> ret_0 {
                ret_0 := constant__airdropAmount_129()
            }

            function getter_fun__totalSupply_58() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_balances_56(key_0) -> ret {

                let slot := 0
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_decimals_126() -> ret_0 {
                ret_0 := constant_decimals_126()
            }

            function getter_fun_name_120() -> ret_0 {
                ret_0 := constant_name_120()
            }

            function getter_fun_owner_171() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_symbol_123() -> ret_0 {
                ret_0 := constant_symbol_123()
            }

            function leftAlign_t_address_payable(value) -> aligned {
                aligned := leftAlign_t_uint160(value)
            }

            function leftAlign_t_uint160(value) -> aligned {
                aligned := shift_left_96(value)
            }

            function leftAlign_t_uint256(value) -> aligned {
                aligned := value
            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
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

            function mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_96(value) -> newValue {
                newValue :=

                shl(96, value)

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

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
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

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

