/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SafeMath_49" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("SafeMath_49_deployed"), datasize("SafeMath_49_deployed"))

        return(0, datasize("SafeMath_49_deployed"))

        function constructor_SafeMath_49() {

        }

    }
    object "SafeMath_49_deployed" {
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

