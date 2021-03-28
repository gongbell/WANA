/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Paramount_156" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Paramount_156()

        codecopy(0, dataoffset("Paramount_156_deployed"), datasize("Paramount_156_deployed"))

        return(0, datasize("Paramount_156_deployed"))

        function checked_div_t_uint256(x, y) -> r {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)
            if iszero(y) { panic_error() }

            r := div(x, y)
        }

        function checked_exp_t_rational_10_by_1_t_uint256(exponent) -> power {
            exponent := cleanup_t_uint256(exponent)

            if gt(exponent, 77) { panic_error() }

            power := exp(10, exponent)
        }

        function cleanup_from_storage_t_address_payable(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_from_storage_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_Paramount_156() {

            let expr_8 := 0x12
            update_storage_value_offset_0t_rational_18_by_1_to_t_uint256(0x03, expr_8)
            let expr_11 := 0x0a
            let _1 := read_from_storage_split_offset_0_t_uint256(0x03)
            let expr_12 := _1
            let _2 := convert_t_rational_10_by_1_to_t_uint256(expr_11)
            let expr_13 := checked_exp_t_rational_10_by_1_t_uint256(expr_12)
            let expr_14 := 0x64
            let expr_15 := checked_div_t_uint256(expr_13, convert_t_rational_100_by_1_to_t_uint256(expr_14))

            update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_15)
            let _3 := read_from_storage_split_offset_0_t_uint256(0x04)
            let expr_18 := _3
            update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_18)
            let expr_21 := 0xf0
            update_storage_value_offset_0t_rational_240_by_1_to_t_uint256(0x06, expr_21)

            let expr_27 := caller()
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_27)
            let expr_28 := expr_27
            let _4 := read_from_storage_split_offset_0_t_address_payable(0x00)
            let expr_31 := _4
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_31)
            let expr_32 := expr_31
            let expr_36 := number()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_36)
            let expr_37 := expr_36

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_18_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_rational_240_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
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

        function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
            value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
        }

        function panic_error() {
            invalid()
        }

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
            value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

        }

        function read_from_storage_split_offset_0_t_uint256(slot) -> value {
            value := extract_from_storage_value_offset_0t_uint256(sload(slot))

        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_right_0_unsigned(value) -> newValue {
            newValue :=

            shr(0, value)

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

        function update_storage_value_offset_0t_rational_18_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_18_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_rational_240_by_1_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_rational_240_by_1_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "Paramount_156_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0fbe333a
                {
                    // getLastBidder()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getLastBidder_123()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7f1ecfe0
                {
                    // getCurrentBid()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getCurrentBid_131()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbee066a8
                {
                    // blocksUntilWin()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_blocksUntilWin_155()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xbfa814b5
                {
                    // func()

                    abi_decode_tuple_(4, calldatasize())
                    fun_func_115()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

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

            function checked_div_t_uint256(x, y) -> r {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if iszero(y) { panic_error() }

                r := div(x, y)
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

            function convert_t_address_payable_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_contract$_Paramount_$156_to_t_address(value) -> converted {
                converted := convert_t_contract$_Paramount_$156_to_t_uint160(value)
            }

            function convert_t_contract$_Paramount_$156_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_20_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
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

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_blocksUntilWin_155() -> vloc__134 {
                let zero_value_for_type_t_uint256_20 := zero_value_for_split_t_uint256()
                vloc__134 := zero_value_for_type_t_uint256_20

                let _21 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_136 := _21
                let _22 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_137 := _22
                let expr_138 := checked_add_t_uint256(expr_136, expr_137)

                let expr_140 := number()
                let expr_141 := gt(cleanup_t_uint256(expr_138), cleanup_t_uint256(expr_140))
                switch expr_141
                case 0 {
                    let expr_150 := 0x00
                    vloc__134 := convert_t_rational_0_by_1_to_t_uint256(expr_150)
                    leave
                }
                default {
                    let _23 := read_from_storage_split_offset_0_t_uint256(0x02)
                    let expr_142 := _23
                    let _24 := read_from_storage_split_offset_0_t_uint256(0x06)
                    let expr_143 := _24
                    let expr_144 := checked_add_t_uint256(expr_142, expr_143)

                    let expr_146 := number()
                    let expr_147 := checked_sub_t_uint256(expr_144, expr_146)

                    vloc__134 := expr_147
                    leave
                }

            }

            function fun_func_115() {

                let _1 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_43 := _1
                let _2 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_44 := _2
                let expr_45 := checked_add_t_uint256(expr_43, expr_44)

                let expr_47 := number()
                let expr_48 := iszero(gt(cleanup_t_uint256(expr_45), cleanup_t_uint256(expr_47)))
                switch expr_48
                case 0 {
                    let expr_75 := callvalue()
                    let _3 := read_from_storage_split_offset_0_t_uint256(0x05)
                    let expr_76 := _3
                    let expr_77 := iszero(lt(cleanup_t_uint256(expr_75), cleanup_t_uint256(expr_76)))
                    switch expr_77
                    case 0 {
                        let _4 := read_from_storage_split_offset_0_t_address_payable(0x00)
                        let expr_104 := _4
                        let expr_106_address := convert_t_address_payable_to_t_address(expr_104)
                        let expr_108 := callvalue()

                        let _5 := 0
                        if iszero(expr_108) { _5 := 2300 }
                        let _6 := call(_5, expr_106_address, expr_108, 0, 0, 0, 0)

                        if iszero(_6) { revert_forward_1() }

                    }
                    default {
                        let _7 := read_from_storage_split_offset_0_t_address_payable(0x00)
                        let expr_78 := _7
                        let expr_80_address := convert_t_address_payable_to_t_address(expr_78)
                        let expr_82 := callvalue()
                        let expr_83 := 0x14
                        let expr_84 := checked_div_t_uint256(expr_82, convert_t_rational_20_by_1_to_t_uint256(expr_83))

                        let _8 := 0
                        if iszero(expr_84) { _8 := 2300 }
                        let _9 := call(_8, expr_80_address, expr_84, 0, 0, 0, 0)

                        if iszero(_9) { revert_forward_1() }

                        let expr_89 := caller()
                        update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_89)
                        let expr_90 := expr_89
                        let expr_94 := number()
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_94)
                        let expr_95 := expr_94
                        let _10 := read_from_storage_split_offset_0_t_uint256(0x05)
                        let expr_98 := _10
                        let _11 := read_from_storage_split_offset_0_t_uint256(0x04)
                        let expr_99 := _11
                        let expr_100 := checked_add_t_uint256(expr_98, expr_99)

                        update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_100)
                        let expr_101 := expr_100
                    }
                }
                default {
                    let _12 := read_from_storage_split_offset_0_t_address_payable(0x01)
                    let expr_49 := _12
                    let expr_51_address := convert_t_address_payable_to_t_address(expr_49)
                    let expr_54_address := address()
                    let expr_55 := convert_t_contract$_Paramount_$156_to_t_address(expr_54_address)
                    let expr_56 := balance(expr_55)

                    let _13 := 0
                    if iszero(expr_56) { _13 := 2300 }
                    let _14 := call(_13, expr_51_address, expr_56, 0, 0, 0, 0)

                    if iszero(_14) { revert_forward_1() }

                    let _15 := read_from_storage_split_offset_0_t_uint256(0x04)
                    let expr_60 := _15
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x05, expr_60)
                    let expr_61 := expr_60
                    let expr_65 := number()
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_65)
                    let expr_66 := expr_65
                    let expr_70 := caller()
                    update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_70)
                    let expr_71 := expr_70
                }

            }

            function fun_getCurrentBid_131() -> vloc__126 {
                let zero_value_for_type_t_uint256_18 := zero_value_for_split_t_uint256()
                vloc__126 := zero_value_for_type_t_uint256_18

                let _19 := read_from_storage_split_offset_0_t_uint256(0x05)
                let expr_128 := _19
                vloc__126 := expr_128
                leave

            }

            function fun_getLastBidder_123() -> vloc__118 {
                let zero_value_for_type_t_address_16 := zero_value_for_split_t_address()
                vloc__118 := zero_value_for_type_t_address_16

                let _17 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_120 := _17
                vloc__118 := convert_t_address_payable_to_t_address(expr_120)
                leave

            }

            function panic_error() {
                invalid()
            }

            function prepare_store_t_address_payable(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
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

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

