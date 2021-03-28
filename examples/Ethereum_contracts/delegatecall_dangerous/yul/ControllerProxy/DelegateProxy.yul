/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "DelegateProxy_239" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_DelegateProxy_239()

        codecopy(0, dataoffset("DelegateProxy_239_deployed"), datasize("DelegateProxy_239_deployed"))

        return(0, datasize("DelegateProxy_239_deployed"))

        function constructor_DelegateProxy_239() {

        }

    }
    object "DelegateProxy_239_deployed" {
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

