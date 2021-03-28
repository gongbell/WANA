/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "MillionEther_963" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_MillionEther_963()

        codecopy(0, dataoffset("MillionEther_963_deployed"), datasize("MillionEther_963_deployed"))

        return(0, datasize("MillionEther_963_deployed"))

        function cleanup_from_storage_t_address(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_from_storage_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_bool(value) -> cleaned {
            cleaned := iszero(iszero(value))
        }

        function cleanup_t_uint16(value) -> cleaned {
            cleaned := and(value, 0xffff)
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

        function cleanup_t_uint8(value) -> cleaned {
            cleaned := and(value, 0xff)
        }

        function constructor_MillionEther_963() {

            let expr_4 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x01, expr_4)
            let expr_32 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint16(0x04, expr_32)
            let expr_35 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x05, expr_35)
            let expr_51 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x7791, expr_51)
            let expr_73 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x7793, expr_73)
            let expr_78 := 0x00
            update_storage_value_offset_20t_rational_0_by_1_to_t_uint8(0x7794, expr_78)
            let expr_81 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x7795, expr_81)
            let expr_84 := 0x00
            update_storage_value_offset_0t_bool_to_t_bool(0x7796, expr_84)
            let expr_87 := 0x00
            update_storage_value_offset_1t_bool_to_t_bool(0x7796, expr_87)
            let expr_90 := 0x0e10
            update_storage_value_offset_2t_rational_3600_by_1_to_t_uint32(0x7796, expr_90)
            let expr_93 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x7797, expr_93)

            let expr_141 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_141)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_142 := _1
            let _2 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_148 := _2
            let _3 := 0x02
            let expr_144 := _3
            let _4 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_145 := _4
            let _5 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_144,expr_145)
            let _6_slot := _5
            let expr_146_slot := _6_slot
            let _7 := add(expr_146_slot, 0)
            update_storage_value_offset_0t_address_to_t_address(_7, expr_148)
            let expr_149 := expr_148
            let expr_155 := 0x00
            let _8 := convert_t_rational_0_by_1_to_t_uint8(expr_155)
            let _9 := 0x02
            let expr_151 := _9
            let _10 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_152 := _10
            let _11 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_151,expr_152)
            let _12_slot := _11
            let expr_153_slot := _12_slot
            let _13 := add(expr_153_slot, 0)
            update_storage_value_offset_20t_uint8_to_t_uint8(_13, _8)
            let expr_156 := _8
            let expr_165 := timestamp()
            let expr_166 := convert_t_uint256_to_t_uint32(expr_165)
            let _14 := 0x02
            let expr_158 := _14
            let _15 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_159 := _15
            let _16 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_158,expr_159)
            let _17_slot := _16
            let expr_160_slot := _17_slot
            let _18 := add(expr_160_slot, 2)
            update_storage_value_offset_0t_uint32_to_t_uint32(_18, expr_166)
            let expr_167 := expr_166
            let expr_173 := 0x00
            let _19 := convert_t_rational_0_by_1_to_t_uint256(expr_173)
            let _20 := 0x02
            let expr_169 := _20
            let _21 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_170 := _21
            let _22 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_169,expr_170)
            let _23_slot := _22
            let expr_171_slot := _23_slot
            let _24 := add(expr_171_slot, 3)
            update_storage_value_offset_0t_uint256_to_t_uint256(_24, _19)
            let expr_174 := _19
            let _25 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_179 := _25
            let _26 := 0x03
            let expr_176 := _26
            let expr_177 := 0x00
            let _27 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_rational_0_by_1(expr_176,expr_177)
            update_storage_value_offset_0t_address_to_t_address(_27, expr_179)
            let expr_180 := expr_179
            let _28 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_185 := _28
            let _29 := 0x03
            let expr_182 := _29
            let _30 := read_from_storage_split_offset_0_t_uint256(0x01)
            let expr_183 := _30
            let _31 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_182,expr_183)
            update_storage_value_offset_0t_address_to_t_address(_31, expr_185)
            let expr_186 := expr_185

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

        function convert_t_rational_0_by_1_to_t_uint16(value) -> converted {
            converted := cleanup_t_uint16(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_0_by_1_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function convert_t_rational_3600_by_1_to_t_uint32(value) -> converted {
            converted := cleanup_t_uint32(value)
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

        function convert_t_uint256_to_t_uint32(value) -> converted {
            converted := cleanup_t_uint32(value)
        }

        function convert_t_uint32_to_t_uint32(value) -> converted {
            converted := cleanup_t_uint32(value)
        }

        function convert_t_uint8_to_t_uint8(value) -> converted {
            converted := cleanup_t_uint8(value)
        }

        function extract_from_storage_value_offset_0t_address(slot_value) -> value {
            value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
        }

        function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
            value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
        }

        function mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(slot , key) -> dataSlot {
            mstore(0, convert_t_address_to_t_address(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_rational_0_by_1(slot , key) -> dataSlot {
            mstore(0, convert_t_rational_0_by_1_to_t_uint256(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(slot , key) -> dataSlot {
            mstore(0, convert_t_uint256_to_t_uint256(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function prepare_store_t_bool(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint16(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint32(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint8(value) -> ret {
            ret := value
        }

        function read_from_storage_split_offset_0_t_address(slot) -> value {
            value := extract_from_storage_value_offset_0t_address(sload(slot))

        }

        function read_from_storage_split_offset_0_t_uint256(slot) -> value {
            value := extract_from_storage_value_offset_0t_uint256(sload(slot))

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_left_16(value) -> newValue {
            newValue :=

            shl(16, value)

        }

        function shift_left_160(value) -> newValue {
            newValue :=

            shl(160, value)

        }

        function shift_left_8(value) -> newValue {
            newValue :=

            shl(8, value)

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

        function update_byte_slice_1_shift_1(value, toInsert) -> result {
            let mask := 65280
            toInsert := shift_left_8(toInsert)
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

        function update_byte_slice_2_shift_0(value, toInsert) -> result {
            let mask := 65535
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

        function update_byte_slice_4_shift_0(value, toInsert) -> result {
            let mask := 0xffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_byte_slice_4_shift_2(value, toInsert) -> result {
            let mask := 0xffffffff0000
            toInsert := shift_left_16(toInsert)
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

        function update_storage_value_offset_0t_rational_0_by_1_to_t_uint16(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint16(value_0)
            sstore(slot, update_byte_slice_2_shift_0(sload(slot), prepare_store_t_uint16(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint32_to_t_uint32(slot, value_0) {
            let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
            sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_uint32(convertedValue_0)))
        }

        function update_storage_value_offset_1t_bool_to_t_bool(slot, value_0) {
            let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
            sstore(slot, update_byte_slice_1_shift_1(sload(slot), prepare_store_t_bool(convertedValue_0)))
        }

        function update_storage_value_offset_20t_rational_0_by_1_to_t_uint8(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint8(value_0)
            sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_uint8(convertedValue_0)))
        }

        function update_storage_value_offset_20t_uint8_to_t_uint8(slot, value_0) {
            let convertedValue_0 := convert_t_uint8_to_t_uint8(value_0)
            sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_uint8(convertedValue_0)))
        }

        function update_storage_value_offset_2t_rational_3600_by_1_to_t_uint32(slot, value_0) {
            let convertedValue_0 := convert_t_rational_3600_by_1_to_t_uint32(value_0)
            sstore(slot, update_byte_slice_4_shift_2(sload(slot), prepare_store_t_uint32(convertedValue_0)))
        }

    }
    object "MillionEther_963_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e6b0afc
                {
                    // adminContractSettings(uint32,address,uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_uint32t_addresst_uint256(4, calldatasize())
                    fun_adminContractSettings_893(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x16bfe25c
                {
                    // emergencyRefund()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_emergencyRefund_962()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4abfbbe3
                {
                    // getBlockInfo(uint8,uint8)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint8t_uint8(4, calldatasize())
                    let ret_0, ret_1, ret_2 :=  fun_getBlockInfo_712(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6386c1c7
                {
                    // getUserInfo(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7 :=  fun_getUserInfo_646(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_t_uint8_t_uint256_t_uint32_t_bool_t_uint256_t_bool_t_uint256__to_t_address_t_uint8_t_uint256_t_uint32_t_bool_t_uint256_t_bool_t_uint256__fromStack(memPos , ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6, ret_7)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x74774370
                {
                    // getUserAddressByID(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getUserAddressByID_658(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7daa10ce
                {
                    // getMyInfo()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0, ret_1 :=  fun_getMyInfo_678()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_uint32__to_t_uint256_t_uint32__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x80c81c16
                {
                    // getStateInfo()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6 :=  fun_getStateInfo_781()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_uint16_t_uint256_t_uint256_t_uint256_t_uint256_t_uint32__to_t_uint256_t_uint16_t_uint256_t_uint256_t_uint256_t_uint256_t_uint32__fromStack(memPos , ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x853828b6
                {
                    // withdrawAll()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_withdrawAll_568()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8fa9e55c
                {
                    // signIn(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  fun_signIn_299(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x95f22405
                {
                    // getImageInfo(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6 :=  fun_getImageInfo_754(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8_t_uint8_t_uint8_t_uint8_t_bytes32_t_bytes32_t_bytes32__to_t_uint8_t_uint8_t_uint8_t_uint8_t_bytes32_t_bytes32_t_bytes32__fromStack(memPos , ret_0, ret_1, ret_2, ret_3, ret_4, ret_5, ret_6)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x99b8a3f0
                {
                    // charityBalance()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_charityBalance_74()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xafcf2fc4
                {
                    // charityAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_charityAddress_76()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe9b0c0e1
                {
                    // adminContractSecurity(address,bool,bool,bool)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3 :=  abi_decode_tuple_t_addresst_boolt_boolt_bool(4, calldatasize())
                    fun_adminContractSecurity_835(param_0, param_1, param_2, param_3)
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

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_t_uint32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint32(value)
            }

            function abi_decode_t_uint8(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint8(value)
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

            function abi_decode_tuple_t_addresst_boolt_boolt_bool(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 96
                    value3 := abi_decode_t_bool(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint32t_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint32(add(headStart, offset), dataEnd)
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

            function abi_decode_tuple_t_uint8t_uint8(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_address_payable_to_t_address(value))
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_uint16_to_t_uint16_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint16(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint32_to_t_uint32_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint32(value))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256__fromStack(headStart , value0, value1, value2) -> tail {
                tail := add(headStart, 96)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

            }

            function abi_encode_tuple_t_address_t_uint8_t_uint256_t_uint32_t_bool_t_uint256_t_bool_t_uint256__to_t_address_t_uint8_t_uint256_t_uint32_t_bool_t_uint256_t_bool_t_uint256__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7) -> tail {
                tail := add(headStart, 256)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint32_to_t_uint32_fromStack(value3,  add(headStart, 96))

                abi_encode_t_bool_to_t_bool_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_bool_to_t_bool_fromStack(value6,  add(headStart, 192))

                abi_encode_t_uint256_to_t_uint256_fromStack(value7,  add(headStart, 224))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256_t_address_payable_t_address_t_uint32__to_t_uint256_t_address_t_address_t_uint32__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_payable_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_address_to_t_address_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint32_to_t_uint32_fromStack(value3,  add(headStart, 96))

            }

            function abi_encode_tuple_t_uint256_t_uint16_t_uint256_t_uint256_t_uint256_t_uint256_t_uint32__to_t_uint256_t_uint16_t_uint256_t_uint256_t_uint256_t_uint256_t_uint32__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint16_to_t_uint16_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint32_to_t_uint32_fromStack(value6,  add(headStart, 192))

            }

            function abi_encode_tuple_t_uint256_t_uint32__to_t_uint256_t_uint32__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint32_to_t_uint32_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_uint8_t_uint8_t_uint8_t_uint8_t_bytes32_t_bytes32_t_bytes32__to_t_uint8_t_uint8_t_uint8_t_uint8_t_bytes32_t_bytes32_t_bytes32__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6) -> tail {
                tail := add(headStart, 224)

                abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint8_to_t_uint8_fromStack(value2,  add(headStart, 64))

                abi_encode_t_uint8_to_t_uint8_fromStack(value3,  add(headStart, 96))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value4,  add(headStart, 128))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value5,  add(headStart, 160))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value6,  add(headStart, 192))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocate_memory_struct_t_struct$_Image_$67_memory_ptr() -> memPtr {
                memPtr := allocateMemory(224)
            }

            function array_dataslot_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(ptr) -> data {
                data := ptr

            }

            function array_dataslot_t_array$_t_struct$_Block_$43_storage_$101_storage(ptr) -> data {
                data := ptr

            }

            function array_length_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(value) -> length {

                length := 0x65

            }

            function array_length_t_array$_t_struct$_Block_$43_storage_$101_storage(value) -> length {

                length := 0x65

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_add_t_uint8(x, y) -> sum {
                x := cleanup_t_uint8(x)
                y := cleanup_t_uint8(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xff, y)) { panic_error() }

                sum := add(x, y)
            }

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }

                r := div(x, y)
            }

            function checked_exp_t_rational_2_by_1_t_uint256(exponent) -> power {
                exponent := cleanup_t_uint256(exponent)

                if gt(exponent, 255) { panic_error() }

                power := exp(2, exponent)
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

            function cleanup_from_storage_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_from_storage_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_from_storage_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function cleanup_from_storage_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
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

            function convert_t_contract$_MillionEther_$963_to_t_address(value) -> converted {
                converted := convert_t_contract$_MillionEther_$963_to_t_uint160(value)
            }

            function convert_t_contract$_MillionEther_$963_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_address_payable(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_0_by_1_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_struct$_Image_$67_storage_to_t_struct$_Image_$67_memory_ptr(value) -> converted {

                converted := read_from_storage_reference_type_t_struct$_Image_$67_memory_ptr(value)

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

            function convert_t_uint256_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            function convert_t_uint256_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint32_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            function convert_t_uint32_to_t_uint32(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint8_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bytes32(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint8(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint16(slot_value) -> value {
                value := cleanup_from_storage_t_uint16(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint32(slot_value) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_20t_uint8(slot_value) -> value {
                value := cleanup_from_storage_t_uint8(shift_right_160_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_2t_uint32(slot_value) -> value {
                value := cleanup_from_storage_t_uint32(shift_right_16_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_4t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_32_unsigned(slot_value))
            }

            function fun_adminContractSecurity_835(vloc_violator_783, vloc_banViolator_785, vloc_pauseContract_787, vloc_refundInvestments_789) {

                let _228 := vloc_violator_783
                let expr_792 := _228
                let expr_795 := 0x00
                let expr_796 := convert_t_rational_0_by_1_to_t_address_payable(expr_795)
                let expr_797 := iszero(eq(cleanup_t_address(expr_792), convert_t_address_payable_to_t_address(expr_796)))
                if expr_797 {
                    let _229 := vloc_banViolator_785
                    let expr_802 := _229
                    let _230 := 0x02
                    let expr_798 := _230
                    let _231 := vloc_violator_783
                    let expr_799 := _231
                    let _232 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_798,expr_799)
                    let _233_slot := _232
                    let expr_800_slot := _233_slot
                    let _234 := add(expr_800_slot, 2)
                    update_storage_value_offset_4t_bool_to_t_bool(_234, expr_802)
                    let expr_803 := expr_802
                }
                let _235 := vloc_pauseContract_787
                let expr_808 := _235
                update_storage_value_offset_0t_bool_to_t_bool(0x7796, expr_808)
                let expr_809 := expr_808
                let _236 := vloc_refundInvestments_789
                let expr_811 := _236
                if expr_811 {
                    let _237 := vloc_refundInvestments_789
                    let expr_813 := _237
                    update_storage_value_offset_1t_bool_to_t_bool(0x7796, expr_813)
                    let expr_814 := expr_813
                    let expr_821_address := address()
                    let expr_822 := convert_t_contract$_MillionEther_$963_to_t_address(expr_821_address)
                    let expr_823 := balance(expr_822)
                    let expr_824 := 0x64
                    let expr_825 := checked_mul_t_uint256(expr_823, convert_t_rational_100_by_1_to_t_uint256(expr_824))

                    let expr_826 := expr_825
                    let _238 := read_from_storage_split_offset_0_t_uint256(0x7795)
                    let expr_827 := _238
                    let expr_828 := checked_div_t_uint256(expr_826, expr_827)

                    let expr_829 := convert_t_uint256_to_t_uint8(expr_828)
                    update_storage_value_offset_20t_uint8_to_t_uint8(0x7794, expr_829)
                    let expr_830 := expr_829
                }

            }

            function fun_adminContractSettings_893(vloc_newDelayInSeconds_837, vloc_newCharityAddress_839, vloc_newImagePlacementPriceInWei_841) {

                let _239 := vloc_newDelayInSeconds_837
                let expr_844 := _239
                let expr_845 := 0x00
                let expr_846 := gt(cleanup_t_uint32(expr_844), convert_t_rational_0_by_1_to_t_uint32(expr_845))
                if expr_846 {
                    let _240 := vloc_newDelayInSeconds_837
                    let expr_848 := _240
                    update_storage_value_offset_2t_uint32_to_t_uint32(0x7796, expr_848)
                    let expr_849 := expr_848
                }
                let _241 := vloc_newCharityAddress_839
                let expr_852 := _241
                let expr_855 := 0x00
                let expr_856 := convert_t_rational_0_by_1_to_t_address_payable(expr_855)
                let expr_857 := iszero(eq(cleanup_t_address(expr_852), convert_t_address_payable_to_t_address(expr_856)))
                if expr_857 {
                    let _242 := 0x02
                    let expr_858 := _242
                    let _243 := vloc_newCharityAddress_839
                    let expr_859 := _243
                    let _244 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_858,expr_859)
                    let _245_slot := _244
                    let expr_860_slot := _245_slot
                    let _246 := add(expr_860_slot, 0)
                    let _247 := read_from_storage_split_offset_0_t_address(_246)
                    let expr_861 := _247
                    let expr_864 := 0x00
                    let expr_865 := convert_t_rational_0_by_1_to_t_address_payable(expr_864)
                    let expr_866 := eq(cleanup_t_address(expr_861), convert_t_address_payable_to_t_address(expr_865))
                    if expr_866 {
                        revert(0, 0)
                    }
                    let _248 := vloc_newCharityAddress_839
                    let expr_872 := _248
                    update_storage_value_offset_0t_address_to_t_address(0x7794, expr_872)
                    let expr_873 := expr_872
                    let _249 := read_from_storage_split_offset_0_t_uint256(0x7793)
                    let expr_879 := _249
                    let _250 := 0x02
                    let expr_875 := _250
                    let _251 := read_from_storage_split_offset_0_t_address(0x7794)
                    let expr_876 := _251
                    let _252 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_875,expr_876)
                    let _253_slot := _252
                    let expr_877_slot := _253_slot
                    let _254 := add(expr_877_slot, 1)
                    let _255 := read_from_storage_split_offset_0_t_uint256(_254)
                    expr_879 := checked_add_t_uint256(_255, expr_879)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_254, expr_879)
                    let expr_880 := expr_879
                    let expr_883 := 0x00
                    let _256 := convert_t_rational_0_by_1_to_t_uint256(expr_883)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x7793, _256)
                    let expr_884 := _256
                }
                let _257 := vloc_newImagePlacementPriceInWei_841
                let expr_889 := _257
                update_storage_value_offset_0t_uint256_to_t_uint256(0x7797, expr_889)
                let expr_890 := expr_889

            }

            function fun_emergencyRefund_962() {

                let _258 := 0x02
                let expr_896 := _258
                let expr_898 := caller()
                let _259 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_896,expr_898)
                let _260_slot := _259
                let expr_899_slot := _260_slot
                let _261 := add(expr_899_slot, 4)
                let _262 := read_from_storage_split_offset_0_t_bool(_261)
                let expr_900 := _262
                let expr_901 := cleanup_t_bool(iszero(expr_900))
                if expr_901 {
                    let _263 := 0x02
                    let expr_904 := _263
                    let expr_906 := caller()
                    let _264 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_904,expr_906)
                    let _265_slot := _264
                    let expr_907_slot := _265_slot
                    let _266 := add(expr_907_slot, 5)
                    let _267 := read_from_storage_split_offset_0_t_uint256(_266)
                    let expr_908 := _267
                    let vloc_totalInvested_903 := expr_908
                    let _268 := vloc_totalInvested_903
                    let expr_912 := _268
                    let _269 := read_from_storage_split_offset_20_t_uint8(0x7794)
                    let expr_913 := _269
                    let expr_914 := checked_mul_t_uint256(expr_912, convert_t_uint8_to_t_uint256(expr_913))

                    let expr_915 := expr_914
                    let expr_916 := 0x64
                    let expr_917 := checked_div_t_uint256(expr_915, convert_t_rational_100_by_1_to_t_uint256(expr_916))

                    let vloc_availableForRefund_911 := expr_917
                    let _270 := vloc_availableForRefund_911
                    let expr_924 := _270
                    let _271 := 0x02
                    let expr_919 := _271
                    let expr_921 := caller()
                    let _272 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_919,expr_921)
                    let _273_slot := _272
                    let expr_922_slot := _273_slot
                    let _274 := add(expr_922_slot, 5)
                    let _275 := read_from_storage_split_offset_0_t_uint256(_274)
                    expr_924 := checked_sub_t_uint256(_275, expr_924)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_274, expr_924)
                    let expr_925 := expr_924
                    let expr_932 := 0x01
                    let _276 := 0x02
                    let expr_927 := _276
                    let expr_929 := caller()
                    let _277 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_927,expr_929)
                    let _278_slot := _277
                    let expr_930_slot := _278_slot
                    let _279 := add(expr_930_slot, 4)
                    update_storage_value_offset_0t_bool_to_t_bool(_279, expr_932)
                    let expr_933 := expr_932
                    let expr_936 := caller()
                    let expr_937_address := convert_t_address_payable_to_t_address(expr_936)
                    let _280 := vloc_availableForRefund_911
                    let expr_938 := _280

                    let _281 := 0
                    if iszero(expr_938) { _281 := 2300 }
                    let expr_939 := call(_281, expr_937_address, expr_938, 0, 0, 0, 0)

                    let expr_940 := cleanup_t_bool(iszero(expr_939))
                    if expr_940 {
                        let _282 := vloc_totalInvested_903
                        let expr_946 := _282
                        let _283 := 0x02
                        let expr_941 := _283
                        let expr_943 := caller()
                        let _284 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_941,expr_943)
                        let _285_slot := _284
                        let expr_944_slot := _285_slot
                        let _286 := add(expr_944_slot, 5)
                        update_storage_value_offset_0t_uint256_to_t_uint256(_286, expr_946)
                        let expr_947 := expr_946
                        let expr_954 := 0x00
                        let _287 := 0x02
                        let expr_949 := _287
                        let expr_951 := caller()
                        let _288 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_949,expr_951)
                        let _289_slot := _288
                        let expr_952_slot := _289_slot
                        let _290 := add(expr_952_slot, 4)
                        update_storage_value_offset_0t_bool_to_t_bool(_290, expr_954)
                        let expr_955 := expr_954
                    }
                }

            }

            function fun_getActivationTime_215(vloc__currentLevel_191, vloc__setting_delay_193) -> vloc__196 {
                let zero_value_for_type_t_uint32_52 := zero_value_for_split_t_uint32()
                vloc__196 := zero_value_for_type_t_uint32_52

                let expr_201 := timestamp()
                let _53 := vloc__setting_delay_193
                let expr_202 := _53
                let expr_203 := 0x02
                let _54 := vloc__currentLevel_191
                let expr_204 := _54
                let expr_205 := 0x01
                let expr_206 := checked_sub_t_uint256(expr_204, convert_t_rational_1_by_1_to_t_uint256(expr_205))

                let expr_207 := expr_206
                let _55 := convert_t_rational_2_by_1_to_t_uint256(expr_203)
                let expr_208 := checked_exp_t_rational_2_by_1_t_uint256(expr_207)
                let expr_209 := expr_208
                let expr_210 := checked_mul_t_uint256(expr_202, expr_209)

                let expr_211 := checked_add_t_uint256(expr_201, expr_210)

                let expr_212 := convert_t_uint256_to_t_uint32(expr_211)
                vloc__196 := expr_212
                leave

            }

            function fun_getBlockInfo_712(vloc_x_680, vloc_y_682) -> vloc_landlord_685, vloc_imageID_687, vloc_sellPrice_689 {
                let zero_value_for_type_t_address_146 := zero_value_for_split_t_address()
                vloc_landlord_685 := zero_value_for_type_t_address_146
                let zero_value_for_type_t_uint256_147 := zero_value_for_split_t_uint256()
                vloc_imageID_687 := zero_value_for_type_t_uint256_147
                let zero_value_for_type_t_uint256_148 := zero_value_for_split_t_uint256()
                vloc_sellPrice_689 := zero_value_for_type_t_uint256_148

                let _149_slot := 0x06
                let expr_691_slot := _149_slot
                let _150 := vloc_x_680
                let expr_692 := _150

                let _151, _152 := storage_array_index_access_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(expr_691_slot, expr_692)
                let _153_slot := _151
                let expr_693_slot := _153_slot
                let _154 := vloc_y_682
                let expr_694 := _154

                let _155, _156 := storage_array_index_access_t_array$_t_struct$_Block_$43_storage_$101_storage(expr_693_slot, expr_694)
                let _157_slot := _155
                let expr_695_slot := _157_slot
                let _158 := add(expr_695_slot, 0)
                let _159 := read_from_storage_split_offset_0_t_address(_158)
                let expr_696 := _159
                let expr_709_component_1 := expr_696
                let _160_slot := 0x06
                let expr_697_slot := _160_slot
                let _161 := vloc_x_680
                let expr_698 := _161

                let _162, _163 := storage_array_index_access_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(expr_697_slot, expr_698)
                let _164_slot := _162
                let expr_699_slot := _164_slot
                let _165 := vloc_y_682
                let expr_700 := _165

                let _166, _167 := storage_array_index_access_t_array$_t_struct$_Block_$43_storage_$101_storage(expr_699_slot, expr_700)
                let _168_slot := _166
                let expr_701_slot := _168_slot
                let _169 := add(expr_701_slot, 1)
                let _170 := read_from_storage_split_offset_0_t_uint256(_169)
                let expr_702 := _170
                let expr_709_component_2 := expr_702
                let _171_slot := 0x06
                let expr_703_slot := _171_slot
                let _172 := vloc_x_680
                let expr_704 := _172

                let _173, _174 := storage_array_index_access_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(expr_703_slot, expr_704)
                let _175_slot := _173
                let expr_705_slot := _175_slot
                let _176 := vloc_y_682
                let expr_706 := _176

                let _177, _178 := storage_array_index_access_t_array$_t_struct$_Block_$43_storage_$101_storage(expr_705_slot, expr_706)
                let _179_slot := _177
                let expr_707_slot := _179_slot
                let _180 := add(expr_707_slot, 2)
                let _181 := read_from_storage_split_offset_0_t_uint256(_180)
                let expr_708 := _181
                let expr_709_component_3 := expr_708
                vloc_landlord_685 := expr_709_component_1
                vloc_imageID_687 := expr_709_component_2
                vloc_sellPrice_689 := expr_709_component_3
                leave

            }

            function fun_getImageInfo_754(vloc_imageID_714) -> vloc_fromX_717, vloc_fromY_719, vloc_toX_721, vloc_toY_723, vloc_imageSourceUrl_725, vloc_adUrl_727, vloc_adText_729 {
                let zero_value_for_type_t_uint8_182 := zero_value_for_split_t_uint8()
                vloc_fromX_717 := zero_value_for_type_t_uint8_182
                let zero_value_for_type_t_uint8_183 := zero_value_for_split_t_uint8()
                vloc_fromY_719 := zero_value_for_type_t_uint8_183
                let zero_value_for_type_t_uint8_184 := zero_value_for_split_t_uint8()
                vloc_toX_721 := zero_value_for_type_t_uint8_184
                let zero_value_for_type_t_uint8_185 := zero_value_for_split_t_uint8()
                vloc_toY_723 := zero_value_for_type_t_uint8_185
                let zero_value_for_type_t_bytes32_186 := zero_value_for_split_t_bytes32()
                vloc_imageSourceUrl_725 := zero_value_for_type_t_bytes32_186
                let zero_value_for_type_t_bytes32_187 := zero_value_for_split_t_bytes32()
                vloc_adUrl_727 := zero_value_for_type_t_bytes32_187
                let zero_value_for_type_t_bytes32_188 := zero_value_for_split_t_bytes32()
                vloc_adText_729 := zero_value_for_type_t_bytes32_188

                let _189 := 0x7792
                let expr_733 := _189
                let _190 := vloc_imageID_714
                let expr_734 := _190
                let _191 := mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Image_$67_storage_$_of_t_uint256(expr_733,expr_734)
                let _192_slot := _191
                let expr_735_slot := _192_slot
                let vloc_i_732_mpos := convert_t_struct$_Image_$67_storage_to_t_struct$_Image_$67_memory_ptr(expr_735_slot)
                let _193_mpos := vloc_i_732_mpos
                let expr_737_mpos := _193_mpos
                let _194 := add(expr_737_mpos, 0)
                let _195 := read_from_memoryt_uint8(_194)
                let expr_738 := _195
                let expr_751_component_1 := expr_738
                let _196_mpos := vloc_i_732_mpos
                let expr_739_mpos := _196_mpos
                let _197 := add(expr_739_mpos, 32)
                let _198 := read_from_memoryt_uint8(_197)
                let expr_740 := _198
                let expr_751_component_2 := expr_740
                let _199_mpos := vloc_i_732_mpos
                let expr_741_mpos := _199_mpos
                let _200 := add(expr_741_mpos, 64)
                let _201 := read_from_memoryt_uint8(_200)
                let expr_742 := _201
                let expr_751_component_3 := expr_742
                let _202_mpos := vloc_i_732_mpos
                let expr_743_mpos := _202_mpos
                let _203 := add(expr_743_mpos, 96)
                let _204 := read_from_memoryt_uint8(_203)
                let expr_744 := _204
                let expr_751_component_4 := expr_744
                let _205_mpos := vloc_i_732_mpos
                let expr_745_mpos := _205_mpos
                let _206 := add(expr_745_mpos, 128)
                let _207 := read_from_memoryt_bytes32(_206)
                let expr_746 := _207
                let expr_751_component_5 := expr_746
                let _208_mpos := vloc_i_732_mpos
                let expr_747_mpos := _208_mpos
                let _209 := add(expr_747_mpos, 160)
                let _210 := read_from_memoryt_bytes32(_209)
                let expr_748 := _210
                let expr_751_component_6 := expr_748
                let _211_mpos := vloc_i_732_mpos
                let expr_749_mpos := _211_mpos
                let _212 := add(expr_749_mpos, 192)
                let _213 := read_from_memoryt_bytes32(_212)
                let expr_750 := _213
                let expr_751_component_7 := expr_750
                vloc_fromX_717 := expr_751_component_1
                vloc_fromY_719 := expr_751_component_2
                vloc_toX_721 := expr_751_component_3
                vloc_toY_723 := expr_751_component_4
                vloc_imageSourceUrl_725 := expr_751_component_5
                vloc_adUrl_727 := expr_751_component_6
                vloc_adText_729 := expr_751_component_7
                leave

            }

            function fun_getMyInfo_678() -> vloc_balance_661, vloc_activationTime_663 {
                let zero_value_for_type_t_uint256_134 := zero_value_for_split_t_uint256()
                vloc_balance_661 := zero_value_for_type_t_uint256_134
                let zero_value_for_type_t_uint32_135 := zero_value_for_split_t_uint32()
                vloc_activationTime_663 := zero_value_for_type_t_uint32_135

                let _136 := 0x02
                let expr_665 := _136
                let expr_667 := caller()
                let _137 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_665,expr_667)
                let _138_slot := _137
                let expr_668_slot := _138_slot
                let _139 := add(expr_668_slot, 1)
                let _140 := read_from_storage_split_offset_0_t_uint256(_139)
                let expr_669 := _140
                let expr_675_component_1 := expr_669
                let _141 := 0x02
                let expr_670 := _141
                let expr_672 := caller()
                let _142 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_670,expr_672)
                let _143_slot := _142
                let expr_673_slot := _143_slot
                let _144 := add(expr_673_slot, 2)
                let _145 := read_from_storage_split_offset_0_t_uint32(_144)
                let expr_674 := _145
                let expr_675_component_2 := expr_674
                vloc_balance_661 := expr_675_component_1
                vloc_activationTime_663 := expr_675_component_2
                leave

            }

            function fun_getStateInfo_781() -> vloc__numUsers_757, vloc__blocksSold_759, vloc__totalWeiInvested_761, vloc__numImages_763, vloc__setting_imagePlacementPriceInWei_765, vloc__numNewStatus_767, vloc__setting_delay_769 {
                let zero_value_for_type_t_uint256_214 := zero_value_for_split_t_uint256()
                vloc__numUsers_757 := zero_value_for_type_t_uint256_214
                let zero_value_for_type_t_uint16_215 := zero_value_for_split_t_uint16()
                vloc__blocksSold_759 := zero_value_for_type_t_uint16_215
                let zero_value_for_type_t_uint256_216 := zero_value_for_split_t_uint256()
                vloc__totalWeiInvested_761 := zero_value_for_type_t_uint256_216
                let zero_value_for_type_t_uint256_217 := zero_value_for_split_t_uint256()
                vloc__numImages_763 := zero_value_for_type_t_uint256_217
                let zero_value_for_type_t_uint256_218 := zero_value_for_split_t_uint256()
                vloc__setting_imagePlacementPriceInWei_765 := zero_value_for_type_t_uint256_218
                let zero_value_for_type_t_uint256_219 := zero_value_for_split_t_uint256()
                vloc__numNewStatus_767 := zero_value_for_type_t_uint256_219
                let zero_value_for_type_t_uint32_220 := zero_value_for_split_t_uint32()
                vloc__setting_delay_769 := zero_value_for_type_t_uint32_220

                let _221 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_771 := _221
                let expr_778_component_1 := expr_771
                let _222 := read_from_storage_split_offset_0_t_uint16(0x04)
                let expr_772 := _222
                let expr_778_component_2 := expr_772
                let _223 := read_from_storage_split_offset_0_t_uint256(0x7795)
                let expr_773 := _223
                let expr_778_component_3 := expr_773
                let _224 := read_from_storage_split_offset_0_t_uint256(0x7791)
                let expr_774 := _224
                let expr_778_component_4 := expr_774
                let _225 := read_from_storage_split_offset_0_t_uint256(0x7797)
                let expr_775 := _225
                let expr_778_component_5 := expr_775
                let _226 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_776 := _226
                let expr_778_component_6 := expr_776
                let _227 := read_from_storage_split_offset_2_t_uint32(0x7796)
                let expr_777 := _227
                let expr_778_component_7 := expr_777
                vloc__numUsers_757 := expr_778_component_1
                vloc__blocksSold_759 := expr_778_component_2
                vloc__totalWeiInvested_761 := expr_778_component_3
                vloc__numImages_763 := expr_778_component_4
                vloc__setting_imagePlacementPriceInWei_765 := expr_778_component_5
                vloc__numNewStatus_767 := expr_778_component_6
                vloc__setting_delay_769 := expr_778_component_7
                leave

            }

            function fun_getUserAddressByID_658(vloc_userID_648) -> vloc_userAddress_651 {
                let zero_value_for_type_t_address_129 := zero_value_for_split_t_address()
                vloc_userAddress_651 := zero_value_for_type_t_address_129

                let _130 := 0x03
                let expr_653 := _130
                let _131 := vloc_userID_648
                let expr_654 := _131
                let _132 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_653,expr_654)
                let _133 := read_from_storage_split_offset_0_t_address(_132)
                let expr_655 := _133
                vloc_userAddress_651 := expr_655
                leave

            }

            function fun_getUserInfo_646(vloc_userAddress_570) -> vloc_referal_573, vloc_handshakes_575, vloc_balance_577, vloc_activationTime_579, vloc_banned_581, vloc_userID_583, vloc_refunded_585, vloc_investments_587 {
                let zero_value_for_type_t_address_73 := zero_value_for_split_t_address()
                vloc_referal_573 := zero_value_for_type_t_address_73
                let zero_value_for_type_t_uint8_74 := zero_value_for_split_t_uint8()
                vloc_handshakes_575 := zero_value_for_type_t_uint8_74
                let zero_value_for_type_t_uint256_75 := zero_value_for_split_t_uint256()
                vloc_balance_577 := zero_value_for_type_t_uint256_75
                let zero_value_for_type_t_uint32_76 := zero_value_for_split_t_uint32()
                vloc_activationTime_579 := zero_value_for_type_t_uint32_76
                let zero_value_for_type_t_bool_77 := zero_value_for_split_t_bool()
                vloc_banned_581 := zero_value_for_type_t_bool_77
                let zero_value_for_type_t_uint256_78 := zero_value_for_split_t_uint256()
                vloc_userID_583 := zero_value_for_type_t_uint256_78
                let zero_value_for_type_t_bool_79 := zero_value_for_split_t_bool()
                vloc_refunded_585 := zero_value_for_type_t_bool_79
                let zero_value_for_type_t_uint256_80 := zero_value_for_split_t_uint256()
                vloc_investments_587 := zero_value_for_type_t_uint256_80

                let _81 := 0x02
                let expr_590 := _81
                let _82 := vloc_userAddress_570
                let expr_591 := _82
                let _83 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_590,expr_591)
                let _84_slot := _83
                let expr_592_slot := _84_slot
                let _85 := add(expr_592_slot, 0)
                let _86 := read_from_storage_split_offset_0_t_address(_85)
                let expr_593 := _86
                vloc_referal_573 := expr_593
                let expr_594 := expr_593
                let _87 := 0x02
                let expr_597 := _87
                let _88 := vloc_userAddress_570
                let expr_598 := _88
                let _89 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_597,expr_598)
                let _90_slot := _89
                let expr_599_slot := _90_slot
                let _91 := add(expr_599_slot, 0)
                let _92 := read_from_storage_split_offset_20_t_uint8(_91)
                let expr_600 := _92
                vloc_handshakes_575 := expr_600
                let expr_601 := expr_600
                let _93 := 0x02
                let expr_604 := _93
                let _94 := vloc_userAddress_570
                let expr_605 := _94
                let _95 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_604,expr_605)
                let _96_slot := _95
                let expr_606_slot := _96_slot
                let _97 := add(expr_606_slot, 1)
                let _98 := read_from_storage_split_offset_0_t_uint256(_97)
                let expr_607 := _98
                vloc_balance_577 := expr_607
                let expr_608 := expr_607
                let _99 := 0x02
                let expr_611 := _99
                let _100 := vloc_userAddress_570
                let expr_612 := _100
                let _101 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_611,expr_612)
                let _102_slot := _101
                let expr_613_slot := _102_slot
                let _103 := add(expr_613_slot, 2)
                let _104 := read_from_storage_split_offset_0_t_uint32(_103)
                let expr_614 := _104
                vloc_activationTime_579 := expr_614
                let expr_615 := expr_614
                let _105 := 0x02
                let expr_618 := _105
                let _106 := vloc_userAddress_570
                let expr_619 := _106
                let _107 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_618,expr_619)
                let _108_slot := _107
                let expr_620_slot := _108_slot
                let _109 := add(expr_620_slot, 2)
                let _110 := read_from_storage_split_offset_4_t_bool(_109)
                let expr_621 := _110
                vloc_banned_581 := expr_621
                let expr_622 := expr_621
                let _111 := 0x02
                let expr_625 := _111
                let _112 := vloc_userAddress_570
                let expr_626 := _112
                let _113 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_625,expr_626)
                let _114_slot := _113
                let expr_627_slot := _114_slot
                let _115 := add(expr_627_slot, 3)
                let _116 := read_from_storage_split_offset_0_t_uint256(_115)
                let expr_628 := _116
                vloc_userID_583 := expr_628
                let expr_629 := expr_628
                let _117 := 0x02
                let expr_632 := _117
                let _118 := vloc_userAddress_570
                let expr_633 := _118
                let _119 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_632,expr_633)
                let _120_slot := _119
                let expr_634_slot := _120_slot
                let _121 := add(expr_634_slot, 4)
                let _122 := read_from_storage_split_offset_0_t_bool(_121)
                let expr_635 := _122
                vloc_refunded_585 := expr_635
                let expr_636 := expr_635
                let _123 := 0x02
                let expr_639 := _123
                let _124 := vloc_userAddress_570
                let expr_640 := _124
                let _125 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_639,expr_640)
                let _126_slot := _125
                let expr_641_slot := _126_slot
                let _127 := add(expr_641_slot, 5)
                let _128 := read_from_storage_split_offset_0_t_uint256(_127)
                let expr_642 := _128
                vloc_investments_587 := expr_642
                let expr_643 := expr_642

            }

            function fun_signIn_299(vloc_referal_217) -> vloc__220 {
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc__220 := zero_value_for_type_t_uint256_1

                let _3 := read_from_storage_split_offset_0_t_uint256(0x01)
                let _2 := increment_t_uint256(_3)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _2)
                let expr_223 := _3
                let _4 := 0x02
                let expr_227 := _4
                let _5 := vloc_referal_217
                let expr_228 := _5
                let _6 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(expr_227,expr_228)
                let _7_slot := _6
                let expr_229_slot := _7_slot
                let _8 := add(expr_229_slot, 0)
                let _9 := read_from_storage_split_offset_20_t_uint8(_8)
                let expr_230 := _9
                let expr_231 := 0x01
                let expr_232 := checked_add_t_uint8(expr_230, convert_t_rational_1_by_1_to_t_uint8(expr_231))

                let vloc_currentLevel_226 := expr_232
                let _10 := vloc_referal_217
                let expr_239 := _10
                let _11 := 0x02
                let expr_234 := _11
                let expr_236 := caller()
                let _12 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_234,expr_236)
                let _13_slot := _12
                let expr_237_slot := _13_slot
                let _14 := add(expr_237_slot, 0)
                update_storage_value_offset_0t_address_to_t_address(_14, expr_239)
                let expr_240 := expr_239
                let _15 := vloc_currentLevel_226
                let expr_247 := _15
                let _16 := 0x02
                let expr_242 := _16
                let expr_244 := caller()
                let _17 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_242,expr_244)
                let _18_slot := _17
                let expr_245_slot := _18_slot
                let _19 := add(expr_245_slot, 0)
                update_storage_value_offset_20t_uint8_to_t_uint8(_19, expr_247)
                let expr_248 := expr_247
                let expr_255_functionIdentifier := 215
                let _20 := vloc_currentLevel_226
                let expr_256 := _20
                let _21 := read_from_storage_split_offset_2_t_uint32(0x7796)
                let expr_257 := _21
                let _22 := convert_t_uint8_to_t_uint256(expr_256)
                let _23 := convert_t_uint32_to_t_uint256(expr_257)
                let expr_258 := fun_getActivationTime_215(_22, _23)
                let _24 := 0x02
                let expr_250 := _24
                let expr_252 := caller()
                let _25 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_250,expr_252)
                let _26_slot := _25
                let expr_253_slot := _26_slot
                let _27 := add(expr_253_slot, 2)
                update_storage_value_offset_0t_uint32_to_t_uint32(_27, expr_258)
                let expr_259 := expr_258
                let expr_266 := 0x00
                let _28 := 0x02
                let expr_261 := _28
                let expr_263 := caller()
                let _29 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_261,expr_263)
                let _30_slot := _29
                let expr_264_slot := _30_slot
                let _31 := add(expr_264_slot, 4)
                update_storage_value_offset_0t_bool_to_t_bool(_31, expr_266)
                let expr_267 := expr_266
                let _32 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_274 := _32
                let _33 := 0x02
                let expr_269 := _33
                let expr_271 := caller()
                let _34 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_269,expr_271)
                let _35_slot := _34
                let expr_272_slot := _35_slot
                let _36 := add(expr_272_slot, 3)
                update_storage_value_offset_0t_uint256_to_t_uint256(_36, expr_274)
                let expr_275 := expr_274
                let expr_281 := caller()
                let _37 := convert_t_address_payable_to_t_address(expr_281)
                let _38 := 0x03
                let expr_277 := _38
                let _39 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_278 := _39
                let _40 := mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(expr_277,expr_278)
                update_storage_value_offset_0t_address_to_t_address(_40, _37)
                let expr_282 := _37
                let _41 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_285 := _41
                let expr_287 := caller()
                let _42 := vloc_referal_217
                let expr_288 := _42
                let _43 := 0x02
                let expr_289 := _43
                let expr_291 := caller()
                let _44 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_289,expr_291)
                let _45_slot := _44
                let expr_292_slot := _45_slot
                let _46 := add(expr_292_slot, 2)
                let _47 := read_from_storage_split_offset_0_t_uint32(_46)
                let expr_293 := _47
                let _48 := 0x9d35dcac34f1dc50826c04b0cf8282b0764ff89463320a8401c9add280b92ebd
                {
                    let _49 := mload(64)
                    let _50 := abi_encode_tuple_t_uint256_t_address_payable_t_address_t_uint32__to_t_uint256_t_address_t_address_t_uint32__fromStack(_49 , expr_285, expr_287, expr_288, expr_293)
                    log1(_49, sub(_50, _49) , _48)
                }let _51 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_296 := _51
                vloc__220 := expr_296
                leave

            }

            function fun_withdrawAll_568() {

                let _56 := 0x02
                let expr_537 := _56
                let expr_539 := caller()
                let _57 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_537,expr_539)
                let _58_slot := _57
                let expr_540_slot := _58_slot
                let _59 := add(expr_540_slot, 1)
                let _60 := read_from_storage_split_offset_0_t_uint256(_59)
                let expr_541 := _60
                let vloc_withdrawAmount_536 := expr_541
                let expr_548 := 0x00
                let _61 := convert_t_rational_0_by_1_to_t_uint256(expr_548)
                let _62 := 0x02
                let expr_543 := _62
                let expr_545 := caller()
                let _63 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_543,expr_545)
                let _64_slot := _63
                let expr_546_slot := _64_slot
                let _65 := add(expr_546_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_65, _61)
                let expr_549 := _61
                let expr_554 := caller()
                let expr_555_address := convert_t_address_payable_to_t_address(expr_554)
                let _66 := vloc_withdrawAmount_536
                let expr_556 := _66

                let _67 := 0
                if iszero(expr_556) { _67 := 2300 }
                let expr_557 := call(_67, expr_555_address, expr_556, 0, 0, 0, 0)

                let _68 := vloc_withdrawAmount_536
                let expr_564 := _68
                let _69 := 0x02
                let expr_559 := _69
                let expr_561 := caller()
                let _70 := mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(expr_559,expr_561)
                let _71_slot := _70
                let expr_562_slot := _71_slot
                let _72 := add(expr_562_slot, 1)
                update_storage_value_offset_0t_uint256_to_t_uint256(_72, expr_564)
                let expr_565 := expr_564

            }

            function getter_fun_charityAddress_76() -> ret {

                let slot := 30612
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_charityBalance_74() -> ret {

                let slot := 30611
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_struct$_User_$22_storage_$_of_t_address_payable(slot , key) -> dataSlot {
                mstore(0, convert_t_address_payable_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_address_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_struct$_Image_$67_storage_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
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

            function prepare_store_t_uint32(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint8(value) -> ret {
                ret := value
            }

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint8(ptr) -> returnValue {

                let value := cleanup_t_uint8(mload(ptr))

                returnValue :=

                value

            }

            function read_from_storage_reference_type_t_struct$_Image_$67_memory_ptr(slot) -> value {
                value := allocate_memory_struct_t_struct$_Image_$67_memory_ptr()

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint8(add(slot, 0), 0)
                    write_to_memory_t_uint8(add(value, 0), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint8(add(slot, 0), 1)
                    write_to_memory_t_uint8(add(value, 32), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint8(add(slot, 0), 2)
                    write_to_memory_t_uint8(add(value, 64), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_uint8(add(slot, 0), 3)
                    write_to_memory_t_uint8(add(value, 96), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_bytes32(add(slot, 1), 0)
                    write_to_memory_t_bytes32(add(value, 128), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_bytes32(add(slot, 2), 0)
                    write_to_memory_t_bytes32(add(value, 160), memberValue_0)
                }

                {
                    let memberValue_0 := read_from_storage_split_dynamic_t_bytes32(add(slot, 3), 0)
                    write_to_memory_t_bytes32(add(value, 192), memberValue_0)
                }

            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bytes32(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bytes32(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint8(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint8(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint16(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint16(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint32(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint32(sload(slot))

            }

            function read_from_storage_split_offset_20_t_uint8(slot) -> value {
                value := extract_from_storage_value_offset_20t_uint8(sload(slot))

            }

            function read_from_storage_split_offset_2_t_uint32(slot) -> value {
                value := extract_from_storage_value_offset_2t_uint32(sload(slot))

            }

            function read_from_storage_split_offset_4_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_4t_bool(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_16(value) -> newValue {
                newValue :=

                shl(16, value)

            }

            function shift_left_160(value) -> newValue {
                newValue :=

                shl(160, value)

            }

            function shift_left_32(value) -> newValue {
                newValue :=

                shl(32, value)

            }

            function shift_left_8(value) -> newValue {
                newValue :=

                shl(8, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_160_unsigned(value) -> newValue {
                newValue :=

                shr(160, value)

            }

            function shift_right_16_unsigned(value) -> newValue {
                newValue :=

                shr(16, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_32_unsigned(value) -> newValue {
                newValue :=

                shr(32, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function storage_array_index_access_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_array$_t_struct$_Block_$43_storage_$101_storage_$101_storage(array)
                slot := add(dataArea, mul(index, 303))
                offset := 0

            }

            function storage_array_index_access_t_array$_t_struct$_Block_$43_storage_$101_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_struct$_Block_$43_storage_$101_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_struct$_Block_$43_storage_$101_storage(array)
                slot := add(dataArea, mul(index, 3))
                offset := 0

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_1_shift_1(value, toInsert) -> result {
                let mask := 65280
                toInsert := shift_left_8(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_1_shift_20(value, toInsert) -> result {
                let mask := 0xff0000000000000000000000000000000000000000
                toInsert := shift_left_160(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_1_shift_4(value, toInsert) -> result {
                let mask := 0xff00000000
                toInsert := shift_left_32(toInsert)
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

            function update_byte_slice_4_shift_0(value, toInsert) -> result {
                let mask := 0xffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_byte_slice_4_shift_2(value, toInsert) -> result {
                let mask := 0xffffffff0000
                toInsert := shift_left_16(toInsert)
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

            function update_storage_value_offset_0t_uint32_to_t_uint32(slot, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_4_shift_0(sload(slot), prepare_store_t_uint32(convertedValue_0)))
            }

            function update_storage_value_offset_1t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_1(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_20t_uint8_to_t_uint8(slot, value_0) {
                let convertedValue_0 := convert_t_uint8_to_t_uint8(value_0)
                sstore(slot, update_byte_slice_1_shift_20(sload(slot), prepare_store_t_uint8(convertedValue_0)))
            }

            function update_storage_value_offset_2t_uint32_to_t_uint32(slot, value_0) {
                let convertedValue_0 := convert_t_uint32_to_t_uint32(value_0)
                sstore(slot, update_byte_slice_4_shift_2(sload(slot), prepare_store_t_uint32(convertedValue_0)))
            }

            function update_storage_value_offset_4t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_4(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint32(value) {
                if iszero(eq(value, cleanup_t_uint32(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function write_to_memory_t_bytes32(memPtr, value) {
                mstore(memPtr, cleanup_t_bytes32(value))
            }

            function write_to_memory_t_uint8(memPtr, value) {
                mstore(memPtr, cleanup_t_uint8(value))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint16() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint32() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

        }

    }

}

