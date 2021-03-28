/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "AFactory_90" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_AFactory_90()

        codecopy(0, dataoffset("AFactory_90_deployed"), datasize("AFactory_90_deployed"))

        return(0, datasize("AFactory_90_deployed"))

        function abi_encode_tuple__to__fromStack(headStart ) -> tail {
            tail := add(headStart, 0)

        }

        function allocateTemporaryMemory() -> memPtr {
            memPtr := mload(64)
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_AFactory_90() {

            constructor_CloneFactory_49()

            let _1 := allocateTemporaryMemory()
            let _2 := add(_1, datasize("Code_52"))
            if or(gt(_2, 0xffffffffffffffff), lt(_2, _1)) { panic_error() }
            datacopy(_1, dataoffset("Code_52"), datasize("Code_52"))
            _2 := abi_encode_tuple__to__fromStack(_2)

            let expr_64_address := create(0, _1, sub(_2, _1))

            releaseTemporaryMemory()
            update_storage_value_offset_0t_contract$_Code_$52_to_t_contract$_Code_$52(0x00, expr_64_address)
            let expr_65_address := expr_64_address

        }

        function constructor_CloneFactory_49() {

        }

        function convert_t_contract$_Code_$52_to_t_contract$_Code_$52(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function panic_error() {
            invalid()
        }

        function prepare_store_t_contract$_Code_$52(value) -> ret {
            ret := value
        }

        function releaseTemporaryMemory() {
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

        function update_storage_value_offset_0t_contract$_Code_$52_to_t_contract$_Code_$52(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_Code_$52_to_t_contract$_Code_$52(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_Code_$52(convertedValue_0)))
        }

    }
    object "AFactory_90_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x6439437e
                {
                    // cloneIt()

                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_cloneIt_89()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_Code_$52__to_t_contract$_Code_$52__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x6f2ddd93
                {
                    // template()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_template_56()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_Code_$52__to_t_contract$_Code_$52__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x71c52f02
                {
                    // cloneAddress()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_cloneAddress_58()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_contract$_Code_$52__to_t_contract$_Code_$52__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_encode_t_contract$_Code_$52_to_t_address_fromStack(value, pos) {
                mstore(pos, convert_t_contract$_Code_$52_to_t_address(value))
            }

            function abi_encode_tuple_t_contract$_Code_$52__to_t_contract$_Code_$52__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_contract$_Code_$52_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            function cleanup_from_storage_t_contract$_Code_$52(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_to_t_bytes20(value) -> converted {
                converted := convert_t_uint160_to_t_bytes20(value)
            }

            function convert_t_address_to_t_contract$_Code_$52(value) -> converted {
                converted := convert_t_uint160_to_t_contract$_Code_$52(value)
            }

            function convert_t_contract$_Code_$52_to_t_address(value) -> converted {
                converted := convert_t_contract$_Code_$52_to_t_uint160(value)
            }

            function convert_t_contract$_Code_$52_to_t_contract$_Code_$52(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_Code_$52_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_20_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_26_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_stringliteral_6cc49b73ed6d42590b06ac2053806789be0916afda418f9d2176bbae8015a321_to_t_bytes_memory_ptr() -> converted {
                converted := allocateMemory(96)
                mstore(converted, 63)

                mstore(add(converted, 32), 0x600034603b57603080600f833981f36000368180378080368173bebebebebebe)

                mstore(add(converted, 64), 0xbebebebebebebebebebebebebebe5af43d82803e15602c573d90f35b3d90fd00)

            }

            function convert_t_uint160_to_t_bytes20(value) -> converted {
                converted := shift_left_96(cleanup_t_uint160(value))
            }

            function convert_t_uint160_to_t_contract$_Code_$52(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_dynamict_contract$_Code_$52(slot_value, offset) -> value {
                value := cleanup_from_storage_t_contract$_Code_$52(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_Code_$52(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_Code_$52(shift_right_0_unsigned(slot_value))
            }

            function fun_cloneIt_89() -> vloc__cloneAddress_71_address {
                let zero_value_for_type_t_contract$_Code_$52_1_address := zero_value_for_split_t_contract$_Code_$52()
                vloc__cloneAddress_71_address := zero_value_for_type_t_contract$_Code_$52_1_address

                let expr_75_functionIdentifier := 48
                let _2_address := read_from_storage_split_offset_0_t_contract$_Code_$52(0x00)
                let expr_78_address := _2_address
                let expr_79 := convert_t_contract$_Code_$52_to_t_address(expr_78_address)
                let expr_80 := fun_createClone_48(expr_79)
                let expr_81_address := convert_t_address_to_t_contract$_Code_$52(expr_80)
                update_storage_value_offset_0t_contract$_Code_$52_to_t_contract$_Code_$52(0x01, expr_81_address)
                let expr_82_address := expr_81_address
                let _3_address := read_from_storage_split_offset_0_t_contract$_Code_$52(0x01)
                let expr_85_address := _3_address
                vloc__cloneAddress_71_address := expr_85_address
                let expr_86_address := expr_85_address

            }

            function fun_createClone_48(vloc_target_8) -> vloc_result_11 {
                let zero_value_for_type_t_address_4 := zero_value_for_split_t_address()
                vloc_result_11 := zero_value_for_type_t_address_4

                let vloc_clone_14_mpos := convert_t_stringliteral_6cc49b73ed6d42590b06ac2053806789be0916afda418f9d2176bbae8015a321_to_t_bytes_memory_ptr()
                let _5 := vloc_target_8
                let expr_21 := _5
                let expr_22 := convert_t_address_to_t_bytes20(expr_21)
                let vloc_targetBytes_18 := expr_22
                for {
                    let expr_26 := 0x00
                    let vloc_i_25 := convert_t_rational_0_by_1_to_t_uint256(expr_26)
                    } 1 {
                    let _7 := vloc_i_25
                    let _6 := increment_t_uint256(_7)
                    vloc_i_25 := _6
                    let expr_32 := _7
                }
                {
                    let _8 := vloc_i_25
                    let expr_28 := _8
                    let expr_29 := 0x14
                    let expr_30 := lt(cleanup_t_uint256(expr_28), convert_t_rational_20_by_1_to_t_uint256(expr_29))
                    if iszero(expr_30) { break }
                    let _9 := vloc_targetBytes_18
                    let expr_39 := _9
                    let _10 := vloc_i_25
                    let expr_40 := _10
                    let _11 := expr_40

                    if iszero(lt(_11, 20)) { panic_error() }
                    let expr_41 := shift_left_248(byte(_11, expr_39))
                    let _12_mpos := vloc_clone_14_mpos
                    let expr_34_mpos := _12_mpos
                    let expr_35 := 0x1a
                    let _13 := vloc_i_25
                    let expr_36 := _13
                    let expr_37 := checked_add_t_uint256(convert_t_rational_26_by_1_to_t_uint256(expr_35), expr_36)

                    let _14 := expr_41
                    mstore8(memory_array_index_access_t_bytes_memory_ptr(expr_34_mpos, expr_37), byte(0, _14))
                    let expr_42 := expr_41
                }
                {
                    let usr$len := mload(vloc_clone_14_mpos)
                    let usr$data := add(vloc_clone_14_mpos, 0x20)
                    vloc_result_11 := create(0, usr$data, usr$len)
                }

            }

            function getter_fun_cloneAddress_58() -> ret_address {

                let slot := 1
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_Code_$52(slot, offset)

            }

            function getter_fun_template_56() -> ret_address {

                let slot := 0
                let offset := 0

                ret_address := read_from_storage_split_dynamic_t_contract$_Code_$52(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if gt(value, 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe) { panic_error() }
                ret := add(value, 1)
            }

            function memory_array_index_access_t_bytes_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_bytes_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 1)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_contract$_Code_$52(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_contract$_Code_$52(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_contract$_Code_$52(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_contract$_Code_$52(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_Code_$52(sload(slot))

            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_248(value) -> newValue {
                newValue :=

                shl(248, value)

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

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_contract$_Code_$52_to_t_contract$_Code_$52(slot, value_0) {
                let convertedValue_0 := convert_t_contract$_Code_$52_to_t_contract$_Code_$52(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_Code_$52(convertedValue_0)))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_contract$_Code_$52() -> ret {
                ret := 0
            }

        }

    }
    /*******************************************************
    *                       WARNING                       *
    *  Solidity to Yul compilation is still EXPERIMENTAL  *
    *       It can result in LOSS OF FUNDS or worse       *
    *                !USE AT YOUR OWN RISK!               *
    *******************************************************/

    object "Code_52" {
        code {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }

            constructor_Code_52()

            codecopy(0, dataoffset("Code_52_deployed"), datasize("Code_52_deployed"))

            return(0, datasize("Code_52_deployed"))

            function constructor_Code_52() {

            }

        }
        object "Code_52_deployed" {
            code {
                mstore(64, 128)

                if iszero(lt(calldatasize(), 4))
                {
                    let selector := shift_right_224_unsigned(calldataload(0))
                    switch selector

                    case 0x9c328fb3
                    {
                        // testVar()
                        if callvalue() { revert(0, 0) }
                        abi_decode_tuple_(4, calldatasize())
                        let ret_0 :=  getter_fun_testVar_51()
                        let memPos := allocateMemory(0)
                        let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                        return(memPos, sub(memEnd, memPos))
                    }

                    default {}
                }
                if iszero(calldatasize()) {  }
                revert(0, 0)

                function abi_decode_tuple_(headStart, dataEnd)   {
                    if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

                }

                function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                    mstore(pos, cleanup_t_uint256(value))
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

                function cleanup_from_storage_t_uint256(value) -> cleaned {
                    cleaned := value
                }

                function cleanup_t_uint256(value) -> cleaned {
                    cleaned := value
                }

                function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                    value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
                }

                function getter_fun_testVar_51() -> ret {

                    let slot := 0
                    let offset := 0

                    ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

                }

                function panic_error() {
                    invalid()
                }

                function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                    value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

                }

                function shift_right_224_unsigned(value) -> newValue {
                    newValue :=

                    shr(224, value)

                }

                function shift_right_unsigned_dynamic(bits, value) -> newValue {
                    newValue :=

                    shr(bits, value)

                }

            }

        }

    }

}

