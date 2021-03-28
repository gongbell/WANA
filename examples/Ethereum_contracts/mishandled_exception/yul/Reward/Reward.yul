/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Reward_105" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_Reward_105()

        codecopy(0, dataoffset("Reward_105_deployed"), datasize("Reward_105_deployed"))

        return(0, datasize("Reward_105_deployed"))

        function constructor_Reward_105() {

        }

    }
    object "Reward_105_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x98e7ea43
                {
                    // reward(uint32[],address[])

                    let param_0, param_1 :=  abi_decode_tuple_t_array$_t_uint32_$dyn_memory_ptrt_array$_t_address_payable_$dyn_memory_ptr(4, calldatasize())
                    fun_reward_104(param_0, param_1)
                    let memPos := allocateMemory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            33function abi_decode_t_address_payable(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address_payable(value)
            }

            // address payable[]
            function abi_decode_t_array$_t_address_payable_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_array$_t_address_payable_$dyn_memory_ptr(length))
                let dst := array
                mstore(array, length) offset := add(offset, 0x20) dst := add(dst, 0x20) // might update offset and dst
                let src := offset
                if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementPos := src
                    mstore(dst, abi_decode_t_address_payable(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            // uint32[]
            35function abi_decode_t_array$_t_uint32_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := allocateMemory(array_allocation_size_t_array$_t_uint32_$dyn_memory_ptr(length))
                let dst := array
                mstore(array, length) offset := add(offset, 0x20) dst := add(dst, 0x20) // might update offset and dst
                let src := offset
                if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {
                    let elementPos := src
                    mstore(dst, abi_decode_t_uint32(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            function abi_decode_t_uint32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint32(value)
            }

            37function abi_decode_tuple_t_array$_t_uint32_$dyn_memory_ptrt_array$_t_address_payable_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {
                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value0 := abi_decode_t_array$_t_uint32_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {
                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                    value1 := abi_decode_t_array$_t_address_payable_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function allocateMemory(size) -> memPtr {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, size)
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
                mstore(64, newFreePtr)
            }

            40function array_allocation_size_t_array$_t_address_payable_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_allocation_size_t_array$_t_uint32_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_length_t_array$_t_address_payable_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_uint32_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error() }

                product := mul(x, y)
            }

            45function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error() }

                diff := sub(x, y)
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

            50function cleanup_t_uint32(value) -> cleaned {
                cleaned := and(value, 0xffffffff)
            }

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_0_by_1_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            55function convert_t_rational_64_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint8(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            function convert_t_uint32_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint32(value)
            }

            60function convert_t_uint8_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint8(value)
            }

            61function fun_reward_104(vloc_rewardsDistribution_3_mpos, vloc_winners_6_mpos) {

                let _1_mpos := vloc_rewardsDistribution_3_mpos
                let expr_9_mpos := _1_mpos
                let expr_10 := array_length_t_array$_t_uint32_$dyn_memory_ptr(expr_9_mpos)
                let expr_11 := 0x00
                let expr_12 := eq(cleanup_t_uint256(expr_10), convert_t_rational_0_by_1_to_t_uint256(expr_11))
                let expr_17 := expr_12
                if iszero(expr_17) {
                    let _2_mpos := vloc_rewardsDistribution_3_mpos
                    let expr_13_mpos := _2_mpos
                    let expr_14 := array_length_t_array$_t_uint32_$dyn_memory_ptr(expr_13_mpos)
                    let expr_15 := 0x40
                    let expr_16 := gt(cleanup_t_uint256(expr_14), convert_t_rational_64_by_1_to_t_uint256(expr_15))
                    expr_17 := expr_16
                }
                if expr_17 {
                    revert(0, 0)
                }
                let _3_mpos := vloc_rewardsDistribution_3_mpos
                let expr_27_mpos := _3_mpos
                let expr_28 := array_length_t_array$_t_uint32_$dyn_memory_ptr(expr_27_mpos)
                let expr_29 := convert_t_uint256_to_t_uint8(expr_28)
                let vloc_numWinners_24 := expr_29
                let _4 := vloc_numWinners_24
                let expr_31 := _4
                let _5_mpos := vloc_winners_6_mpos
                let expr_34_mpos := _5_mpos
                let expr_35 := array_length_t_array$_t_address_payable_$dyn_memory_ptr(expr_34_mpos)
                let expr_36 := convert_t_uint256_to_t_uint8(expr_35)
                let expr_37 := gt(cleanup_t_uint8(expr_31), cleanup_t_uint8(expr_36))
                if expr_37 {
                    let _6_mpos := vloc_winners_6_mpos
                    let expr_41_mpos := _6_mpos
                    let expr_42 := array_length_t_array$_t_address_payable_$dyn_memory_ptr(expr_41_mpos)
                    let expr_43 := convert_t_uint256_to_t_uint8(expr_42)
                    vloc_numWinners_24 := expr_43
                    let expr_44 := expr_43
                }
                let expr_51 := callvalue()
                let vloc_forJack_49 := expr_51
                for {
                    let expr_55 := 0x00
                    let vloc_k_54 := convert_t_rational_0_by_1_to_t_uint8(expr_55)
                    } 1 {
                    let _8 := vloc_k_54
                    let _7 := increment_t_uint8(_8)
                    vloc_k_54 := _7
                    let expr_61 := _8
                }
                {
                    let _9 := vloc_k_54
                    let expr_57 := _9
                    let _10 := vloc_numWinners_24
                    let expr_58 := _10
                    let expr_59 := lt(cleanup_t_uint8(expr_57), cleanup_t_uint8(expr_58))
                    if iszero(expr_59) { break }
                    let expr_66 := callvalue()
                    let _11_mpos := vloc_rewardsDistribution_3_mpos
                    let expr_67_mpos := _11_mpos
                    let _12 := vloc_k_54
                    let expr_68 := _12
                    let _13 := read_from_memoryt_uint32(memory_array_index_access_t_array$_t_uint32_$dyn_memory_ptr(expr_67_mpos, convert_t_uint8_to_t_uint256(expr_68)))
                    let expr_69 := _13
                    let expr_70 := checked_mul_t_uint256(expr_66, convert_t_uint32_to_t_uint256(expr_69))

                    let vloc_value_64 := expr_70
                    let _14_mpos := vloc_winners_6_mpos
                    let expr_72_mpos := _14_mpos
                    let _15 := vloc_k_54
                    let expr_73 := _15
                    let _16 := read_from_memoryt_address_payable(memory_array_index_access_t_array$_t_address_payable_$dyn_memory_ptr(expr_72_mpos, convert_t_uint8_to_t_uint256(expr_73)))
                    let expr_74 := _16
                    let expr_75_address := convert_t_address_payable_to_t_address(expr_74)
                    let _17 := vloc_value_64
                    let expr_76 := _17

                    let _18 := 0
                    if iszero(expr_76) { _18 := 2300 }
                    let expr_77 := call(_18, expr_75_address, expr_76, 0, 0, 0, 0)

                    let _19 := vloc_forJack_49
                    let expr_80 := _19
                    let _20 := vloc_value_64
                    let expr_81 := _20
                    let expr_82 := checked_sub_t_uint256(expr_80, expr_81)

                    vloc_forJack_49 := expr_82
                    let expr_83 := expr_82
                }
                let _21 := vloc_forJack_49
                let expr_87 := _21
                let expr_88 := 0x00
                let expr_89 := gt(cleanup_t_uint256(expr_87), convert_t_rational_0_by_1_to_t_uint256(expr_88))
                if expr_89 {
                    let expr_91 := caller()
                    let expr_92_address := convert_t_address_payable_to_t_address(expr_91)
                    let _22 := vloc_forJack_49
                    let expr_93 := _22

                    let _23 := 0
                    if iszero(expr_93) { _23 := 2300 }
                    let expr_94 := call(_23, expr_92_address, expr_93, 0, 0, 0, 0)

                    let expr_95 := cleanup_t_bool(iszero(expr_94))
                    if expr_95 {
                        revert(0, 0)
                    }
                }

            }

            function increment_t_uint8(value) -> ret {
                value := cleanup_t_uint8(value)
                if gt(value, 0xfe) { panic_error() }
                ret := add(value, 1)
            }

            function memory_array_index_access_t_array$_t_address_payable_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_address_payable_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_uint32_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint32_$dyn_memory_ptr(baseRef))) {
                    panic_error()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function panic_error() {
                invalid()
            }

            function read_from_memoryt_address_payable(ptr) -> returnValue {

                let value := cleanup_t_address_payable(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint32(ptr) -> returnValue {

                let value := cleanup_t_uint32(mload(ptr))

                returnValue :=

                value

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_address_payable(value) {
                if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint32(value) {
                if iszero(eq(value, cleanup_t_uint32(value))) { revert(0, 0) }
            }

        }

    }

}

