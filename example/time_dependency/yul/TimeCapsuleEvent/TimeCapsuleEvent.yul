/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TimeCapsuleEvent_150" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_TimeCapsuleEvent_150()

        codecopy(0, dataoffset("TimeCapsuleEvent_150_deployed"), datasize("TimeCapsuleEvent_150_deployed"))

        return(0, datasize("TimeCapsuleEvent_150_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_Ownable_32() {

            let expr_8 := caller()
            let _1 := convert_t_address_payable_to_t_address(expr_8)
            update_storage_value_offset_0t_address_to_t_address(0x00, _1)
            let expr_9 := _1

        }

        function constructor_TimeCapsuleEvent_150() {

            constructor_Ownable_32()

        }

        function convert_t_address_payable_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_address(value) -> converted {
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

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

    }
    object "TimeCapsuleEvent_150_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x2e1a7d4d
                {
                    // withdraw(uint256)

                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_withdraw_132(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x41c0e1b5
                {
                    // kill()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_kill_149()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4fb2e45d
                {
                    // transferOwner(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_transferOwner_31(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb4a99a4e
                {
                    // Owner()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_Owner_3()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb7f9c4f6
                {
                    // initCapsule(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_initCapsule_55(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_62()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd0e30db0
                {
                    // deposit()

                    abi_decode_tuple_(4, calldatasize())
                    fun_deposit_90()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xec8cb281
                {
                    // openDate()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_openDate_40()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfc7e286d
                {
                    // deposits(address)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0 :=  getter_fun_deposits_38(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
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

            function convert_t_contract$_Ownable_$32_to_t_address(value) -> converted {
                converted := convert_t_contract$_Ownable_$32_to_t_uint160(value)
            }

            function convert_t_contract$_Ownable_$32_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_TimeCapsuleEvent_$150_to_t_address(value) -> converted {
                converted := convert_t_contract$_TimeCapsuleEvent_$150_to_t_uint160(value)
            }

            function convert_t_contract$_TimeCapsuleEvent_$150_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_500000000000000000_by_1_to_t_uint256(value) -> converted {
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

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_deposit_90() {

                let expr_72 := callvalue()
                let expr_73 := 0x06f05b59d3b20000
                let expr_74 := iszero(lt(cleanup_t_uint256(expr_72), convert_t_rational_500000000000000000_by_1_to_t_uint256(expr_73)))
                switch expr_74
                case 0 {
                    let expr_86 := timestamp()
                }
                default {
                    let expr_80 := callvalue()
                    let _4 := 0x01
                    let expr_75 := _4
                    let expr_77 := caller()
                    let _5 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_75,expr_77)
                    let _6 := read_from_storage_split_offset_0_t_uint256(_5)
                    expr_80 := checked_add_t_uint256(_6, expr_80)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_5, expr_80)
                    let expr_81 := expr_80
                }

            }

            function fun_func_62() {

                let expr_58_functionIdentifier := 90
                fun_deposit_90()

            }

            function fun_initCapsule_55(vloc_open_42) {

                let expr_47 := caller()
                let _2 := convert_t_address_payable_to_t_address(expr_47)
                update_storage_value_offset_0t_address_to_t_address(0x00, _2)
                let expr_48 := _2
                let _3 := vloc_open_42
                let expr_51 := _3
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_51)
                let expr_52 := expr_51

            }

            function fun_kill_149() {

                let expr_137_address := address()
                let expr_138 := convert_t_contract$_TimeCapsuleEvent_$150_to_t_address(expr_137_address)
                let expr_139 := balance(expr_138)
                let expr_140 := 0x00
                let expr_141 := eq(cleanup_t_uint256(expr_139), convert_t_rational_0_by_1_to_t_uint256(expr_140))
                if expr_141 {
                    let expr_144 := caller()
                    selfdestruct(expr_144)
                }

            }

            function fun_transferOwner_31(vloc__owner_14) {

                let expr_19_address := address()
                let expr_20 := convert_t_contract$_Ownable_$32_to_t_address(expr_19_address)
                let expr_21 := balance(expr_20)
                let expr_22 := 0x00
                let expr_23 := eq(cleanup_t_uint256(expr_21), convert_t_rational_0_by_1_to_t_uint256(expr_22))
                if expr_23 {
                    let _1 := vloc__owner_14
                    let expr_25 := _1
                    update_storage_value_offset_0t_address_to_t_address(0x00, expr_25)
                    let expr_26 := expr_25
                }

            }

            function fun_withdraw_132(vloc_amount_98) {

                let expr_102 := timestamp()
                let _7 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_103 := _7
                let expr_104 := iszero(lt(cleanup_t_uint256(expr_102), cleanup_t_uint256(expr_103)))
                if expr_104 {
                    let _8 := 0x01
                    let expr_107 := _8
                    let expr_109 := caller()
                    let _9 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_107,expr_109)
                    let _10 := read_from_storage_split_offset_0_t_uint256(_9)
                    let expr_110 := _10
                    let vloc_max_106 := expr_110
                    let _11 := vloc_amount_98
                    let expr_112 := _11
                    let _12 := vloc_max_106
                    let expr_113 := _12
                    let expr_114 := iszero(gt(cleanup_t_uint256(expr_112), cleanup_t_uint256(expr_113)))
                    let expr_118 := expr_114
                    if expr_118 {
                        let _13 := vloc_max_106
                        let expr_115 := _13
                        let expr_116 := 0x00
                        let expr_117 := gt(cleanup_t_uint256(expr_115), convert_t_rational_0_by_1_to_t_uint256(expr_116))
                        expr_118 := expr_117
                    }
                    if expr_118 {
                        let expr_122 := caller()
                        let expr_123_address := convert_t_address_payable_to_t_address(expr_122)
                        let _14 := vloc_amount_98
                        let expr_124 := _14

                        let _15 := 0
                        if iszero(expr_124) { _15 := 2300 }
                        let expr_125 := call(_15, expr_123_address, expr_124, 0, 0, 0, 0)

                    }
                }

            }

            function getter_fun_Owner_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_deposits_38(key_0) -> ret {

                let slot := 1
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot, key_0)

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_openDate_40() -> ret {

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

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

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

        }

    }

}

