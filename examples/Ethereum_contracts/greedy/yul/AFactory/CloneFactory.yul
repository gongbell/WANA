/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "CloneFactory_49" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_CloneFactory_49()

        codecopy(0, dataoffset("CloneFactory_49_deployed"), datasize("CloneFactory_49_deployed"))

        return(0, datasize("CloneFactory_49_deployed"))

        function constructor_CloneFactory_49() {

        }

    }
    object "CloneFactory_49_deployed" {
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

