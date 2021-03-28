/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SafeMath_257" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("SafeMath_257_deployed"), datasize("SafeMath_257_deployed"))

        return(0, datasize("SafeMath_257_deployed"))

        function constructor_SafeMath_257() {

        }

    }
    object "SafeMath_257_deployed" {
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

