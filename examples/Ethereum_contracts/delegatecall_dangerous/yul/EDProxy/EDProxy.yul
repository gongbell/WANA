/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "EDProxy_307" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_EDProxy_307()

        codecopy(0, dataoffset("EDProxy_307_deployed"), datasize("EDProxy_307_deployed"))

        return(0, datasize("EDProxy_307_deployed"))

        function constructor_EDProxy_307() {

        }

    }
    object "EDProxy_307_deployed" {
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
                    fun_testcall_306(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf3372898
                {
                    // dtrade(address,uint8,uint8,uint256[],address[],bytes32[])
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3, param_4, param_5 :=  abi_decode_tuple_t_addresst_uint8t_uint8t_array$_t_uint256_$dyn_memory_ptrt_array$_t_address_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(4, calldatasize())
                    fun_dtrade_121(param_0, param_1, param_2, param_3, param_4, param_5)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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
            35function abi_decode_t_array$_t_bytes32_$dyn_memory_ptr(offset, end) -> array {
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

            40function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            41function abi_decode_tuple_t_addresst_uint8t_uint8t_array$_t_uint256_$dyn_memory_ptrt_array$_t_address_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5 {
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

            function abi_encode_t_stringliteral_0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4_to_t_string_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, 92)

                mstore(add(pos, 0), "trade(address,uint256,address,ui")

                    mstore(add(pos, 32), "nt256,uint256,uint256,address,ui")

                mstore(add(pos, 64), "nt8,bytes32,bytes32,uint256)")

                end := add(pos, 92)
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

            function abi_encode_tuple_packed_t_stringliteral_0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4__to_t_string_memory_ptr__nonPadded_inplace_fromStack(pos ) -> end {

                pos := abi_encode_t_stringliteral_0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4_to_t_string_memory_ptr_nonPadded_inplace_fromStack( pos)

                end := pos
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

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

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

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
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

            93function fun_dtrade_121(vloc__callee_6, vloc_v1_8, vloc_v2_10, vloc_uints_13_mpos, vloc_addresses_16_mpos, vloc_b_19_mpos) {

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

                    let expr_80_mpos := allocateTemporaryMemory()
                    let _29 := add(expr_80_mpos, 0x20)

                    let _30 := abi_encode_tuple_packed_t_stringliteral_0a19b14a08704840e75041143e1834b6f4b023a90bb5f42e3a9e69c1efd8c2a4__to_t_string_memory_ptr__nonPadded_inplace_fromStack(_29)
                    mstore(expr_80_mpos, sub(_30, add(expr_80_mpos, 0x20)))
                    mstore(64, round_up_to_mul_of_32(_30))
                    let expr_81 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_80_mpos), array_length_t_bytes_memory_ptr(expr_80_mpos))
                    let expr_82 := convert_t_bytes32_to_t_bytes4(expr_81)
                    let _31_mpos := vloc_addresses_16_mpos
                    let expr_83_mpos := _31_mpos
                    let expr_84 := 0x01
                    let _32 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_83_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_84)))
                    let expr_85 := _32
                    let _33_mpos := vloc_uints_13_mpos
                    let expr_86_mpos := _33_mpos
                    let expr_87 := 0x01
                    let _34 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_86_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_87)))
                    let expr_88 := _34
                    let _35_mpos := vloc_addresses_16_mpos
                    let expr_89_mpos := _35_mpos
                    let expr_90 := 0x03
                    let _36 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_89_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_90)))
                    let expr_91 := _36
                    let _37_mpos := vloc_uints_13_mpos
                    let expr_92_mpos := _37_mpos
                    let expr_93 := 0x03
                    let _38 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_92_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_93)))
                    let expr_94 := _38
                    let _39_mpos := vloc_uints_13_mpos
                    let expr_95_mpos := _39_mpos
                    let expr_96 := 0x05
                    let _40 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_95_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_96)))
                    let expr_97 := _40
                    let _41_mpos := vloc_uints_13_mpos
                    let expr_98_mpos := _41_mpos
                    let expr_99 := 0x07
                    let _42 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_98_mpos, convert_t_rational_7_by_1_to_t_uint256(expr_99)))
                    let expr_100 := _42
                    let _43_mpos := vloc_addresses_16_mpos
                    let expr_101_mpos := _43_mpos
                    let expr_102 := 0x05
                    let _44 := read_from_memoryt_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_101_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_102)))
                    let expr_103 := _44
                    let _45 := vloc_v2_10
                    let expr_104 := _45
                    let _46_mpos := vloc_b_19_mpos
                    let expr_105_mpos := _46_mpos
                    let expr_106 := 0x01
                    let _47 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_105_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_106)))
                    let expr_107 := _47
                    let _48_mpos := vloc_b_19_mpos
                    let expr_108_mpos := _48_mpos
                    let expr_109 := 0x03
                    let _49 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_108_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_109)))
                    let expr_110 := _49
                    let _50_mpos := vloc_uints_13_mpos
                    let expr_111_mpos := _50_mpos
                    let expr_112 := 0x09
                    let _51 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_111_mpos, convert_t_rational_9_by_1_to_t_uint256(expr_112)))
                    let expr_113 := _51

                    let expr_114_mpos := allocateTemporaryMemory()
                    let _52 := add(expr_114_mpos, 0x20)

                    let _53 := abi_encode_tuple_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__to_t_bytes4_t_address_t_uint256_t_address_t_uint256_t_uint256_t_uint256_t_address_t_uint8_t_bytes32_t_bytes32_t_uint256__fromStack(_52, expr_82, expr_85, expr_88, expr_91, expr_94, expr_97, expr_100, expr_103, expr_104, expr_107, expr_110, expr_113)
                    mstore(expr_114_mpos, sub(_53, add(expr_114_mpos, 0x20)))
                    mstore(64, round_up_to_mul_of_32(_53))

                    let _54 := add(expr_114_mpos, 0x20)
                    let _55 := mload(expr_114_mpos)

                    let expr_115_component_1 := delegatecall(gas(), expr_71_address,  _54, _55, 0, 0)

                    let expr_115_component_2_mpos := extract_returndata()

                    let expr_116_component_1 := expr_115_component_1
                    let expr_116_component_2_mpos := expr_115_component_2_mpos
                }

            }

            94function fun_testcall_306(vloc__callee_123) {

                let expr_134 := 0x04
                let _56 := convert_t_rational_4_by_1_to_t_uint256(expr_134)
                let expr_135_mpos := allocate_and_zero_memory_array_t_array$_t_bytes32_$dyn_memory_ptr(_56)
                let vloc_b_130_mpos := expr_135_mpos
                let expr_145 := 0x06
                let _57 := convert_t_rational_6_by_1_to_t_uint256(expr_145)
                let expr_146_mpos := allocate_and_zero_memory_array_t_array$_t_address_$dyn_memory_ptr(_57)
                let vloc_addrs_141_mpos := expr_146_mpos
                let expr_156 := 0x0c
                let _58 := convert_t_rational_12_by_1_to_t_uint256(expr_156)
                let expr_157_mpos := allocate_and_zero_memory_array_t_array$_t_uint256_$dyn_memory_ptr(_58)
                let vloc_ints_152_mpos := expr_157_mpos
                let vloc_v1_160
                let zero_value_for_type_t_uint8_59 := zero_value_for_split_t_uint8()
                vloc_v1_160 := zero_value_for_type_t_uint8_59
                let vloc_v2_163
                let zero_value_for_type_t_uint8_60 := zero_value_for_split_t_uint8()
                vloc_v2_163 := zero_value_for_type_t_uint8_60
                let vloc_somebytes_166
                let zero_value_for_type_t_bytes32_61 := zero_value_for_split_t_bytes32()
                vloc_somebytes_166 := zero_value_for_type_t_bytes32_61
                let expr_171 := 0x01
                let _62 := convert_t_rational_1_by_1_to_t_uint256(expr_171)
                let _63_mpos := vloc_ints_152_mpos
                let expr_168_mpos := _63_mpos
                let expr_169 := 0x00
                let _64 := _62
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_168_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_169)), _64)
                let expr_172 := _62
                let expr_177 := 0x02
                let _65 := convert_t_rational_2_by_1_to_t_uint256(expr_177)
                let _66_mpos := vloc_ints_152_mpos
                let expr_174_mpos := _66_mpos
                let expr_175 := 0x01
                let _67 := _65
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_174_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_175)), _67)
                let expr_178 := _65
                let expr_183 := 0x03
                let _68 := convert_t_rational_3_by_1_to_t_uint256(expr_183)
                let _69_mpos := vloc_ints_152_mpos
                let expr_180_mpos := _69_mpos
                let expr_181 := 0x02
                let _70 := _68
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_180_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_181)), _70)
                let expr_184 := _68
                let expr_189 := 0x04
                let _71 := convert_t_rational_4_by_1_to_t_uint256(expr_189)
                let _72_mpos := vloc_ints_152_mpos
                let expr_186_mpos := _72_mpos
                let expr_187 := 0x03
                let _73 := _71
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_186_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_187)), _73)
                let expr_190 := _71
                let expr_195 := 0x05
                let _74 := convert_t_rational_5_by_1_to_t_uint256(expr_195)
                let _75_mpos := vloc_ints_152_mpos
                let expr_192_mpos := _75_mpos
                let expr_193 := 0x04
                let _76 := _74
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_192_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_193)), _76)
                let expr_196 := _74
                let expr_201 := 0x06
                let _77 := convert_t_rational_6_by_1_to_t_uint256(expr_201)
                let _78_mpos := vloc_ints_152_mpos
                let expr_198_mpos := _78_mpos
                let expr_199 := 0x05
                let _79 := _77
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_198_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_199)), _79)
                let expr_202 := _77
                let expr_207 := 0x07
                let _80 := convert_t_rational_7_by_1_to_t_uint256(expr_207)
                let _81_mpos := vloc_ints_152_mpos
                let expr_204_mpos := _81_mpos
                let expr_205 := 0x06
                let _82 := _80
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_204_mpos, convert_t_rational_6_by_1_to_t_uint256(expr_205)), _82)
                let expr_208 := _80
                let expr_213 := 0x08
                let _83 := convert_t_rational_8_by_1_to_t_uint256(expr_213)
                let _84_mpos := vloc_ints_152_mpos
                let expr_210_mpos := _84_mpos
                let expr_211 := 0x07
                let _85 := _83
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_210_mpos, convert_t_rational_7_by_1_to_t_uint256(expr_211)), _85)
                let expr_214 := _83
                let expr_219 := 0x09
                let _86 := convert_t_rational_9_by_1_to_t_uint256(expr_219)
                let _87_mpos := vloc_ints_152_mpos
                let expr_216_mpos := _87_mpos
                let expr_217 := 0x08
                let _88 := _86
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_216_mpos, convert_t_rational_8_by_1_to_t_uint256(expr_217)), _88)
                let expr_220 := _86
                let expr_225 := 0x0a
                let _89 := convert_t_rational_10_by_1_to_t_uint256(expr_225)
                let _90_mpos := vloc_ints_152_mpos
                let expr_222_mpos := _90_mpos
                let expr_223 := 0x09
                let _91 := _89
                write_to_memory_t_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_222_mpos, convert_t_rational_9_by_1_to_t_uint256(expr_223)), _91)
                let expr_226 := _89
                let expr_229 := 0x0b
                let _92 := convert_t_rational_11_by_1_to_t_uint8(expr_229)
                vloc_v1_160 := _92
                let expr_230 := _92
                let expr_233 := 0x0c
                let _93 := convert_t_rational_12_by_1_to_t_uint8(expr_233)
                vloc_v2_163 := _93
                let expr_234 := _93
                let _94 := vloc_somebytes_166
                let expr_239 := _94
                let _95_mpos := vloc_b_130_mpos
                let expr_236_mpos := _95_mpos
                let expr_237 := 0x00
                let _96 := expr_239
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_236_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_237)), _96)
                let expr_240 := expr_239
                let _97 := vloc_somebytes_166
                let expr_245 := _97
                let _98_mpos := vloc_b_130_mpos
                let expr_242_mpos := _98_mpos
                let expr_243 := 0x01
                let _99 := expr_245
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_242_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_243)), _99)
                let expr_246 := expr_245
                let _100 := vloc_somebytes_166
                let expr_251 := _100
                let _101_mpos := vloc_b_130_mpos
                let expr_248_mpos := _101_mpos
                let expr_249 := 0x02
                let _102 := expr_251
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_248_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_249)), _102)
                let expr_252 := expr_251
                let _103 := vloc_somebytes_166
                let expr_257 := _103
                let _104_mpos := vloc_b_130_mpos
                let expr_254_mpos := _104_mpos
                let expr_255 := 0x03
                let _105 := expr_257
                write_to_memory_t_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_254_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_255)), _105)
                let expr_258 := expr_257
                let expr_263 := 0xdc04977a2078c8ffdf086d618d1f961b6c541111
                let _106 := convert_t_address_payable_to_t_address(expr_263)
                let _107_mpos := vloc_addrs_141_mpos
                let expr_260_mpos := _107_mpos
                let expr_261 := 0x00
                let _108 := _106
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_260_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_261)), _108)
                let expr_264 := _106
                let expr_269 := 0xdc04977a2078c8ffdf086d618d1f961b6c542222
                let _109 := convert_t_address_payable_to_t_address(expr_269)
                let _110_mpos := vloc_addrs_141_mpos
                let expr_266_mpos := _110_mpos
                let expr_267 := 0x01
                let _111 := _109
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_266_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_267)), _111)
                let expr_270 := _109
                let expr_275 := 0xdc04977a2078c8ffdf086d618d1f961b6c543333
                let _112 := convert_t_address_payable_to_t_address(expr_275)
                let _113_mpos := vloc_addrs_141_mpos
                let expr_272_mpos := _113_mpos
                let expr_273 := 0x02
                let _114 := _112
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_272_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_273)), _114)
                let expr_276 := _112
                let expr_281 := 0xdc04977a2078c8ffdf086d618d1f961b6c544444
                let _115 := convert_t_address_payable_to_t_address(expr_281)
                let _116_mpos := vloc_addrs_141_mpos
                let expr_278_mpos := _116_mpos
                let expr_279 := 0x03
                let _117 := _115
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_278_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_279)), _117)
                let expr_282 := _115
                let expr_287 := 0xdc04977a2078c8ffdf086d618d1f961b6c545555
                let _118 := convert_t_address_payable_to_t_address(expr_287)
                let _119_mpos := vloc_addrs_141_mpos
                let expr_284_mpos := _119_mpos
                let expr_285 := 0x04
                let _120 := _118
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_284_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_285)), _120)
                let expr_288 := _118
                let expr_293 := 0xdc04977a2078c8ffdf086d618d1f961b6c546666
                let _121 := convert_t_address_payable_to_t_address(expr_293)
                let _122_mpos := vloc_addrs_141_mpos
                let expr_290_mpos := _122_mpos
                let expr_291 := 0x05
                let _123 := _121
                write_to_memory_t_address(memory_array_index_access_t_array$_t_address_$dyn_memory_ptr(expr_290_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_291)), _123)
                let expr_294 := _121
                let expr_296_functionIdentifier := 121
                let _124 := vloc__callee_123
                let expr_297 := _124
                let _125 := vloc_v1_160
                let expr_298 := _125
                let _126 := vloc_v2_163
                let expr_299 := _126
                let _127_mpos := vloc_ints_152_mpos
                let expr_300_mpos := _127_mpos
                let _128_mpos := vloc_addrs_141_mpos
                let expr_301_mpos := _128_mpos
                let _129_mpos := vloc_b_130_mpos
                let expr_302_mpos := _129_mpos
                fun_dtrade_121(expr_297, expr_298, expr_299, expr_300_mpos, expr_301_mpos, expr_302_mpos)

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

