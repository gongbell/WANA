/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "AddressUtils_18" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("AddressUtils_18_deployed"), datasize("AddressUtils_18_deployed"))

        return(0, datasize("AddressUtils_18_deployed"))

        function constructor_AddressUtils_18() {

        }

    }
    object "AddressUtils_18_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

        }

    }

}

