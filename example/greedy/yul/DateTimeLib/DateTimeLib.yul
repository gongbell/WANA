/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "DateTimeLib_773" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("DateTimeLib_773_deployed"), datasize("DateTimeLib_773_deployed"))

        return(0, datasize("DateTimeLib_773_deployed"))

        function constructor_DateTimeLib_773() {

        }

    }
    object "DateTimeLib_773_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3e239e1a
                {
                    // getHour(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getHour_461(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4ac1ad78
                {
                    // getWeekday(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getWeekday_514(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x62ba9687
                {
                    // toTimestamp(uint16,uint8,uint8,uint8,uint8)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3, param_4 :=  abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8t_uint8(4, calldatasize())
                    let ret_0 :=  fun_toTimestamp_583(param_0, param_1, param_2, param_3, param_4)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x65c72840
                {
                    // getDay(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getDay_441(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x7f791833
                {
                    // toTimestamp(uint16,uint8,uint8,uint8)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3 :=  abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8(4, calldatasize())
                    let ret_0 :=  fun_toTimestamp_558(param_0, param_1, param_2, param_3)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8aa001fc
                {
                    // getSecond(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getSecond_494(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x8c8d98a0
                {
                    // toTimestamp(uint16,uint8,uint8)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_uint16t_uint8t_uint8(4, calldatasize())
                    let ret_0 :=  fun_toTimestamp_535(param_0, param_1, param_2)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9054bdec
                {
                    // toTimestamp(uint16,uint8,uint8,uint8,uint8,uint8)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2, param_3, param_4, param_5 :=  abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8t_uint8t_uint8(4, calldatasize())
                    let ret_0 :=  fun_toTimestamp_772(param_0, param_1, param_2, param_3, param_4, param_5)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x92d66313
                {
                    // getYear(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getYear_415(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint16__to_t_uint16__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa324ad24
                {
                    // getMonth(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getMonth_428(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6f0e577
                {
                    // isLeapYear(uint16)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint16(4, calldatasize())
                    let ret_0 :=  fun_isLeapYear_70(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb1999937
                {
                    // leapYearsBefore(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_leapYearsBefore_94(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xb238ad0e
                {
                    // getDaysInMonth(uint8,uint16)
                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint8t_uint16(4, calldatasize())
                    let ret_0 :=  fun_getDaysInMonth_164(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xfa93f883
                {
                    // getMinute(uint256)
                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_getMinute_479(param_0)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint8__to_t_uint8__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_uint16(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint16(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_t_uint8(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint8(value)
            }

            function abi_decode_tuple_t_uint16(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint16t_uint8t_uint8(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 64
                    value2 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8(headStart, dataEnd) -> value0, value1, value2, value3 {
                if slt(sub(dataEnd, headStart), 128) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
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
                    let offset := 96
                    value3 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8t_uint8(headStart, dataEnd) -> value0, value1, value2, value3, value4 {
                if slt(sub(dataEnd, headStart), 160) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
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
                    let offset := 96
                    value3 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 128
                    value4 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint16t_uint8t_uint8t_uint8t_uint8t_uint8(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5 {
                if slt(sub(dataEnd, headStart), 192) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
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
                    let offset := 96
                    value3 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 128
                    value4 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 160
                    value5 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint8t_uint16(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := 0
                    value0 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
                }

                {
                    let offset := 32
                    value1 := abi_decode_t_uint16(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint16_to_t_uint16_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint16(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint16__to_t_uint16__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint16_to_t_uint16_fromStack(value0,  add(headStart, 0))

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

            function allocate_and_zero_memory_array_t_array$_t_uint8_$12_memory_ptr(length) -> memPtr {
                memPtr := allocate_memory_array_t_array$_t_uint8_$12_memory_ptr(length)
                let dataStart := memPtr
                let dataSize := array_allocation_size_t_array$_t_uint8_$12_memory_ptr(length)

                zero_memory_chunk_t_uint8(dataStart, dataSize)
            }

            function allocate_and_zero_memory_struct_t_struct$__DateTime_$15_memory_ptr() -> memPtr {
                memPtr := allocate_memory_struct_t_struct$__DateTime_$15_memory_ptr()
                let offset := memPtr

                mstore(offset, zero_value_for_t_uint16())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

                mstore(offset, zero_value_for_t_uint8())
                offset := add(offset, 32)

            }

            function allocate_memory_array_t_array$_t_uint8_$12_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_array$_t_uint8_$12_memory_ptr(length)
                memPtr := allocateMemory(allocSize)

            }

            function allocate_memory_struct_t_struct$__DateTime_$15_memory_ptr() -> memPtr {
                memPtr := allocateMemory(224)
            }

            function array_allocation_size_t_array$_t_uint8_$12_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

            }

            function array_length_t_array$_t_uint8_$12_memory_ptr(value) -> length {

                length := 0x0c

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

            function checked_mod_t_uint16(x, y) -> r {
                x := cleanup_t_uint16(x)
                y := cleanup_t_uint16(y)
                if iszero(y) { panic_error() }
                r := mod(x, y)
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

            function checked_sub_t_uint16(x, y) -> diff {
                x := cleanup_t_uint16(x)
                y := cleanup_t_uint16(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function checked_sub_t_uint8(x, y) -> diff {
                x := cleanup_t_uint8(x)
                y := cleanup_t_uint8(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_uint16(value) -> cleaned {
                cleaned := and(value, 0xffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function constant_DAY_IN_SECONDS_18() -> ret {
                let expr_17 := 0x015180
                let _75 := convert_t_rational_86400_by_1_to_t_uint256(expr_17)

                ret := _75
            }

            function constant_HOUR_IN_SECONDS_27() -> ret {
                let expr_26 := 0x0e10
                let _216 := convert_t_rational_3600_by_1_to_t_uint256(expr_26)

                ret := _216
            }

            function constant_LEAP_YEAR_IN_SECONDS_24() -> ret {
                let expr_23 := 0x01e28500
                let _33 := convert_t_rational_31622400_by_1_to_t_uint256(expr_23)

                ret := _33
            }

            function constant_MINUTE_IN_SECONDS_30() -> ret {
                let expr_29 := 0x3c
                let _219 := convert_t_rational_60_by_1_to_t_uint256(expr_29)

                ret := _219
            }

            function constant_ORIGIN_YEAR_33() -> ret {
                let expr_32 := 0x07b2
                let _27 := convert_t_rational_1970_by_1_to_t_uint16(expr_32)

                ret := _27
            }

            function constant_YEAR_IN_SECONDS_21() -> ret {
                let expr_20 := 0x01e13380
                let _29 := convert_t_rational_31536000_by_1_to_t_uint256(expr_20)

                ret := _29
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

            function convert_t_rational_100_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_100_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_11_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_11_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_12_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_1970_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_1_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_1_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_24_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_28_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_29_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_30_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_31536000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_31622400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_31_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_3600_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_3_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_400_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_4_by_1_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_rational_4_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_4_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_60_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_6_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_6_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_7_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_7_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_86400_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_8_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_8_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_rational_9_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_9_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint16_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_uint256_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint16(value)
            }

            function convert_t_uint256_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint8_to_t_uint16(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function fun_getDay_441(vloc_timestamp_430) -> vloc__433 {
                let zero_value_for_type_t_uint8_122 := zero_value_for_split_t_uint8()
                vloc__433 := zero_value_for_type_t_uint8_122

                let expr_435_functionIdentifier := 329
                let _123 := vloc_timestamp_430
                let expr_436 := _123
                let expr_437_mpos := fun_parseTimestamp_329(expr_436)
                let _124 := add(expr_437_mpos, 64)
                let _125 := read_from_memoryt_uint8(_124)
                let expr_438 := _125
                vloc__433 := expr_438
                leave

            }

            function fun_getDaysInMonth_164(vloc_month_96, vloc_year_98) -> vloc__101 {
                let zero_value_for_type_t_uint8_11 := zero_value_for_split_t_uint8()
                vloc__101 := zero_value_for_type_t_uint8_11

                let _12 := vloc_month_96
                let expr_103 := _12
                let expr_104 := 0x01
                let expr_105 := eq(cleanup_t_uint8(expr_103), convert_t_rational_1_by_1_to_t_uint8(expr_104))
                let expr_109 := expr_105
                if iszero(expr_109) {
                    let _13 := vloc_month_96
                    let expr_106 := _13
                    let expr_107 := 0x03
                    let expr_108 := eq(cleanup_t_uint8(expr_106), convert_t_rational_3_by_1_to_t_uint8(expr_107))
                    expr_109 := expr_108
                }
                let expr_113 := expr_109
                if iszero(expr_113) {
                    let _14 := vloc_month_96
                    let expr_110 := _14
                    let expr_111 := 0x05
                    let expr_112 := eq(cleanup_t_uint8(expr_110), convert_t_rational_5_by_1_to_t_uint8(expr_111))
                    expr_113 := expr_112
                }
                let expr_117 := expr_113
                if iszero(expr_117) {
                    let _15 := vloc_month_96
                    let expr_114 := _15
                    let expr_115 := 0x07
                    let expr_116 := eq(cleanup_t_uint8(expr_114), convert_t_rational_7_by_1_to_t_uint8(expr_115))
                    expr_117 := expr_116
                }
                let expr_121 := expr_117
                if iszero(expr_121) {
                    let _16 := vloc_month_96
                    let expr_118 := _16
                    let expr_119 := 0x08
                    let expr_120 := eq(cleanup_t_uint8(expr_118), convert_t_rational_8_by_1_to_t_uint8(expr_119))
                    expr_121 := expr_120
                }
                let expr_125 := expr_121
                if iszero(expr_125) {
                    let _17 := vloc_month_96
                    let expr_122 := _17
                    let expr_123 := 0x0a
                    let expr_124 := eq(cleanup_t_uint8(expr_122), convert_t_rational_10_by_1_to_t_uint8(expr_123))
                    expr_125 := expr_124
                }
                let expr_129 := expr_125
                if iszero(expr_129) {
                    let _18 := vloc_month_96
                    let expr_126 := _18
                    let expr_127 := 0x0c
                    let expr_128 := eq(cleanup_t_uint8(expr_126), convert_t_rational_12_by_1_to_t_uint8(expr_127))
                    expr_129 := expr_128
                }
                switch expr_129
                case 0 {
                    let _19 := vloc_month_96
                    let expr_133 := _19
                    let expr_134 := 0x04
                    let expr_135 := eq(cleanup_t_uint8(expr_133), convert_t_rational_4_by_1_to_t_uint8(expr_134))
                    let expr_139 := expr_135
                    if iszero(expr_139) {
                        let _20 := vloc_month_96
                        let expr_136 := _20
                        let expr_137 := 0x06
                        let expr_138 := eq(cleanup_t_uint8(expr_136), convert_t_rational_6_by_1_to_t_uint8(expr_137))
                        expr_139 := expr_138
                    }
                    let expr_143 := expr_139
                    if iszero(expr_143) {
                        let _21 := vloc_month_96
                        let expr_140 := _21
                        let expr_141 := 0x09
                        let expr_142 := eq(cleanup_t_uint8(expr_140), convert_t_rational_9_by_1_to_t_uint8(expr_141))
                        expr_143 := expr_142
                    }
                    let expr_147 := expr_143
                    if iszero(expr_147) {
                        let _22 := vloc_month_96
                        let expr_144 := _22
                        let expr_145 := 0x0b
                        let expr_146 := eq(cleanup_t_uint8(expr_144), convert_t_rational_11_by_1_to_t_uint8(expr_145))
                        expr_147 := expr_146
                    }
                    switch expr_147
                    case 0 {
                        let expr_151_functionIdentifier := 70
                        let _23 := vloc_year_98
                        let expr_152 := _23
                        let expr_153 := fun_isLeapYear_70(expr_152)
                        switch expr_153
                        case 0 {
                            let expr_157 := 0x1c
                            vloc__101 := convert_t_rational_28_by_1_to_t_uint8(expr_157)
                            leave
                        }
                        default {
                            let expr_154 := 0x1d
                            vloc__101 := convert_t_rational_29_by_1_to_t_uint8(expr_154)
                            leave
                        }
                    }
                    default {
                        let expr_148 := 0x1e
                        vloc__101 := convert_t_rational_30_by_1_to_t_uint8(expr_148)
                        leave
                    }
                }
                default {
                    let expr_130 := 0x1f
                    vloc__101 := convert_t_rational_31_by_1_to_t_uint8(expr_130)
                    leave
                }

            }

            function fun_getHour_461(vloc_timestamp_443) -> vloc__446 {
                let zero_value_for_type_t_uint8_126 := zero_value_for_split_t_uint8()
                vloc__446 := zero_value_for_type_t_uint8_126

                let _127 := vloc_timestamp_443
                let expr_450 := _127
                let expr_451 := 0x3c
                let expr_452 := checked_div_t_uint256(expr_450, convert_t_rational_60_by_1_to_t_uint256(expr_451))

                let expr_453 := 0x3c
                let expr_454 := checked_div_t_uint256(expr_452, convert_t_rational_60_by_1_to_t_uint256(expr_453))

                let expr_455 := expr_454
                let expr_456 := 0x18
                let expr_457 := checked_mod_t_uint256(expr_455, convert_t_rational_24_by_1_to_t_uint256(expr_456))

                let expr_458 := convert_t_uint256_to_t_uint8(expr_457)
                vloc__446 := expr_458
                leave

            }

            function fun_getMinute_479(vloc_timestamp_463) -> vloc__466 {
                let zero_value_for_type_t_uint8_128 := zero_value_for_split_t_uint8()
                vloc__466 := zero_value_for_type_t_uint8_128

                let _129 := vloc_timestamp_463
                let expr_470 := _129
                let expr_471 := 0x3c
                let expr_472 := checked_div_t_uint256(expr_470, convert_t_rational_60_by_1_to_t_uint256(expr_471))

                let expr_473 := expr_472
                let expr_474 := 0x3c
                let expr_475 := checked_mod_t_uint256(expr_473, convert_t_rational_60_by_1_to_t_uint256(expr_474))

                let expr_476 := convert_t_uint256_to_t_uint8(expr_475)
                vloc__466 := expr_476
                leave

            }

            function fun_getMonth_428(vloc_timestamp_417) -> vloc__420 {
                let zero_value_for_type_t_uint8_47 := zero_value_for_split_t_uint8()
                vloc__420 := zero_value_for_type_t_uint8_47

                let expr_422_functionIdentifier := 329
                let _48 := vloc_timestamp_417
                let expr_423 := _48
                let expr_424_mpos := fun_parseTimestamp_329(expr_423)
                let _49 := add(expr_424_mpos, 32)
                let _50 := read_from_memoryt_uint8(_49)
                let expr_425 := _50
                vloc__420 := expr_425
                leave

            }

            function fun_getSecond_494(vloc_timestamp_481) -> vloc__484 {
                let zero_value_for_type_t_uint8_130 := zero_value_for_split_t_uint8()
                vloc__484 := zero_value_for_type_t_uint8_130

                let _131 := vloc_timestamp_481
                let expr_488 := _131
                let expr_489 := 0x3c
                let expr_490 := checked_mod_t_uint256(expr_488, convert_t_rational_60_by_1_to_t_uint256(expr_489))

                let expr_491 := convert_t_uint256_to_t_uint8(expr_490)
                vloc__484 := expr_491
                leave

            }

            function fun_getWeekday_514(vloc_timestamp_496) -> vloc__499 {
                let zero_value_for_type_t_uint8_132 := zero_value_for_split_t_uint8()
                vloc__499 := zero_value_for_type_t_uint8_132

                let _133 := vloc_timestamp_496
                let expr_503 := _133
                let expr_504 := constant_DAY_IN_SECONDS_18()
                let expr_505 := checked_div_t_uint256(expr_503, expr_504)

                let expr_506 := 0x04
                let expr_507 := checked_add_t_uint256(expr_505, convert_t_rational_4_by_1_to_t_uint256(expr_506))

                let expr_508 := expr_507
                let expr_509 := 0x07
                let expr_510 := checked_mod_t_uint256(expr_508, convert_t_rational_7_by_1_to_t_uint256(expr_509))

                let expr_511 := convert_t_uint256_to_t_uint8(expr_510)
                vloc__499 := expr_511
                leave

            }

            function fun_getYear_415(vloc_timestamp_331) -> vloc__334 {
                let zero_value_for_type_t_uint16_24 := zero_value_for_split_t_uint16()
                vloc__334 := zero_value_for_type_t_uint16_24

                let expr_338 := 0x00
                let vloc_secondsAccountedFor_337 := convert_t_rational_0_by_1_to_t_uint256(expr_338)
                let vloc_year_341
                let zero_value_for_type_t_uint16_25 := zero_value_for_split_t_uint16()
                vloc_year_341 := zero_value_for_type_t_uint16_25
                let vloc_numLeapYears_344
                let zero_value_for_type_t_uint256_26 := zero_value_for_split_t_uint256()
                vloc_numLeapYears_344 := zero_value_for_type_t_uint256_26
                let expr_349 := constant_ORIGIN_YEAR_33()
                let _28 := vloc_timestamp_331
                let expr_350 := _28
                let expr_351 := constant_YEAR_IN_SECONDS_21()
                let expr_352 := checked_div_t_uint256(expr_350, expr_351)

                let expr_353 := checked_add_t_uint256(convert_t_uint16_to_t_uint256(expr_349), expr_352)

                let expr_354 := convert_t_uint256_to_t_uint16(expr_353)
                vloc_year_341 := expr_354
                let expr_355 := expr_354
                let expr_358_functionIdentifier := 94
                let _30 := vloc_year_341
                let expr_359 := _30
                let _31 := convert_t_uint16_to_t_uint256(expr_359)
                let expr_360 := fun_leapYearsBefore_94(_31)
                let expr_361_functionIdentifier := 94
                let expr_362 := constant_ORIGIN_YEAR_33()
                let _32 := convert_t_uint16_to_t_uint256(expr_362)
                let expr_363 := fun_leapYearsBefore_94(_32)
                let expr_364 := checked_sub_t_uint256(expr_360, expr_363)

                vloc_numLeapYears_344 := expr_364
                let expr_365 := expr_364
                let expr_368 := constant_LEAP_YEAR_IN_SECONDS_24()
                let _34 := vloc_numLeapYears_344
                let expr_369 := _34
                let expr_370 := checked_mul_t_uint256(expr_368, expr_369)

                let _35 := vloc_secondsAccountedFor_337
                expr_370 := checked_add_t_uint256(_35, expr_370)
                vloc_secondsAccountedFor_337 := expr_370
                let expr_371 := expr_370
                let expr_374 := constant_YEAR_IN_SECONDS_21()
                let _36 := vloc_year_341
                let expr_375 := _36
                let expr_376 := constant_ORIGIN_YEAR_33()
                let expr_377 := checked_sub_t_uint16(expr_375, expr_376)

                let _37 := vloc_numLeapYears_344
                let expr_378 := _37
                let expr_379 := checked_sub_t_uint256(convert_t_uint16_to_t_uint256(expr_377), expr_378)

                let expr_380 := expr_379
                let expr_381 := checked_mul_t_uint256(expr_374, expr_380)

                let _38 := vloc_secondsAccountedFor_337
                expr_381 := checked_add_t_uint256(_38, expr_381)
                vloc_secondsAccountedFor_337 := expr_381
                let expr_382 := expr_381
                for {
                    } 1 {
                }
                {
                    let _39 := vloc_secondsAccountedFor_337
                    let expr_384 := _39
                    let _40 := vloc_timestamp_331
                    let expr_385 := _40
                    let expr_386 := gt(cleanup_t_uint256(expr_384), cleanup_t_uint256(expr_385))
                    if iszero(expr_386) { break }
                    let expr_387_functionIdentifier := 70
                    let _41 := vloc_year_341
                    let expr_390 := _41
                    let expr_391 := 0x01
                    let expr_392 := checked_sub_t_uint16(expr_390, convert_t_rational_1_by_1_to_t_uint16(expr_391))

                    let expr_393 := expr_392
                    let expr_394 := fun_isLeapYear_70(expr_393)
                    switch expr_394
                    case 0 {
                        let expr_401 := constant_YEAR_IN_SECONDS_21()
                        let _42 := vloc_secondsAccountedFor_337
                        expr_401 := checked_sub_t_uint256(_42, expr_401)
                        vloc_secondsAccountedFor_337 := expr_401
                        let expr_402 := expr_401
                    }
                    default {
                        let expr_396 := constant_LEAP_YEAR_IN_SECONDS_24()
                        let _43 := vloc_secondsAccountedFor_337
                        expr_396 := checked_sub_t_uint256(_43, expr_396)
                        vloc_secondsAccountedFor_337 := expr_396
                        let expr_397 := expr_396
                    }
                    let expr_407 := 0x01
                    let _44 := convert_t_rational_1_by_1_to_t_uint16(expr_407)
                    let _45 := vloc_year_341
                    _44 := checked_sub_t_uint16(_45, _44)
                    vloc_year_341 := _44
                    let expr_408 := _44
                }
                let _46 := vloc_year_341
                let expr_412 := _46
                vloc__334 := expr_412
                leave

            }

            function fun_isLeapYear_70(vloc_year_35) -> vloc__38 {
                let zero_value_for_type_t_bool_1 := zero_value_for_split_t_bool()
                vloc__38 := zero_value_for_type_t_bool_1

                let _2 := vloc_year_35
                let expr_40 := _2
                let expr_41 := 0x04
                let expr_42 := checked_mod_t_uint16(expr_40, convert_t_rational_4_by_1_to_t_uint16(expr_41))

                let expr_43 := 0x00
                let expr_44 := iszero(eq(cleanup_t_uint16(expr_42), convert_t_rational_0_by_1_to_t_uint16(expr_43)))
                if expr_44 {
                    let expr_45 := 0x00
                    vloc__38 := expr_45
                    leave
                }
                let _3 := vloc_year_35
                let expr_49 := _3
                let expr_50 := 0x64
                let expr_51 := checked_mod_t_uint16(expr_49, convert_t_rational_100_by_1_to_t_uint16(expr_50))

                let expr_52 := 0x00
                let expr_53 := iszero(eq(cleanup_t_uint16(expr_51), convert_t_rational_0_by_1_to_t_uint16(expr_52)))
                if expr_53 {
                    let expr_54 := 0x01
                    vloc__38 := expr_54
                    leave
                }
                let _4 := vloc_year_35
                let expr_58 := _4
                let expr_59 := 0x0190
                let expr_60 := checked_mod_t_uint16(expr_58, convert_t_rational_400_by_1_to_t_uint16(expr_59))

                let expr_61 := 0x00
                let expr_62 := iszero(eq(cleanup_t_uint16(expr_60), convert_t_rational_0_by_1_to_t_uint16(expr_61)))
                if expr_62 {
                    let expr_63 := 0x00
                    vloc__38 := expr_63
                    leave
                }
                let expr_67 := 0x01
                vloc__38 := expr_67
                leave

            }

            function fun_leapYearsBefore_94(vloc_year_72) -> vloc__75 {
                let zero_value_for_type_t_uint256_5 := zero_value_for_split_t_uint256()
                vloc__75 := zero_value_for_type_t_uint256_5

                let expr_78 := 0x01
                let _6 := convert_t_rational_1_by_1_to_t_uint256(expr_78)
                let _7 := vloc_year_72
                _6 := checked_sub_t_uint256(_7, _6)
                vloc_year_72 := _6
                let expr_79 := _6
                let _8 := vloc_year_72
                let expr_81 := _8
                let expr_82 := 0x04
                let expr_83 := checked_div_t_uint256(expr_81, convert_t_rational_4_by_1_to_t_uint256(expr_82))

                let _9 := vloc_year_72
                let expr_84 := _9
                let expr_85 := 0x64
                let expr_86 := checked_div_t_uint256(expr_84, convert_t_rational_100_by_1_to_t_uint256(expr_85))

                let expr_87 := checked_sub_t_uint256(expr_83, expr_86)

                let _10 := vloc_year_72
                let expr_88 := _10
                let expr_89 := 0x0190
                let expr_90 := checked_div_t_uint256(expr_88, convert_t_rational_400_by_1_to_t_uint256(expr_89))

                let expr_91 := checked_add_t_uint256(expr_87, expr_90)

                vloc__75 := expr_91
                leave

            }

            function fun_parseTimestamp_329(vloc_timestamp_166) -> vloc_dt_169_mpos {
                let zero_value_for_type_t_struct$__DateTime_$15_memory_ptr_51_mpos := zero_value_for_split_t_struct$__DateTime_$15_memory_ptr()
                vloc_dt_169_mpos := zero_value_for_type_t_struct$__DateTime_$15_memory_ptr_51_mpos

                let expr_173 := 0x00
                let vloc_secondsAccountedFor_172 := convert_t_rational_0_by_1_to_t_uint256(expr_173)
                let vloc_buf_176
                let zero_value_for_type_t_uint256_52 := zero_value_for_split_t_uint256()
                vloc_buf_176 := zero_value_for_type_t_uint256_52
                let vloc_i_179
                let zero_value_for_type_t_uint8_53 := zero_value_for_split_t_uint8()
                vloc_i_179 := zero_value_for_type_t_uint8_53
                let expr_184_functionIdentifier := 415
                let _54 := vloc_timestamp_166
                let expr_185 := _54
                let expr_186 := fun_getYear_415(expr_185)
                let _55_mpos := vloc_dt_169_mpos
                let expr_181_mpos := _55_mpos
                let _56 := add(expr_181_mpos, 0)
                let _57 := expr_186
                write_to_memory_t_uint16(_56, _57)
                let expr_187 := expr_186
                let expr_190_functionIdentifier := 94
                let _58_mpos := vloc_dt_169_mpos
                let expr_191_mpos := _58_mpos
                let _59 := add(expr_191_mpos, 0)
                let _60 := read_from_memoryt_uint16(_59)
                let expr_192 := _60
                let _61 := convert_t_uint16_to_t_uint256(expr_192)
                let expr_193 := fun_leapYearsBefore_94(_61)
                let expr_194_functionIdentifier := 94
                let expr_195 := constant_ORIGIN_YEAR_33()
                let _62 := convert_t_uint16_to_t_uint256(expr_195)
                let expr_196 := fun_leapYearsBefore_94(_62)
                let expr_197 := checked_sub_t_uint256(expr_193, expr_196)

                vloc_buf_176 := expr_197
                let expr_198 := expr_197
                let expr_201 := constant_LEAP_YEAR_IN_SECONDS_24()
                let _63 := vloc_buf_176
                let expr_202 := _63
                let expr_203 := checked_mul_t_uint256(expr_201, expr_202)

                let _64 := vloc_secondsAccountedFor_172
                expr_203 := checked_add_t_uint256(_64, expr_203)
                vloc_secondsAccountedFor_172 := expr_203
                let expr_204 := expr_203
                let expr_207 := constant_YEAR_IN_SECONDS_21()
                let _65_mpos := vloc_dt_169_mpos
                let expr_208_mpos := _65_mpos
                let _66 := add(expr_208_mpos, 0)
                let _67 := read_from_memoryt_uint16(_66)
                let expr_209 := _67
                let expr_210 := constant_ORIGIN_YEAR_33()
                let expr_211 := checked_sub_t_uint16(expr_209, expr_210)

                let _68 := vloc_buf_176
                let expr_212 := _68
                let expr_213 := checked_sub_t_uint256(convert_t_uint16_to_t_uint256(expr_211), expr_212)

                let expr_214 := expr_213
                let expr_215 := checked_mul_t_uint256(expr_207, expr_214)

                let _69 := vloc_secondsAccountedFor_172
                expr_215 := checked_add_t_uint256(_69, expr_215)
                vloc_secondsAccountedFor_172 := expr_215
                let expr_216 := expr_215
                let vloc_secondsInMonth_219
                let zero_value_for_type_t_uint256_70 := zero_value_for_split_t_uint256()
                vloc_secondsInMonth_219 := zero_value_for_type_t_uint256_70
                for {
                    let expr_222 := 0x01
                    let _71 := convert_t_rational_1_by_1_to_t_uint8(expr_222)
                    vloc_i_179 := _71
                    let expr_223 := _71
                    } 1 {
                    let _73 := vloc_i_179
                    let _72 := increment_t_uint8(_73)
                    vloc_i_179 := _72
                    let expr_229 := _73
                }
                {
                    let _74 := vloc_i_179
                    let expr_225 := _74
                    let expr_226 := 0x0c
                    let expr_227 := iszero(gt(cleanup_t_uint8(expr_225), convert_t_rational_12_by_1_to_t_uint8(expr_226)))
                    if iszero(expr_227) { break }
                    let expr_232 := constant_DAY_IN_SECONDS_18()
                    let expr_233_functionIdentifier := 164
                    let _76 := vloc_i_179
                    let expr_234 := _76
                    let _77_mpos := vloc_dt_169_mpos
                    let expr_235_mpos := _77_mpos
                    let _78 := add(expr_235_mpos, 0)
                    let _79 := read_from_memoryt_uint16(_78)
                    let expr_236 := _79
                    let expr_237 := fun_getDaysInMonth_164(expr_234, expr_236)
                    let expr_238 := checked_mul_t_uint256(expr_232, convert_t_uint8_to_t_uint256(expr_237))

                    vloc_secondsInMonth_219 := expr_238
                    let expr_239 := expr_238
                    let _80 := vloc_secondsInMonth_219
                    let expr_241 := _80
                    let _81 := vloc_secondsAccountedFor_172
                    let expr_242 := _81
                    let expr_243 := checked_add_t_uint256(expr_241, expr_242)

                    let _82 := vloc_timestamp_166
                    let expr_244 := _82
                    let expr_245 := gt(cleanup_t_uint256(expr_243), cleanup_t_uint256(expr_244))
                    if expr_245 {
                        let _83 := vloc_i_179
                        let expr_249 := _83
                        let _84_mpos := vloc_dt_169_mpos
                        let expr_246_mpos := _84_mpos
                        let _85 := add(expr_246_mpos, 32)
                        let _86 := expr_249
                        write_to_memory_t_uint8(_85, _86)
                        let expr_250 := expr_249
                        break
                    }
                    let _87 := vloc_secondsInMonth_219
                    let expr_256 := _87
                    let _88 := vloc_secondsAccountedFor_172
                    expr_256 := checked_add_t_uint256(_88, expr_256)
                    vloc_secondsAccountedFor_172 := expr_256
                    let expr_257 := expr_256
                }
                for {
                    let expr_262 := 0x01
                    let _89 := convert_t_rational_1_by_1_to_t_uint8(expr_262)
                    vloc_i_179 := _89
                    let expr_263 := _89
                    } 1 {
                    let _91 := vloc_i_179
                    let _90 := increment_t_uint8(_91)
                    vloc_i_179 := _90
                    let expr_274 := _91
                }
                {
                    let _92 := vloc_i_179
                    let expr_265 := _92
                    let expr_266_functionIdentifier := 164
                    let _93_mpos := vloc_dt_169_mpos
                    let expr_267_mpos := _93_mpos
                    let _94 := add(expr_267_mpos, 32)
                    let _95 := read_from_memoryt_uint8(_94)
                    let expr_268 := _95
                    let _96_mpos := vloc_dt_169_mpos
                    let expr_269_mpos := _96_mpos
                    let _97 := add(expr_269_mpos, 0)
                    let _98 := read_from_memoryt_uint16(_97)
                    let expr_270 := _98
                    let expr_271 := fun_getDaysInMonth_164(expr_268, expr_270)
                    let expr_272 := iszero(gt(cleanup_t_uint8(expr_265), cleanup_t_uint8(expr_271)))
                    if iszero(expr_272) { break }
                    let expr_276 := constant_DAY_IN_SECONDS_18()
                    let _99 := vloc_secondsAccountedFor_172
                    let expr_277 := _99
                    let expr_278 := checked_add_t_uint256(expr_276, expr_277)

                    let _100 := vloc_timestamp_166
                    let expr_279 := _100
                    let expr_280 := gt(cleanup_t_uint256(expr_278), cleanup_t_uint256(expr_279))
                    if expr_280 {
                        let _101 := vloc_i_179
                        let expr_284 := _101
                        let _102_mpos := vloc_dt_169_mpos
                        let expr_281_mpos := _102_mpos
                        let _103 := add(expr_281_mpos, 64)
                        let _104 := expr_284
                        write_to_memory_t_uint8(_103, _104)
                        let expr_285 := expr_284
                        break
                    }
                    let expr_291 := constant_DAY_IN_SECONDS_18()
                    let _105 := vloc_secondsAccountedFor_172
                    expr_291 := checked_add_t_uint256(_105, expr_291)
                    vloc_secondsAccountedFor_172 := expr_291
                    let expr_292 := expr_291
                }
                let expr_299_functionIdentifier := 461
                let _106 := vloc_timestamp_166
                let expr_300 := _106
                let expr_301 := fun_getHour_461(expr_300)
                let _107_mpos := vloc_dt_169_mpos
                let expr_296_mpos := _107_mpos
                let _108 := add(expr_296_mpos, 96)
                let _109 := expr_301
                write_to_memory_t_uint8(_108, _109)
                let expr_302 := expr_301
                let expr_307_functionIdentifier := 479
                let _110 := vloc_timestamp_166
                let expr_308 := _110
                let expr_309 := fun_getMinute_479(expr_308)
                let _111_mpos := vloc_dt_169_mpos
                let expr_304_mpos := _111_mpos
                let _112 := add(expr_304_mpos, 128)
                let _113 := expr_309
                write_to_memory_t_uint8(_112, _113)
                let expr_310 := expr_309
                let expr_315_functionIdentifier := 494
                let _114 := vloc_timestamp_166
                let expr_316 := _114
                let expr_317 := fun_getSecond_494(expr_316)
                let _115_mpos := vloc_dt_169_mpos
                let expr_312_mpos := _115_mpos
                let _116 := add(expr_312_mpos, 160)
                let _117 := expr_317
                write_to_memory_t_uint8(_116, _117)
                let expr_318 := expr_317
                let expr_323_functionIdentifier := 514
                let _118 := vloc_timestamp_166
                let expr_324 := _118
                let expr_325 := fun_getWeekday_514(expr_324)
                let _119_mpos := vloc_dt_169_mpos
                let expr_320_mpos := _119_mpos
                let _120 := add(expr_320_mpos, 192)
                let _121 := expr_325
                write_to_memory_t_uint8(_120, _121)
                let expr_326 := expr_325

            }

            function fun_toTimestamp_535(vloc_year_516, vloc_month_518, vloc_day_520) -> vloc_timestamp_523 {
                let zero_value_for_type_t_uint256_134 := zero_value_for_split_t_uint256()
                vloc_timestamp_523 := zero_value_for_type_t_uint256_134

                let expr_525_functionIdentifier := 772
                let _135 := vloc_year_516
                let expr_526 := _135
                let _136 := vloc_month_518
                let expr_527 := _136
                let _137 := vloc_day_520
                let expr_528 := _137
                let expr_529 := 0x00
                let expr_530 := 0x00
                let expr_531 := 0x00
                let _138 := convert_t_rational_0_by_1_to_t_uint8(expr_529)
                let _139 := convert_t_rational_0_by_1_to_t_uint8(expr_530)
                let _140 := convert_t_rational_0_by_1_to_t_uint8(expr_531)
                let expr_532 := fun_toTimestamp_772(expr_526, expr_527, expr_528, _138, _139, _140)
                vloc_timestamp_523 := expr_532
                leave

            }

            function fun_toTimestamp_558(vloc_year_537, vloc_month_539, vloc_day_541, vloc_hour_543) -> vloc_timestamp_546 {
                let zero_value_for_type_t_uint256_141 := zero_value_for_split_t_uint256()
                vloc_timestamp_546 := zero_value_for_type_t_uint256_141

                let expr_548_functionIdentifier := 772
                let _142 := vloc_year_537
                let expr_549 := _142
                let _143 := vloc_month_539
                let expr_550 := _143
                let _144 := vloc_day_541
                let expr_551 := _144
                let _145 := vloc_hour_543
                let expr_552 := _145
                let expr_553 := 0x00
                let expr_554 := 0x00
                let _146 := convert_t_rational_0_by_1_to_t_uint8(expr_553)
                let _147 := convert_t_rational_0_by_1_to_t_uint8(expr_554)
                let expr_555 := fun_toTimestamp_772(expr_549, expr_550, expr_551, expr_552, _146, _147)
                vloc_timestamp_546 := expr_555
                leave

            }

            function fun_toTimestamp_583(vloc_year_560, vloc_month_562, vloc_day_564, vloc_hour_566, vloc_minute_568) -> vloc_timestamp_571 {
                let zero_value_for_type_t_uint256_148 := zero_value_for_split_t_uint256()
                vloc_timestamp_571 := zero_value_for_type_t_uint256_148

                let expr_573_functionIdentifier := 772
                let _149 := vloc_year_560
                let expr_574 := _149
                let _150 := vloc_month_562
                let expr_575 := _150
                let _151 := vloc_day_564
                let expr_576 := _151
                let _152 := vloc_hour_566
                let expr_577 := _152
                let _153 := vloc_minute_568
                let expr_578 := _153
                let expr_579 := 0x00
                let _154 := convert_t_rational_0_by_1_to_t_uint8(expr_579)
                let expr_580 := fun_toTimestamp_772(expr_574, expr_575, expr_576, expr_577, expr_578, _154)
                vloc_timestamp_571 := expr_580
                leave

            }

            function fun_toTimestamp_772(vloc_year_585, vloc_month_587, vloc_day_589, vloc_hour_591, vloc_minute_593, vloc_second_595) -> vloc_timestamp_598 {
                let zero_value_for_type_t_uint256_155 := zero_value_for_split_t_uint256()
                vloc_timestamp_598 := zero_value_for_type_t_uint256_155

                let vloc_i_601
                let zero_value_for_type_t_uint16_156 := zero_value_for_split_t_uint16()
                vloc_i_601 := zero_value_for_type_t_uint16_156
                for {
                    let expr_604 := constant_ORIGIN_YEAR_33()
                    vloc_i_601 := expr_604
                    let expr_605 := expr_604
                    } 1 {
                    let _158 := vloc_i_601
                    let _157 := increment_t_uint16(_158)
                    vloc_i_601 := _157
                    let expr_611 := _158
                }
                {
                    let _159 := vloc_i_601
                    let expr_607 := _159
                    let _160 := vloc_year_585
                    let expr_608 := _160
                    let expr_609 := lt(cleanup_t_uint16(expr_607), cleanup_t_uint16(expr_608))
                    if iszero(expr_609) { break }
                    let expr_613_functionIdentifier := 70
                    let _161 := vloc_i_601
                    let expr_614 := _161
                    let expr_615 := fun_isLeapYear_70(expr_614)
                    switch expr_615
                    case 0 {
                        let expr_622 := constant_YEAR_IN_SECONDS_21()
                        let _162 := vloc_timestamp_598
                        expr_622 := checked_add_t_uint256(_162, expr_622)
                        vloc_timestamp_598 := expr_622
                        let expr_623 := expr_622
                    }
                    default {
                        let expr_617 := constant_LEAP_YEAR_IN_SECONDS_24()
                        let _163 := vloc_timestamp_598
                        expr_617 := checked_add_t_uint256(_163, expr_617)
                        vloc_timestamp_598 := expr_617
                        let expr_618 := expr_617
                    }
                }
                let expr_631 := 0x0c
                let vloc_monthDayCounts_634_mpos
                let zero_value_for_type_t_array$_t_uint8_$12_memory_ptr_164_mpos := zero_value_for_split_t_array$_t_uint8_$12_memory_ptr()
                vloc_monthDayCounts_634_mpos := zero_value_for_type_t_array$_t_uint8_$12_memory_ptr_164_mpos
                let expr_639 := 0x1f
                let _165 := convert_t_rational_31_by_1_to_t_uint8(expr_639)
                let _166_mpos := vloc_monthDayCounts_634_mpos
                let expr_636_mpos := _166_mpos
                let expr_637 := 0x00
                let _167 := _165
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_636_mpos, convert_t_rational_0_by_1_to_t_uint256(expr_637)), _167)
                let expr_640 := _165
                let expr_642_functionIdentifier := 70
                let _168 := vloc_year_585
                let expr_643 := _168
                let expr_644 := fun_isLeapYear_70(expr_643)
                switch expr_644
                case 0 {
                    let expr_655 := 0x1c
                    let _169 := convert_t_rational_28_by_1_to_t_uint8(expr_655)
                    let _170_mpos := vloc_monthDayCounts_634_mpos
                    let expr_652_mpos := _170_mpos
                    let expr_653 := 0x01
                    let _171 := _169
                    write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_652_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_653)), _171)
                    let expr_656 := _169
                }
                default {
                    let expr_648 := 0x1d
                    let _172 := convert_t_rational_29_by_1_to_t_uint8(expr_648)
                    let _173_mpos := vloc_monthDayCounts_634_mpos
                    let expr_645_mpos := _173_mpos
                    let expr_646 := 0x01
                    let _174 := _172
                    write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_645_mpos, convert_t_rational_1_by_1_to_t_uint256(expr_646)), _174)
                    let expr_649 := _172
                }
                let expr_663 := 0x1f
                let _175 := convert_t_rational_31_by_1_to_t_uint8(expr_663)
                let _176_mpos := vloc_monthDayCounts_634_mpos
                let expr_660_mpos := _176_mpos
                let expr_661 := 0x02
                let _177 := _175
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_660_mpos, convert_t_rational_2_by_1_to_t_uint256(expr_661)), _177)
                let expr_664 := _175
                let expr_669 := 0x1e
                let _178 := convert_t_rational_30_by_1_to_t_uint8(expr_669)
                let _179_mpos := vloc_monthDayCounts_634_mpos
                let expr_666_mpos := _179_mpos
                let expr_667 := 0x03
                let _180 := _178
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_666_mpos, convert_t_rational_3_by_1_to_t_uint256(expr_667)), _180)
                let expr_670 := _178
                let expr_675 := 0x1f
                let _181 := convert_t_rational_31_by_1_to_t_uint8(expr_675)
                let _182_mpos := vloc_monthDayCounts_634_mpos
                let expr_672_mpos := _182_mpos
                let expr_673 := 0x04
                let _183 := _181
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_672_mpos, convert_t_rational_4_by_1_to_t_uint256(expr_673)), _183)
                let expr_676 := _181
                let expr_681 := 0x1e
                let _184 := convert_t_rational_30_by_1_to_t_uint8(expr_681)
                let _185_mpos := vloc_monthDayCounts_634_mpos
                let expr_678_mpos := _185_mpos
                let expr_679 := 0x05
                let _186 := _184
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_678_mpos, convert_t_rational_5_by_1_to_t_uint256(expr_679)), _186)
                let expr_682 := _184
                let expr_687 := 0x1f
                let _187 := convert_t_rational_31_by_1_to_t_uint8(expr_687)
                let _188_mpos := vloc_monthDayCounts_634_mpos
                let expr_684_mpos := _188_mpos
                let expr_685 := 0x06
                let _189 := _187
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_684_mpos, convert_t_rational_6_by_1_to_t_uint256(expr_685)), _189)
                let expr_688 := _187
                let expr_693 := 0x1f
                let _190 := convert_t_rational_31_by_1_to_t_uint8(expr_693)
                let _191_mpos := vloc_monthDayCounts_634_mpos
                let expr_690_mpos := _191_mpos
                let expr_691 := 0x07
                let _192 := _190
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_690_mpos, convert_t_rational_7_by_1_to_t_uint256(expr_691)), _192)
                let expr_694 := _190
                let expr_699 := 0x1e
                let _193 := convert_t_rational_30_by_1_to_t_uint8(expr_699)
                let _194_mpos := vloc_monthDayCounts_634_mpos
                let expr_696_mpos := _194_mpos
                let expr_697 := 0x08
                let _195 := _193
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_696_mpos, convert_t_rational_8_by_1_to_t_uint256(expr_697)), _195)
                let expr_700 := _193
                let expr_705 := 0x1f
                let _196 := convert_t_rational_31_by_1_to_t_uint8(expr_705)
                let _197_mpos := vloc_monthDayCounts_634_mpos
                let expr_702_mpos := _197_mpos
                let expr_703 := 0x09
                let _198 := _196
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_702_mpos, convert_t_rational_9_by_1_to_t_uint256(expr_703)), _198)
                let expr_706 := _196
                let expr_711 := 0x1e
                let _199 := convert_t_rational_30_by_1_to_t_uint8(expr_711)
                let _200_mpos := vloc_monthDayCounts_634_mpos
                let expr_708_mpos := _200_mpos
                let expr_709 := 0x0a
                let _201 := _199
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_708_mpos, convert_t_rational_10_by_1_to_t_uint256(expr_709)), _201)
                let expr_712 := _199
                let expr_717 := 0x1f
                let _202 := convert_t_rational_31_by_1_to_t_uint8(expr_717)
                let _203_mpos := vloc_monthDayCounts_634_mpos
                let expr_714_mpos := _203_mpos
                let expr_715 := 0x0b
                let _204 := _202
                write_to_memory_t_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_714_mpos, convert_t_rational_11_by_1_to_t_uint256(expr_715)), _204)
                let expr_718 := _202
                for {
                    let expr_721 := 0x01
                    let _205 := convert_t_rational_1_by_1_to_t_uint16(expr_721)
                    vloc_i_601 := _205
                    let expr_722 := _205
                    } 1 {
                    let _207 := vloc_i_601
                    let _206 := increment_t_uint16(_207)
                    vloc_i_601 := _206
                    let expr_728 := _207
                }
                {
                    let _208 := vloc_i_601
                    let expr_724 := _208
                    let _209 := vloc_month_587
                    let expr_725 := _209
                    let expr_726 := lt(cleanup_t_uint16(expr_724), convert_t_uint8_to_t_uint16(expr_725))
                    if iszero(expr_726) { break }
                    let expr_731 := constant_DAY_IN_SECONDS_18()
                    let _210_mpos := vloc_monthDayCounts_634_mpos
                    let expr_732_mpos := _210_mpos
                    let _211 := vloc_i_601
                    let expr_733 := _211
                    let expr_734 := 0x01
                    let expr_735 := checked_sub_t_uint16(expr_733, convert_t_rational_1_by_1_to_t_uint16(expr_734))

                    let _212 := read_from_memoryt_uint8(memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(expr_732_mpos, convert_t_uint16_to_t_uint256(expr_735)))
                    let expr_736 := _212
                    let expr_737 := checked_mul_t_uint256(expr_731, convert_t_uint8_to_t_uint256(expr_736))

                    let _213 := vloc_timestamp_598
                    expr_737 := checked_add_t_uint256(_213, expr_737)
                    vloc_timestamp_598 := expr_737
                    let expr_738 := expr_737
                }
                let expr_743 := constant_DAY_IN_SECONDS_18()
                let _214 := vloc_day_589
                let expr_744 := _214
                let expr_745 := 0x01
                let expr_746 := checked_sub_t_uint8(expr_744, convert_t_rational_1_by_1_to_t_uint8(expr_745))

                let expr_747 := expr_746
                let expr_748 := checked_mul_t_uint256(expr_743, convert_t_uint8_to_t_uint256(expr_747))

                let _215 := vloc_timestamp_598
                expr_748 := checked_add_t_uint256(_215, expr_748)
                vloc_timestamp_598 := expr_748
                let expr_749 := expr_748
                let expr_752 := constant_HOUR_IN_SECONDS_27()
                let _217 := vloc_hour_591
                let expr_753 := _217
                let expr_754 := expr_753
                let expr_755 := checked_mul_t_uint256(expr_752, convert_t_uint8_to_t_uint256(expr_754))

                let _218 := vloc_timestamp_598
                expr_755 := checked_add_t_uint256(_218, expr_755)
                vloc_timestamp_598 := expr_755
                let expr_756 := expr_755
                let expr_759 := constant_MINUTE_IN_SECONDS_30()
                let _220 := vloc_minute_593
                let expr_760 := _220
                let expr_761 := expr_760
                let expr_762 := checked_mul_t_uint256(expr_759, convert_t_uint8_to_t_uint256(expr_761))

                let _221 := vloc_timestamp_598
                expr_762 := checked_add_t_uint256(_221, expr_762)
                vloc_timestamp_598 := expr_762
                let expr_763 := expr_762
                let _222 := vloc_second_595
                let expr_766 := _222
                let _223 := convert_t_uint8_to_t_uint256(expr_766)
                let _224 := vloc_timestamp_598
                _223 := checked_add_t_uint256(_224, _223)
                vloc_timestamp_598 := _223
                let expr_767 := _223
                let _225 := vloc_timestamp_598
                let expr_769 := _225
                vloc_timestamp_598 := expr_769
                leave

            }

            function increment_t_uint16(value) -> ret {
                value := cleanup_t_uint16(value)
                if gt(value, 0xfffe) { panic_error() }
                ret := add(value, 1)
            }

            function increment_t_uint8(value) -> ret {
                value := cleanup_t_uint8(value)
                if gt(value, 0xfe) { panic_error() }
                ret := add(value, 1)
            }

            function memory_array_index_access_t_array$_t_uint8_$12_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint8_$12_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                addr := add(baseRef, offset)
            }

            function panic_error() {
                invalid()
            }

            function read_from_memoryt_uint16(ptr) -> returnValue {

                let value := cleanup_t_uint16(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint8(ptr) -> returnValue {

                let value := cleanup_t_uint8(mload(ptr))

                returnValue :=

                value

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_uint16(value) {
                if iszero(eq(value, cleanup_t_uint16(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint8(value) {
                if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
            }

            function write_to_memory_t_uint16(memPtr, value) {
                mstore(memPtr, cleanup_t_uint16(value))
            }

            function write_to_memory_t_uint8(memPtr, value) {
                mstore(memPtr, cleanup_t_uint8(value))
            }

            function zero_memory_chunk_t_uint8(dataStart, dataSizeInBytes) {
                calldatacopy(dataStart, calldatasize(), dataSizeInBytes)
            }

            function zero_value_for_split_t_array$_t_uint8_$12_memory_ptr() -> ret {
                ret := allocate_and_zero_memory_array_t_array$_t_uint8_$12_memory_ptr(12)
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_struct$__DateTime_$15_memory_ptr() -> ret {
                ret := allocate_and_zero_memory_struct_t_struct$__DateTime_$15_memory_ptr()
            }

            function zero_value_for_split_t_uint16() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

            function zero_value_for_t_uint16() -> ret {
                ret := 0
            }

            function zero_value_for_t_uint8() -> ret {
                ret := 0
            }

        }

    }

}

