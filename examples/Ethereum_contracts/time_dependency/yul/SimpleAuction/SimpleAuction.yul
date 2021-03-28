/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SimpleAuction_166" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_SimpleAuction_166()

        codecopy(0, dataoffset("SimpleAuction_166_deployed"), datasize("SimpleAuction_166_deployed"))

        return(0, datasize("SimpleAuction_166_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_SimpleAuction_166() {

            let expr_21 := 0xc2752751e6b91736d5a2e8e31336dc7c7220e8fc
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_21)
            let expr_22 := expr_21
            let expr_26 := timestamp()
            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_26)
            let expr_27 := expr_26
            let expr_30 := 0x0258
            let _1 := convert_t_rational_600_by_1_to_t_uint256(expr_30)
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, _1)
            let expr_31 := _1

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_rational_600_by_1_to_t_uint256(value) -> converted {
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

        function prepare_store_t_address_payable(value) -> ret {
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

    }
    object "SimpleAuction_166_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1998aeef
                {
                    // bid()

                    abi_decode_tuple_(4, calldatasize())
                    fun_bid_80()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2a24f46c
                {
                    // auctionEnd()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_auctionEnd_165()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x38af3eed
                {
                    // beneficiary()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_beneficiary_2()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_withdraw_125()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4b449cba
                {
                    // auctionEndTime()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_auctionEndTime_135()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4f245ef7
                {
                    // auctionStart()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_auctionStart_4()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x91f90157
                {
                    // highestBidder()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBidder_8()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd074a38d
                {
                    // biddingTime()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_biddingTime_6()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd57bde79
                {
                    // highestBid()
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBid_10()
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

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

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
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

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
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

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_auctionEndTime_135() -> vloc__128 {
                let zero_value_for_type_t_uint256_24 := zero_value_for_split_t_uint256()
                vloc__128 := zero_value_for_type_t_uint256_24

                let _25 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_130 := _25
                let _26 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_131 := _26
                let expr_132 := checked_add_t_uint256(expr_130, expr_131)

                vloc__128 := expr_132
                leave

            }

            function fun_auctionEnd_165() {

                let expr_141 := timestamp()
                let _27 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_142 := _27
                let _28 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_143 := _28
                let expr_144 := checked_add_t_uint256(expr_142, expr_143)

                let expr_145 := expr_144
                let expr_146 := iszero(lt(cleanup_t_uint256(expr_141), cleanup_t_uint256(expr_145)))
                require_helper(expr_146)
                let _29 := read_from_storage_split_offset_0_t_bool(0x06)
                let expr_150 := _29
                let expr_151 := cleanup_t_bool(iszero(expr_150))
                require_helper(expr_151)
                let expr_155 := 0x01
                update_storage_value_offset_0t_bool_to_t_bool(0x06, expr_155)
                let expr_156 := expr_155
                let _30 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_158 := _30
                let expr_160_address := convert_t_address_payable_to_t_address(expr_158)
                let _31 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_161 := _31

                let _32 := 0
                if iszero(expr_161) { _32 := 2300 }
                let _33 := call(_32, expr_160_address, expr_161, 0, 0, 0, 0)

                if iszero(_33) { revert_forward_1() }

            }

            function fun_bid_80() {

                let expr_40 := timestamp()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_41 := _1
                let _2 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_42 := _2
                let expr_43 := checked_add_t_uint256(expr_41, expr_42)

                let expr_44 := expr_43
                let expr_45 := iszero(gt(cleanup_t_uint256(expr_40), cleanup_t_uint256(expr_44)))
                require_helper(expr_45)
                let expr_50 := callvalue()
                let _3 := read_from_storage_split_offset_0_t_uint256(0x04)
                let expr_51 := _3
                let expr_52 := gt(cleanup_t_uint256(expr_50), cleanup_t_uint256(expr_51))
                require_helper(expr_52)
                let _4 := read_from_storage_split_offset_0_t_address(0x03)
                let expr_55 := _4
                let expr_58 := 0x00
                let expr_59 := convert_t_rational_0_by_1_to_t_address_payable(expr_58)
                let expr_60 := iszero(eq(cleanup_t_address(expr_55), convert_t_address_payable_to_t_address(expr_59)))
                if expr_60 {
                    let _5 := read_from_storage_split_offset_0_t_uint256(0x04)
                    let expr_64 := _5
                    let _6 := 0x05
                    let expr_61 := _6
                    let _7 := read_from_storage_split_offset_0_t_address(0x03)
                    let expr_62 := _7
                    let _8 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_61,expr_62)
                    let _9 := read_from_storage_split_offset_0_t_uint256(_8)
                    expr_64 := checked_add_t_uint256(_9, expr_64)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_8, expr_64)
                    let expr_65 := expr_64
                }
                let expr_71 := caller()
                let _10 := convert_t_address_payable_to_t_address(expr_71)
                update_storage_value_offset_0t_address_to_t_address(0x03, _10)
                let expr_72 := _10
                let expr_76 := callvalue()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x04, expr_76)
                let expr_77 := expr_76

            }

            function fun_withdraw_125() -> vloc__84 {
                let zero_value_for_type_t_bool_11 := zero_value_for_split_t_bool()
                vloc__84 := zero_value_for_type_t_bool_11

                let _12 := 0x05
                let expr_88 := _12
                let expr_90 := caller()
                let _13 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_88,expr_90)
                let _14 := read_from_storage_split_offset_0_t_uint256(_13)
                let expr_91 := _14
                let vloc_amount_87 := expr_91
                let _15 := vloc_amount_87
                let expr_93 := _15
                let expr_94 := 0x00
                let expr_95 := gt(cleanup_t_uint256(expr_93), convert_t_rational_0_by_1_to_t_uint256(expr_94))
                if expr_95 {
                    let expr_100 := 0x00
                    let _16 := convert_t_rational_0_by_1_to_t_uint256(expr_100)
                    let _17 := 0x05
                    let expr_96 := _17
                    let expr_98 := caller()
                    let _18 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_96,expr_98)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_18, _16)
                    let expr_101 := _16
                    let expr_104 := caller()
                    let expr_105_address := convert_t_address_payable_to_t_address(expr_104)
                    let _19 := vloc_amount_87
                    let expr_106 := _19

                    let _20 := 0
                    if iszero(expr_106) { _20 := 2300 }
                    let expr_107 := call(_20, expr_105_address, expr_106, 0, 0, 0, 0)

                    let expr_108 := cleanup_t_bool(iszero(expr_107))
                    if expr_108 {
                        let _21 := vloc_amount_87
                        let expr_113 := _21
                        let _22 := 0x05
                        let expr_109 := _22
                        let expr_111 := caller()
                        let _23 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address_payable(expr_109,expr_111)
                        update_storage_value_offset_0t_uint256_to_t_uint256(_23, expr_113)
                        let expr_114 := expr_113
                        let expr_116 := 0x00
                        vloc__84 := expr_116
                        leave
                    }
                }
                let expr_122 := 0x01
                vloc__84 := expr_122
                leave

            }

            function getter_fun_auctionStart_4() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_beneficiary_2() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_biddingTime_6() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_highestBid_10() -> ret {

                let slot := 4
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_highestBidder_8() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

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

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

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

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

