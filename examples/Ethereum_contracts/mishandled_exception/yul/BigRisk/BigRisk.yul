/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "BigRisk_130" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_BigRisk_130()

        codecopy(0, dataoffset("BigRisk_130_deployed"), datasize("BigRisk_130_deployed"))

        return(0, datasize("BigRisk_130_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_BigRisk_130() {

            let expr_10 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x01, expr_10)
            let expr_15 := 0x00
            update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(0x03, expr_15)

            let expr_23 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_23)
            update_storage_value_offset_0t_address_to_t_address(0x04, _1)
            let expr_24 := _1

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
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

        function prepare_store_t_uint256(value) -> ret {
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

        function update_storage_value_offset_0t_rational_0_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_0_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "BigRisk_130_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x13af4035
                {
                    // setOwner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setOwner_129(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8da5cb5b
                {
                    // owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_owner_18()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9003adfe
                {
                    // collectedFees()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_collectedFees_13()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa2f9eac6
                {
                    // persons(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1 :=  getter_fun_persons_8(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable_t_uint256__to_t_address_payable_t_uint256__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa60f3588
                {
                    // payoutIdx()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_payoutIdx_11()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb69ef8a8
                {
                    // balance()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_balance_16()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_func_34()
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

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            35function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
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

            40function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_payable_t_uint256__to_t_address_payable_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            45function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            function allocate_memory_struct_t_struct$_Person_$5_storage_ptr() -> memPtr {
                memPtr := allocateMemory(64)
            }

            function array_dataslot_t_array$_t_struct$_Person_$5_storage_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_struct$_Person_$5_storage_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_push_zero_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array) -> slot, offset {
                let oldLen := array_length_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error() }
                sstore(array, add(oldLen, 1))
                slot, offset := storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array, oldLen)
            }
            50function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error() }

                sum := add(x, y)
            }

            51function checked_mod_t_uint256(x, y) -> r {
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

            55function cleanup_from_storage_t_address_payable(value) -> cleaned {
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

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            60function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            64function convert_t_rational_100000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            65function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
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

            70function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            74function fun_enter_119() {

                let vloc_amount_38
                let zero_value_for_type_t_uint256_1 := zero_value_for_split_t_uint256()
                vloc_amount_38 := zero_value_for_type_t_uint256_1
                let expr_42 := callvalue()
                vloc_amount_38 := expr_42
                let expr_43 := expr_42
                let _2 := vloc_amount_38
                let expr_45 := _2
                let expr_46 := 0x056bc75e2d63100000
                let expr_47 := checked_mod_t_uint256(expr_45, convert_t_rational_100000000000000000000_by_1_to_t_uint256(expr_46))

                let expr_48 := 0x00
                let expr_49 := iszero(eq(cleanup_t_uint256(expr_47), convert_t_rational_0_by_1_to_t_uint256(expr_48)))
                if expr_49 {
                    let expr_53 := caller()
                    let expr_54_address := convert_t_address_payable_to_t_address(expr_53)
                    let _3 := vloc_amount_38
                    let expr_55 := _3

                    let _4 := 0
                    if iszero(expr_55) { _4 := 2300 }
                    let expr_56 := call(_4, expr_54_address, expr_55, 0, 0, 0, 0)

                    leave
                }
                let _5_slot := 0x00
                let expr_63_slot := _5_slot
                let expr_64 := array_length_t_array$_t_struct$_Person_$5_storage_$dyn_storage(expr_63_slot)
                let vloc_idx_62 := expr_64
                let expr_70 := caller()
                let _6 := vloc_amount_38
                let expr_71 := _6
                let expr_72_mpos := allocate_memory_struct_t_struct$_Person_$5_storage_ptr()
                write_to_memory_t_address_payable(add(expr_72_mpos, 0), expr_70)
                write_to_memory_t_uint256(add(expr_72_mpos, 32), expr_71)
                let vloc_temp_67_mpos := expr_72_mpos
                let _7_slot := 0x00
                let expr_74_slot := _7_slot
                let expr_76_slot := expr_74_slot
                let _8, _9 := array_push_zero_t_array$_t_struct$_Person_$5_storage_$dyn_storage(expr_76_slot)
                let _10_slot := _8
                let expr_77_slot := _10_slot
                let _11 := vloc_amount_38
                let expr_80 := _11
                let _12 := read_from_storage_split_offset_0_t_uint256(0x03)
                expr_80 := checked_add_t_uint256(_12, expr_80)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_80)
                let expr_81 := expr_80
                for {
                    } 1 {
                }
                {
                    let _13 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let expr_83 := _13
                    let _14_slot := 0x00
                    let expr_84_slot := _14_slot
                    let _15 := read_from_storage_split_offset_0_t_uint256(0x01)
                    let expr_85 := _15

                    let _16, _17 := storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(expr_84_slot, expr_85)
                    let _18_slot := _16
                    let expr_86_slot := _18_slot
                    let _19 := add(expr_86_slot, 1)
                    let _20 := read_from_storage_split_offset_0_t_uint256(_19)
                    let expr_87 := _20
                    let expr_88 := 0x02
                    let expr_89 := checked_mul_t_uint256(expr_87, convert_t_rational_2_by_1_to_t_uint256(expr_88))

                    let expr_90 := iszero(lt(cleanup_t_uint256(expr_83), cleanup_t_uint256(expr_89)))
                    if iszero(expr_90) { break }
                    let _21_slot := 0x00
                    let expr_93_slot := _21_slot
                    let _22 := read_from_storage_split_offset_0_t_uint256(0x01)
                    let expr_94 := _22

                    let _23, _24 := storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(expr_93_slot, expr_94)
                    let _25_slot := _23
                    let expr_95_slot := _25_slot
                    let _26 := add(expr_95_slot, 1)
                    let _27 := read_from_storage_split_offset_0_t_uint256(_26)
                    let expr_96 := _27
                    let expr_97 := 0x02
                    let expr_98 := checked_mul_t_uint256(expr_96, convert_t_rational_2_by_1_to_t_uint256(expr_97))

                    let vloc_transactionAmount_92 := expr_98
                    let _28_slot := 0x00
                    let expr_100_slot := _28_slot
                    let _29 := read_from_storage_split_offset_0_t_uint256(0x01)
                    let expr_101 := _29

                    let _30, _31 := storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(expr_100_slot, expr_101)
                    let _32_slot := _30
                    let expr_102_slot := _32_slot
                    let _33 := add(expr_102_slot, 0)
                    let _34 := read_from_storage_split_offset_0_t_address_payable(_33)
                    let expr_103 := _34
                    let expr_104_address := convert_t_address_payable_to_t_address(expr_103)
                    let _35 := vloc_transactionAmount_92
                    let expr_105 := _35

                    let _36 := 0
                    if iszero(expr_105) { _36 := 2300 }
                    let expr_106 := call(_36, expr_104_address, expr_105, 0, 0, 0, 0)

                    let _37 := vloc_transactionAmount_92
                    let expr_109 := _37
                    let _38 := read_from_storage_split_offset_0_t_uint256(0x03)
                    expr_109 := checked_sub_t_uint256(_38, expr_109)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_109)
                    let expr_110 := expr_109
                    let expr_113 := 0x01
                    let _39 := convert_t_rational_1_by_1_to_t_uint256(expr_113)
                    let _40 := read_from_storage_split_offset_0_t_uint256(0x01)
                    _39 := checked_add_t_uint256(_40, _39)
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _39)
                    let expr_114 := _39
                }

            }

            75function fun_func_34() {

                let expr_30_functionIdentifier := 119
                fun_enter_119()

            }

            function fun_setOwner_129(vloc__owner_121) {

                let _41 := vloc__owner_121
                let expr_125 := _41
                update_storage_value_offset_0t_address_to_t_address(0x04, expr_125)
                let expr_126 := expr_125

            }

            function getter_fun_balance_16() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_collectedFees_13() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_owner_18() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_payoutIdx_11() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_persons_8(key_0) -> ret_0, ret_1 {

                let slot := 0
                let offset := 0

                if iszero(lt(key_0, array_length_t_array$_t_struct$_Person_$5_storage_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(slot, key_0)

                ret_0 := read_from_storage_split_offset_0_t_address_payable(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

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

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
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

            function storage_array_index_access_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error() }

                let dataArea := array_dataslot_t_array$_t_struct$_Person_$5_storage_$dyn_storage(array)
                slot := add(dataArea, mul(index, 2))
                offset := 0

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

            function write_to_memory_t_address_payable(memPtr, value) {
                mstore(memPtr, cleanup_t_address_payable(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            103function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

