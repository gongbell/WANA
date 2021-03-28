/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EDProxy_322" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EDProxy_322()

        codecopy(0, dataoffset("EDProxy_322_deployed"), datasize("EDProxy_322_deployed"))

        return(0, datasize("EDProxy_322_deployed"))

        function constructor_EDProxy_322() {

        }

    }
    object "EDProxy_322_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xb59bb5e3
                {
                    // testcall(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_testcall_321(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf3372898
                {
                    // dtrade(address,uint8,uint8,uint256[],address[],bytes32[])
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3, param_4, param_5 :=  abi_decode_tuple_t_addresst_uint8t_uint8t_array$_t_uint256_$dyn_memory_ptrt_array$_t_address_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(4, calldatasize())
                    fun_dtrade_118(param_0, param_1, param_2, param_3, param_4, param_5)
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

            // address[]
            function abi_decode_t_array$_t_address_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length))
                let dst := array
                mstore(array, length) offset := add(offset, 0x20) dst := add(dst, 0x20) // might update offset and dst
                let src := offset
                if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementPos := src
                    mstore(dst, abi_decode_t_address(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            // bytes32[]
            function abi_decode_t_array$_t_bytes32_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length))
                let dst := array
                mstore(array, length) offset := add(offset, 0x20) dst := add(dst, 0x20) // might update offset and dst
                let src := offset
                if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementPos := src
                    mstore(dst, abi_decode_t_bytes32(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            // uint256[]
            function abi_decode_t_array$_t_uint256_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length))
                let dst := array
                mstore(array, length) offset := add(offset, 0x20) dst := add(dst, 0x20) // might update offset and dst
                let src := offset
                if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementPos := src
                    mstore(dst, abi_decode_t_uint256(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_t_uint8(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint8(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_addresst_uint8t_uint8t_array$_t_uint256_$dyn_memory_ptrt_array$_t_address_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5 {
                if slt(sub(dataEnd, headStart), 192) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 96))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value3 := abi_decode_t_array$_t_uint256_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 128))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value4 := abi_decode_t_array$_t_address_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 160))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value5 := abi_decode_t_array$_t_bytes32_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_bytes4_to_t_bytes4_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes4(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__to_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__fromStack(headStart , value0, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10, value11) -> tail {
                tail := add(headStart, 384)

                abi_encode_t_bytes4_to_t_bytes4_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

                abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

                abi_encode_t_address_to_t_address_fromStack(value3,  add(headStart, 96))

                abi_encode_t_uint256_to_t_uint256_fromStack(value4,  add(headStart, 128))

                abi_encode_t_uint256_to_t_uint256_fromStack(value5,  add(headStart, 160))

                abi_encode_t_uint256_to_t_uint256_fromStack(value6,  add(headStart, 192))

                abi_encode_t_address_to_t_address_fromStack(value7,  add(headStart, 224))

                abi_encode_t_uint8_to_t_uint8_fromStack(value8,  add(headStart, 256))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value9,  add(headStart, 288))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value10,  add(headStart, 320))

                abi_encode_t_uint256_to_t_uint256_fromStack(value11,  add(headStart, 352))

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

            function allocate_and_zero_memory_array_t_array$_t_address_$dyn_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_address_$dyn_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length)

                dataStart := add(dataStart, 32)
                dataSize := sub(dataSize, 32)

                zero_memory_chunk_t_address(dataStart, dataSize)
            }

            function allocate_and_zero_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length)

                dataStart := add(dataStart, 32)
                dataSize := sub(dataSize, 32)

                zero_memory_chunk_t_bytes32(dataStart, dataSize)
            }

            function allocate_and_zero_memory_array_t_array$_t_uint256_$dyn_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_uint256_$dyn_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length)

                dataStart := add(dataStart, 32)
                dataSize := sub(dataSize, 32)

                zero_memory_chunk_t_uint256(dataStart, dataSize)
            }

            function allocate_memory_array_t_array$_t_address_$dyn_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function allocate_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function allocate_memory_array_t_array$_t_uint256_$dyn_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

                mstore(memPtr, length)

            }

            function array_allocation_size_t_array$_t_address_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_length_t_array$_t_address_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_bytes32_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_uint256_$dyn_memory_ptr(value) -> length {

                length := mload(value)

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

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bytes32_to_t_bytes4(value) -> converted {
                converted := cleanup_t_bytes32(value)
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

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_11_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_12_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_12_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_4_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_6_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_7_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_8_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_9_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function fun_dtrade_118(vloc__callee_6, vloc_v1_8, vloc_v2_10, vloc_uints_13_mpos, vloc_addresses_16_mpos, vloc_b_19_mpos) {

                let _1 := vloc__callee_6
                let expr_24 := _1
                let expr_25_address := expr_24
                let expr_32 := 0x0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4
                let expr_33 := convert_t_bytes32_to_t_bytes4(expr_32)
                let _2_mpos := vloc_addresses_16_mpos
                let expr_34_mpos := _2_mpos
                let expr_35 := 0x00
                let _3 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_34_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_35)))
                let expr_36 := _3
                let _4_mpos := vloc_uints_13_mpos
                let expr_37_mpos := _4_mpos
                let expr_38 := 0x00
                let _5 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_37_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_38)))
                let expr_39 := _5
                let _6_mpos := vloc_addresses_16_mpos
                let expr_40_mpos := _6_mpos
                let expr_41 := 0x02
                let _7 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_40_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_41)))
                let expr_42 := _7
                let _8_mpos := vloc_uints_13_mpos
                let expr_43_mpos := _8_mpos
                let expr_44 := 0x02
                let _9 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_43_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_44)))
                let expr_45 := _9
                let _10_mpos := vloc_uints_13_mpos
                let expr_46_mpos := _10_mpos
                let expr_47 := 0x04
                let _11 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_46_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_47)))
                let expr_48 := _11
                let _12_mpos := vloc_uints_13_mpos
                let expr_49_mpos := _12_mpos
                let expr_50 := 0x06
                let _13 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_49_mpos, convert_t_rational_6_by_1_to_t_uint256(expr_50)))
                let expr_51 := _13
                let _14_mpos := vloc_addresses_16_mpos
                let expr_52_mpos := _14_mpos
                let expr_53 := 0x04
                let _15 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_52_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_53)))
                let expr_54 := _15
                let _16 := vloc_v1_8
                let expr_55 := _16
                let _17_mpos := vloc_b_19_mpos
                let expr_56_mpos := _17_mpos
                let expr_57 := 0x00
                let _18 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_56_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_57)))
                let expr_58 := _18
                let _19_mpos := vloc_b_19_mpos
                let expr_59_mpos := _19_mpos
                let expr_60 := 0x02
                let _20 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_59_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_60)))
                let expr_61 := _20
                let _21_mpos := vloc_uints_13_mpos
                let expr_62_mpos := _21_mpos
                let expr_63 := 0x08
                let _22 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_62_mpos, convert_t_rational_8_by_1_to_t_uint256(expr_63)))
                let expr_64 := _22

                let expr_65_mpos := allocateTemporaryMemory()
                let _23 := add(expr_65_mpos, 0x20)

                let _24 := abi_encode_tuple_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__to_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__fromStack(_23, expr_33, expr_36, expr_39, expr_42, expr_45, expr_48, expr_51, expr_54, expr_55, expr_58, expr_61, expr_64)
                mstore(expr_65_mpos, sub(_24, add(expr_65_mpos, 0x20)))
                mstore(64, round_up_to_mul_of_32(_24))

                let _25 := add(expr_65_mpos, 0x20)
                let _26 := mload(expr_65_mpos)

                let expr_66_component_1 := delegatecall(gas(), expr_25_address,  _25, _26, 0, 0)

                let expr_66_component_2_mpos := extract_returndata()

                let vloc_success_23 := expr_66_component_1
                let _27 := vloc_success_23
                let expr_68 := _27
                if expr_68 {
                    let _28 := vloc__callee_6
                    let expr_69 := _28
                    let expr_71_address := expr_69
                    let expr_78 := 0x0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4
                    let expr_79 := convert_t_bytes32_to_t_bytes4(expr_78)
                    let _29_mpos := vloc_addresses_16_mpos
                    let expr_80_mpos := _29_mpos
                    let expr_81 := 0x01
                    let _30 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_80_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_81)))
                    let expr_82 := _30
                    let _31_mpos := vloc_uints_13_mpos
                    let expr_83_mpos := _31_mpos
                    let expr_84 := 0x01
                    let _32 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_83_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_84)))
                    let expr_85 := _32
                    let _33_mpos := vloc_addresses_16_mpos
                    let expr_86_mpos := _33_mpos
                    let expr_87 := 0x03
                    let _34 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_86_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_87)))
                    let expr_88 := _34
                    let _35_mpos := vloc_uints_13_mpos
                    let expr_89_mpos := _35_mpos
                    let expr_90 := 0x03
                    let _36 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_89_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_90)))
                    let expr_91 := _36
                    let _37_mpos := vloc_uints_13_mpos
                    let expr_92_mpos := _37_mpos
                    let expr_93 := 0x05
                    let _38 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_92_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_93)))
                    let expr_94 := _38
                    let _39_mpos := vloc_uints_13_mpos
                    let expr_95_mpos := _39_mpos
                    let expr_96 := 0x07
                    let _40 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_95_mpos, convert_t_rational_7_by_1_to_t_uint256(expr_96)))
                    let expr_97 := _40
                    let _41_mpos := vloc_addresses_16_mpos
                    let expr_98_mpos := _41_mpos
                    let expr_99 := 0x05
                    let _42 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_98_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_99)))
                    let expr_100 := _42
                    let _43 := vloc_v2_10
                    let expr_101 := _43
                    let _44_mpos := vloc_b_19_mpos
                    let expr_102_mpos := _44_mpos
                    let expr_103 := 0x01
                    let _45 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_102_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_103)))
                    let expr_104 := _45
                    let _46_mpos := vloc_b_19_mpos
                    let expr_105_mpos := _46_mpos
                    let expr_106 := 0x03
                    let _47 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_105_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_106)))
                    let expr_107 := _47
                    let _48_mpos := vloc_uints_13_mpos
                    let expr_108_mpos := _48_mpos
                    let expr_109 := 0x09
                    let _49 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_108_mpos, convert_t_rational_9_by_1_to_t_uint256(expr_109)))
                    let expr_110 := _49

                    let expr_111_mpos := allocateTemporaryMemory()
                    let _50 := add(expr_111_mpos, 0x20)

                    let _51 := abi_encode_tuple_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__to_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__fromStack(_50, expr_79, expr_82, expr_85, expr_88, expr_91, expr_94, expr_97, expr_100, expr_101, expr_104, expr_107, expr_110)
                    mstore(expr_111_mpos, sub(_51, add(expr_111_mpos, 0x20)))
                    mstore(64, round_up_to_mul_of_32(_51))

                    let _52 := add(expr_111_mpos, 0x20)
                    let _53 := mload(expr_111_mpos)

                    let expr_112_component_1 := delegatecall(gas(), expr_71_address,  _52, _53, 0, 0)

                    let expr_112_component_2_mpos := extract_returndata()

                    let expr_113_component_1 := expr_112_component_1
                    let expr_113_component_2_mpos := expr_112_component_2_mpos
                }

            }

            function fun_testcall_321(vloc__callee_120) {

                let expr_131 := 0x04
                let _54 := convert_t_rational_4_by_1_to_t_uint256(expr_131)
                let expr_132_mpos := allocate_and_zero_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(_54)
                let vloc_b_127_mpos := expr_132_mpos
                let expr_142 := 0x06
                let _55 := convert_t_rational_6_by_1_to_t_uint256(expr_142)
                let expr_143_mpos := allocate_and_zero_memory_array_t_array$_t_address_$dyn_memory_ptr(_55)
                let vloc_addrs_138_mpos := expr_143_mpos
                let expr_153 := 0x0c
                let _56 := convert_t_rational_12_by_1_to_t_uint256(expr_153)
                let expr_154_mpos := allocate_and_zero_memory_array_t_array$_t_uint256_$dyn_memory_ptr(_56)
                let vloc_ints_149_mpos := expr_154_mpos
                let vloc_v1_157
                let zero_value_for_type_t_uint8_57 := zero_value_for_split_t_uint8()
                vloc_v1_157 := zero_value_for_type_t_uint8_57
                let vloc_v2_160
                let zero_value_for_type_t_uint8_58 := zero_value_for_split_t_uint8()
                vloc_v2_160 := zero_value_for_type_t_uint8_58
                let vloc_somebytes_163
                let zero_value_for_type_t_bytes32_59 := zero_value_for_split_t_bytes32()
                vloc_somebytes_163 := zero_value_for_type_t_bytes32_59
                let expr_168 := 0x01
                let _60 := convert_t_rational_1_by_1_to_t_uint256(expr_168)
                let _61_mpos := vloc_ints_149_mpos
                let expr_165_mpos := _61_mpos
                let expr_166 := 0x00
                let _62 := _60
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_165_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_166)), _62)
                let expr_169 := _60
                let expr_174 := 0x02
                let _63 := convert_t_rational_2_by_1_to_t_uint256(expr_174)
                let _64_mpos := vloc_ints_149_mpos
                let expr_171_mpos := _64_mpos
                let expr_172 := 0x01
                let _65 := _63
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_171_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_172)), _65)
                let expr_175 := _63
                let expr_180 := 0x03
                let _66 := convert_t_rational_3_by_1_to_t_uint256(expr_180)
                let _67_mpos := vloc_ints_149_mpos
                let expr_177_mpos := _67_mpos
                let expr_178 := 0x02
                let _68 := _66
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_177_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_178)), _68)
                let expr_181 := _66
                let expr_186 := 0x04
                let _69 := convert_t_rational_4_by_1_to_t_uint256(expr_186)
                let _70_mpos := vloc_ints_149_mpos
                let expr_183_mpos := _70_mpos
                let expr_184 := 0x03
                let _71 := _69
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_183_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_184)), _71)
                let expr_187 := _69
                let expr_192 := 0x05
                let _72 := convert_t_rational_5_by_1_to_t_uint256(expr_192)
                let _73_mpos := vloc_ints_149_mpos
                let expr_189_mpos := _73_mpos
                let expr_190 := 0x04
                let _74 := _72
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_189_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_190)), _74)
                let expr_193 := _72
                let expr_198 := 0x06
                let _75 := convert_t_rational_6_by_1_to_t_uint256(expr_198)
                let _76_mpos := vloc_ints_149_mpos
                let expr_195_mpos := _76_mpos
                let expr_196 := 0x05
                let _77 := _75
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_195_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_196)), _77)
                let expr_199 := _75
                let expr_204 := 0x07
                let _78 := convert_t_rational_7_by_1_to_t_uint256(expr_204)
                let _79_mpos := vloc_ints_149_mpos
                let expr_201_mpos := _79_mpos
                let expr_202 := 0x06
                let _80 := _78
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_201_mpos, convert_t_rational_6_by_1_to_t_uint256(expr_202)), _80)
                let expr_205 := _78
                let expr_210 := 0x08
                let _81 := convert_t_rational_8_by_1_to_t_uint256(expr_210)
                let _82_mpos := vloc_ints_149_mpos
                let expr_207_mpos := _82_mpos
                let expr_208 := 0x07
                let _83 := _81
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_207_mpos, convert_t_rational_7_by_1_to_t_uint256(expr_208)), _83)
                let expr_211 := _81
                let expr_216 := 0x09
                let _84 := convert_t_rational_9_by_1_to_t_uint256(expr_216)
                let _85_mpos := vloc_ints_149_mpos
                let expr_213_mpos := _85_mpos
                let expr_214 := 0x08
                let _86 := _84
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_213_mpos, convert_t_rational_8_by_1_to_t_uint256(expr_214)), _86)
                let expr_217 := _84
                let expr_222 := 0x0a
                let _87 := convert_t_rational_10_by_1_to_t_uint256(expr_222)
                let _88_mpos := vloc_ints_149_mpos
                let expr_219_mpos := _88_mpos
                let expr_220 := 0x09
                let _89 := _87
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_219_mpos, convert_t_rational_9_by_1_to_t_uint256(expr_220)), _89)
                let expr_223 := _87
                let expr_226 := 0x0b
                let _90 := convert_t_rational_11_by_1_to_t_uint8(expr_226)
                vloc_v1_157 := _90
                let expr_227 := _90
                let expr_230 := 0x0c
                let _91 := convert_t_rational_12_by_1_to_t_uint8(expr_230)
                vloc_v2_160 := _91
                let expr_231 := _91
                let _92 := vloc_somebytes_163
                let expr_236 := _92
                let _93_mpos := vloc_b_127_mpos
                let expr_233_mpos := _93_mpos
                let expr_234 := 0x00
                let _94 := expr_236
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_233_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_234)), _94)
                let expr_237 := expr_236
                let _95 := vloc_somebytes_163
                let expr_242 := _95
                let _96_mpos := vloc_b_127_mpos
                let expr_239_mpos := _96_mpos
                let expr_240 := 0x01
                let _97 := expr_242
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_239_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_240)), _97)
                let expr_243 := expr_242
                let _98 := vloc_somebytes_163
                let expr_248 := _98
                let _99_mpos := vloc_b_127_mpos
                let expr_245_mpos := _99_mpos
                let expr_246 := 0x02
                let _100 := expr_248
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_245_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_246)), _100)
                let expr_249 := expr_248
                let _101 := vloc_somebytes_163
                let expr_254 := _101
                let _102_mpos := vloc_b_127_mpos
                let expr_251_mpos := _102_mpos
                let expr_252 := 0x03
                let _103 := expr_254
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_251_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_252)), _103)
                let expr_255 := expr_254
                let expr_262 := 0x00
                let expr_263 := convert_t_rational_0_by_1_to_t_address_payable(expr_262)
                let _104 := convert_t_address_payable_to_t_address(expr_263)
                let _105_mpos := vloc_addrs_138_mpos
                let expr_257_mpos := _105_mpos
                let expr_258 := 0x00
                let _106 := _104
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_257_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_258)), _106)
                let expr_264 := _104
                let expr_271 := 0x00
                let expr_272 := convert_t_rational_0_by_1_to_t_address_payable(expr_271)
                let _107 := convert_t_address_payable_to_t_address(expr_272)
                let _108_mpos := vloc_addrs_138_mpos
                let expr_266_mpos := _108_mpos
                let expr_267 := 0x01
                let _109 := _107
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_266_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_267)), _109)
                let expr_273 := _107
                let expr_280 := 0x00
                let expr_281 := convert_t_rational_0_by_1_to_t_address_payable(expr_280)
                let _110 := convert_t_address_payable_to_t_address(expr_281)
                let _111_mpos := vloc_addrs_138_mpos
                let expr_275_mpos := _111_mpos
                let expr_276 := 0x02
                let _112 := _110
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_275_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_276)), _112)
                let expr_282 := _110
                let expr_289 := 0x00
                let expr_290 := convert_t_rational_0_by_1_to_t_address_payable(expr_289)
                let _113 := convert_t_address_payable_to_t_address(expr_290)
                let _114_mpos := vloc_addrs_138_mpos
                let expr_284_mpos := _114_mpos
                let expr_285 := 0x03
                let _115 := _113
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_284_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_285)), _115)
                let expr_291 := _113
                let expr_298 := 0x00
                let expr_299 := convert_t_rational_0_by_1_to_t_address_payable(expr_298)
                let _116 := convert_t_address_payable_to_t_address(expr_299)
                let _117_mpos := vloc_addrs_138_mpos
                let expr_293_mpos := _117_mpos
                let expr_294 := 0x04
                let _118 := _116
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_293_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_294)), _118)
                let expr_300 := _116
                let expr_307 := 0x00
                let expr_308 := convert_t_rational_0_by_1_to_t_address_payable(expr_307)
                let _119 := convert_t_address_payable_to_t_address(expr_308)
                let _120_mpos := vloc_addrs_138_mpos
                let expr_302_mpos := _120_mpos
                let expr_303 := 0x05
                let _121 := _119
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_302_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_303)), _121)
                let expr_309 := _119
                let expr_311_functionIdentifier := 118
                let _122 := vloc__callee_120
                let expr_312 := _122
                let _123 := vloc_v1_157
                let expr_313 := _123
                let _124 := vloc_v2_160
                let expr_314 := _124
                let _125_mpos := vloc_ints_149_mpos
                let expr_315_mpos := _125_mpos
                let _126_mpos := vloc_addrs_138_mpos
                let expr_316_mpos := _126_mpos
                let _127_mpos := vloc_b_127_mpos
                let expr_317_mpos := _127_mpos
                fun_dtrade_118(expr_312, expr_313, expr_314, expr_315_mpos, expr_316_mpos, expr_317_mpos)

            }

            function memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_address_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_bytes32_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint256_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function panic_error() {
                invalid()
            }

            function read_from_memoryt_address(ptr) -> returnValue {

                let value := cleanup_t_address(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

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

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function write_to_memory_t_address(memPtr, value) {
                mstore(memPtr, cleanup_t_address(value))
            }

            function write_to_memory_t_bytes32(memPtr, value) {
                mstore(memPtr, cleanup_t_bytes32(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function zero_memory_chunk_t_address(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function zero_memory_chunk_t_bytes32(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function zero_memory_chunk_t_uint256(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

        }

    }

}

