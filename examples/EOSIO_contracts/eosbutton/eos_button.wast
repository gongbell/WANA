(module
 (type $FUNCSIG$vijiij (func (param i32 i64 i32 i32 i64)))
 (type $FUNCSIG$vij (func (param i32 i64)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$j (func (result i64)))
 (type $FUNCSIG$vjj (func (param i64 i64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vj (func (param i64)))
 (type $FUNCSIG$ij (func (param i64) (result i32)))
 (type $FUNCSIG$ijjjj (func (param i64 i64 i64 i64) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vijii (func (param i32 i64 i32 i32)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ijjjjii (func (param i64 i64 i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$i (func (result i32)))
 (import "env" "abort" (func $abort))
 (import "env" "action_data_size" (func $action_data_size (result i32)))
 (import "env" "current_receiver" (func $current_receiver (result i64)))
 (import "env" "current_time" (func $current_time (result i64)))
 (import "env" "db_find_i64" (func $db_find_i64 (param i64 i64 i64 i64) (result i32)))
 (import "env" "db_get_i64" (func $db_get_i64 (param i32 i32 i32) (result i32)))
 (import "env" "db_lowerbound_i64" (func $db_lowerbound_i64 (param i64 i64 i64 i64) (result i32)))
 (import "env" "db_next_i64" (func $db_next_i64 (param i32 i32) (result i32)))
 (import "env" "db_remove_i64" (func $db_remove_i64 (param i32)))
 (import "env" "db_store_i64" (func $db_store_i64 (param i64 i64 i64 i64 i32 i32) (result i32)))
 (import "env" "db_update_i64" (func $db_update_i64 (param i32 i64 i32 i32)))
 (import "env" "eosio_assert" (func $eosio_assert (param i32 i32)))
 (import "env" "is_account" (func $is_account (param i64) (result i32)))
 (import "env" "memcpy" (func $memcpy (param i32 i32 i32) (result i32)))
 (import "env" "read_action_data" (func $read_action_data (param i32 i32) (result i32)))
 (import "env" "require_auth" (func $require_auth (param i64)))
 (import "env" "require_auth2" (func $require_auth2 (param i64 i64)))
 (table 3 3 anyfunc)
 (elem (i32.const 0) $__wasm_nullptr $_ZN3ebt10eos_button8ebtpressEyN5eosio5assetEby $_ZN3ebt10eos_button7claimadEy)
 (memory $0 1)
 (data (i32.const 4) "\90g\00\00")
 (data (i32.const 16) "unsupported symbol name\00")
 (data (i32.const 48) "object passed to iterator_to is not in multi_index\00")
 (data (i32.const 112) "overflow/underflow\00")
 (data (i32.const 144) "dividing by 0\00")
 (data (i32.const 160) "invalid symbol name\00")
 (data (i32.const 192) "multiplication overflow or underflow\00")
 (data (i32.const 240) "multiplication underflow\00")
 (data (i32.const 272) "multiplication overflow\00")
 (data (i32.const 304) "attempt to add asset with different symbol\00")
 (data (i32.const 352) "addition underflow\00")
 (data (i32.const 384) "addition overflow\00")
 (data (i32.const 416) "to account does not exist\00")
 (data (i32.const 448) "cannot pass end iterator to modify\00")
 (data (i32.const 496) "cannot pass end iterator to erase\00")
 (data (i32.const 544) "cannot increment end iterator\00")
 (data (i32.const 576) "not started yet\00")
 (data (i32.const 592) "unknown account\00")
 (data (i32.const 608) "magnitude of asset amount must be less than 2^62\00")
 (data (i32.const 672) "object passed to modify is not in multi_index\00")
 (data (i32.const 720) "cannot modify objects in table of another contract\00")
 (data (i32.const 784) "updater cannot change primary key when modifying an object\00")
 (data (i32.const 848) "write\00")
 (data (i32.const 864) "attempt to subtract asset with different symbol\00")
 (data (i32.const 912) "subtraction underflow\00")
 (data (i32.const 944) "subtraction overflow\00")
 (data (i32.const 976) "cannot create objects in table of another contract\00")
 (data (i32.const 1040) "comparison of assets with different symbols is not allowed\00")
 (data (i32.const 1104) "insufficient balance\00")
 (data (i32.const 1136) "object passed to erase is not in multi_index\00")
 (data (i32.const 1184) "cannot erase objects in table of another contract\00")
 (data (i32.const 1248) "attempt to remove object that was not in multi_index\00")
 (data (i32.const 1312) "no balance object found\00")
 (data (i32.const 1344) "overdrawn balance\00")
 (data (i32.const 1376) "error reading iterator\00")
 (data (i32.const 1408) "read\00")
 (data (i32.const 1424) "Airdrop has not started\00")
 (data (i32.const 1456) "Airdrop is ended\00")
 (data (i32.const 1488) "claim is too frequent\00")
 (data (i32.const 1520) "onerror\00")
 (data (i32.const 1536) "eosio\00")
 (data (i32.const 1552) "onerror action\'s are only valid from the \"eosio\" system account\00")
 (data (i32.const 1616) "deposit\00")
 (data (i32.const 10032) "malloc_from_freed was designed to only be called after _heap was completely allocated\00")
 (export "memory" (memory $0))
 (export "_ZeqRK11checksum256S1_" (func $_ZeqRK11checksum256S1_))
 (export "_ZeqRK11checksum160S1_" (func $_ZeqRK11checksum160S1_))
 (export "_ZneRK11checksum160S1_" (func $_ZneRK11checksum160S1_))
 (export "now" (func $now))
 (export "_ZN5eosio12require_authERKNS_16permission_levelE" (func $_ZN5eosio12require_authERKNS_16permission_levelE))
 (export "_ZN3ebt10eos_button8ebtpressEyN5eosio5assetEby" (func $_ZN3ebt10eos_button8ebtpressEyN5eosio5assetEby))
 (export "_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE" (func $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE))
 (export "_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy" (func $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy))
 (export "_ZN3ebt10eos_button7claimadEy" (func $_ZN3ebt10eos_button7claimadEy))
 (export "_ZN3ebt10eos_button9mtransferEyyN5eosio5assetEy" (func $_ZN3ebt10eos_button9mtransferEyyN5eosio5assetEy))
 (export "_ZN3ebt10eos_button7depositEv" (func $_ZN3ebt10eos_button7depositEv))
 (export "_ZN3ebt10eos_button5s_addEyy" (func $_ZN3ebt10eos_button5s_addEyy))
 (export "_ZN3ebt10eos_button5s_subEyy" (func $_ZN3ebt10eos_button5s_subEyy))
 (export "_ZN3ebt10eos_button5s_mulEyy" (func $_ZN3ebt10eos_button5s_mulEyy))
 (export "_ZN3ebt10eos_button5s_divEyy" (func $_ZN3ebt10eos_button5s_divEyy))
 (export "apply" (func $apply))
 (export "malloc" (func $malloc))
 (export "free" (func $free))
 (export "memcmp" (func $memcmp))
 (func $_ZeqRK11checksum256S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.eqz
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZeqRK11checksum160S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.eqz
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZneRK11checksum160S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.ne
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
   (i32.const 0)
  )
 )
 (func $now (result i32)
  (i32.wrap/i64
   (i64.div_u
    (call $current_time)
    (i64.const 1000000)
   )
  )
 )
 (func $_ZN5eosio12require_authERKNS_16permission_levelE (param $0 i32)
  (call $require_auth2
   (i64.load
    (get_local $0)
   )
   (i64.load offset=8
    (get_local $0)
   )
  )
 )
 (func $_ZN3ebt10eos_button8ebtpressEyN5eosio5assetEby (type $FUNCSIG$vijiij) (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32) (param $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (get_local $2)
    )
    (i64.const 1413629188)
   )
   (i32.const 16)
  )
  (i64.store
   (tee_local $5
    (i32.add
     (i32.add
      (get_local $7)
      (i32.const 16)
     )
     (i32.const 8)
    )
   )
   (i64.load offset=8
    (get_local $2)
   )
  )
  (set_local $6
   (i64.load
    (get_local $2)
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (i32.add
      (get_local $7)
      (i32.const 16)
     )
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 8)
   )
   (i32.load
    (get_local $5)
   )
  )
  (i64.store offset=16
   (get_local $7)
   (get_local $6)
  )
  (i32.store offset=4
   (get_local $7)
   (i32.load offset=20
    (get_local $7)
   )
  )
  (i32.store
   (get_local $7)
   (i32.load offset=16
    (get_local $7)
   )
  )
  (call $_ZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEby
   (get_local $0)
   (get_local $1)
   (get_local $7)
   (get_local $3)
   (get_local $4)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 32)
   )
  )
 )
 (func $_ZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEby (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32) (param $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i64)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $20
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 320)
    )
   )
  )
  (i64.store offset=280
   (get_local $20)
   (get_local $1)
  )
  (i64.store offset=272
   (get_local $20)
   (get_local $4)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store offset=264
   (get_local $20)
   (i64.const 10000)
  )
  (set_local $18
   (call $is_account
    (get_local $4)
   )
  )
  (set_local $7
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i64.eq
     (get_local $4)
     (get_local $1)
    )
   )
   (set_local $7
    (i32.const 0)
   )
   (br_if $label$0
    (i32.xor
     (get_local $18)
     (i32.const 1)
    )
   )
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.ne
          (tee_local $1
           (i64.load offset=8
            (get_local $2)
           )
          )
          (i64.const 1413629188)
         )
        )
        (set_local $7
         (i32.const 0)
        )
        (i32.store
         (i32.add
          (get_local $20)
          (i32.const 256)
         )
         (i32.const 0)
        )
        (i64.store offset=240
         (get_local $20)
         (i64.const -1)
        )
        (i64.store offset=248
         (get_local $20)
         (i64.const 0)
        )
        (i64.store offset=224
         (get_local $20)
         (tee_local $9
          (i64.load
           (get_local $0)
          )
         )
        )
        (i64.store offset=232
         (get_local $20)
         (get_local $4)
        )
        (br_if $label$0
         (i32.lt_s
          (tee_local $18
           (call $db_find_i64
            (get_local $9)
            (get_local $4)
            (i64.const 3607749779137757184)
            (i64.shr_u
             (get_local $1)
             (i64.const 8)
            )
           )
          )
          (i32.const 0)
         )
        )
        (call $eosio_assert
         (i32.eq
          (i32.load offset=16
           (tee_local $18
            (call $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE31load_object_by_primary_iteratorEl
             (i32.add
              (get_local $20)
              (i32.const 224)
             )
             (get_local $18)
            )
           )
          )
          (i32.add
           (get_local $20)
           (i32.const 224)
          )
         )
         (i32.const 48)
        )
        (set_local $7
         (i64.gt_s
          (i64.load
           (get_local $18)
          )
          (i64.const 0)
         )
        )
        (br_if $label$0
         (i32.eqz
          (tee_local $6
           (i32.load offset=248
            (get_local $20)
           )
          )
         )
        )
        (br_if $label$4
         (i32.eq
          (tee_local $18
           (i32.load
            (tee_local $5
             (i32.add
              (get_local $20)
              (i32.const 252)
             )
            )
           )
          )
          (get_local $6)
         )
        )
        (loop $label$6
         (set_local $19
          (i32.load
           (tee_local $18
            (i32.add
             (get_local $18)
             (i32.const -24)
            )
           )
          )
         )
         (i32.store
          (get_local $18)
          (i32.const 0)
         )
         (block $label$7
          (br_if $label$7
           (i32.eqz
            (get_local $19)
           )
          )
          (call $_ZdlPv
           (get_local $19)
          )
         )
         (br_if $label$6
          (i32.ne
           (get_local $6)
           (get_local $18)
          )
         )
        )
        (set_local $18
         (i32.load
          (i32.add
           (get_local $20)
           (i32.const 248)
          )
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i32.const 0)
       )
       (i32.store
        (i32.add
         (get_local $20)
         (i32.const 256)
        )
        (i32.const 0)
       )
       (i64.store offset=240
        (get_local $20)
        (i64.const -1)
       )
       (i64.store offset=248
        (get_local $20)
        (i64.const 0)
       )
       (i64.store offset=224
        (get_local $20)
        (tee_local $1
         (i64.load
          (get_local $0)
         )
        )
       )
       (i64.store offset=232
        (get_local $20)
        (get_local $1)
       )
       (br_if $label$0
        (i32.lt_s
         (tee_local $18
          (call $db_find_i64
           (get_local $1)
           (get_local $1)
           (i64.const 3607819374565523456)
           (get_local $4)
          )
         )
         (i32.const 0)
        )
       )
       (call $eosio_assert
        (i32.eq
         (i32.load offset=32
          (tee_local $18
           (call $_ZNK5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE31load_object_by_primary_iteratorEl
            (i32.add
             (get_local $20)
             (i32.const 224)
            )
            (get_local $18)
           )
          )
         )
         (i32.add
          (get_local $20)
          (i32.const 224)
         )
        )
        (i32.const 48)
       )
       (set_local $7
        (i64.gt_s
         (i64.load offset=16
          (get_local $18)
         )
         (i64.const 0)
        )
       )
       (br_if $label$0
        (i32.eqz
         (tee_local $6
          (i32.load offset=248
           (get_local $20)
          )
         )
        )
       )
       (br_if $label$2
        (i32.eq
         (tee_local $18
          (i32.load
           (tee_local $5
            (i32.add
             (get_local $20)
             (i32.const 252)
            )
           )
          )
         )
         (get_local $6)
        )
       )
       (loop $label$8
        (set_local $19
         (i32.load
          (tee_local $18
           (i32.add
            (get_local $18)
            (i32.const -24)
           )
          )
         )
        )
        (i32.store
         (get_local $18)
         (i32.const 0)
        )
        (block $label$9
         (br_if $label$9
          (i32.eqz
           (get_local $19)
          )
         )
         (call $_ZdlPv
          (get_local $19)
         )
        )
        (br_if $label$8
         (i32.ne
          (get_local $6)
          (get_local $18)
         )
        )
       )
       (set_local $18
        (i32.load
         (i32.add
          (get_local $20)
          (i32.const 248)
         )
        )
       )
       (br $label$1)
      )
      (set_local $18
       (get_local $6)
      )
     )
     (i32.store
      (get_local $5)
      (get_local $6)
     )
     (call $_ZdlPv
      (get_local $18)
     )
     (br $label$0)
    )
    (set_local $18
     (get_local $6)
    )
   )
   (i32.store
    (get_local $5)
    (get_local $6)
   )
   (call $_ZdlPv
    (get_local $18)
   )
  )
  (i32.store
   (i32.add
    (get_local $20)
    (i32.const 256)
   )
   (i32.const 0)
  )
  (i64.store offset=240
   (get_local $20)
   (i64.const -1)
  )
  (i64.store offset=224
   (get_local $20)
   (tee_local $4
    (i64.load
     (get_local $0)
    )
   )
  )
  (i64.store offset=232
   (get_local $20)
   (get_local $4)
  )
  (i64.store offset=248
   (get_local $20)
   (i64.const 0)
  )
  (block $label$10
   (block $label$11
    (br_if $label$11
     (i32.lt_s
      (tee_local $18
       (call $db_find_i64
        (get_local $4)
        (get_local $4)
        (i64.const 5904996781212565504)
        (i64.const 0)
       )
      )
      (i32.const 0)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=124
       (tee_local $5
        (call $_ZNK5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE31load_object_by_primary_iteratorEl
         (i32.add
          (get_local $20)
          (i32.const 224)
         )
         (get_local $18)
        )
       )
      )
      (i32.add
       (get_local $20)
       (i32.const 224)
      )
     )
     (i32.const 48)
    )
    (br $label$10)
   )
   (set_local $4
    (i64.load offset=280
     (get_local $20)
    )
   )
   (i32.store offset=104
    (get_local $20)
    (get_local $2)
   )
   (call $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE7emplaceIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E_EENS4_14const_iteratorEyOSA_
    (i32.add
     (get_local $20)
     (i32.const 184)
    )
    (i32.add
     (get_local $20)
     (i32.const 224)
    )
    (get_local $4)
    (i32.add
     (get_local $20)
     (i32.const 104)
    )
   )
   (set_local $5
    (i32.load offset=188
     (get_local $20)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $20)
    (i32.const 216)
   )
   (i32.const 0)
  )
  (i64.store offset=208
   (get_local $20)
   (i64.const 0)
  )
  (i64.store offset=200
   (get_local $20)
   (i64.const -1)
  )
  (i64.store offset=184
   (get_local $20)
   (tee_local $4
    (i64.load
     (get_local $0)
    )
   )
  )
  (i64.store offset=192
   (get_local $20)
   (get_local $4)
  )
  (set_local $4
   (i64.load32_u offset=120
    (get_local $5)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.div_u
     (tee_local $9
      (i64.mul
       (tee_local $1
        (i64.load offset=16
         (get_local $5)
        )
       )
       (i64.const 120)
      )
     )
     (i64.const 120)
    )
    (get_local $1)
   )
   (i32.const 112)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 144)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 112)
  )
  (set_local $1
   (call $current_time)
  )
  (set_local $10
   (i64.load32_u offset=116
    (get_local $5)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 112)
  )
  (block $label$12
   (block $label$13
    (block $label$14
     (block $label$15
      (block $label$16
       (block $label$17
        (block $label$18
         (block $label$19
          (block $label$20
           (block $label$21
            (block $label$22
             (block $label$23
              (br_if $label$23
               (i64.ge_u
                (i64.and
                 (i64.div_u
                  (get_local $1)
                  (i64.const 1000000)
                 )
                 (i64.const 4294967295)
                )
                (i64.add
                 (get_local $10)
                 (tee_local $4
                  (select
                   (i64.and
                    (tee_local $4
                     (i64.add
                      (get_local $4)
                      (i64.div_u
                       (get_local $9)
                       (i64.const 10000)
                      )
                     )
                    )
                    (i64.const 4294967295)
                   )
                   (i64.const 120)
                   (i32.lt_u
                    (i32.wrap/i64
                     (get_local $4)
                    )
                    (i32.const 120)
                   )
                  )
                 )
                )
               )
              )
              (call $eosio_assert
               (i64.ge_u
                (tee_local $1
                 (i64.and
                  (i64.div_u
                   (call $current_time)
                   (i64.const 1000000)
                  )
                  (i64.const 4294967295)
                 )
                )
                (tee_local $9
                 (i64.load32_u
                  (i32.add
                   (get_local $5)
                   (i32.const 116)
                  )
                 )
                )
               )
               (i32.const 112)
              )
              (call $eosio_assert
               (i64.ge_u
                (get_local $4)
                (tee_local $1
                 (i64.sub
                  (get_local $1)
                  (get_local $9)
                 )
                )
               )
               (i32.const 112)
              )
              (i64.store32 offset=100
               (get_local $20)
               (i64.sub
                (get_local $4)
                (get_local $1)
               )
              )
              (set_local $4
               (i64.load offset=280
                (get_local $20)
               )
              )
              (block $label$24
               (br_if $label$24
                (i32.eq
                 (tee_local $6
                  (i32.load
                   (i32.add
                    (get_local $20)
                    (i32.const 212)
                   )
                  )
                 )
                 (tee_local $8
                  (i32.load
                   (i32.add
                    (get_local $20)
                    (i32.const 208)
                   )
                  )
                 )
                )
               )
               (set_local $18
                (i32.add
                 (get_local $6)
                 (i32.const -24)
                )
               )
               (set_local $16
                (i32.sub
                 (i32.const 0)
                 (get_local $8)
                )
               )
               (loop $label$25
                (br_if $label$24
                 (i64.eq
                  (i64.load
                   (i32.load
                    (get_local $18)
                   )
                  )
                  (get_local $4)
                 )
                )
                (set_local $6
                 (get_local $18)
                )
                (set_local $18
                 (tee_local $19
                  (i32.add
                   (get_local $18)
                   (i32.const -24)
                  )
                 )
                )
                (br_if $label$25
                 (i32.ne
                  (i32.add
                   (get_local $19)
                   (get_local $16)
                  )
                  (i32.const -24)
                 )
                )
               )
              )
              (br_if $label$22
               (i32.eq
                (get_local $6)
                (get_local $8)
               )
              )
              (call $eosio_assert
               (i32.eq
                (i32.load offset=40
                 (tee_local $18
                  (i32.load
                   (i32.add
                    (get_local $6)
                    (i32.const -24)
                   )
                  )
                 )
                )
                (i32.add
                 (get_local $20)
                 (i32.const 184)
                )
               )
               (i32.const 48)
              )
              (br $label$21)
             )
             (set_local $1
              (call $current_time)
             )
             (set_local $9
              (i64.load32_u
               (i32.add
                (get_local $5)
                (i32.const 116)
               )
              )
             )
             (call $eosio_assert
              (i32.const 1)
              (i32.const 112)
             )
             (call $eosio_assert
              (i32.const 1)
              (i32.const 112)
             )
             (block $label$26
              (br_if $label$26
               (i64.ge_u
                (i64.and
                 (i64.div_u
                  (get_local $1)
                  (i64.const 1000000)
                 )
                 (i64.const 4294967295)
                )
                (i64.add
                 (i64.add
                  (get_local $4)
                  (get_local $9)
                 )
                 (i64.const 600)
                )
               )
              )
              (call $eosio_assert
               (i32.const 0)
               (i32.const 576)
              )
              (br_if $label$13
               (tee_local $6
                (i32.load offset=208
                 (get_local $20)
                )
               )
              )
              (br $label$12)
             )
             (br_if $label$20
              (i32.le_s
               (tee_local $18
                (call $db_lowerbound_i64
                 (i64.load offset=184
                  (get_local $20)
                 )
                 (i64.load
                  (i32.add
                   (i32.add
                    (get_local $20)
                    (i32.const 184)
                   )
                   (i32.const 8)
                  )
                 )
                 (i64.const 5905160962557476864)
                 (i64.const 0)
                )
               )
               (i32.const -1)
              )
             )
             (i32.store offset=180
              (get_local $20)
              (call $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl
               (i32.add
                (get_local $20)
                (i32.const 184)
               )
               (get_local $18)
              )
             )
             (i32.store offset=176
              (get_local $20)
              (i32.add
               (get_local $20)
               (i32.const 184)
              )
             )
             (set_local $6
              (i32.add
               (i32.add
                (get_local $20)
                (i32.const 160)
               )
               (i32.const 8)
              )
             )
             (set_local $7
              (i32.add
               (get_local $5)
               (i32.const 48)
              )
             )
             (set_local $8
              (i32.add
               (get_local $5)
               (i32.const 104)
              )
             )
             (set_local $3
              (i32.add
               (get_local $5)
               (i32.const 40)
              )
             )
             (set_local $12
              (i32.add
               (get_local $20)
               (i32.const 120)
              )
             )
             (set_local $14
              (i32.add
               (get_local $20)
               (i32.const 136)
              )
             )
             (set_local $15
              (i32.add
               (get_local $20)
               (i32.const 132)
              )
             )
             (loop $label$27
              (i64.store
               (get_local $6)
               (i64.const 1398362884)
              )
              (i64.store offset=160
               (get_local $20)
               (i64.const 0)
              )
              (call $eosio_assert
               (i32.const 1)
               (i32.const 608)
              )
              (set_local $4
               (i64.shr_u
                (i64.load
                 (get_local $6)
                )
                (i64.const 8)
               )
              )
              (set_local $18
               (i32.const 0)
              )
              (block $label$28
               (loop $label$29
                (set_local $19
                 (i32.const 0)
                )
                (br_if $label$28
                 (i32.gt_u
                  (i32.add
                   (i32.shl
                    (i32.wrap/i64
                     (get_local $4)
                    )
                    (i32.const 24)
                   )
                   (i32.const -1073741825)
                  )
                  (i32.const 452984830)
                 )
                )
                (block $label$30
                 (br_if $label$30
                  (i64.ne
                   (i64.and
                    (tee_local $4
                     (i64.shr_u
                      (get_local $4)
                      (i64.const 8)
                     )
                    )
                    (i64.const 255)
                   )
                   (i64.const 0)
                  )
                 )
                 (loop $label$31
                  (br_if $label$28
                   (i64.ne
                    (i64.and
                     (tee_local $4
                      (i64.shr_u
                       (get_local $4)
                       (i64.const 8)
                      )
                     )
                     (i64.const 255)
                    )
                    (i64.const 0)
                   )
                  )
                  (br_if $label$31
                   (i32.lt_s
                    (tee_local $18
                     (i32.add
                      (get_local $18)
                      (i32.const 1)
                     )
                    )
                    (i32.const 7)
                   )
                  )
                 )
                )
                (set_local $19
                 (i32.const 1)
                )
                (br_if $label$29
                 (i32.lt_s
                  (tee_local $18
                   (i32.add
                    (get_local $18)
                    (i32.const 1)
                   )
                  )
                  (i32.const 7)
                 )
                )
               )
              )
              (call $eosio_assert
               (get_local $19)
               (i32.const 160)
              )
              (set_local $1
               (i64.load
                (get_local $7)
               )
              )
              (set_local $9
               (i64.load
                (get_local $8)
               )
              )
              (set_local $4
               (i64.load
                (get_local $3)
               )
              )
              (set_local $10
               (i64.load
                (i32.load offset=180
                 (get_local $20)
                )
               )
              )
              (call $eosio_assert
               (i32.const 1)
               (i32.const 192)
              )
              (call $eosio_assert
               (i64.gt_s
                (get_local $4)
                (i64.const -4611686018427387904)
               )
               (i32.const 240)
              )
              (call $eosio_assert
               (i64.lt_s
                (get_local $4)
                (i64.const 4611686018427387904)
               )
               (i32.const 272)
              )
              (set_local $11
               (i64.load offset=8
                (i32.load offset=180
                 (get_local $20)
                )
               )
              )
              (call $eosio_assert
               (i32.const 1)
               (i32.const 192)
              )
              (call $eosio_assert
               (i32.const 1)
               (i32.const 240)
              )
              (call $eosio_assert
               (i32.const 1)
               (i32.const 272)
              )
              (set_local $4
               (i64.div_s
                (i64.mul
                 (get_local $11)
                 (i64.div_s
                  (i64.mul
                   (get_local $4)
                   (i64.const 95)
                  )
                  (i64.const 100)
                 )
                )
                (i64.load
                 (i32.add
                  (get_local $5)
                  (i32.const 24)
                 )
                )
               )
              )
              (block $label$32
               (br_if $label$32
                (i64.ne
                 (get_local $10)
                 (get_local $9)
                )
               )
               (set_local $10
                (i64.load
                 (get_local $7)
                )
               )
               (set_local $9
                (i64.load
                 (get_local $3)
                )
               )
               (call $eosio_assert
                (i32.const 1)
                (i32.const 192)
               )
               (call $eosio_assert
                (i64.gt_s
                 (get_local $9)
                 (i64.const -4611686018427387904)
                )
                (i32.const 240)
               )
               (call $eosio_assert
                (i64.lt_s
                 (get_local $9)
                 (i64.const 4611686018427387904)
                )
                (i32.const 272)
               )
               (call $eosio_assert
                (i64.eq
                 (get_local $10)
                 (get_local $1)
                )
                (i32.const 304)
               )
               (call $eosio_assert
                (i64.gt_s
                 (tee_local $4
                  (i64.add
                   (i64.div_s
                    (get_local $9)
                    (i64.const 20)
                   )
                   (get_local $4)
                  )
                 )
                 (i64.const -4611686018427387904)
                )
                (i32.const 352)
               )
               (call $eosio_assert
                (i64.lt_s
                 (get_local $4)
                 (i64.const 4611686018427387904)
                )
                (i32.const 384)
               )
              )
              (i64.store
               (get_local $6)
               (get_local $1)
              )
              (i64.store offset=160
               (get_local $20)
               (get_local $4)
              )
              (block $label$33
               (br_if $label$33
                (i64.eq
                 (tee_local $4
                  (i64.load
                   (i32.load offset=180
                    (get_local $20)
                   )
                  )
                 )
                 (i64.load
                  (get_local $0)
                 )
                )
               )
               (br_if $label$33
                (i32.eqz
                 (call $is_account
                  (get_local $4)
                 )
                )
               )
               (br_if $label$33
                (i64.le_s
                 (i64.load offset=160
                  (get_local $20)
                 )
                 (i64.const 0)
                )
               )
               (block $label$34
                (br_if $label$34
                 (i64.ne
                  (i64.load
                   (i32.add
                    (get_local $2)
                    (i32.const 8)
                   )
                  )
                  (i64.const 1413629188)
                 )
                )
                (i32.store
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 144)
                  )
                  (i32.const 12)
                 )
                 (i32.load
                  (i32.add
                   (i32.add
                    (get_local $20)
                    (i32.const 160)
                   )
                   (i32.const 12)
                  )
                 )
                )
                (i32.store
                 (tee_local $19
                  (i32.add
                   (i32.add
                    (get_local $20)
                    (i32.const 144)
                   )
                   (i32.const 8)
                  )
                 )
                 (i32.load
                  (get_local $6)
                 )
                )
                (i32.store offset=148
                 (get_local $20)
                 (i32.load offset=164
                  (get_local $20)
                 )
                )
                (i32.store offset=144
                 (get_local $20)
                 (i32.load offset=160
                  (get_local $20)
                 )
                )
                (set_local $1
                 (i64.load
                  (get_local $0)
                 )
                )
                (set_local $4
                 (i64.load
                  (i32.load offset=180
                   (get_local $20)
                  )
                 )
                )
                (set_local $9
                 (i64.load offset=280
                  (get_local $20)
                 )
                )
                (i64.store
                 (tee_local $18
                  (i32.add
                   (i32.add
                    (get_local $20)
                    (i32.const 288)
                   )
                   (i32.const 8)
                  )
                 )
                 (i64.load
                  (get_local $19)
                 )
                )
                (i64.store offset=288
                 (get_local $20)
                 (i64.load offset=144
                  (get_local $20)
                 )
                )
                (call $eosio_assert
                 (call $is_account
                  (get_local $4)
                 )
                 (i32.const 416)
                )
                (i64.store
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 104)
                  )
                  (i32.const 8)
                 )
                 (tee_local $10
                  (i64.load
                   (get_local $18)
                  )
                 )
                )
                (i64.store
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 56)
                  )
                  (i32.const 8)
                 )
                 (get_local $10)
                )
                (i64.store offset=104
                 (get_local $20)
                 (tee_local $10
                  (i64.load offset=288
                   (get_local $20)
                  )
                 )
                )
                (i64.store offset=56
                 (get_local $20)
                 (get_local $10)
                )
                (call $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE
                 (get_local $0)
                 (get_local $1)
                 (i32.add
                  (get_local $20)
                  (i32.const 56)
                 )
                )
                (i64.store
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 304)
                  )
                  (i32.const 8)
                 )
                 (tee_local $1
                  (i64.load
                   (get_local $18)
                  )
                 )
                )
                (i64.store
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 40)
                  )
                  (i32.const 8)
                 )
                 (get_local $1)
                )
                (i64.store offset=304
                 (get_local $20)
                 (tee_local $1
                  (i64.load offset=288
                   (get_local $20)
                  )
                 )
                )
                (i64.store offset=40
                 (get_local $20)
                 (get_local $1)
                )
                (call $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy
                 (get_local $0)
                 (get_local $4)
                 (i32.add
                  (get_local $20)
                  (i32.const 40)
                 )
                 (get_local $9)
                )
                (br $label$33)
               )
               (i64.store
                (i32.add
                 (i32.add
                  (get_local $20)
                  (i32.const 104)
                 )
                 (i32.const 8)
                )
                (tee_local $4
                 (i64.load
                  (get_local $0)
                 )
                )
               )
               (i64.store
                (get_local $12)
                (i64.const -1)
               )
               (i64.store
                (tee_local $13
                 (i32.add
                  (i32.add
                   (get_local $20)
                   (i32.const 104)
                  )
                  (i32.const 24)
                 )
                )
                (i64.const 0)
               )
               (i32.store
                (get_local $14)
                (i32.const 0)
               )
               (i64.store offset=104
                (get_local $20)
                (get_local $4)
               )
               (block $label$35
                (block $label$36
                 (br_if $label$36
                  (i32.lt_s
                   (tee_local $18
                    (call $db_find_i64
                     (get_local $4)
                     (get_local $4)
                     (i64.const 3607819374565523456)
                     (i64.load
                      (i32.load offset=180
                       (get_local $20)
                      )
                     )
                    )
                   )
                   (i32.const 0)
                  )
                 )
                 (call $eosio_assert
                  (i32.eq
                   (i32.load offset=32
                    (tee_local $18
                     (call $_ZNK5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE31load_object_by_primary_iteratorEl
                      (i32.add
                       (get_local $20)
                       (i32.const 104)
                      )
                      (get_local $18)
                     )
                    )
                   )
                   (i32.add
                    (get_local $20)
                    (i32.const 104)
                   )
                  )
                  (i32.const 48)
                 )
                 (i32.store offset=304
                  (get_local $20)
                  (i32.add
                   (get_local $20)
                   (i32.const 160)
                  )
                 )
                 (call $eosio_assert
                  (i32.const 1)
                  (i32.const 448)
                 )
                 (call $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E1_EEvRKS3_yOSC_
                  (i32.add
                   (get_local $20)
                   (i32.const 104)
                  )
                  (get_local $18)
                  (i64.const 0)
                  (i32.add
                   (get_local $20)
                   (i32.const 304)
                  )
                 )
                 (br_if $label$35
                  (tee_local $16
                   (i32.load
                    (get_local $13)
                   )
                  )
                 )
                 (br $label$33)
                )
                (set_local $4
                 (i64.load offset=280
                  (get_local $20)
                 )
                )
                (i32.store offset=308
                 (get_local $20)
                 (i32.add
                  (get_local $20)
                  (i32.const 160)
                 )
                )
                (i32.store offset=304
                 (get_local $20)
                 (i32.add
                  (get_local $20)
                  (i32.const 176)
                 )
                )
                (call $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E0_EENS4_14const_iteratorEyOSC_
                 (i32.add
                  (get_local $20)
                  (i32.const 288)
                 )
                 (i32.add
                  (get_local $20)
                  (i32.const 104)
                 )
                 (get_local $4)
                 (i32.add
                  (get_local $20)
                  (i32.const 304)
                 )
                )
                (br_if $label$33
                 (i32.eqz
                  (tee_local $16
                   (i32.load
                    (get_local $13)
                   )
                  )
                 )
                )
               )
               (block $label$37
                (block $label$38
                 (br_if $label$38
                  (i32.eq
                   (tee_local $18
                    (i32.load
                     (get_local $15)
                    )
                   )
                   (get_local $16)
                  )
                 )
                 (loop $label$39
                  (set_local $19
                   (i32.load
                    (tee_local $18
                     (i32.add
                      (get_local $18)
                      (i32.const -24)
                     )
                    )
                   )
                  )
                  (i32.store
                   (get_local $18)
                   (i32.const 0)
                  )
                  (block $label$40
                   (br_if $label$40
                    (i32.eqz
                     (get_local $19)
                    )
                   )
                   (call $_ZdlPv
                    (get_local $19)
                   )
                  )
                  (br_if $label$39
                   (i32.ne
                    (get_local $16)
                    (get_local $18)
                   )
                  )
                 )
                 (set_local $18
                  (i32.load
                   (get_local $13)
                  )
                 )
                 (br $label$37)
                )
                (set_local $18
                 (get_local $16)
                )
               )
               (i32.store
                (get_local $15)
                (get_local $16)
               )
               (call $_ZdlPv
                (get_local $18)
               )
              )
              (set_local $18
               (i32.const 0)
              )
              (call $eosio_assert
               (tee_local $16
                (i32.ne
                 (tee_local $19
                  (i32.wrap/i64
                   (i64.shr_u
                    (tee_local $4
                     (i64.load offset=176
                      (get_local $20)
                     )
                    )
                    (i64.const 32)
                   )
                  )
                 )
                 (i32.const 0)
                )
               )
               (i32.const 496)
              )
              (call $eosio_assert
               (get_local $16)
               (i32.const 544)
              )
              (block $label$41
               (br_if $label$41
                (i32.lt_s
                 (tee_local $16
                  (call $db_next_i64
                   (i32.load offset=44
                    (get_local $19)
                   )
                   (i32.add
                    (get_local $20)
                    (i32.const 104)
                   )
                  )
                 )
                 (i32.const 0)
                )
               )
               (set_local $18
                (call $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl
                 (i32.wrap/i64
                  (get_local $4)
                 )
                 (get_local $16)
                )
               )
              )
              (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE5eraseERKS3_
               (i32.add
                (get_local $20)
                (i32.const 184)
               )
               (get_local $19)
              )
              (i64.store offset=176
               (get_local $20)
               (i64.or
                (i64.shl
                 (i64.extend_u/i32
                  (get_local $18)
                 )
                 (i64.const 32)
                )
                (i64.and
                 (get_local $4)
                 (i64.const 4294967295)
                )
               )
              )
              (br_if $label$27
               (get_local $18)
              )
              (br $label$19)
             )
            )
            (set_local $18
             (i32.const 0)
            )
            (br_if $label$21
             (i32.lt_s
              (tee_local $19
               (call $db_find_i64
                (i64.load offset=184
                 (get_local $20)
                )
                (i64.load
                 (i32.add
                  (get_local $20)
                  (i32.const 192)
                 )
                )
                (i64.const 5905160962557476864)
                (get_local $4)
               )
              )
              (i32.const 0)
             )
            )
            (call $eosio_assert
             (i32.eq
              (i32.load offset=40
               (tee_local $18
                (call $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl
                 (i32.add
                  (get_local $20)
                  (i32.const 184)
                 )
                 (get_local $19)
                )
               )
              )
              (i32.add
               (get_local $20)
               (i32.const 184)
              )
             )
             (i32.const 48)
            )
           )
           (call $eosio_assert
            (i64.ge_u
             (tee_local $4
              (i64.and
               (i64.div_u
                (call $current_time)
                (i64.const 1000000)
               )
               (i64.const 4294967295)
              )
             )
             (tee_local $1
              (i64.load32_u offset=112
               (get_local $5)
              )
             )
            )
            (i32.const 112)
           )
           (block $label$42
            (block $label$43
             (block $label$44
              (br_if $label$44
               (i64.gt_u
                (i64.sub
                 (get_local $4)
                 (get_local $1)
                )
                (i64.const 5)
               )
              )
              (call $eosio_assert
               (i64.lt_u
                (tee_local $4
                 (i64.load32_u offset=100
                  (get_local $20)
                 )
                )
                (i64.const 121)
               )
               (i32.const 112)
              )
              (br_if $label$43
               (i64.lt_u
                (i64.sub
                 (i64.const 120)
                 (get_local $4)
                )
                (i64.const 6)
               )
              )
             )
             (br_if $label$42
              (i32.eqz
               (get_local $3)
              )
             )
             (call $eosio_assert
              (i32.lt_u
               (tee_local $19
                (i32.load offset=100
                 (get_local $20)
                )
               )
               (i32.const 121)
              )
              (i32.const 112)
             )
             (br_if $label$42
              (i32.ne
               (get_local $19)
               (i32.const 120)
              )
             )
            )
            (set_local $4
             (i64.load offset=280
              (get_local $20)
             )
            )
            (br_if $label$18
             (i32.eqz
              (get_local $18)
             )
            )
            (call $eosio_assert
             (i32.const 1)
             (i32.const 448)
            )
            (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E5_EEvRKS3_yOSA_
             (i32.add
              (get_local $20)
              (i32.const 184)
             )
             (get_local $18)
             (get_local $4)
             (i32.add
              (get_local $20)
              (i32.const 104)
             )
            )
            (br_if $label$13
             (tee_local $6
              (i32.load offset=208
               (get_local $20)
              )
             )
            )
            (br $label$12)
           )
           (call $eosio_assert
            (i64.ge_u
             (i64.and
              (tee_local $11
               (i64.div_u
                (call $current_time)
                (i64.const 1000000)
               )
              )
              (i64.const 4294967295)
             )
             (tee_local $17
              (i64.load32_u
               (i32.add
                (get_local $5)
                (i32.const 112)
               )
              )
             )
            )
            (i32.const 112)
           )
           (call $eosio_assert
            (i64.eq
             (i64.div_u
              (tee_local $9
               (i64.mul
                (tee_local $4
                 (i64.load
                  (get_local $2)
                 )
                )
                (i64.const 1036800000)
               )
              )
              (i64.const 1036800000)
             )
             (get_local $4)
            )
            (i32.const 112)
           )
           (set_local $4
            (i64.const 0)
           )
           (set_local $1
            (i64.const 0)
           )
           (block $label$45
            (br_if $label$45
             (i64.eqz
              (tee_local $10
               (i64.load32_u offset=100
                (get_local $20)
               )
              )
             )
            )
            (call $eosio_assert
             (i32.const 1)
             (i32.const 112)
            )
            (set_local $1
             (i64.mul
              (get_local $10)
              (get_local $10)
             )
            )
           )
           (call $eosio_assert
            (i64.lt_u
             (get_local $1)
             (i64.const -2280)
            )
            (i32.const 112)
           )
           (call $eosio_assert
            (i32.const 1)
            (i32.const 112)
           )
           (block $label$46
            (br_if $label$46
             (i64.eqz
              (tee_local $1
               (i64.add
                (get_local $1)
                (i64.const 2280)
               )
              )
             )
            )
            (call $eosio_assert
             (i64.eq
              (i64.div_u
               (tee_local $4
                (i64.mul
                 (get_local $1)
                 (tee_local $10
                  (i64.add
                   (i64.and
                    (i64.sub
                     (get_local $11)
                     (get_local $17)
                    )
                    (i64.const 4294967295)
                   )
                   (i64.const 86400)
                  )
                 )
                )
               )
               (get_local $1)
              )
              (get_local $10)
             )
             (i32.const 112)
            )
           )
           (set_local $1
            (i64.const 0)
           )
           (call $eosio_assert
            (i64.ne
             (get_local $4)
             (i64.const 0)
            )
            (i32.const 144)
           )
           (i64.store offset=160
            (get_local $20)
            (tee_local $10
             (i64.div_u
              (get_local $9)
              (get_local $4)
             )
            )
           )
           (block $label$47
            (br_if $label$47
             (i32.eqz
              (get_local $3)
             )
            )
            (block $label$48
             (br_if $label$48
              (i64.gt_u
               (get_local $4)
               (get_local $9)
              )
             )
             (call $eosio_assert
              (i64.eq
               (i64.div_u
                (tee_local $1
                 (i64.mul
                  (get_local $10)
                  (i64.const 100)
                 )
                )
                (get_local $10)
               )
               (i64.const 100)
              )
              (i32.const 112)
             )
            )
            (call $eosio_assert
             (i32.const 1)
             (i32.const 112)
            )
            (call $eosio_assert
             (i32.const 1)
             (i32.const 144)
            )
            (i64.store offset=160
             (get_local $20)
             (i64.div_u
              (get_local $1)
              (i64.const 150)
             )
            )
           )
           (block $label$49
            (br_if $label$49
             (i64.ne
              (i64.load offset=8
               (get_local $2)
              )
              (i64.const 1413629188)
             )
            )
            (br_if $label$15
             (i64.eq
              (tee_local $4
               (i64.load offset=280
                (get_local $20)
               )
              )
              (tee_local $1
               (i64.load
                (get_local $0)
               )
              )
             )
            )
            (i64.store
             (tee_local $19
              (i32.add
               (i32.add
                (get_local $20)
                (i32.const 80)
               )
               (i32.const 8)
              )
             )
             (i64.load
              (i32.add
               (get_local $2)
               (i32.const 8)
              )
             )
            )
            (i64.store offset=80
             (get_local $20)
             (i64.load
              (get_local $2)
             )
            )
            (i64.store
             (tee_local $18
              (i32.add
               (i32.add
                (get_local $20)
                (i32.const 288)
               )
               (i32.const 8)
              )
             )
             (i64.load
              (get_local $19)
             )
            )
            (i64.store offset=288
             (get_local $20)
             (i64.load offset=80
              (get_local $20)
             )
            )
            (call $eosio_assert
             (call $is_account
              (get_local $1)
             )
             (i32.const 416)
            )
            (i64.store
             (i32.add
              (i32.add
               (get_local $20)
               (i32.const 104)
              )
              (i32.const 8)
             )
             (tee_local $9
              (i64.load
               (get_local $18)
              )
             )
            )
            (i64.store
             (i32.add
              (i32.add
               (get_local $20)
               (i32.const 24)
              )
              (i32.const 8)
             )
             (get_local $9)
            )
            (i64.store offset=104
             (get_local $20)
             (tee_local $9
              (i64.load offset=288
               (get_local $20)
              )
             )
            )
            (i64.store offset=24
             (get_local $20)
             (get_local $9)
            )
            (call $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE
             (get_local $0)
             (get_local $4)
             (i32.add
              (get_local $20)
              (i32.const 24)
             )
            )
            (i64.store
             (i32.add
              (i32.add
               (get_local $20)
               (i32.const 304)
              )
              (i32.const 8)
             )
             (tee_local $9
              (i64.load
               (get_local $18)
              )
             )
            )
            (i64.store
             (i32.add
              (i32.add
               (get_local $20)
               (i32.const 8)
              )
              (i32.const 8)
             )
             (get_local $9)
            )
            (i64.store offset=304
             (get_local $20)
             (tee_local $9
              (i64.load offset=288
               (get_local $20)
              )
             )
            )
            (i64.store offset=8
             (get_local $20)
             (get_local $9)
            )
            (call $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy
             (get_local $0)
             (get_local $1)
             (i32.add
              (get_local $20)
              (i32.const 8)
             )
             (get_local $4)
            )
            (br $label$15)
           )
           (i32.store
            (i32.add
             (get_local $20)
             (i32.const 136)
            )
            (i32.const 0)
           )
           (i64.store offset=104
            (get_local $20)
            (tee_local $4
             (i64.load
              (get_local $0)
             )
            )
           )
           (i64.store offset=120
            (get_local $20)
            (i64.const -1)
           )
           (i64.store offset=128
            (get_local $20)
            (i64.const 0)
           )
           (i64.store offset=112
            (get_local $20)
            (get_local $4)
           )
           (set_local $18
            (i32.const 0)
           )
           (block $label$50
            (br_if $label$50
             (i32.lt_s
              (tee_local $19
               (call $db_find_i64
                (get_local $4)
                (get_local $4)
                (i64.const 3607819374565523456)
                (i64.load offset=280
                 (get_local $20)
                )
               )
              )
              (i32.const 0)
             )
            )
            (call $eosio_assert
             (i32.eq
              (i32.load offset=32
               (tee_local $18
                (call $_ZNK5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE31load_object_by_primary_iteratorEl
                 (i32.add
                  (get_local $20)
                  (i32.const 104)
                 )
                 (get_local $19)
                )
               )
              )
              (i32.add
               (get_local $20)
               (i32.const 104)
              )
             )
             (i32.const 48)
            )
           )
           (call $eosio_assert
            (tee_local $19
             (i32.ne
              (get_local $18)
              (i32.const 0)
             )
            )
            (i32.const 592)
           )
           (i32.store offset=304
            (get_local $20)
            (get_local $2)
           )
           (call $eosio_assert
            (get_local $19)
            (i32.const 448)
           )
           (call $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E6_EEvRKS3_yOSC_
            (i32.add
             (get_local $20)
             (i32.const 104)
            )
            (get_local $18)
            (i64.const 0)
            (i32.add
             (get_local $20)
             (i32.const 304)
            )
           )
           (br_if $label$15
            (i32.eqz
             (tee_local $6
              (i32.load offset=128
               (get_local $20)
              )
             )
            )
           )
           (br_if $label$17
            (i32.eq
             (tee_local $18
              (i32.load
               (tee_local $16
                (i32.add
                 (get_local $20)
                 (i32.const 132)
                )
               )
              )
             )
             (get_local $6)
            )
           )
           (loop $label$51
            (set_local $19
             (i32.load
              (tee_local $18
               (i32.add
                (get_local $18)
                (i32.const -24)
               )
              )
             )
            )
            (i32.store
             (get_local $18)
             (i32.const 0)
            )
            (block $label$52
             (br_if $label$52
              (i32.eqz
               (get_local $19)
              )
             )
             (call $_ZdlPv
              (get_local $19)
             )
            )
            (br_if $label$51
             (i32.ne
              (get_local $6)
              (get_local $18)
             )
            )
           )
           (set_local $18
            (i32.load
             (i32.add
              (get_local $20)
              (i32.const 128)
             )
            )
           )
           (br $label$16)
          )
          (i32.store offset=180
           (get_local $20)
           (i32.const 0)
          )
          (i32.store offset=176
           (get_local $20)
           (i32.add
            (get_local $20)
            (i32.const 184)
           )
          )
         )
         (br_if $label$14
          (i32.lt_u
           (i32.wrap/i64
            (i64.div_u
             (call $current_time)
             (i64.const 1000000)
            )
           )
           (i32.const 1532167200)
          )
         )
         (set_local $4
          (i64.load offset=280
           (get_local $20)
          )
         )
         (i32.store offset=108
          (get_local $20)
          (i32.add
           (get_local $20)
           (i32.const 264)
          )
         )
         (i32.store offset=104
          (get_local $20)
          (i32.add
           (get_local $20)
           (i32.const 280)
          )
         )
         (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E2_EENS4_14const_iteratorEyOSA_
          (i32.add
           (get_local $20)
           (i32.const 304)
          )
          (i32.add
           (get_local $20)
           (i32.const 184)
          )
          (get_local $4)
          (i32.add
           (get_local $20)
           (i32.const 104)
          )
         )
         (set_local $4
          (i64.load offset=280
           (get_local $20)
          )
         )
         (i32.store offset=104
          (get_local $20)
          (get_local $0)
         )
         (i32.store offset=112
          (get_local $20)
          (get_local $2)
         )
         (i32.store offset=108
          (get_local $20)
          (i32.add
           (get_local $20)
           (i32.const 264)
          )
         )
         (i32.store offset=116
          (get_local $20)
          (i32.add
           (get_local $20)
           (i32.const 280)
          )
         )
         (call $eosio_assert
          (i32.ne
           (get_local $5)
           (i32.const 0)
          )
          (i32.const 448)
         )
         (call $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE6modifyIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E3_EEvRKS3_yOSA_
          (i32.add
           (get_local $20)
           (i32.const 224)
          )
          (get_local $5)
          (get_local $4)
          (i32.add
           (get_local $20)
           (i32.const 104)
          )
         )
         (br_if $label$13
          (tee_local $6
           (i32.load offset=208
            (get_local $20)
           )
          )
         )
         (br $label$12)
        )
        (i32.store offset=304
         (get_local $20)
         (i32.add
          (get_local $20)
          (i32.const 280)
         )
        )
        (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E4_EENS4_14const_iteratorEyOSA_
         (i32.add
          (get_local $20)
          (i32.const 104)
         )
         (i32.add
          (get_local $20)
          (i32.const 184)
         )
         (get_local $4)
         (i32.add
          (get_local $20)
          (i32.const 304)
         )
        )
        (br_if $label$13
         (tee_local $6
          (i32.load offset=208
           (get_local $20)
          )
         )
        )
        (br $label$12)
       )
       (set_local $18
        (get_local $6)
       )
      )
      (i32.store
       (get_local $16)
       (get_local $6)
      )
      (call $_ZdlPv
       (get_local $18)
      )
     )
     (set_local $4
      (i64.load offset=272
       (get_local $20)
      )
     )
     (block $label$53
      (br_if $label$53
       (i32.eq
        (tee_local $6
         (i32.load
          (i32.add
           (get_local $20)
           (i32.const 212)
          )
         )
        )
        (tee_local $3
         (i32.load
          (i32.add
           (get_local $20)
           (i32.const 208)
          )
         )
        )
       )
      )
      (set_local $18
       (i32.add
        (get_local $6)
        (i32.const -24)
       )
      )
      (set_local $16
       (i32.sub
        (i32.const 0)
        (get_local $3)
       )
      )
      (loop $label$54
       (br_if $label$53
        (i64.eq
         (i64.load
          (i32.load
           (get_local $18)
          )
         )
         (get_local $4)
        )
       )
       (set_local $6
        (get_local $18)
       )
       (set_local $18
        (tee_local $19
         (i32.add
          (get_local $18)
          (i32.const -24)
         )
        )
       )
       (br_if $label$54
        (i32.ne
         (i32.add
          (get_local $19)
          (get_local $16)
         )
         (i32.const -24)
        )
       )
      )
     )
     (block $label$55
      (block $label$56
       (br_if $label$56
        (i32.eq
         (get_local $6)
         (get_local $3)
        )
       )
       (call $eosio_assert
        (i32.eq
         (i32.load offset=40
          (tee_local $18
           (i32.load
            (i32.add
             (get_local $6)
             (i32.const -24)
            )
           )
          )
         )
         (i32.add
          (get_local $20)
          (i32.const 184)
         )
        )
        (i32.const 48)
       )
       (br $label$55)
      )
      (set_local $18
       (i32.const 0)
      )
      (br_if $label$55
       (i32.lt_s
        (tee_local $19
         (call $db_find_i64
          (i64.load offset=184
           (get_local $20)
          )
          (i64.load
           (i32.add
            (get_local $20)
            (i32.const 192)
           )
          )
          (i64.const 5905160962557476864)
          (get_local $4)
         )
        )
        (i32.const 0)
       )
      )
      (call $eosio_assert
       (i32.eq
        (i32.load offset=40
         (tee_local $18
          (call $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl
           (i32.add
            (get_local $20)
            (i32.const 184)
           )
           (get_local $19)
          )
         )
        )
        (i32.add
         (get_local $20)
         (i32.const 184)
        )
       )
       (i32.const 48)
      )
     )
     (set_local $4
      (i64.const 0)
     )
     (i64.store offset=176
      (get_local $20)
      (i64.const 0)
     )
     (block $label$57
      (br_if $label$57
       (i32.eqz
        (get_local $7)
       )
      )
      (set_local $4
       (i64.const 0)
      )
      (set_local $1
       (i64.const 0)
      )
      (block $label$58
       (br_if $label$58
        (i64.eqz
         (tee_local $9
          (i64.load offset=160
           (get_local $20)
          )
         )
        )
       )
       (call $eosio_assert
        (i64.eq
         (i64.div_u
          (tee_local $1
           (i64.mul
            (get_local $9)
            (i64.const 5)
           )
          )
          (get_local $9)
         )
         (i64.const 5)
        )
        (i32.const 112)
       )
       (set_local $1
        (i64.div_u
         (get_local $1)
         (i64.const 100)
        )
       )
      )
      (call $eosio_assert
       (i32.const 1)
       (i32.const 144)
      )
      (i64.store offset=176
       (get_local $20)
       (get_local $1)
      )
      (block $label$59
       (br_if $label$59
        (i64.eqz
         (tee_local $1
          (i64.load offset=160
           (get_local $20)
          )
         )
        )
       )
       (call $eosio_assert
        (i64.eq
         (i64.div_u
          (tee_local $4
           (i64.mul
            (get_local $1)
            (i64.const 5)
           )
          )
          (get_local $1)
         )
         (i64.const 5)
        )
        (i32.const 112)
       )
       (set_local $4
        (i64.div_u
         (get_local $4)
         (i64.const 100)
        )
       )
      )
      (call $eosio_assert
       (i32.const 1)
       (i32.const 144)
      )
      (set_local $1
       (i64.load offset=280
        (get_local $20)
       )
      )
      (block $label$60
       (br_if $label$60
        (i32.eqz
         (get_local $18)
        )
       )
       (i32.store offset=104
        (get_local $20)
        (get_local $0)
       )
       (i32.store offset=108
        (get_local $20)
        (i32.add
         (get_local $20)
         (i32.const 176)
        )
       )
       (call $eosio_assert
        (i32.const 1)
        (i32.const 448)
       )
       (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E8_EEvRKS3_yOSA_
        (i32.add
         (get_local $20)
         (i32.const 184)
        )
        (get_local $18)
        (get_local $1)
        (i32.add
         (get_local $20)
         (i32.const 104)
        )
       )
       (br $label$57)
      )
      (i32.store offset=108
       (get_local $20)
       (i32.add
        (get_local $20)
        (i32.const 176)
       )
      )
      (i32.store offset=104
       (get_local $20)
       (i32.add
        (get_local $20)
        (i32.const 272)
       )
      )
      (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E7_EENS4_14const_iteratorEyOSA_
       (i32.add
        (get_local $20)
        (i32.const 304)
       )
       (i32.add
        (get_local $20)
        (i32.const 184)
       )
       (get_local $1)
       (i32.add
        (get_local $20)
        (i32.const 104)
       )
      )
     )
     (call $eosio_assert
      (i64.ge_u
       (tee_local $4
        (i64.add
         (tee_local $1
          (i64.load offset=160
           (get_local $20)
          )
         )
         (get_local $4)
        )
       )
       (get_local $1)
      )
      (i32.const 112)
     )
     (i64.store offset=160
      (get_local $20)
      (get_local $4)
     )
     (i32.store8 offset=79
      (get_local $20)
      (i64.gt_u
       (get_local $4)
       (i64.const 9999)
      )
     )
     (set_local $4
      (i64.load offset=280
       (get_local $20)
      )
     )
     (block $label$61
      (br_if $label$61
       (i32.eq
        (tee_local $6
         (i32.load
          (i32.add
           (get_local $20)
           (i32.const 212)
          )
         )
        )
        (tee_local $7
         (i32.load
          (i32.add
           (get_local $20)
           (i32.const 208)
          )
         )
        )
       )
      )
      (set_local $18
       (i32.add
        (get_local $6)
        (i32.const -24)
       )
      )
      (set_local $16
       (i32.sub
        (i32.const 0)
        (get_local $7)
       )
      )
      (loop $label$62
       (br_if $label$61
        (i64.eq
         (i64.load
          (i32.load
           (get_local $18)
          )
         )
         (get_local $4)
        )
       )
       (set_local $6
        (get_local $18)
       )
       (set_local $18
        (tee_local $19
         (i32.add
          (get_local $18)
          (i32.const -24)
         )
        )
       )
       (br_if $label$62
        (i32.ne
         (i32.add
          (get_local $19)
          (get_local $16)
         )
         (i32.const -24)
        )
       )
      )
     )
     (block $label$63
      (block $label$64
       (block $label$65
        (block $label$66
         (block $label$67
          (br_if $label$67
           (i32.eq
            (get_local $6)
            (get_local $7)
           )
          )
          (call $eosio_assert
           (i32.eq
            (i32.load offset=40
             (tee_local $18
              (i32.load
               (i32.add
                (get_local $6)
                (i32.const -24)
               )
              )
             )
            )
            (i32.add
             (get_local $20)
             (i32.const 184)
            )
           )
           (i32.const 48)
          )
          (set_local $4
           (i64.load offset=280
            (get_local $20)
           )
          )
          (br_if $label$66
           (get_local $18)
          )
          (br $label$64)
         )
         (br_if $label$65
          (i32.le_s
           (tee_local $18
            (call $db_find_i64
             (i64.load offset=184
              (get_local $20)
             )
             (i64.load
              (i32.add
               (get_local $20)
               (i32.const 192)
              )
             )
             (i64.const 5905160962557476864)
             (get_local $4)
            )
           )
           (i32.const -1)
          )
         )
         (call $eosio_assert
          (i32.eq
           (i32.load offset=40
            (tee_local $18
             (call $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl
              (i32.add
               (get_local $20)
               (i32.const 184)
              )
              (get_local $18)
             )
            )
           )
           (i32.add
            (get_local $20)
            (i32.const 184)
           )
          )
          (i32.const 48)
         )
         (set_local $4
          (i64.load offset=280
           (get_local $20)
          )
         )
        )
        (i32.store offset=104
         (get_local $20)
         (get_local $0)
        )
        (i32.store offset=108
         (get_local $20)
         (i32.add
          (get_local $20)
          (i32.const 160)
         )
        )
        (i32.store offset=112
         (get_local $20)
         (i32.add
          (get_local $20)
          (i32.const 100)
         )
        )
        (call $eosio_assert
         (i32.const 1)
         (i32.const 448)
        )
        (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E10_EEvRKS3_yOSA_
         (i32.add
          (get_local $20)
          (i32.const 184)
         )
         (get_local $18)
         (get_local $4)
         (i32.add
          (get_local $20)
          (i32.const 104)
         )
        )
        (br $label$63)
       )
       (set_local $4
        (i64.load offset=280
         (get_local $20)
        )
       )
      )
      (i32.store offset=104
       (get_local $20)
       (get_local $0)
      )
      (i32.store offset=108
       (get_local $20)
       (i32.add
        (get_local $20)
        (i32.const 280)
       )
      )
      (i32.store offset=112
       (get_local $20)
       (i32.add
        (get_local $20)
        (i32.const 160)
       )
      )
      (i32.store offset=116
       (get_local $20)
       (i32.add
        (get_local $20)
        (i32.const 100)
       )
      )
      (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E9_EENS4_14const_iteratorEyOSA_
       (i32.add
        (get_local $20)
        (i32.const 304)
       )
       (i32.add
        (get_local $20)
        (i32.const 184)
       )
       (get_local $4)
       (i32.add
        (get_local $20)
        (i32.const 104)
       )
      )
     )
     (set_local $1
      (i64.load
       (tee_local $18
        (i32.add
         (get_local $2)
         (i32.const 8)
        )
       )
      )
     )
     (set_local $4
      (i64.load
       (get_local $2)
      )
     )
     (call $eosio_assert
      (i32.const 1)
      (i32.const 192)
     )
     (call $eosio_assert
      (i64.gt_s
       (get_local $4)
       (i64.const -4611686018427387904)
      )
      (i32.const 240)
     )
     (call $eosio_assert
      (i64.lt_s
       (get_local $4)
       (i64.const 4611686018427387904)
      )
      (i32.const 272)
     )
     (i64.store offset=304
      (get_local $20)
      (i64.div_s
       (get_local $4)
       (i64.const 100)
      )
     )
     (i64.store offset=312
      (get_local $20)
      (get_local $1)
     )
     (set_local $1
      (i64.load
       (get_local $18)
      )
     )
     (set_local $4
      (i64.load
       (get_local $2)
      )
     )
     (call $eosio_assert
      (i32.const 1)
      (i32.const 192)
     )
     (call $eosio_assert
      (i64.gt_s
       (get_local $4)
       (i64.const -4611686018427387904)
      )
      (i32.const 240)
     )
     (call $eosio_assert
      (i64.lt_s
       (get_local $4)
       (i64.const 4611686018427387904)
      )
      (i32.const 272)
     )
     (i64.store offset=288
      (get_local $20)
      (i64.div_s
       (get_local $4)
       (i64.const 50)
      )
     )
     (i64.store offset=296
      (get_local $20)
      (get_local $1)
     )
     (set_local $4
      (i64.load offset=280
       (get_local $20)
      )
     )
     (i32.store offset=104
      (get_local $20)
      (get_local $0)
     )
     (i32.store offset=116
      (get_local $20)
      (get_local $2)
     )
     (i32.store offset=108
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 160)
      )
     )
     (i32.store offset=112
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 176)
      )
     )
     (i32.store offset=120
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 304)
      )
     )
     (i32.store offset=124
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 288)
      )
     )
     (i32.store offset=128
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 79)
      )
     )
     (i32.store offset=132
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 280)
      )
     )
     (i32.store offset=136
      (get_local $20)
      (i32.add
       (get_local $20)
       (i32.const 100)
      )
     )
     (call $eosio_assert
      (i32.ne
       (get_local $5)
       (i32.const 0)
      )
      (i32.const 448)
     )
     (call $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE6modifyIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E11_EEvRKS3_yOSA_
      (i32.add
       (get_local $20)
       (i32.const 224)
      )
      (get_local $5)
      (get_local $4)
      (i32.add
       (get_local $20)
       (i32.const 104)
      )
     )
    )
    (br_if $label$12
     (i32.eqz
      (tee_local $6
       (i32.load offset=208
        (get_local $20)
       )
      )
     )
    )
   )
   (block $label$68
    (block $label$69
     (br_if $label$69
      (i32.eq
       (tee_local $18
        (i32.load
         (tee_local $0
          (i32.add
           (get_local $20)
           (i32.const 212)
          )
         )
        )
       )
       (get_local $6)
      )
     )
     (loop $label$70
      (set_local $19
       (i32.load
        (tee_local $18
         (i32.add
          (get_local $18)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $18)
       (i32.const 0)
      )
      (block $label$71
       (br_if $label$71
        (i32.eqz
         (get_local $19)
        )
       )
       (call $_ZdlPv
        (get_local $19)
       )
      )
      (br_if $label$70
       (i32.ne
        (get_local $6)
        (get_local $18)
       )
      )
     )
     (set_local $18
      (i32.load
       (i32.add
        (get_local $20)
        (i32.const 208)
       )
      )
     )
     (br $label$68)
    )
    (set_local $18
     (get_local $6)
    )
   )
   (i32.store
    (get_local $0)
    (get_local $6)
   )
   (call $_ZdlPv
    (get_local $18)
   )
  )
  (block $label$72
   (br_if $label$72
    (i32.eqz
     (tee_local $6
      (i32.load offset=248
       (get_local $20)
      )
     )
    )
   )
   (block $label$73
    (block $label$74
     (br_if $label$74
      (i32.eq
       (tee_local $18
        (i32.load
         (tee_local $0
          (i32.add
           (get_local $20)
           (i32.const 252)
          )
         )
        )
       )
       (get_local $6)
      )
     )
     (loop $label$75
      (set_local $19
       (i32.load
        (tee_local $18
         (i32.add
          (get_local $18)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $18)
       (i32.const 0)
      )
      (block $label$76
       (br_if $label$76
        (i32.eqz
         (get_local $19)
        )
       )
       (call $_ZdlPv
        (get_local $19)
       )
      )
      (br_if $label$75
       (i32.ne
        (get_local $6)
        (get_local $18)
       )
      )
     )
     (set_local $18
      (i32.load
       (i32.add
        (get_local $20)
        (i32.const 248)
       )
      )
     )
     (br $label$73)
    )
    (set_local $18
     (get_local $6)
    )
   )
   (i32.store
    (get_local $0)
    (get_local $6)
   )
   (call $_ZdlPv
    (get_local $18)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $20)
    (i32.const 320)
   )
  )
 )
 (func $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store offset=44
   (tee_local $8
    (get_local $9)
   )
   (get_local $1)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $2
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $3
    (i32.sub
     (i32.const 0)
     (get_local $2)
    )
   )
   (set_local $6
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $4
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $3)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (get_local $2)
     )
    )
    (set_local $6
     (i32.load
      (i32.add
       (get_local $7)
       (i32.const -24)
      )
     )
    )
    (br $label$2)
   )
   (call $eosio_assert
    (i32.xor
     (i32.shr_u
      (tee_local $6
       (call $db_get_i64
        (get_local $1)
        (i32.const 0)
        (i32.const 0)
       )
      )
      (i32.const 31)
     )
     (i32.const 1)
    )
    (i32.const 1376)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.lt_u
       (get_local $6)
       (i32.const 513)
      )
     )
     (set_local $4
      (call $malloc
       (get_local $6)
      )
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $9)
       (i32.and
        (i32.add
         (get_local $6)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $db_get_i64
     (get_local $1)
     (get_local $4)
     (get_local $6)
    )
   )
   (i32.store offset=36
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=32
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=40
    (get_local $8)
    (i32.add
     (get_local $4)
     (get_local $6)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (get_local $6)
      (i32.const 513)
     )
    )
    (call $free
     (get_local $4)
    )
   )
   (i32.store offset=12
    (get_local $8)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
   )
   (i32.store offset=16
    (get_local $8)
    (i32.add
     (get_local $8)
     (i32.const 44)
    )
   )
   (i32.store offset=8
    (get_local $8)
    (get_local $0)
   )
   (set_local $6
    (call $_ZN5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE4itemC2IZNKS4_31load_object_by_primary_iteratorElEUlRT_E_EEPKS4_OS7_
     (tee_local $4
      (call $_Znwj
       (i32.const 32)
      )
     )
     (get_local $0)
     (i32.add
      (get_local $8)
      (i32.const 8)
     )
    )
   )
   (i32.store offset=24
    (get_local $8)
    (get_local $4)
   )
   (i64.store offset=8
    (get_local $8)
    (tee_local $5
     (i64.shr_u
      (i64.load offset=8
       (get_local $4)
      )
      (i64.const 8)
     )
    )
   )
   (i32.store offset=4
    (get_local $8)
    (tee_local $1
     (i32.load offset=20
      (get_local $4)
     )
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i32.ge_u
       (tee_local $7
        (i32.load
         (tee_local $3
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $7)
      (get_local $5)
     )
     (i32.store offset=16
      (get_local $7)
      (get_local $1)
     )
     (i32.store offset=24
      (get_local $8)
      (i32.const 0)
     )
     (i32.store
      (get_local $7)
      (get_local $4)
     )
     (i32.store
      (get_local $3)
      (i32.add
       (get_local $7)
       (i32.const 24)
      )
     )
     (br $label$7)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 8)
     )
     (i32.add
      (get_local $8)
      (i32.const 4)
     )
    )
   )
   (set_local $4
    (i32.load offset=24
     (get_local $8)
    )
   )
   (i32.store offset=24
    (get_local $8)
    (i32.const 0)
   )
   (br_if $label$2
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
  (get_local $6)
 )
 (func $_ZNK5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (set_local $8
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $9)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $6
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $2
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $3
    (i32.sub
     (i32.const 0)
     (get_local $2)
    )
   )
   (set_local $5
    (i32.add
     (get_local $6)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (i32.load
       (i32.add
        (get_local $5)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
    (set_local $6
     (get_local $5)
    )
    (set_local $5
     (tee_local $4
      (i32.add
       (get_local $5)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $3)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $6)
      (get_local $2)
     )
    )
    (set_local $4
     (i32.load
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br $label$2)
   )
   (call $eosio_assert
    (i32.xor
     (i32.shr_u
      (tee_local $5
       (call $db_get_i64
        (get_local $1)
        (i32.const 0)
        (i32.const 0)
       )
      )
      (i32.const 31)
     )
     (i32.const 1)
    )
    (i32.const 1376)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.lt_u
       (get_local $5)
       (i32.const 513)
      )
     )
     (set_local $4
      (call $malloc
       (get_local $5)
      )
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $9)
       (i32.and
        (i32.add
         (get_local $5)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $db_get_i64
     (get_local $1)
     (get_local $4)
     (get_local $5)
    )
   )
   (i32.store offset=36
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=32
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=40
    (get_local $8)
    (i32.add
     (get_local $4)
     (get_local $5)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (get_local $5)
      (i32.const 513)
     )
    )
    (call $free
     (get_local $4)
    )
   )
   (set_local $3
    (i32.add
     (get_local $0)
     (i32.const 24)
    )
   )
   (i64.store offset=24
    (tee_local $4
     (call $_Znwj
      (i32.const 48)
     )
    )
    (i64.const 1398362884)
   )
   (i64.store offset=16
    (get_local $4)
    (i64.const 0)
   )
   (call $eosio_assert
    (i32.const 1)
    (i32.const 608)
   )
   (set_local $7
    (i64.const 5462355)
   )
   (set_local $5
    (i32.const 0)
   )
   (block $label$7
    (block $label$8
     (loop $label$9
      (br_if $label$8
       (i32.gt_u
        (i32.add
         (i32.shl
          (i32.wrap/i64
           (get_local $7)
          )
          (i32.const 24)
         )
         (i32.const -1073741825)
        )
        (i32.const 452984830)
       )
      )
      (block $label$10
       (br_if $label$10
        (i64.ne
         (i64.and
          (tee_local $7
           (i64.shr_u
            (get_local $7)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (loop $label$11
        (br_if $label$8
         (i64.ne
          (i64.and
           (tee_local $7
            (i64.shr_u
             (get_local $7)
             (i64.const 8)
            )
           )
           (i64.const 255)
          )
          (i64.const 0)
         )
        )
        (br_if $label$11
         (i32.lt_s
          (tee_local $5
           (i32.add
            (get_local $5)
            (i32.const 1)
           )
          )
          (i32.const 7)
         )
        )
       )
      )
      (set_local $6
       (i32.const 1)
      )
      (br_if $label$9
       (i32.lt_s
        (tee_local $5
         (i32.add
          (get_local $5)
          (i32.const 1)
         )
        )
        (i32.const 7)
       )
      )
      (br $label$7)
     )
    )
    (set_local $6
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (get_local $6)
    (i32.const 160)
   )
   (i32.store offset=32
    (get_local $4)
    (get_local $0)
   )
   (drop
    (call $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button8accstateE
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (get_local $4)
    )
   )
   (i32.store offset=36
    (get_local $4)
    (get_local $1)
   )
   (i32.store offset=24
    (get_local $8)
    (get_local $4)
   )
   (i64.store offset=16
    (get_local $8)
    (tee_local $7
     (i64.load
      (get_local $4)
     )
    )
   )
   (i32.store offset=12
    (get_local $8)
    (tee_local $6
     (i32.load offset=36
      (get_local $4)
     )
    )
   )
   (block $label$12
    (block $label$13
     (br_if $label$13
      (i32.ge_u
       (tee_local $5
        (i32.load
         (tee_local $1
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $5)
      (get_local $7)
     )
     (i32.store offset=16
      (get_local $5)
      (get_local $6)
     )
     (i32.store offset=24
      (get_local $8)
      (i32.const 0)
     )
     (i32.store
      (get_local $5)
      (get_local $4)
     )
     (i32.store
      (get_local $1)
      (i32.add
       (get_local $5)
       (i32.const 24)
      )
     )
     (br $label$12)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
     (get_local $3)
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 16)
     )
     (i32.add
      (get_local $8)
      (i32.const 12)
     )
    )
   )
   (set_local $5
    (i32.load offset=24
     (get_local $8)
    )
   )
   (i32.store offset=24
    (get_local $8)
    (i32.const 0)
   )
   (br_if $label$2
    (i32.eqz
     (get_local $5)
    )
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
  (get_local $4)
 )
 (func $_ZNK5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (set_local $8
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $9)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $2
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $3
    (i32.sub
     (i32.const 0)
     (get_local $2)
    )
   )
   (set_local $6
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $4
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $3)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (get_local $2)
     )
    )
    (set_local $6
     (i32.load
      (i32.add
       (get_local $7)
       (i32.const -24)
      )
     )
    )
    (br $label$2)
   )
   (call $eosio_assert
    (i32.xor
     (i32.shr_u
      (tee_local $6
       (call $db_get_i64
        (get_local $1)
        (i32.const 0)
        (i32.const 0)
       )
      )
      (i32.const 31)
     )
     (i32.const 1)
    )
    (i32.const 1376)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.lt_u
       (get_local $6)
       (i32.const 513)
      )
     )
     (set_local $4
      (call $malloc
       (get_local $6)
      )
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $9)
       (i32.and
        (i32.add
         (get_local $6)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $db_get_i64
     (get_local $1)
     (get_local $4)
     (get_local $6)
    )
   )
   (i32.store offset=36
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=32
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=40
    (get_local $8)
    (i32.add
     (get_local $4)
     (get_local $6)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (get_local $6)
      (i32.const 513)
     )
    )
    (call $free
     (get_local $4)
    )
   )
   (set_local $4
    (call $_ZN3ebt10eos_button7ebtgameC2Ev
     (tee_local $6
      (call $_Znwj
       (i32.const 136)
      )
     )
    )
   )
   (i32.store offset=124
    (get_local $6)
    (get_local $0)
   )
   (drop
    (call $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button7ebtgameE
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (get_local $4)
    )
   )
   (i32.store offset=128
    (get_local $6)
    (get_local $1)
   )
   (i32.store offset=24
    (get_local $8)
    (get_local $6)
   )
   (i64.store offset=16
    (get_local $8)
    (tee_local $5
     (i64.load
      (get_local $6)
     )
    )
   )
   (i32.store offset=12
    (get_local $8)
    (tee_local $7
     (i32.load offset=128
      (get_local $6)
     )
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i32.ge_u
       (tee_local $4
        (i32.load
         (tee_local $1
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $4)
      (get_local $5)
     )
     (i32.store offset=16
      (get_local $4)
      (get_local $7)
     )
     (i32.store offset=24
      (get_local $8)
      (i32.const 0)
     )
     (i32.store
      (get_local $4)
      (get_local $6)
     )
     (i32.store
      (get_local $1)
      (i32.add
       (get_local $4)
       (i32.const 24)
      )
     )
     (br $label$7)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 16)
     )
     (i32.add
      (get_local $8)
      (i32.const 12)
     )
    )
   )
   (set_local $4
    (i32.load offset=24
     (get_local $8)
    )
   )
   (i32.store offset=24
    (get_local $8)
    (i32.const 0)
   )
   (br_if $label$2
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
  (get_local $6)
 )
 (func $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE7emplaceIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E_EENS4_14const_iteratorEyOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 160)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (set_local $6
   (call $_ZN3ebt10eos_button7ebtgameC2Ev
    (tee_local $4
     (call $_Znwj
      (i32.const 136)
     )
    )
   )
  )
  (i32.store offset=124
   (get_local $4)
   (get_local $1)
  )
  (call $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E_clIS4_EEDaSA_
   (get_local $3)
   (get_local $6)
  )
  (i32.store offset=152
   (get_local $8)
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 124)
   )
  )
  (i32.store offset=148
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (i32.store offset=144
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button7ebtgameE
    (i32.add
     (get_local $8)
     (i32.const 144)
    )
    (get_local $6)
   )
  )
  (i32.store offset=128
   (get_local $4)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $1)
    )
    (i64.const 5904996781212565504)
    (get_local $2)
    (tee_local $5
     (i64.load
      (get_local $4)
     )
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 124)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $5)
     (i64.load offset=16
      (get_local $1)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $5)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=144
   (get_local $8)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $8)
   (tee_local $5
    (i64.load
     (get_local $4)
    )
   )
  )
  (i32.store offset=12
   (get_local $8)
   (tee_local $3
    (i32.load offset=128
     (get_local $4)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (tee_local $6
       (i32.load
        (tee_local $7
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $6)
     (get_local $5)
    )
    (i32.store offset=16
     (get_local $6)
     (get_local $3)
    )
    (i32.store offset=144
     (get_local $8)
     (i32.const 0)
    )
    (i32.store
     (get_local $6)
     (get_local $4)
    )
    (i32.store
     (get_local $7)
     (i32.add
      (get_local $6)
      (i32.const 24)
     )
    )
    (br $label$1)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $8)
     (i32.const 144)
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.add
     (get_local $8)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $1
   (i32.load offset=144
    (get_local $8)
   )
  )
  (i32.store offset=144
   (get_local $8)
   (i32.const 0)
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (get_local $1)
    )
   )
   (call $_ZdlPv
    (get_local $1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 160)
   )
  )
 )
 (func $_ZNK5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (set_local $8
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $9)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $2
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $3
    (i32.sub
     (i32.const 0)
     (get_local $2)
    )
   )
   (set_local $6
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $4
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $3)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (get_local $2)
     )
    )
    (set_local $6
     (i32.load
      (i32.add
       (get_local $7)
       (i32.const -24)
      )
     )
    )
    (br $label$2)
   )
   (call $eosio_assert
    (i32.xor
     (i32.shr_u
      (tee_local $6
       (call $db_get_i64
        (get_local $1)
        (i32.const 0)
        (i32.const 0)
       )
      )
      (i32.const 31)
     )
     (i32.const 1)
    )
    (i32.const 1376)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.lt_u
       (get_local $6)
       (i32.const 513)
      )
     )
     (set_local $4
      (call $malloc
       (get_local $6)
      )
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $9)
       (i32.and
        (i32.add
         (get_local $6)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $db_get_i64
     (get_local $1)
     (get_local $4)
     (get_local $6)
    )
   )
   (i32.store offset=36
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=32
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=40
    (get_local $8)
    (i32.add
     (get_local $4)
     (get_local $6)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (get_local $6)
      (i32.const 513)
     )
    )
    (call $free
     (get_local $4)
    )
   )
   (i32.store offset=40
    (tee_local $6
     (call $_Znwj
      (i32.const 56)
     )
    )
    (get_local $0)
   )
   (drop
    (call $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button9ebtplayerE
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (get_local $6)
    )
   )
   (i32.store offset=44
    (get_local $6)
    (get_local $1)
   )
   (i32.store offset=24
    (get_local $8)
    (get_local $6)
   )
   (i64.store offset=16
    (get_local $8)
    (tee_local $5
     (i64.load
      (get_local $6)
     )
    )
   )
   (i32.store offset=12
    (get_local $8)
    (tee_local $7
     (i32.load offset=44
      (get_local $6)
     )
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i32.ge_u
       (tee_local $4
        (i32.load
         (tee_local $1
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $4)
      (get_local $5)
     )
     (i32.store offset=16
      (get_local $4)
      (get_local $7)
     )
     (i32.store offset=24
      (get_local $8)
      (i32.const 0)
     )
     (i32.store
      (get_local $4)
      (get_local $6)
     )
     (i32.store
      (get_local $1)
      (i32.add
       (get_local $4)
       (i32.const 24)
      )
     )
     (br $label$7)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 16)
     )
     (i32.add
      (get_local $8)
      (i32.const 12)
     )
    )
   )
   (set_local $4
    (i32.load offset=24
     (get_local $8)
    )
   )
   (i32.store offset=24
    (get_local $8)
    (i32.const 0)
   )
   (br_if $label$2
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
  (get_local $6)
 )
 (func $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE (param $0 i32) (param $1 i64) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 40)
   )
   (i32.const 0)
  )
  (i64.store offset=16
   (get_local $7)
   (get_local $1)
  )
  (i64.store offset=24
   (get_local $7)
   (i64.const -1)
  )
  (i64.store offset=32
   (get_local $7)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $7)
   (i64.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i64.ge_s
    (i64.load
     (tee_local $0
      (call $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE3getEyPKc
       (i32.add
        (get_local $7)
        (i32.const 8)
       )
       (i64.shr_u
        (tee_local $1
         (i64.load offset=8
          (get_local $2)
         )
        )
        (i64.const 8)
       )
       (i32.const 1312)
      )
     )
    )
    (tee_local $4
     (i64.load
      (get_local $2)
     )
    )
   )
   (i32.const 1344)
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=16
     (get_local $0)
    )
    (i32.add
     (get_local $7)
     (i32.const 8)
    )
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (get_local $7)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $1)
    (tee_local $5
     (i64.load offset=8
      (get_local $0)
     )
    )
   )
   (i32.const 864)
  )
  (i64.store
   (get_local $0)
   (tee_local $1
    (i64.sub
     (i64.load
      (get_local $0)
     )
     (get_local $4)
    )
   )
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $1)
    (i64.const -4611686018427387904)
   )
   (i32.const 912)
  )
  (call $eosio_assert
   (i64.lt_s
    (i64.load
     (get_local $0)
    )
    (i64.const 4611686018427387904)
   )
   (i32.const 944)
  )
  (call $eosio_assert
   (i64.eq
    (tee_local $1
     (i64.shr_u
      (get_local $5)
      (i64.const 8)
     )
    )
    (i64.shr_u
     (i64.load offset=8
      (get_local $0)
     )
     (i64.const 8)
    )
   )
   (i32.const 784)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $7)
     (i32.const 48)
    )
    (get_local $0)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (i32.add
      (get_local $7)
      (i32.const 48)
     )
     (i32.const 8)
    )
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (call $db_update_i64
   (i32.load offset=20
    (get_local $0)
   )
   (i64.const 0)
   (i32.add
    (get_local $7)
    (i32.const 48)
   )
   (i32.const 16)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $1)
     (i64.load offset=24
      (get_local $7)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (get_local $7)
      (i32.const 8)
     )
     (i32.const 16)
    )
    (i64.add
     (get_local $1)
     (i64.const 1)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (tee_local $3
      (i32.load offset=32
       (get_local $7)
      )
     )
    )
   )
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eq
       (tee_local $0
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $7)
           (i32.const 36)
          )
         )
        )
       )
       (get_local $3)
      )
     )
     (loop $label$4
      (set_local $2
       (i32.load
        (tee_local $0
         (i32.add
          (get_local $0)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $0)
       (i32.const 0)
      )
      (block $label$5
       (br_if $label$5
        (i32.eqz
         (get_local $2)
        )
       )
       (call $_ZdlPv
        (get_local $2)
       )
      )
      (br_if $label$4
       (i32.ne
        (get_local $3)
        (get_local $0)
       )
      )
     )
     (set_local $0
      (i32.load
       (i32.add
        (get_local $7)
        (i32.const 32)
       )
      )
     )
     (br $label$2)
    )
    (set_local $0
     (get_local $3)
    )
   )
   (i32.store
    (get_local $6)
    (get_local $3)
   )
   (call $_ZdlPv
    (get_local $0)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 64)
   )
  )
 )
 (func $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 80)
    )
   )
  )
  (set_local $8
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $9)
     (i32.const 8)
    )
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store offset=24
   (get_local $9)
   (i64.const -1)
  )
  (i64.store offset=32
   (get_local $9)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $9)
   (tee_local $6
    (i64.load
     (get_local $0)
    )
   )
  )
  (i64.store offset=16
   (get_local $9)
   (get_local $1)
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.lt_s
        (tee_local $0
         (call $db_find_i64
          (get_local $6)
          (get_local $1)
          (i64.const 3607749779137757184)
          (i64.shr_u
           (tee_local $4
            (i64.load offset=8
             (get_local $2)
            )
           )
           (i64.const 8)
          )
         )
        )
        (i32.const 0)
       )
      )
      (call $eosio_assert
       (i32.eq
        (i32.load offset=16
         (tee_local $8
          (call $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE31load_object_by_primary_iteratorEl
           (i32.add
            (get_local $9)
            (i32.const 8)
           )
           (get_local $0)
          )
         )
        )
        (i32.add
         (get_local $9)
         (i32.const 8)
        )
       )
       (i32.const 48)
      )
      (call $eosio_assert
       (i32.const 1)
       (i32.const 448)
      )
      (call $eosio_assert
       (i32.eq
        (i32.load offset=16
         (get_local $8)
        )
        (i32.add
         (get_local $9)
         (i32.const 8)
        )
       )
       (i32.const 672)
      )
      (call $eosio_assert
       (i64.eq
        (i64.load offset=8
         (get_local $9)
        )
        (call $current_receiver)
       )
       (i32.const 720)
      )
      (call $eosio_assert
       (i64.eq
        (get_local $4)
        (tee_local $1
         (i64.load offset=8
          (get_local $8)
         )
        )
       )
       (i32.const 304)
      )
      (i64.store
       (get_local $8)
       (tee_local $6
        (i64.add
         (i64.load
          (get_local $8)
         )
         (i64.load
          (get_local $2)
         )
        )
       )
      )
      (call $eosio_assert
       (i64.gt_s
        (get_local $6)
        (i64.const -4611686018427387904)
       )
       (i32.const 352)
      )
      (call $eosio_assert
       (i64.lt_s
        (i64.load
         (get_local $8)
        )
        (i64.const 4611686018427387904)
       )
       (i32.const 384)
      )
      (call $eosio_assert
       (i64.eq
        (tee_local $1
         (i64.shr_u
          (get_local $1)
          (i64.const 8)
         )
        )
        (i64.shr_u
         (i64.load offset=8
          (get_local $8)
         )
         (i64.const 8)
        )
       )
       (i32.const 784)
      )
      (call $eosio_assert
       (i32.const 1)
       (i32.const 848)
      )
      (drop
       (call $memcpy
        (i32.add
         (get_local $9)
         (i32.const 64)
        )
        (get_local $8)
        (i32.const 8)
       )
      )
      (call $eosio_assert
       (i32.const 1)
       (i32.const 848)
      )
      (drop
       (call $memcpy
        (i32.or
         (i32.add
          (get_local $9)
          (i32.const 64)
         )
         (i32.const 8)
        )
        (i32.add
         (get_local $8)
         (i32.const 8)
        )
        (i32.const 8)
       )
      )
      (call $db_update_i64
       (i32.load offset=20
        (get_local $8)
       )
       (i64.const 0)
       (i32.add
        (get_local $9)
        (i32.const 64)
       )
       (i32.const 16)
      )
      (br_if $label$2
       (i64.lt_u
        (get_local $1)
        (i64.load
         (tee_local $8
          (i32.add
           (i32.add
            (get_local $9)
            (i32.const 8)
           )
           (i32.const 16)
          )
         )
        )
       )
      )
      (i64.store
       (get_local $8)
       (i64.add
        (get_local $1)
        (i64.const 1)
       )
      )
      (br_if $label$1
       (tee_local $2
        (i32.load offset=32
         (get_local $9)
        )
       )
      )
      (br $label$0)
     )
     (call $eosio_assert
      (i64.eq
       (i64.load offset=8
        (get_local $9)
       )
       (call $current_receiver)
      )
      (i32.const 976)
     )
     (i64.store offset=8
      (tee_local $0
       (call $_Znwj
        (i32.const 32)
       )
      )
      (i64.const 1398362884)
     )
     (i64.store
      (get_local $0)
      (i64.const 0)
     )
     (call $eosio_assert
      (i32.const 1)
      (i32.const 608)
     )
     (set_local $5
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
     )
     (set_local $1
      (i64.const 5462355)
     )
     (block $label$4
      (loop $label$5
       (set_local $7
        (i32.const 0)
       )
       (br_if $label$4
        (i32.gt_u
         (i32.add
          (i32.shl
           (i32.wrap/i64
            (get_local $1)
           )
           (i32.const 24)
          )
          (i32.const -1073741825)
         )
         (i32.const 452984830)
        )
       )
       (block $label$6
        (br_if $label$6
         (i64.ne
          (i64.and
           (tee_local $1
            (i64.shr_u
             (get_local $1)
             (i64.const 8)
            )
           )
           (i64.const 255)
          )
          (i64.const 0)
         )
        )
        (loop $label$7
         (br_if $label$4
          (i64.ne
           (i64.and
            (tee_local $1
             (i64.shr_u
              (get_local $1)
              (i64.const 8)
             )
            )
            (i64.const 255)
           )
           (i64.const 0)
          )
         )
         (br_if $label$7
          (i32.lt_s
           (tee_local $8
            (i32.add
             (get_local $8)
             (i32.const 1)
            )
           )
           (i32.const 7)
          )
         )
        )
       )
       (set_local $7
        (i32.const 1)
       )
       (br_if $label$5
        (i32.lt_s
         (tee_local $8
          (i32.add
           (get_local $8)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (call $eosio_assert
      (get_local $7)
      (i32.const 160)
     )
     (i32.store offset=16
      (get_local $0)
      (i32.add
       (get_local $9)
       (i32.const 8)
      )
     )
     (i64.store
      (tee_local $8
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
      (i64.load
       (i32.add
        (get_local $2)
        (i32.const 8)
       )
      )
     )
     (i64.store
      (get_local $0)
      (i64.load
       (get_local $2)
      )
     )
     (call $eosio_assert
      (i32.const 1)
      (i32.const 848)
     )
     (drop
      (call $memcpy
       (i32.add
        (get_local $9)
        (i32.const 64)
       )
       (get_local $0)
       (i32.const 8)
      )
     )
     (call $eosio_assert
      (i32.const 1)
      (i32.const 848)
     )
     (drop
      (call $memcpy
       (i32.or
        (i32.add
         (get_local $9)
         (i32.const 64)
        )
        (i32.const 8)
       )
       (get_local $5)
       (i32.const 8)
      )
     )
     (i32.store offset=20
      (get_local $0)
      (tee_local $2
       (call $db_store_i64
        (i64.load
         (i32.add
          (i32.add
           (get_local $9)
           (i32.const 8)
          )
          (i32.const 8)
         )
        )
        (i64.const 3607749779137757184)
        (get_local $3)
        (tee_local $1
         (i64.shr_u
          (i64.load
           (get_local $8)
          )
          (i64.const 8)
         )
        )
        (i32.add
         (get_local $9)
         (i32.const 64)
        )
        (i32.const 16)
       )
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.lt_u
        (get_local $1)
        (i64.load
         (tee_local $7
          (i32.add
           (i32.add
            (get_local $9)
            (i32.const 8)
           )
           (i32.const 16)
          )
         )
        )
       )
      )
      (i64.store
       (get_local $7)
       (i64.add
        (get_local $1)
        (i64.const 1)
       )
      )
     )
     (i32.store offset=56
      (get_local $9)
      (get_local $0)
     )
     (i64.store offset=64
      (get_local $9)
      (tee_local $1
       (i64.shr_u
        (i64.load
         (get_local $8)
        )
        (i64.const 8)
       )
      )
     )
     (i32.store offset=52
      (get_local $9)
      (get_local $2)
     )
     (block $label$9
      (block $label$10
       (br_if $label$10
        (i32.ge_u
         (tee_local $8
          (i32.load
           (tee_local $7
            (i32.add
             (get_local $9)
             (i32.const 36)
            )
           )
          )
         )
         (i32.load
          (i32.add
           (get_local $9)
           (i32.const 40)
          )
         )
        )
       )
       (i64.store offset=8
        (get_local $8)
        (get_local $1)
       )
       (i32.store offset=16
        (get_local $8)
        (get_local $2)
       )
       (i32.store offset=56
        (get_local $9)
        (i32.const 0)
       )
       (i32.store
        (get_local $8)
        (get_local $0)
       )
       (i32.store
        (get_local $7)
        (i32.add
         (get_local $8)
         (i32.const 24)
        )
       )
       (br $label$9)
      )
      (call $_ZNSt3__16vectorIN5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
       (i32.add
        (get_local $9)
        (i32.const 32)
       )
       (i32.add
        (get_local $9)
        (i32.const 56)
       )
       (i32.add
        (get_local $9)
        (i32.const 64)
       )
       (i32.add
        (get_local $9)
        (i32.const 52)
       )
      )
     )
     (set_local $8
      (i32.load offset=56
       (get_local $9)
      )
     )
     (i32.store offset=56
      (get_local $9)
      (i32.const 0)
     )
     (br_if $label$2
      (i32.eqz
       (get_local $8)
      )
     )
     (call $_ZdlPv
      (get_local $8)
     )
    )
    (br_if $label$0
     (i32.eqz
      (tee_local $2
       (i32.load offset=32
        (get_local $9)
       )
      )
     )
    )
   )
   (block $label$11
    (block $label$12
     (br_if $label$12
      (i32.eq
       (tee_local $8
        (i32.load
         (tee_local $7
          (i32.add
           (get_local $9)
           (i32.const 36)
          )
         )
        )
       )
       (get_local $2)
      )
     )
     (loop $label$13
      (set_local $0
       (i32.load
        (tee_local $8
         (i32.add
          (get_local $8)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $8)
       (i32.const 0)
      )
      (block $label$14
       (br_if $label$14
        (i32.eqz
         (get_local $0)
        )
       )
       (call $_ZdlPv
        (get_local $0)
       )
      )
      (br_if $label$13
       (i32.ne
        (get_local $2)
        (get_local $8)
       )
      )
     )
     (set_local $8
      (i32.load
       (i32.add
        (get_local $9)
        (i32.const 32)
       )
      )
     )
     (br $label$11)
    )
    (set_local $8
     (get_local $2)
    )
   )
   (i32.store
    (get_local $7)
    (get_local $2)
   )
   (call $_ZdlPv
    (get_local $8)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $9)
    (i32.const 80)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E1_EEvRKS3_yOSC_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=32
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (set_local $7
   (i64.load offset=16
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (tee_local $6
      (i32.load
       (get_local $3)
      )
     )
    )
    (tee_local $5
     (i64.load
      (tee_local $3
       (i32.add
        (get_local $1)
        (i32.const 24)
       )
      )
     )
    )
   )
   (i32.const 304)
  )
  (call $eosio_assert
   (i64.gt_s
    (tee_local $7
     (i64.add
      (get_local $7)
      (i64.load
       (get_local $6)
      )
     )
    )
    (i64.const -4611686018427387904)
   )
   (i32.const 352)
  )
  (call $eosio_assert
   (i64.lt_s
    (get_local $7)
    (i64.const 4611686018427387904)
   )
   (i32.const 384)
  )
  (i64.store
   (get_local $3)
   (get_local $5)
  )
  (i64.store offset=16
   (get_local $1)
   (get_local $7)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (get_local $8)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $8)
     (i32.const 8)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $8)
     (i32.const 12)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 20)
    )
    (get_local $3)
    (i32.const 8)
   )
  )
  (call $db_update_i64
   (i32.load offset=36
    (get_local $1)
   )
   (get_local $2)
   (get_local $8)
   (i32.const 28)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E0_EENS4_14const_iteratorEyOSC_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i64.store offset=40
   (get_local $7)
   (get_local $2)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (i32.store offset=20
   (get_local $7)
   (get_local $3)
  )
  (i32.store offset=16
   (get_local $7)
   (get_local $1)
  )
  (i32.store offset=24
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 40)
   )
  )
  (i64.store offset=24
   (tee_local $4
    (call $_Znwj
     (i32.const 48)
    )
   )
   (i64.const 1398362884)
  )
  (i64.store offset=16
   (get_local $4)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $2
   (i64.const 5462355)
  )
  (set_local $3
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $2)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $2
          (i64.shr_u
           (get_local $2)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $2
           (i64.shr_u
            (get_local $2)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $3
          (i32.add
           (get_local $3)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $6
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $3
        (i32.add
         (get_local $3)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $6
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $6)
   (i32.const 160)
  )
  (i32.store offset=32
   (get_local $4)
   (get_local $1)
  )
  (call $_ZZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E0_EENS4_14const_iteratorEyOSC_ENKUlSD_E_clINS4_4itemEEEDaSD_
   (i32.add
    (get_local $7)
    (i32.const 16)
   )
   (get_local $4)
  )
  (i32.store offset=32
   (get_local $7)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $7)
   (tee_local $2
    (i64.load
     (get_local $4)
    )
   )
  )
  (i32.store offset=12
   (get_local $7)
   (tee_local $6
    (i32.load offset=36
     (get_local $4)
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.ge_u
      (tee_local $3
       (i32.load
        (tee_local $5
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $3)
     (get_local $2)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $6)
    )
    (i32.store offset=32
     (get_local $7)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $4)
    )
    (i32.store
     (get_local $5)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$5)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $7)
     (i32.const 32)
    )
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
    (i32.add
     (get_local $7)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $3
   (i32.load offset=32
    (get_local $7)
   )
  )
  (i32.store offset=32
   (get_local $7)
   (i32.const 0)
  )
  (block $label$7
   (br_if $label$7
    (i32.eqz
     (get_local $3)
    )
   )
   (call $_ZdlPv
    (get_local $3)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE5eraseERKS3_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (call $eosio_assert
   (i32.eq
    (i32.load offset=40
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 1136)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 1184)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (tee_local $5
        (i32.add
         (get_local $0)
         (i32.const 28)
        )
       )
      )
     )
     (tee_local $3
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $2
    (i64.load
     (get_local $1)
    )
   )
   (set_local $6
    (i32.sub
     (i32.const 0)
     (get_local $3)
    )
   )
   (set_local $8
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i64.eq
      (i64.load
       (i32.load
        (get_local $8)
       )
      )
      (get_local $2)
     )
    )
    (set_local $7
     (get_local $8)
    )
    (set_local $8
     (tee_local $4
      (i32.add
       (get_local $8)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $6)
      )
      (i32.const -24)
     )
    )
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $7)
    (get_local $3)
   )
   (i32.const 1248)
  )
  (set_local $8
   (i32.add
    (get_local $7)
    (i32.const -24)
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (tee_local $4
       (i32.load
        (get_local $5)
       )
      )
     )
    )
    (set_local $3
     (i32.sub
      (i32.const 0)
      (get_local $4)
     )
    )
    (set_local $7
     (get_local $8)
    )
    (loop $label$4
     (set_local $6
      (i32.load
       (tee_local $8
        (i32.add
         (get_local $7)
         (i32.const 24)
        )
       )
      )
     )
     (i32.store
      (get_local $8)
      (i32.const 0)
     )
     (set_local $4
      (i32.load
       (get_local $7)
      )
     )
     (i32.store
      (get_local $7)
      (get_local $6)
     )
     (block $label$5
      (br_if $label$5
       (i32.eqz
        (get_local $4)
       )
      )
      (call $_ZdlPv
       (get_local $4)
      )
     )
     (i32.store
      (i32.add
       (get_local $7)
       (i32.const 16)
      )
      (i32.load
       (i32.add
        (get_local $7)
        (i32.const 40)
       )
      )
     )
     (i64.store
      (i32.add
       (get_local $7)
       (i32.const 8)
      )
      (i64.load
       (i32.add
        (get_local $7)
        (i32.const 32)
       )
      )
     )
     (set_local $7
      (get_local $8)
     )
     (br_if $label$4
      (i32.ne
       (i32.add
        (get_local $8)
        (get_local $3)
       )
       (i32.const -24)
      )
     )
    )
    (br_if $label$2
     (i32.eq
      (tee_local $7
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 28)
        )
       )
      )
      (get_local $8)
     )
    )
   )
   (loop $label$6
    (set_local $4
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$7
     (br_if $label$7
      (i32.eqz
       (get_local $4)
      )
     )
     (call $_ZdlPv
      (get_local $4)
     )
    )
    (br_if $label$6
     (i32.ne
      (get_local $8)
      (get_local $7)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 28)
   )
   (get_local $8)
  )
  (call $db_remove_i64
   (i32.load offset=44
    (get_local $1)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E2_EENS4_14const_iteratorEyOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 80)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (i32.store offset=40
   (tee_local $4
    (call $_Znwj
     (i32.const 56)
    )
   )
   (get_local $1)
  )
  (i64.store
   (get_local $4)
   (i64.load
    (i32.load
     (get_local $3)
    )
   )
  )
  (i64.store offset=8
   (get_local $4)
   (i64.const 10000)
  )
  (i64.store offset=16
   (get_local $4)
   (i64.const 10000)
  )
  (i64.store offset=24
   (get_local $4)
   (i64.const 2)
  )
  (i32.store offset=32
   (get_local $4)
   (i32.const 0)
  )
  (i32.store offset=72
   (get_local $8)
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (i32.store offset=68
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (get_local $4)
   )
  )
  (i32.store offset=44
   (get_local $4)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $1)
    )
    (i64.const 5905160962557476864)
    (get_local $2)
    (tee_local $5
     (i64.load
      (get_local $4)
     )
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $5)
     (i64.load offset=16
      (get_local $1)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $5)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=64
   (get_local $8)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $8)
   (tee_local $5
    (i64.load
     (get_local $4)
    )
   )
  )
  (i32.store offset=12
   (get_local $8)
   (tee_local $6
    (i32.load offset=44
     (get_local $4)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (tee_local $3
       (i32.load
        (tee_local $7
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $3)
     (get_local $5)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $6)
    )
    (i32.store offset=64
     (get_local $8)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $4)
    )
    (i32.store
     (get_local $7)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$1)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.add
     (get_local $8)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $4
   (i32.load offset=64
    (get_local $8)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.const 0)
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 80)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE6modifyIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E3_EEvRKS3_yOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 144)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=124
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E3_clIS4_EEDaSA_
   (get_local $3)
   (get_local $1)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (i32.store offset=136
   (get_local $5)
   (i32.add
    (get_local $5)
    (i32.const 124)
   )
  )
  (i32.store offset=132
   (get_local $5)
   (get_local $5)
  )
  (i32.store offset=128
   (get_local $5)
   (get_local $5)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button7ebtgameE
    (i32.add
     (get_local $5)
     (i32.const 128)
    )
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=128
    (get_local $1)
   )
   (get_local $2)
   (get_local $5)
   (i32.const 124)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 144)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E4_EENS4_14const_iteratorEyOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 80)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (i32.store offset=40
   (tee_local $4
    (call $_Znwj
     (i32.const 56)
    )
   )
   (get_local $1)
  )
  (i64.store
   (get_local $4)
   (i64.load
    (i32.load
     (get_local $3)
    )
   )
  )
  (i64.store offset=24
   (get_local $4)
   (i64.const 4)
  )
  (i32.store offset=72
   (get_local $8)
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (i32.store offset=68
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (get_local $4)
   )
  )
  (i32.store offset=44
   (get_local $4)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $1)
    )
    (i64.const 5905160962557476864)
    (get_local $2)
    (tee_local $5
     (i64.load
      (get_local $4)
     )
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $5)
     (i64.load offset=16
      (get_local $1)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $5)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=64
   (get_local $8)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $8)
   (tee_local $5
    (i64.load
     (get_local $4)
    )
   )
  )
  (i32.store offset=12
   (get_local $8)
   (tee_local $6
    (i32.load offset=44
     (get_local $4)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (tee_local $3
       (i32.load
        (tee_local $7
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $3)
     (get_local $5)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $6)
    )
    (i32.store offset=64
     (get_local $8)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $4)
    )
    (i32.store
     (get_local $7)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$1)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.add
     (get_local $8)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $4
   (i32.load offset=64
    (get_local $8)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.const 0)
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 80)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E5_EEvRKS3_yOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=40
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (i64.store offset=24
   (get_local $1)
   (i64.const 4)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 784)
  )
  (i32.store offset=56
   (get_local $5)
   (i32.add
    (get_local $5)
    (i32.const 36)
   )
  )
  (i32.store offset=52
   (get_local $5)
   (get_local $5)
  )
  (i32.store offset=48
   (get_local $5)
   (get_local $5)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $5)
     (i32.const 48)
    )
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=44
    (get_local $1)
   )
   (get_local $2)
   (get_local $5)
   (i32.const 36)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 64)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E6_EEvRKS3_yOSC_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=32
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (tee_local $5
      (i32.add
       (get_local $1)
       (i32.const 24)
      )
     )
    )
    (i64.load offset=8
     (tee_local $6
      (i32.load
       (get_local $3)
      )
     )
    )
   )
   (i32.const 1040)
  )
  (call $eosio_assert
   (i64.ge_s
    (i64.load offset=16
     (get_local $1)
    )
    (i64.load
     (get_local $6)
    )
   )
   (i32.const 1104)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (tee_local $3
      (i32.load
       (get_local $3)
      )
     )
    )
    (i64.load
     (get_local $5)
    )
   )
   (i32.const 864)
  )
  (i64.store offset=16
   (get_local $1)
   (tee_local $7
    (i64.sub
     (i64.load offset=16
      (get_local $1)
     )
     (i64.load
      (get_local $3)
     )
    )
   )
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $7)
    (i64.const -4611686018427387904)
   )
   (i32.const 912)
  )
  (call $eosio_assert
   (i64.lt_s
    (i64.load offset=16
     (get_local $1)
    )
    (i64.const 4611686018427387904)
   )
   (i32.const 944)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (get_local $8)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $8)
     (i32.const 8)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $8)
     (i32.const 12)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 20)
    )
    (get_local $5)
    (i32.const 8)
   )
  )
  (call $db_update_i64
   (i32.load offset=36
    (get_local $1)
   )
   (get_local $2)
   (get_local $8)
   (i32.const 28)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E7_EENS4_14const_iteratorEyOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 80)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (i32.store offset=40
   (tee_local $4
    (call $_Znwj
     (i32.const 56)
    )
   )
   (get_local $1)
  )
  (i64.store
   (get_local $4)
   (i64.load
    (i32.load
     (get_local $3)
    )
   )
  )
  (i64.store offset=8
   (get_local $4)
   (i64.load
    (i32.load offset=4
     (get_local $3)
    )
   )
  )
  (i64.store offset=16
   (get_local $4)
   (i64.const 0)
  )
  (i64.store offset=24
   (get_local $4)
   (i64.const 0)
  )
  (i32.store offset=32
   (get_local $4)
   (i32.const 0)
  )
  (i32.store offset=72
   (get_local $8)
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (i32.store offset=68
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (get_local $4)
   )
  )
  (i32.store offset=44
   (get_local $4)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $1)
    )
    (i64.const 5905160962557476864)
    (get_local $2)
    (tee_local $5
     (i64.load
      (get_local $4)
     )
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 36)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $5)
     (i64.load offset=16
      (get_local $1)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $5)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=64
   (get_local $8)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $8)
   (tee_local $5
    (i64.load
     (get_local $4)
    )
   )
  )
  (i32.store offset=12
   (get_local $8)
   (tee_local $6
    (i32.load offset=44
     (get_local $4)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (tee_local $3
       (i32.load
        (tee_local $7
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $3)
     (get_local $5)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $6)
    )
    (i32.store offset=64
     (get_local $8)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $4)
    )
    (i32.store
     (get_local $7)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$1)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $8)
     (i32.const 64)
    )
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.add
     (get_local $8)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $4
   (i32.load offset=64
    (get_local $8)
   )
  )
  (i32.store offset=64
   (get_local $8)
   (i32.const 0)
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 80)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E8_EEvRKS3_yOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=40
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $6
     (i64.add
      (i64.load
       (i32.load offset=4
        (get_local $3)
       )
      )
      (tee_local $5
       (i64.load offset=8
        (get_local $1)
       )
      )
     )
    )
    (get_local $5)
   )
   (i32.const 112)
  )
  (i64.store offset=8
   (get_local $1)
   (get_local $6)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (i32.store offset=56
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 36)
   )
  )
  (i32.store offset=52
   (get_local $7)
   (get_local $7)
  )
  (i32.store offset=48
   (get_local $7)
   (get_local $7)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $7)
     (i32.const 48)
    )
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=44
    (get_local $1)
   )
   (get_local $2)
   (get_local $7)
   (i32.const 36)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 64)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E9_EENS4_14const_iteratorEyOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i64.store offset=40
   (get_local $7)
   (get_local $2)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $1)
    )
    (call $current_receiver)
   )
   (i32.const 976)
  )
  (i32.store offset=20
   (get_local $7)
   (get_local $3)
  )
  (i32.store offset=16
   (get_local $7)
   (get_local $1)
  )
  (i32.store offset=24
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 40)
   )
  )
  (drop
   (call $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE4itemC2IZNS4_7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E9_EENS4_14const_iteratorEyOSC_EUlSD_E_EEPKS4_SG_
    (tee_local $3
     (call $_Znwj
      (i32.const 56)
     )
    )
    (get_local $1)
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=32
   (get_local $7)
   (get_local $3)
  )
  (i64.store offset=16
   (get_local $7)
   (tee_local $2
    (i64.load
     (get_local $3)
    )
   )
  )
  (i32.store offset=12
   (get_local $7)
   (tee_local $4
    (i32.load offset=44
     (get_local $3)
    )
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.load
        (tee_local $6
         (i32.add
          (get_local $1)
          (i32.const 28)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 32)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $5)
     (get_local $2)
    )
    (i32.store offset=16
     (get_local $5)
     (get_local $4)
    )
    (i32.store offset=32
     (get_local $7)
     (i32.const 0)
    )
    (i32.store
     (get_local $5)
     (get_local $3)
    )
    (i32.store
     (get_local $6)
     (i32.add
      (get_local $5)
      (i32.const 24)
     )
    )
    (br $label$0)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $7)
     (i32.const 32)
    )
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
    (i32.add
     (get_local $7)
     (i32.const 12)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $3)
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (set_local $1
   (i32.load offset=32
    (get_local $7)
   )
  )
  (i32.store offset=32
   (get_local $7)
   (i32.const 0)
  )
  (block $label$2
   (br_if $label$2
    (i32.eqz
     (get_local $1)
    )
   )
   (call $_ZdlPv
    (get_local $1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE6modifyIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E10_EEvRKS3_yOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=40
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $6
     (i64.add
      (i64.load
       (i32.load offset=4
        (get_local $3)
       )
      )
      (tee_local $5
       (i64.load offset=8
        (get_local $1)
       )
      )
     )
    )
    (get_local $5)
   )
   (i32.const 112)
  )
  (i64.store offset=8
   (get_local $1)
   (get_local $6)
  )
  (set_local $5
   (i64.load
    (i32.load offset=4
     (get_local $3)
    )
   )
  )
  (i64.store offset=24
   (get_local $1)
   (i64.const 3)
  )
  (i64.store offset=16
   (get_local $1)
   (get_local $5)
  )
  (i32.store offset=32
   (get_local $1)
   (i32.load
    (i32.load offset=8
     (get_local $3)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (i32.store offset=56
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 36)
   )
  )
  (i32.store offset=52
   (get_local $7)
   (get_local $7)
  )
  (i32.store offset=48
   (get_local $7)
   (get_local $7)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $7)
     (i32.const 48)
    )
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=44
    (get_local $1)
   )
   (get_local $2)
   (get_local $7)
   (i32.const 36)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 64)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE6modifyIZNS2_12handle_pressIS4_NS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E11_EEvRKS3_yOSA_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (local $5 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 144)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=124
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 672)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 720)
  )
  (set_local $4
   (i64.load
    (get_local $1)
   )
  )
  (call $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E11_clIS4_EEDaSA_
   (get_local $3)
   (get_local $1)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $4)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 784)
  )
  (i32.store offset=136
   (get_local $5)
   (i32.add
    (get_local $5)
    (i32.const 124)
   )
  )
  (i32.store offset=132
   (get_local $5)
   (get_local $5)
  )
  (i32.store offset=128
   (get_local $5)
   (get_local $5)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button7ebtgameE
    (i32.add
     (get_local $5)
     (i32.const 128)
    )
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=128
    (get_local $1)
   )
   (get_local $2)
   (get_local $5)
   (i32.const 124)
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $0)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 144)
   )
  )
 )
 (func $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E11_clIS4_EEDaSA_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i64)
  (call $eosio_assert
   (i64.ge_u
    (tee_local $3
     (i64.add
      (i64.load
       (i32.load offset=4
        (get_local $0)
       )
      )
      (tee_local $5
       (i64.load offset=24
        (get_local $1)
       )
      )
     )
    )
    (get_local $5)
   )
   (i32.const 112)
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $5
     (i64.add
      (i64.load
       (i32.load offset=8
        (get_local $0)
       )
      )
      (get_local $3)
     )
    )
    (get_local $3)
   )
   (i32.const 112)
  )
  (i64.store offset=24
   (get_local $1)
   (get_local $5)
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $3
     (i64.add
      (i64.load
       (i32.load offset=4
        (get_local $0)
       )
      )
      (tee_local $5
       (i64.load offset=32
        (get_local $1)
       )
      )
     )
    )
    (get_local $5)
   )
   (i32.const 112)
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $5
     (i64.add
      (i64.load
       (i32.load offset=8
        (get_local $0)
       )
      )
      (get_local $3)
     )
    )
    (get_local $3)
   )
   (i32.const 112)
  )
  (i64.store offset=32
   (get_local $1)
   (get_local $5)
  )
  (set_local $5
   (i64.load offset=40
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (tee_local $4
      (i32.load offset=12
       (get_local $0)
      )
     )
    )
    (tee_local $3
     (i64.load
      (tee_local $2
       (i32.add
        (get_local $1)
        (i32.const 48)
       )
      )
     )
    )
   )
   (i32.const 304)
  )
  (call $eosio_assert
   (i64.gt_s
    (tee_local $5
     (i64.add
      (get_local $5)
      (i64.load
       (get_local $4)
      )
     )
    )
    (i64.const -4611686018427387904)
   )
   (i32.const 352)
  )
  (call $eosio_assert
   (i64.lt_s
    (get_local $5)
    (i64.const 4611686018427387904)
   )
   (i32.const 384)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $3)
    (i64.load offset=8
     (tee_local $4
      (i32.load offset=16
       (get_local $0)
      )
     )
    )
   )
   (i32.const 864)
  )
  (call $eosio_assert
   (i64.gt_s
    (tee_local $5
     (i64.sub
      (get_local $5)
      (i64.load
       (get_local $4)
      )
     )
    )
    (i64.const -4611686018427387904)
   )
   (i32.const 912)
  )
  (call $eosio_assert
   (i64.lt_s
    (get_local $5)
    (i64.const 4611686018427387904)
   )
   (i32.const 944)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $3)
    (i64.load offset=8
     (tee_local $4
      (i32.load offset=20
       (get_local $0)
      )
     )
    )
   )
   (i32.const 864)
  )
  (call $eosio_assert
   (i64.gt_s
    (tee_local $5
     (i64.sub
      (get_local $5)
      (i64.load
       (get_local $4)
      )
     )
    )
    (i64.const -4611686018427387904)
   )
   (i32.const 912)
  )
  (call $eosio_assert
   (i64.lt_s
    (get_local $5)
    (i64.const 4611686018427387904)
   )
   (i32.const 944)
  )
  (i64.store
   (get_local $2)
   (get_local $3)
  )
  (i64.store offset=40
   (get_local $1)
   (get_local $5)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (tee_local $4
      (i32.load offset=16
       (get_local $0)
      )
     )
    )
    (i64.load
     (i32.add
      (get_local $1)
      (i32.const 80)
     )
    )
   )
   (i32.const 304)
  )
  (i64.store offset=72
   (get_local $1)
   (tee_local $3
    (i64.add
     (i64.load offset=72
      (get_local $1)
     )
     (i64.load
      (get_local $4)
     )
    )
   )
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $3)
    (i64.const -4611686018427387904)
   )
   (i32.const 352)
  )
  (call $eosio_assert
   (i64.lt_s
    (i64.load offset=72
     (get_local $1)
    )
    (i64.const 4611686018427387904)
   )
   (i32.const 384)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (tee_local $4
      (i32.load offset=20
       (get_local $0)
      )
     )
    )
    (i64.load
     (i32.add
      (get_local $1)
      (i32.const 96)
     )
    )
   )
   (i32.const 304)
  )
  (i64.store offset=88
   (get_local $1)
   (tee_local $3
    (i64.add
     (i64.load offset=88
      (get_local $1)
     )
     (i64.load
      (get_local $4)
     )
    )
   )
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $3)
    (i64.const -4611686018427387904)
   )
   (i32.const 352)
  )
  (call $eosio_assert
   (i64.lt_s
    (i64.load offset=88
     (get_local $1)
    )
    (i64.const 4611686018427387904)
   )
   (i32.const 384)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (i32.load8_u
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (i64.store offset=16
    (get_local $1)
    (i64.load
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
   )
   (i64.store offset=104
    (get_local $1)
    (i64.load
     (i32.load offset=28
      (get_local $0)
     )
    )
   )
   (i64.store32 offset=116
    (get_local $1)
    (i64.div_u
     (call $current_time)
     (i64.const 1000000)
    )
   )
   (i32.store offset=120
    (get_local $1)
    (i32.load
     (i32.load offset=32
      (get_local $0)
     )
    )
   )
  )
 )
 (func $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button7ebtgameE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (i32.load offset=4
      (get_local $0)
     )
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (get_local $1)
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 32)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 40)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 48)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 56)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 64)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 72)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 80)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 88)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 96)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 104)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 112)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 116)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 120)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (get_local $0)
 )
 (func $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (i32.load offset=4
      (get_local $0)
     )
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (get_local $1)
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $1)
     (i32.const 32)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE4itemC2IZNS4_7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEES4_EEvyNS_5assetEbyEUlRT_E9_EENS4_14const_iteratorEyOSC_EUlSD_E_EEPKS4_SG_ (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $6
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (i32.store offset=40
   (get_local $0)
   (get_local $1)
  )
  (i64.store
   (get_local $0)
   (i64.load
    (i32.load offset=4
     (tee_local $1
      (i32.load offset=4
       (get_local $2)
      )
     )
    )
   )
  )
  (set_local $3
   (i32.load
    (get_local $2)
   )
  )
  (call $eosio_assert
   (i64.ge_u
    (tee_local $5
     (i64.add
      (i64.load
       (i32.load offset=8
        (get_local $1)
       )
      )
      (tee_local $4
       (i64.load offset=8
        (get_local $0)
       )
      )
     )
    )
    (get_local $4)
   )
   (i32.const 112)
  )
  (i64.store offset=8
   (get_local $0)
   (get_local $5)
  )
  (set_local $4
   (i64.load
    (i32.load offset=8
     (get_local $1)
    )
   )
  )
  (i64.store offset=24
   (get_local $0)
   (i64.const 3)
  )
  (i64.store offset=16
   (get_local $0)
   (get_local $4)
  )
  (i32.store offset=32
   (get_local $0)
   (i32.load
    (i32.load offset=12
     (get_local $1)
    )
   )
  )
  (i32.store offset=56
   (get_local $6)
   (i32.add
    (get_local $6)
    (i32.const 36)
   )
  )
  (i32.store offset=52
   (get_local $6)
   (get_local $6)
  )
  (i32.store offset=48
   (get_local $6)
   (get_local $6)
  )
  (drop
   (call $_ZN3ebtlsIN5eosio10datastreamIPcEEEERT_S6_RKNS_10eos_button9ebtplayerE
    (i32.add
     (get_local $6)
     (i32.const 48)
    )
    (get_local $0)
   )
  )
  (i32.store offset=44
   (get_local $0)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $3)
    )
    (i64.const 5905160962557476864)
    (i64.load
     (i32.load offset=8
      (get_local $2)
     )
    )
    (tee_local $4
     (i64.load
      (get_local $0)
     )
    )
    (get_local $6)
    (i32.const 36)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $4)
     (i64.load offset=16
      (get_local $3)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $3)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $4)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 64)
   )
  )
  (get_local $0)
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy5905160962557476864EN3ebt10eos_button9ebtplayerEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $6
            (i32.load
             (get_local $0)
            )
           )
          )
          (i32.const 24)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 178956971)
     )
    )
    (set_local $7
     (i32.const 178956970)
    )
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (tee_local $6
         (i32.div_s
          (i32.sub
           (i32.load offset=8
            (get_local $0)
           )
           (get_local $6)
          )
          (i32.const 24)
         )
        )
        (i32.const 89478484)
       )
      )
      (br_if $label$2
       (i32.eqz
        (tee_local $7
         (select
          (get_local $5)
          (tee_local $7
           (i32.shl
            (get_local $6)
            (i32.const 1)
           )
          )
          (i32.lt_u
           (get_local $7)
           (get_local $5)
          )
         )
        )
       )
      )
     )
     (set_local $6
      (call $_Znwj
       (i32.mul
        (get_local $7)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $7
     (i32.const 0)
    )
    (set_local $6
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $6)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
   (get_local $5)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load
    (get_local $2)
   )
  )
  (i32.store offset=16
   (get_local $1)
   (i32.load
    (get_local $3)
   )
  )
  (set_local $4
   (i32.add
    (get_local $6)
    (i32.mul
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i32.eq
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (tee_local $7
       (i32.load
        (get_local $0)
       )
      )
     )
    )
    (loop $label$6
     (set_local $3
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $6)
         (i32.const -24)
        )
       )
      )
     )
     (i32.store
      (get_local $2)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
      (get_local $3)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -8)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -8)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -12)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -12)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -16)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
     )
     (set_local $6
      (get_local $2)
     )
     (br_if $label$6
      (i32.ne
       (get_local $7)
       (get_local $2)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $6
     (i32.load
      (get_local $0)
     )
    )
    (br $label$4)
   )
   (set_local $6
    (get_local $7)
   )
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $5)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$7
   (br_if $label$7
    (i32.eq
     (get_local $7)
     (get_local $6)
    )
   )
   (loop $label$8
    (set_local $1
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$9
     (br_if $label$9
      (i32.eqz
       (get_local $1)
      )
     )
     (call $_ZdlPv
      (get_local $1)
     )
    )
    (br_if $label$8
     (i32.ne
      (get_local $6)
      (get_local $7)
     )
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (i32.eqz
     (get_local $6)
    )
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
 )
 (func $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E3_clIS4_EEDaSA_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (call $eosio_assert
   (i64.ne
    (tee_local $3
     (i64.load offset=8
      (get_local $1)
     )
    )
    (i64.const -1)
   )
   (i32.const 112)
  )
  (i64.store offset=16
   (get_local $1)
   (i64.const 10000)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.add
    (get_local $3)
    (i64.const 1)
   )
  )
  (i64.store offset=24
   (get_local $1)
   (i64.const 10000)
  )
  (call $eosio_assert
   (i64.lt_u
    (tee_local $3
     (i64.load offset=32
      (get_local $1)
     )
    )
    (i64.const -10000)
   )
   (i32.const 112)
  )
  (i64.store offset=32
   (get_local $1)
   (i64.add
    (get_local $3)
    (i64.const 10000)
   )
  )
  (i32.store
   (i32.add
    (get_local $1)
    (i32.const 52)
   )
   (i32.load
    (i32.add
     (get_local $1)
     (i32.const 84)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $1)
    (i32.const 48)
   )
   (i32.load
    (i32.add
     (get_local $1)
     (i32.const 80)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $1)
    (i32.const 44)
   )
   (i32.load
    (i32.add
     (get_local $1)
     (i32.const 76)
    )
   )
  )
  (i32.store offset=40
   (get_local $1)
   (i32.load offset=72
    (get_local $1)
   )
  )
  (set_local $2
   (i64.load offset=8
    (i32.load offset=8
     (get_local $0)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (get_local $2)
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i64.store
   (i32.add
    (get_local $1)
    (i32.const 80)
   )
   (get_local $2)
  )
  (i64.store offset=72
   (get_local $1)
   (i64.const 0)
  )
  (i64.store offset=104
   (get_local $1)
   (i64.load
    (i32.load offset=12
     (get_local $0)
    )
   )
  )
  (i64.store32 offset=112
   (get_local $1)
   (i64.div_u
    (call $current_time)
    (i64.const 1000000)
   )
  )
  (set_local $3
   (call $current_time)
  )
  (i32.store offset=120
   (get_local $1)
   (i32.const 0)
  )
  (i64.store32 offset=116
   (get_local $1)
   (i64.div_u
    (get_local $3)
    (i64.const 1000000)
   )
  )
 )
 (func $_ZZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_12handle_pressINS0_ILy5904996781212565504ENS2_7ebtgameEJEEENS0_ILy5905160962557476864ENS2_9ebtplayerEJEEEEEvyNS_5assetEbyEUlRT_E0_EENS4_14const_iteratorEyOSC_ENKUlSD_E_clINS4_4itemEEEDaSD_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $6
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (i64.store
   (get_local $1)
   (i64.load
    (i32.load offset=4
     (i32.load
      (tee_local $4
       (i32.load offset=4
        (get_local $0)
       )
      )
     )
    )
   )
  )
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (i64.store offset=16
   (get_local $1)
   (i64.load
    (tee_local $4
     (i32.load offset=4
      (get_local $4)
     )
    )
   )
  )
  (i64.store
   (tee_local $5
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
   )
   (i64.load
    (i32.add
     (get_local $4)
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (get_local $6)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $6)
     (i32.const 8)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.or
     (get_local $6)
     (i32.const 12)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const 20)
    )
    (get_local $5)
    (i32.const 8)
   )
  )
  (i32.store offset=36
   (get_local $1)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $2)
    )
    (i64.const 3607819374565523456)
    (i64.load
     (i32.load offset=8
      (get_local $0)
     )
    )
    (tee_local $3
     (i64.load
      (get_local $1)
     )
    )
    (get_local $6)
    (i32.const 28)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.lt_u
     (get_local $3)
     (i64.load offset=16
      (get_local $2)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $2)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $3)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $3)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 32)
   )
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $6
            (i32.load
             (get_local $0)
            )
           )
          )
          (i32.const 24)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 178956971)
     )
    )
    (set_local $7
     (i32.const 178956970)
    )
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (tee_local $6
         (i32.div_s
          (i32.sub
           (i32.load offset=8
            (get_local $0)
           )
           (get_local $6)
          )
          (i32.const 24)
         )
        )
        (i32.const 89478484)
       )
      )
      (br_if $label$2
       (i32.eqz
        (tee_local $7
         (select
          (get_local $5)
          (tee_local $7
           (i32.shl
            (get_local $6)
            (i32.const 1)
           )
          )
          (i32.lt_u
           (get_local $7)
           (get_local $5)
          )
         )
        )
       )
      )
     )
     (set_local $6
      (call $_Znwj
       (i32.mul
        (get_local $7)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $7
     (i32.const 0)
    )
    (set_local $6
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $6)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
   (get_local $5)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load
    (get_local $2)
   )
  )
  (i32.store offset=16
   (get_local $1)
   (i32.load
    (get_local $3)
   )
  )
  (set_local $4
   (i32.add
    (get_local $6)
    (i32.mul
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i32.eq
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (tee_local $7
       (i32.load
        (get_local $0)
       )
      )
     )
    )
    (loop $label$6
     (set_local $3
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $6)
         (i32.const -24)
        )
       )
      )
     )
     (i32.store
      (get_local $2)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
      (get_local $3)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -8)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -8)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -12)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -12)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -16)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
     )
     (set_local $6
      (get_local $2)
     )
     (br_if $label$6
      (i32.ne
       (get_local $7)
       (get_local $2)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $6
     (i32.load
      (get_local $0)
     )
    )
    (br $label$4)
   )
   (set_local $6
    (get_local $7)
   )
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $5)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$7
   (br_if $label$7
    (i32.eq
     (get_local $7)
     (get_local $6)
    )
   )
   (loop $label$8
    (set_local $1
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$9
     (br_if $label$9
      (i32.eqz
       (get_local $1)
      )
     )
     (call $_ZdlPv
      (get_local $1)
     )
    )
    (br_if $label$8
     (i32.ne
      (get_local $6)
      (get_local $7)
     )
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (i32.eqz
     (get_local $6)
    )
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $6
            (i32.load
             (get_local $0)
            )
           )
          )
          (i32.const 24)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 178956971)
     )
    )
    (set_local $7
     (i32.const 178956970)
    )
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (tee_local $6
         (i32.div_s
          (i32.sub
           (i32.load offset=8
            (get_local $0)
           )
           (get_local $6)
          )
          (i32.const 24)
         )
        )
        (i32.const 89478484)
       )
      )
      (br_if $label$2
       (i32.eqz
        (tee_local $7
         (select
          (get_local $5)
          (tee_local $7
           (i32.shl
            (get_local $6)
            (i32.const 1)
           )
          )
          (i32.lt_u
           (get_local $7)
           (get_local $5)
          )
         )
        )
       )
      )
     )
     (set_local $6
      (call $_Znwj
       (i32.mul
        (get_local $7)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $7
     (i32.const 0)
    )
    (set_local $6
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $6)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
   (get_local $5)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load
    (get_local $2)
   )
  )
  (i32.store offset=16
   (get_local $1)
   (i32.load
    (get_local $3)
   )
  )
  (set_local $4
   (i32.add
    (get_local $6)
    (i32.mul
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i32.eq
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (tee_local $7
       (i32.load
        (get_local $0)
       )
      )
     )
    )
    (loop $label$6
     (set_local $3
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $6)
         (i32.const -24)
        )
       )
      )
     )
     (i32.store
      (get_local $2)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
      (get_local $3)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -8)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -8)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -12)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -12)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -16)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
     )
     (set_local $6
      (get_local $2)
     )
     (br_if $label$6
      (i32.ne
       (get_local $7)
       (get_local $2)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $6
     (i32.load
      (get_local $0)
     )
    )
    (br $label$4)
   )
   (set_local $6
    (get_local $7)
   )
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $5)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$7
   (br_if $label$7
    (i32.eq
     (get_local $7)
     (get_local $6)
    )
   )
   (loop $label$8
    (set_local $1
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$9
     (br_if $label$9
      (i32.eqz
       (get_local $1)
      )
     )
     (call $_ZdlPv
      (get_local $1)
     )
    )
    (br_if $label$8
     (i32.ne
      (get_local $6)
      (get_local $7)
     )
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (i32.eqz
     (get_local $6)
    )
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
 )
 (func $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE3getEyPKc (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $3
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $6
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (set_local $4
    (i32.sub
     (i32.const 0)
     (get_local $3)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i64.eq
      (i64.shr_u
       (i64.load offset=8
        (i32.load
         (get_local $6)
        )
       )
       (i64.const 8)
      )
      (get_local $1)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $5
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $5)
       (get_local $4)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (get_local $3)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=16
       (tee_local $6
        (i32.load
         (i32.add
          (get_local $7)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $0)
     )
     (i32.const 48)
    )
    (br $label$2)
   )
   (set_local $6
    (i32.const 0)
   )
   (br_if $label$2
    (i32.lt_s
     (tee_local $5
      (call $db_find_i64
       (i64.load
        (get_local $0)
       )
       (i64.load offset=8
        (get_local $0)
       )
       (i64.const 3607749779137757184)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=16
      (tee_local $6
       (call $_ZNK5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE31load_object_by_primary_iteratorEl
        (get_local $0)
        (get_local $5)
       )
      )
     )
     (get_local $0)
    )
    (i32.const 48)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $6)
    (i32.const 0)
   )
   (get_local $2)
  )
  (get_local $6)
 )
 (func $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button9ebtplayerE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (i32.load offset=4
      (get_local $0)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (get_local $1)
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 32)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (get_local $0)
 )
 (func $_ZN3ebt10eos_button7ebtgameC2Ev (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (i64.store offset=40
   (get_local $0)
   (i64.const 0)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 48)
    )
   )
   (i64.const 1398362884)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 160)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 64)
    )
   )
   (i64.const 1398362884)
  )
  (i64.store offset=56
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 160)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 80)
    )
   )
   (i64.const 1398362884)
  )
  (i64.store offset=72
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$10
   (block $label$11
    (loop $label$12
     (br_if $label$11
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$13
      (br_if $label$13
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$14
       (br_if $label$11
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$14
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$12
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$10)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 160)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 96)
    )
   )
   (i64.const 1398362884)
  )
  (i64.store offset=88
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$15
   (block $label$16
    (loop $label$17
     (br_if $label$16
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$18
      (br_if $label$18
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$19
       (br_if $label$16
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$19
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$17
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$15)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 160)
  )
  (get_local $0)
 )
 (func $_ZZN3ebt10eos_button12handle_pressIN5eosio11multi_indexILy5904996781212565504ENS0_7ebtgameEJEEENS3_ILy5905160962557476864ENS0_9ebtplayerEJEEEEEvyNS2_5assetEbyENKUlRT_E_clIS4_EEDaSA_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (set_local $2
   (i64.load offset=8
    (i32.load
     (get_local $0)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (get_local $2)
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i64.store
   (i32.add
    (get_local $1)
    (i32.const 48)
   )
   (get_local $2)
  )
  (i64.store offset=40
   (get_local $1)
   (i64.const 0)
  )
  (set_local $2
   (i64.load offset=8
    (i32.load
     (get_local $0)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (get_local $2)
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i64.store
   (i32.add
    (get_local $1)
    (i32.const 64)
   )
   (get_local $2)
  )
  (i64.store offset=56
   (get_local $1)
   (i64.const 0)
  )
  (set_local $2
   (i64.load offset=8
    (i32.load
     (get_local $0)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (get_local $2)
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$10
   (block $label$11
    (loop $label$12
     (br_if $label$11
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$13
      (br_if $label$13
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$14
       (br_if $label$11
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$14
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$12
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$10)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i64.store
   (i32.add
    (get_local $1)
    (i32.const 80)
   )
   (get_local $2)
  )
  (i64.store offset=72
   (get_local $1)
   (i64.const 0)
  )
  (set_local $2
   (i64.load offset=8
    (i32.load
     (get_local $0)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (get_local $2)
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$15
   (block $label$16
    (loop $label$17
     (br_if $label$16
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$18
      (br_if $label$18
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$19
       (br_if $label$16
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$19
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$17
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$15)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i64.store
   (i32.add
    (get_local $1)
    (i32.const 96)
   )
   (get_local $2)
  )
  (i64.store offset=88
   (get_local $1)
   (i64.const 0)
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy5904996781212565504EN3ebt10eos_button7ebtgameEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $6
            (i32.load
             (get_local $0)
            )
           )
          )
          (i32.const 24)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 178956971)
     )
    )
    (set_local $7
     (i32.const 178956970)
    )
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (tee_local $6
         (i32.div_s
          (i32.sub
           (i32.load offset=8
            (get_local $0)
           )
           (get_local $6)
          )
          (i32.const 24)
         )
        )
        (i32.const 89478484)
       )
      )
      (br_if $label$2
       (i32.eqz
        (tee_local $7
         (select
          (get_local $5)
          (tee_local $7
           (i32.shl
            (get_local $6)
            (i32.const 1)
           )
          )
          (i32.lt_u
           (get_local $7)
           (get_local $5)
          )
         )
        )
       )
      )
     )
     (set_local $6
      (call $_Znwj
       (i32.mul
        (get_local $7)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $7
     (i32.const 0)
    )
    (set_local $6
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $6)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
   (get_local $5)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load
    (get_local $2)
   )
  )
  (i32.store offset=16
   (get_local $1)
   (i32.load
    (get_local $3)
   )
  )
  (set_local $4
   (i32.add
    (get_local $6)
    (i32.mul
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i32.eq
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (tee_local $7
       (i32.load
        (get_local $0)
       )
      )
     )
    )
    (loop $label$6
     (set_local $3
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $6)
         (i32.const -24)
        )
       )
      )
     )
     (i32.store
      (get_local $2)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
      (get_local $3)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -8)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -8)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -12)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -12)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -16)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
     )
     (set_local $6
      (get_local $2)
     )
     (br_if $label$6
      (i32.ne
       (get_local $7)
       (get_local $2)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $6
     (i32.load
      (get_local $0)
     )
    )
    (br $label$4)
   )
   (set_local $6
    (get_local $7)
   )
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $5)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$7
   (br_if $label$7
    (i32.eq
     (get_local $7)
     (get_local $6)
    )
   )
   (loop $label$8
    (set_local $1
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$9
     (br_if $label$9
      (i32.eqz
       (get_local $1)
      )
     )
     (call $_ZdlPv
      (get_local $1)
     )
    )
    (br_if $label$8
     (i32.ne
      (get_local $6)
      (get_local $7)
     )
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (i32.eqz
     (get_local $6)
    )
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
 )
 (func $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button7ebtgameE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (i32.load offset=4
      (get_local $0)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (get_local $1)
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 32)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 40)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 48)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 56)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 64)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 72)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 80)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 88)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 96)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 104)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 112)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 116)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 120)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (get_local $0)
 )
 (func $_ZN3ebtrsIN5eosio10datastreamIPKcEEEERT_S7_RNS_10eos_button8accstateE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (i32.load offset=4
      (get_local $0)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (get_local $1)
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 3)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $0)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosio11multi_indexILy3607749779137757184EN3ebt10eos_button7accountEJEE4itemC2IZNKS4_31load_object_by_primary_iteratorElEUlRT_E_EEPKS4_OS7_ (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (i64.store offset=8
   (get_local $0)
   (i64.const 1398362884)
  )
  (i64.store
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i64.shr_u
    (i64.load offset=8
     (get_local $0)
    )
    (i64.const 8)
   )
  )
  (set_local $4
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $4
          (i32.add
           (get_local $4)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 160)
  )
  (i32.store offset=16
   (get_local $0)
   (get_local $1)
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $4
       (i32.load offset=4
        (get_local $2)
       )
      )
     )
     (i32.load offset=4
      (get_local $4)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (get_local $0)
    (i32.load offset=4
     (get_local $4)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $4)
   (tee_local $5
    (i32.add
     (i32.load offset=4
      (get_local $4)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $4)
     )
     (get_local $5)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $4)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $4)
   (i32.add
    (i32.load offset=4
     (get_local $4)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=20
   (get_local $0)
   (i32.load
    (i32.load offset=8
     (get_local $2)
    )
   )
  )
  (get_local $0)
 )
 (func $_ZN3ebt10eos_button7claimadEy (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 160)
    )
   )
  )
  (i64.store offset=88
   (get_local $7)
   (get_local $1)
  )
  (call $require_auth
   (get_local $1)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $5
   (i32.const 0)
  )
  (set_local $4
   (i64.const 5521989)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $4)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $4
          (i64.shr_u
           (get_local $4)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $4
           (i64.shr_u
            (get_local $4)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $5
          (i32.add
           (get_local $5)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $2
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $5
        (i32.add
         (get_local $5)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $2
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $2)
   (i32.const 160)
  )
  (set_local $5
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 80)
   )
   (i32.const 0)
  )
  (i64.store offset=64
   (get_local $7)
   (i64.const -1)
  )
  (i64.store offset=72
   (get_local $7)
   (i64.const 0)
  )
  (i64.store offset=48
   (get_local $7)
   (tee_local $4
    (i64.load
     (get_local $0)
    )
   )
  )
  (i64.store offset=56
   (get_local $7)
   (get_local $4)
  )
  (block $label$5
   (br_if $label$5
    (i32.lt_s
     (tee_local $2
      (call $db_find_i64
       (get_local $4)
       (get_local $4)
       (i64.const 3607819374565523456)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=32
      (tee_local $5
       (call $_ZNK5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE31load_object_by_primary_iteratorEl
        (i32.add
         (get_local $7)
         (i32.const 48)
        )
        (get_local $2)
       )
      )
     )
     (i32.add
      (get_local $7)
      (i32.const 48)
     )
    )
    (i32.const 48)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.wrap/i64
     (i64.div_u
      (call $current_time)
      (i64.const 1000000)
     )
    )
    (i32.const 1531907999)
   )
   (i32.const 1424)
  )
  (call $eosio_assert
   (i32.lt_u
    (i32.wrap/i64
     (i64.div_u
      (call $current_time)
      (i64.const 1000000)
     )
    )
    (i32.const 1533117600)
   )
   (i32.const 1456)
  )
  (block $label$6
   (block $label$7
    (br_if $label$7
     (i32.eqz
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.ge_u
      (i32.wrap/i64
       (i64.div_u
        (call $current_time)
        (i64.const 1000000)
       )
      )
      (i32.add
       (i32.load offset=8
        (get_local $5)
       )
       (i32.const 3600)
      )
     )
     (i32.const 1488)
    )
    (set_local $1
     (i64.load offset=88
      (get_local $7)
     )
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 448)
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=32
       (get_local $5)
      )
      (i32.add
       (get_local $7)
       (i32.const 48)
      )
     )
     (i32.const 672)
    )
    (call $eosio_assert
     (i64.eq
      (i64.load offset=48
       (get_local $7)
      )
      (call $current_receiver)
     )
     (i32.const 720)
    )
    (set_local $4
     (i64.load
      (get_local $5)
     )
    )
    (i64.store
     (get_local $5)
     (i64.load offset=88
      (get_local $7)
     )
    )
    (i64.store32 offset=8
     (get_local $5)
     (i64.div_u
      (call $current_time)
      (i64.const 1000000)
     )
    )
    (call $eosio_assert
     (i64.eq
      (get_local $4)
      (i64.load
       (get_local $5)
      )
     )
     (i32.const 784)
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 848)
    )
    (drop
     (call $memcpy
      (i32.add
       (get_local $7)
       (i32.const 128)
      )
      (get_local $5)
      (i32.const 8)
     )
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 848)
    )
    (drop
     (call $memcpy
      (i32.or
       (i32.add
        (get_local $7)
        (i32.const 128)
       )
       (i32.const 8)
      )
      (i32.add
       (get_local $5)
       (i32.const 8)
      )
      (i32.const 4)
     )
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 848)
    )
    (drop
     (call $memcpy
      (i32.or
       (i32.add
        (get_local $7)
        (i32.const 128)
       )
       (i32.const 12)
      )
      (i32.add
       (get_local $5)
       (i32.const 16)
      )
      (i32.const 8)
     )
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 848)
    )
    (drop
     (call $memcpy
      (i32.add
       (get_local $7)
       (i32.const 148)
      )
      (i32.add
       (get_local $5)
       (i32.const 24)
      )
      (i32.const 8)
     )
    )
    (call $db_update_i64
     (i32.load offset=36
      (get_local $5)
     )
     (get_local $1)
     (i32.add
      (get_local $7)
      (i32.const 128)
     )
     (i32.const 28)
    )
    (br_if $label$6
     (i64.lt_u
      (get_local $4)
      (i64.load
       (tee_local $5
        (i32.add
         (i32.add
          (get_local $7)
          (i32.const 48)
         )
         (i32.const 16)
        )
       )
      )
     )
    )
    (i64.store
     (get_local $5)
     (select
      (i64.const -2)
      (i64.add
       (get_local $4)
       (i64.const 1)
      )
      (i64.gt_u
       (get_local $4)
       (i64.const -3)
      )
     )
    )
    (br $label$6)
   )
   (set_local $4
    (i64.load offset=88
     (get_local $7)
    )
   )
   (i32.store offset=40
    (get_local $7)
    (i32.add
     (get_local $7)
     (i32.const 88)
    )
   )
   (i64.store offset=96
    (get_local $7)
    (get_local $4)
   )
   (call $eosio_assert
    (i64.eq
     (i64.load offset=48
      (get_local $7)
     )
     (call $current_receiver)
    )
    (i32.const 976)
   )
   (i32.store offset=132
    (get_local $7)
    (i32.add
     (get_local $7)
     (i32.const 40)
    )
   )
   (i32.store offset=128
    (get_local $7)
    (i32.add
     (get_local $7)
     (i32.const 48)
    )
   )
   (i32.store offset=136
    (get_local $7)
    (i32.add
     (get_local $7)
     (i32.const 96)
    )
   )
   (i64.store offset=24
    (tee_local $2
     (call $_Znwj
      (i32.const 48)
     )
    )
    (i64.const 1398362884)
   )
   (i64.store offset=16
    (get_local $2)
    (i64.const 0)
   )
   (call $eosio_assert
    (i32.const 1)
    (i32.const 608)
   )
   (set_local $4
    (i64.const 5462355)
   )
   (set_local $5
    (i32.const 0)
   )
   (block $label$8
    (block $label$9
     (loop $label$10
      (br_if $label$9
       (i32.gt_u
        (i32.add
         (i32.shl
          (i32.wrap/i64
           (get_local $4)
          )
          (i32.const 24)
         )
         (i32.const -1073741825)
        )
        (i32.const 452984830)
       )
      )
      (block $label$11
       (br_if $label$11
        (i64.ne
         (i64.and
          (tee_local $4
           (i64.shr_u
            (get_local $4)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (loop $label$12
        (br_if $label$9
         (i64.ne
          (i64.and
           (tee_local $4
            (i64.shr_u
             (get_local $4)
             (i64.const 8)
            )
           )
           (i64.const 255)
          )
          (i64.const 0)
         )
        )
        (br_if $label$12
         (i32.lt_s
          (tee_local $5
           (i32.add
            (get_local $5)
            (i32.const 1)
           )
          )
          (i32.const 7)
         )
        )
       )
      )
      (set_local $6
       (i32.const 1)
      )
      (br_if $label$10
       (i32.lt_s
        (tee_local $5
         (i32.add
          (get_local $5)
          (i32.const 1)
         )
        )
        (i32.const 7)
       )
      )
      (br $label$8)
     )
    )
    (set_local $6
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (get_local $6)
    (i32.const 160)
   )
   (i32.store offset=32
    (get_local $2)
    (i32.add
     (get_local $7)
     (i32.const 48)
    )
   )
   (call $_ZZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_7claimadEyE3$_0EENS4_14const_iteratorEyOT_ENKUlRS8_E_clINS4_4itemEEEDaSA_
    (i32.add
     (get_local $7)
     (i32.const 128)
    )
    (get_local $2)
   )
   (i32.store offset=120
    (get_local $7)
    (get_local $2)
   )
   (i64.store offset=128
    (get_local $7)
    (tee_local $4
     (i64.load
      (get_local $2)
     )
    )
   )
   (i32.store offset=116
    (get_local $7)
    (tee_local $6
     (i32.load offset=36
      (get_local $2)
     )
    )
   )
   (block $label$13
    (block $label$14
     (br_if $label$14
      (i32.ge_u
       (tee_local $5
        (i32.load
         (tee_local $3
          (i32.add
           (get_local $7)
           (i32.const 76)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $7)
         (i32.const 80)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $5)
      (get_local $4)
     )
     (i32.store offset=16
      (get_local $5)
      (get_local $6)
     )
     (i32.store offset=120
      (get_local $7)
      (i32.const 0)
     )
     (i32.store
      (get_local $5)
      (get_local $2)
     )
     (i32.store
      (get_local $3)
      (i32.add
       (get_local $5)
       (i32.const 24)
      )
     )
     (br $label$13)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE8item_ptrENS_9allocatorIS7_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS6_4itemENS_14default_deleteISD_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $7)
      (i32.const 72)
     )
     (i32.add
      (get_local $7)
      (i32.const 120)
     )
     (i32.add
      (get_local $7)
      (i32.const 128)
     )
     (i32.add
      (get_local $7)
      (i32.const 116)
     )
    )
   )
   (set_local $5
    (i32.load offset=120
     (get_local $7)
    )
   )
   (i32.store offset=120
    (get_local $7)
    (i32.const 0)
   )
   (br_if $label$6
    (i32.eqz
     (get_local $5)
    )
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (set_local $1
   (i64.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (call $is_account
    (tee_local $4
     (i64.load offset=88
      (get_local $7)
     )
    )
   )
   (i32.const 416)
  )
  (i64.store offset=136
   (get_local $7)
   (i64.const 1413629188)
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $7)
     (i32.const 24)
    )
    (i32.const 8)
   )
   (i64.const 1413629188)
  )
  (i64.store offset=128
   (get_local $7)
   (i64.const 100000000)
  )
  (i64.store offset=24
   (get_local $7)
   (i64.const 100000000)
  )
  (call $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE
   (get_local $0)
   (get_local $1)
   (i32.add
    (get_local $7)
    (i32.const 24)
   )
  )
  (i64.store offset=104
   (get_local $7)
   (i64.const 1413629188)
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $7)
     (i32.const 8)
    )
    (i32.const 8)
   )
   (i64.const 1413629188)
  )
  (i64.store offset=96
   (get_local $7)
   (i64.const 100000000)
  )
  (i64.store offset=8
   (get_local $7)
   (i64.const 100000000)
  )
  (call $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy
   (get_local $0)
   (get_local $4)
   (i32.add
    (get_local $7)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$15
   (br_if $label$15
    (i32.eqz
     (tee_local $0
      (i32.load offset=72
       (get_local $7)
      )
     )
    )
   )
   (block $label$16
    (block $label$17
     (br_if $label$17
      (i32.eq
       (tee_local $5
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $7)
           (i32.const 76)
          )
         )
        )
       )
       (get_local $0)
      )
     )
     (loop $label$18
      (set_local $2
       (i32.load
        (tee_local $5
         (i32.add
          (get_local $5)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $5)
       (i32.const 0)
      )
      (block $label$19
       (br_if $label$19
        (i32.eqz
         (get_local $2)
        )
       )
       (call $_ZdlPv
        (get_local $2)
       )
      )
      (br_if $label$18
       (i32.ne
        (get_local $0)
        (get_local $5)
       )
      )
     )
     (set_local $5
      (i32.load
       (i32.add
        (get_local $7)
        (i32.const 72)
       )
      )
     )
     (br $label$16)
    )
    (set_local $5
     (get_local $0)
    )
   )
   (i32.store
    (get_local $6)
    (get_local $0)
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 160)
   )
  )
 )
 (func $_ZZN5eosio11multi_indexILy3607819374565523456EN3ebt10eos_button8accstateEJEE7emplaceIZNS2_7claimadEyE3$_0EENS4_14const_iteratorEyOT_ENKUlRS8_E_clINS4_4itemEEEDaSA_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (set_local $8
   (tee_local $9
    (i32.load offset=4
     (i32.const 0)
    )
   )
  )
  (i64.store
   (get_local $1)
   (i64.load
    (i32.load
     (i32.load offset=4
      (get_local $0)
     )
    )
   )
  )
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (i64.store32 offset=8
   (get_local $1)
   (i64.div_u
    (call $current_time)
    (i64.const 1000000)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $3
   (i32.add
    (get_local $1)
    (i32.const 8)
   )
  )
  (set_local $5
   (i64.const 5459781)
  )
  (set_local $6
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $5)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $5
          (i64.shr_u
           (get_local $5)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $5
           (i64.shr_u
            (get_local $5)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $6
          (i32.add
           (get_local $6)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $7
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $6
        (i32.add
         (get_local $6)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $7
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $7)
   (i32.const 160)
  )
  (i64.store
   (tee_local $4
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
   )
   (i64.const 1397703940)
  )
  (i64.store offset=16
   (get_local $1)
   (i64.const 0)
  )
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.add
     (tee_local $6
      (get_local $9)
     )
     (i32.const -32)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (get_local $7)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const -24)
    )
    (get_local $3)
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const -20)
    )
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 848)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const -12)
    )
    (get_local $4)
    (i32.const 8)
   )
  )
  (i32.store offset=36
   (get_local $1)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $2)
    )
    (i64.const 3607819374565523456)
    (i64.load
     (i32.load offset=8
      (get_local $0)
     )
    )
    (tee_local $5
     (i64.load
      (get_local $1)
     )
    )
    (get_local $7)
    (i32.const 28)
   )
  )
  (block $label$5
   (br_if $label$5
    (i64.lt_u
     (get_local $5)
     (i64.load offset=16
      (get_local $2)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $2)
     (i32.const 16)
    )
    (select
     (i64.const -2)
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $5)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $8)
  )
 )
 (func $_ZN3ebt10eos_button9mtransferEyyN5eosio5assetEy (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32) (param $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $eosio_assert
   (call $is_account
    (get_local $2)
   )
   (i32.const 416)
  )
  (i64.store
   (tee_local $6
    (i32.add
     (i32.add
      (get_local $8)
      (i32.const 48)
     )
     (i32.const 8)
    )
   )
   (i64.load
    (tee_local $5
     (i32.add
      (get_local $3)
      (i32.const 8)
     )
    )
   )
  )
  (set_local $7
   (i64.load
    (get_local $3)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (i32.add
      (get_local $8)
      (i32.const 48)
     )
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $8)
     (i32.const 16)
    )
    (i32.const 8)
   )
   (i32.load
    (get_local $6)
   )
  )
  (i64.store offset=48
   (get_local $8)
   (get_local $7)
  )
  (i32.store offset=20
   (get_local $8)
   (i32.load offset=52
    (get_local $8)
   )
  )
  (i32.store offset=16
   (get_local $8)
   (i32.load offset=48
    (get_local $8)
   )
  )
  (call $_ZN3ebt10eos_button13c_sub_balanceEyN5eosio5assetE
   (get_local $0)
   (get_local $1)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (i64.store
   (tee_local $6
    (i32.add
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (i32.const 8)
    )
   )
   (i64.load
    (get_local $5)
   )
  )
  (set_local $1
   (i64.load
    (get_local $3)
   )
  )
  (i32.store
   (i32.add
    (get_local $8)
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $8)
    (i32.const 8)
   )
   (i32.load
    (get_local $6)
   )
  )
  (i64.store offset=32
   (get_local $8)
   (get_local $1)
  )
  (i32.store offset=4
   (get_local $8)
   (i32.load offset=36
    (get_local $8)
   )
  )
  (i32.store
   (get_local $8)
   (i32.load offset=32
    (get_local $8)
   )
  )
  (call $_ZN3ebt10eos_button13c_add_balanceEyN5eosio5assetEy
   (get_local $0)
   (get_local $2)
   (get_local $8)
   (get_local $4)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 64)
   )
  )
 )
 (func $_ZN3ebt10eos_button7depositEv (param $0 i32)
 )
 (func $_ZN3ebt10eos_button5s_addEyy (param $0 i32) (param $1 i64) (param $2 i64) (result i64)
  (call $eosio_assert
   (i64.ge_u
    (tee_local $2
     (i64.add
      (get_local $2)
      (get_local $1)
     )
    )
    (get_local $1)
   )
   (i32.const 112)
  )
  (get_local $2)
 )
 (func $_ZN3ebt10eos_button5s_subEyy (param $0 i32) (param $1 i64) (param $2 i64) (result i64)
  (call $eosio_assert
   (i64.ge_u
    (get_local $1)
    (get_local $2)
   )
   (i32.const 112)
  )
  (i64.sub
   (get_local $1)
   (get_local $2)
  )
 )
 (func $_ZN3ebt10eos_button5s_mulEyy (param $0 i32) (param $1 i64) (param $2 i64) (result i64)
  (local $3 i64)
  (block $label$0
   (br_if $label$0
    (i64.eqz
     (get_local $1)
    )
   )
   (call $eosio_assert
    (i64.eq
     (i64.div_u
      (tee_local $3
       (i64.mul
        (get_local $2)
        (get_local $1)
       )
      )
      (get_local $1)
     )
     (get_local $2)
    )
    (i32.const 112)
   )
   (return
    (get_local $3)
   )
  )
  (i64.const 0)
 )
 (func $_ZN3ebt10eos_button5s_divEyy (param $0 i32) (param $1 i64) (param $2 i64) (result i64)
  (call $eosio_assert
   (i64.ne
    (get_local $2)
    (i64.const 0)
   )
   (i32.const 144)
  )
  (i64.div_u
   (get_local $1)
   (get_local $2)
  )
 )
 (func $apply (param $0 i64) (param $1 i64) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (set_local $6
   (i64.const 0)
  )
  (set_local $5
   (i64.const 59)
  )
  (set_local $4
   (i32.const 1520)
  )
  (set_local $7
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $6)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $3
             (i32.load8_s
              (get_local $4)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $3
         (i32.add
          (get_local $3)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $8
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $6)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $3
       (select
        (i32.add
         (get_local $3)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $3)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $8
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $3)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $8
     (i64.shl
      (i64.and
       (get_local $8)
       (i64.const 31)
      )
      (i64.and
       (get_local $5)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $4
    (i32.add
     (get_local $4)
     (i32.const 1)
    )
   )
   (set_local $6
    (i64.add
     (get_local $6)
     (i64.const 1)
    )
   )
   (set_local $7
    (i64.or
     (get_local $8)
     (get_local $7)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $5
      (i64.add
       (get_local $5)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i64.ne
     (get_local $7)
     (get_local $2)
    )
   )
   (set_local $6
    (i64.const 0)
   )
   (set_local $5
    (i64.const 59)
   )
   (set_local $4
    (i32.const 1536)
   )
   (set_local $7
    (i64.const 0)
   )
   (loop $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (block $label$12
         (br_if $label$12
          (i64.gt_u
           (get_local $6)
           (i64.const 4)
          )
         )
         (br_if $label$11
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $3
              (i32.load8_s
               (get_local $4)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $3
          (i32.add
           (get_local $3)
           (i32.const 165)
          )
         )
         (br $label$10)
        )
        (set_local $8
         (i64.const 0)
        )
        (br_if $label$9
         (i64.le_u
          (get_local $6)
          (i64.const 11)
         )
        )
        (br $label$8)
       )
       (set_local $3
        (select
         (i32.add
          (get_local $3)
          (i32.const 208)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $3)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $8
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $3)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $8
      (i64.shl
       (i64.and
        (get_local $8)
        (i64.const 31)
       )
       (i64.and
        (get_local $5)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $4
     (i32.add
      (get_local $4)
      (i32.const 1)
     )
    )
    (set_local $6
     (i64.add
      (get_local $6)
      (i64.const 1)
     )
    )
    (set_local $7
     (i64.or
      (get_local $8)
      (get_local $7)
     )
    )
    (br_if $label$7
     (i64.ne
      (tee_local $5
       (i64.add
        (get_local $5)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (call $eosio_assert
    (i64.eq
     (get_local $7)
     (get_local $1)
    )
    (i32.const 1552)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i64.eq
      (get_local $1)
      (get_local $0)
     )
    )
    (set_local $6
     (i64.const 0)
    )
    (set_local $5
     (i64.const 59)
    )
    (set_local $4
     (i32.const 1520)
    )
    (set_local $7
     (i64.const 0)
    )
    (loop $label$15
     (block $label$16
      (block $label$17
       (block $label$18
        (block $label$19
         (block $label$20
          (br_if $label$20
           (i64.gt_u
            (get_local $6)
            (i64.const 6)
           )
          )
          (br_if $label$19
           (i32.gt_u
            (i32.and
             (i32.add
              (tee_local $3
               (i32.load8_s
                (get_local $4)
               )
              )
              (i32.const -97)
             )
             (i32.const 255)
            )
            (i32.const 25)
           )
          )
          (set_local $3
           (i32.add
            (get_local $3)
            (i32.const 165)
           )
          )
          (br $label$18)
         )
         (set_local $8
          (i64.const 0)
         )
         (br_if $label$17
          (i64.le_u
           (get_local $6)
           (i64.const 11)
          )
         )
         (br $label$16)
        )
        (set_local $3
         (select
          (i32.add
           (get_local $3)
           (i32.const 208)
          )
          (i32.const 0)
          (i32.lt_u
           (i32.and
            (i32.add
             (get_local $3)
             (i32.const -49)
            )
            (i32.const 255)
           )
           (i32.const 5)
          )
         )
        )
       )
       (set_local $8
        (i64.shr_s
         (i64.shl
          (i64.extend_u/i32
           (get_local $3)
          )
          (i64.const 56)
         )
         (i64.const 56)
        )
       )
      )
      (set_local $8
       (i64.shl
        (i64.and
         (get_local $8)
         (i64.const 31)
        )
        (i64.and
         (get_local $5)
         (i64.const 4294967295)
        )
       )
      )
     )
     (set_local $4
      (i32.add
       (get_local $4)
       (i32.const 1)
      )
     )
     (set_local $6
      (i64.add
       (get_local $6)
       (i64.const 1)
      )
     )
     (set_local $7
      (i64.or
       (get_local $8)
       (get_local $7)
      )
     )
     (br_if $label$15
      (i64.ne
       (tee_local $5
        (i64.add
         (get_local $5)
         (i64.const -5)
        )
       )
       (i64.const -6)
      )
     )
    )
    (br_if $label$13
     (i64.ne
      (get_local $7)
      (get_local $2)
     )
    )
   )
   (set_local $6
    (i64.const 0)
   )
   (set_local $5
    (i64.const 59)
   )
   (set_local $4
    (i32.const 1616)
   )
   (set_local $7
    (i64.const 0)
   )
   (loop $label$21
    (block $label$22
     (block $label$23
      (block $label$24
       (block $label$25
        (block $label$26
         (br_if $label$26
          (i64.gt_u
           (get_local $6)
           (i64.const 6)
          )
         )
         (br_if $label$25
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $3
              (i32.load8_s
               (get_local $4)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $3
          (i32.add
           (get_local $3)
           (i32.const 165)
          )
         )
         (br $label$24)
        )
        (set_local $8
         (i64.const 0)
        )
        (br_if $label$23
         (i64.le_u
          (get_local $6)
          (i64.const 11)
         )
        )
        (br $label$22)
       )
       (set_local $3
        (select
         (i32.add
          (get_local $3)
          (i32.const 208)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $3)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $8
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $3)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $8
      (i64.shl
       (i64.and
        (get_local $8)
        (i64.const 31)
       )
       (i64.and
        (get_local $5)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $4
     (i32.add
      (get_local $4)
      (i32.const 1)
     )
    )
    (set_local $6
     (i64.add
      (get_local $6)
      (i64.const 1)
     )
    )
    (set_local $7
     (i64.or
      (get_local $8)
      (get_local $7)
     )
    )
    (br_if $label$21
     (i64.ne
      (tee_local $5
       (i64.add
        (get_local $5)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (br_if $label$13
    (i64.eq
     (get_local $7)
     (get_local $2)
    )
   )
   (i64.store offset=40
    (get_local $9)
    (get_local $0)
   )
   (block $label$27
    (br_if $label$27
     (i64.eq
      (get_local $2)
      (i64.const 4921564786929434624)
     )
    )
    (br_if $label$13
     (i64.ne
      (get_local $2)
      (i64.const 5905164326813040640)
     )
    )
    (i32.store offset=36
     (get_local $9)
     (i32.const 0)
    )
    (i32.store offset=32
     (get_local $9)
     (i32.const 1)
    )
    (i64.store offset=8 align=4
     (get_local $9)
     (i64.load offset=32
      (get_local $9)
     )
    )
    (drop
     (call $_ZN5eosio14execute_actionIN3ebt10eos_buttonES2_JyNS_5assetEbyEEEbPT_MT0_FvDpT1_E
      (i32.add
       (get_local $9)
       (i32.const 40)
      )
      (i32.add
       (get_local $9)
       (i32.const 8)
      )
     )
    )
    (br $label$13)
   )
   (i32.store offset=28
    (get_local $9)
    (i32.const 0)
   )
   (i32.store offset=24
    (get_local $9)
    (i32.const 2)
   )
   (i64.store offset=16 align=4
    (get_local $9)
    (i64.load offset=24
     (get_local $9)
    )
   )
   (drop
    (call $_ZN5eosio14execute_actionIN3ebt10eos_buttonES2_JyEEEbPT_MT0_FvDpT1_E
     (i32.add
      (get_local $9)
      (i32.const 40)
     )
     (i32.add
      (get_local $9)
      (i32.const 16)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $9)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio14execute_actionIN3ebt10eos_buttonES2_JyNS_5assetEbyEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (set_local $10
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 112)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $8)
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $9
   (i32.load
    (get_local $1)
   )
  )
  (set_local $1
   (i32.const 0)
  )
  (set_local $6
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $3
      (call $action_data_size)
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.lt_u
       (get_local $3)
       (i32.const 513)
      )
     )
     (set_local $6
      (call $malloc
       (get_local $3)
      )
     )
     (br $label$1)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $6
      (i32.sub
       (get_local $8)
       (i32.and
        (i32.add
         (get_local $3)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $read_action_data
     (get_local $6)
     (get_local $3)
    )
   )
  )
  (i64.store
   (i32.add
    (get_local $10)
    (i32.const 40)
   )
   (i64.const 1398362884)
  )
  (i64.store offset=32
   (get_local $10)
   (i64.const 0)
  )
  (i64.store offset=24
   (get_local $10)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 608)
  )
  (set_local $7
   (i64.const 5462355)
  )
  (block $label$3
   (block $label$4
    (loop $label$5
     (br_if $label$4
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $7)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$6
      (br_if $label$6
       (i64.ne
        (i64.and
         (tee_local $7
          (i64.shr_u
           (get_local $7)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$7
       (br_if $label$4
        (i64.ne
         (i64.and
          (tee_local $7
           (i64.shr_u
            (get_local $7)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$7
        (i32.lt_s
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $8
      (i32.const 1)
     )
     (br_if $label$5
      (i32.lt_s
       (tee_local $1
        (i32.add
         (get_local $1)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$3)
    )
   )
   (set_local $8
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $8)
   (i32.const 160)
  )
  (i64.store offset=56
   (get_local $10)
   (i64.const 0)
  )
  (i32.store8 offset=48
   (get_local $10)
   (i32.const 0)
  )
  (i32.store offset=100
   (get_local $10)
   (get_local $6)
  )
  (i32.store offset=96
   (get_local $10)
   (get_local $6)
  )
  (i32.store offset=104
   (get_local $10)
   (i32.add
    (get_local $6)
    (get_local $3)
   )
  )
  (i32.store offset=64
   (get_local $10)
   (i32.add
    (get_local $10)
    (i32.const 96)
   )
  )
  (i32.store offset=80
   (get_local $10)
   (i32.add
    (get_local $10)
    (i32.const 24)
   )
  )
  (call $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyN5eosio5assetEbyEEELi0EEEZNS8_rsINS8_10datastreamIPKcEEJyS9_byEEERT_SI_RNS7_IJDpT0_EEEEUlSI_E_EEvRKSH_RKT0_
   (i32.add
    (get_local $10)
    (i32.const 80)
   )
   (i32.add
    (get_local $10)
    (i32.const 64)
   )
  )
  (block $label$8
   (br_if $label$8
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $6)
   )
  )
  (i64.store
   (tee_local $1
    (i32.add
     (i32.add
      (get_local $10)
      (i32.const 64)
     )
     (i32.const 8)
    )
   )
   (i64.load
    (i32.add
     (get_local $10)
     (i32.const 40)
    )
   )
  )
  (set_local $7
   (i64.load offset=24
    (get_local $10)
   )
  )
  (i64.store offset=64
   (get_local $10)
   (i64.load offset=32
    (get_local $10)
   )
  )
  (set_local $4
   (i64.load
    (i32.add
     (get_local $10)
     (i32.const 56)
    )
   )
  )
  (set_local $6
   (i32.load8_u
    (i32.add
     (get_local $10)
     (i32.const 48)
    )
   )
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $10)
     (i32.const 80)
    )
    (i32.const 8)
   )
   (i64.load
    (get_local $1)
   )
  )
  (i64.store offset=80
   (get_local $10)
   (i64.load offset=64
    (get_local $10)
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.shr_s
     (get_local $2)
     (i32.const 1)
    )
   )
  )
  (block $label$9
   (br_if $label$9
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $9
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $9)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $10)
     (i32.const 96)
    )
    (i32.const 8)
   )
   (tee_local $5
    (i64.load
     (i32.add
      (i32.add
       (get_local $10)
       (i32.const 80)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $10)
     (i32.const 8)
    )
    (i32.const 8)
   )
   (get_local $5)
  )
  (i64.store offset=96
   (get_local $10)
   (tee_local $5
    (i64.load offset=80
     (get_local $10)
    )
   )
  )
  (i64.store offset=8
   (get_local $10)
   (get_local $5)
  )
  (call_indirect (type $FUNCSIG$vijiij)
   (get_local $1)
   (get_local $7)
   (i32.add
    (get_local $10)
    (i32.const 8)
   )
   (i32.ne
    (i32.and
     (get_local $6)
     (i32.const 255)
    )
    (i32.const 0)
   )
   (get_local $4)
   (get_local $9)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $10)
    (i32.const 112)
   )
  )
  (i32.const 1)
 )
 (func $_ZN5eosio14execute_actionIN3ebt10eos_buttonES2_JyEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $6
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $4)
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $1
         (call $action_data_size)
        )
       )
      )
      (br_if $label$2
       (i32.lt_u
        (get_local $1)
        (i32.const 513)
       )
      )
      (set_local $4
       (call $malloc
        (get_local $1)
       )
      )
      (br $label$1)
     )
     (set_local $4
      (i32.const 0)
     )
     (br $label$0)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $4)
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $read_action_data
     (get_local $4)
     (get_local $1)
    )
   )
  )
  (i64.store offset=8
   (get_local $6)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.gt_u
    (get_local $1)
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const 8)
    )
    (get_local $4)
    (i32.const 8)
   )
  )
  (set_local $3
   (i64.load offset=8
    (get_local $6)
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.lt_u
     (get_local $1)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $4)
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.shr_s
     (get_local $2)
     (i32.const 1)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $5
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $5)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vij)
   (get_local $1)
   (get_local $3)
   (get_local $5)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 16)
   )
  )
  (i32.const 1)
 )
 (func $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyN5eosio5assetEbyEEELi0EEEZNS8_rsINS8_10datastreamIPKcEEJyS9_byEEERT_SI_RNS7_IJDpT0_EEEEUlSI_E_EEvRKSH_RKT0_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (get_local $2)
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (set_local $0
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $3)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $3)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.ne
    (i32.load offset=8
     (tee_local $3
      (i32.load
       (get_local $1)
      )
     )
    )
    (i32.load offset=4
     (get_local $3)
    )
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $4)
     (i32.const 15)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 1)
   )
  )
  (i32.store8 offset=24
   (get_local $0)
   (i32.ne
    (i32.load8_u offset=15
     (get_local $4)
    )
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 1408)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 32)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $4)
    (i32.const 16)
   )
  )
 )
 (func $malloc (param $0 i32) (result i32)
  (call $_ZN5eosio14memory_manager6mallocEm
   (i32.const 1624)
   (get_local $0)
  )
 )
 (func $_ZN5eosio14memory_manager6mallocEm (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (block $label$1
    (br_if $label$1
     (tee_local $13
      (i32.load offset=8384
       (get_local $0)
      )
     )
    )
    (set_local $13
     (i32.const 16)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 8384)
     )
     (i32.const 16)
    )
   )
   (set_local $2
    (select
     (i32.sub
      (i32.add
       (get_local $1)
       (i32.const 8)
      )
      (tee_local $2
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
        (i32.const 7)
       )
      )
     )
     (get_local $1)
     (get_local $2)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.ge_u
        (tee_local $10
         (i32.load offset=8388
          (get_local $0)
         )
        )
        (get_local $13)
       )
      )
      (set_local $1
       (i32.add
        (i32.add
         (get_local $0)
         (i32.mul
          (get_local $10)
          (i32.const 12)
         )
        )
        (i32.const 8192)
       )
      )
      (block $label$5
       (br_if $label$5
        (get_local $10)
       )
       (br_if $label$5
        (i32.load
         (tee_local $13
          (i32.add
           (get_local $0)
           (i32.const 8196)
          )
         )
        )
       )
       (i32.store
        (get_local $1)
        (i32.const 8192)
       )
       (i32.store
        (get_local $13)
        (get_local $0)
       )
      )
      (set_local $10
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (loop $label$6
       (block $label$7
        (br_if $label$7
         (i32.gt_u
          (i32.add
           (tee_local $13
            (i32.load offset=8
             (get_local $1)
            )
           )
           (get_local $10)
          )
          (i32.load
           (get_local $1)
          )
         )
        )
        (i32.store
         (tee_local $13
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $13)
          )
         )
         (i32.or
          (i32.and
           (i32.load
            (get_local $13)
           )
           (i32.const -2147483648)
          )
          (get_local $2)
         )
        )
        (i32.store
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const 8)
          )
         )
         (i32.add
          (i32.load
           (get_local $1)
          )
          (get_local $10)
         )
        )
        (i32.store
         (get_local $13)
         (i32.or
          (i32.load
           (get_local $13)
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$3
         (tee_local $1
          (i32.add
           (get_local $13)
           (i32.const 4)
          )
         )
        )
       )
       (br_if $label$6
        (tee_local $1
         (call $_ZN5eosio14memory_manager16next_active_heapEv
          (get_local $0)
         )
        )
       )
      )
     )
     (set_local $4
      (i32.sub
       (i32.const 2147483644)
       (get_local $2)
      )
     )
     (set_local $11
      (i32.add
       (get_local $0)
       (i32.const 8392)
      )
     )
     (set_local $12
      (i32.add
       (get_local $0)
       (i32.const 8384)
      )
     )
     (set_local $13
      (tee_local $3
       (i32.load offset=8392
        (get_local $0)
       )
      )
     )
     (loop $label$8
      (call $eosio_assert
       (i32.eq
        (i32.load
         (i32.add
          (tee_local $1
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $13)
             (i32.const 12)
            )
           )
          )
          (i32.const 8200)
         )
        )
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $1)
           (i32.const 8192)
          )
         )
        )
       )
       (i32.const 10032)
      )
      (set_local $13
       (i32.add
        (tee_local $6
         (i32.load
          (i32.add
           (get_local $1)
           (i32.const 8196)
          )
         )
        )
        (i32.const 4)
       )
      )
      (loop $label$9
       (set_local $7
        (i32.add
         (get_local $6)
         (i32.load
          (get_local $5)
         )
        )
       )
       (set_local $1
        (i32.and
         (tee_local $9
          (i32.load
           (tee_local $8
            (i32.add
             (get_local $13)
             (i32.const -4)
            )
           )
          )
         )
         (i32.const 2147483647)
        )
       )
       (block $label$10
        (br_if $label$10
         (i32.lt_s
          (get_local $9)
          (i32.const 0)
         )
        )
        (block $label$11
         (br_if $label$11
          (i32.ge_u
           (get_local $1)
           (get_local $2)
          )
         )
         (loop $label$12
          (br_if $label$11
           (i32.ge_u
            (tee_local $10
             (i32.add
              (get_local $13)
              (get_local $1)
             )
            )
            (get_local $7)
           )
          )
          (br_if $label$11
           (i32.lt_s
            (tee_local $10
             (i32.load
              (get_local $10)
             )
            )
            (i32.const 0)
           )
          )
          (br_if $label$12
           (i32.lt_u
            (tee_local $1
             (i32.add
              (i32.add
               (get_local $1)
               (i32.and
                (get_local $10)
                (i32.const 2147483647)
               )
              )
              (i32.const 4)
             )
            )
            (get_local $2)
           )
          )
         )
        )
        (i32.store
         (get_local $8)
         (i32.or
          (select
           (get_local $1)
           (get_local $2)
           (i32.lt_u
            (get_local $1)
            (get_local $2)
           )
          )
          (i32.and
           (get_local $9)
           (i32.const -2147483648)
          )
         )
        )
        (block $label$13
         (br_if $label$13
          (i32.le_u
           (get_local $1)
           (get_local $2)
          )
         )
         (i32.store
          (i32.add
           (get_local $13)
           (get_local $2)
          )
          (i32.and
           (i32.add
            (get_local $4)
            (get_local $1)
           )
           (i32.const 2147483647)
          )
         )
        )
        (br_if $label$2
         (i32.ge_u
          (get_local $1)
          (get_local $2)
         )
        )
       )
       (br_if $label$9
        (i32.lt_u
         (tee_local $13
          (i32.add
           (i32.add
            (get_local $13)
            (get_local $1)
           )
           (i32.const 4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $1
       (i32.const 0)
      )
      (i32.store
       (get_local $11)
       (tee_local $13
        (select
         (i32.const 0)
         (tee_local $13
          (i32.add
           (i32.load
            (get_local $11)
           )
           (i32.const 1)
          )
         )
         (i32.eq
          (get_local $13)
          (i32.load
           (get_local $12)
          )
         )
        )
       )
      )
      (br_if $label$8
       (i32.ne
        (get_local $13)
        (get_local $3)
       )
      )
     )
    )
    (return
     (get_local $1)
    )
   )
   (i32.store
    (get_local $8)
    (i32.or
     (i32.load
      (get_local $8)
     )
     (i32.const -2147483648)
    )
   )
   (return
    (get_local $13)
   )
  )
  (i32.const 0)
 )
 (func $_ZN5eosio14memory_manager16next_active_heapEv (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (set_local $1
   (i32.load offset=8388
    (get_local $0)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (i32.load8_u offset=10118
       (i32.const 0)
      )
     )
    )
    (set_local $7
     (i32.load offset=10120
      (i32.const 0)
     )
    )
    (br $label$0)
   )
   (set_local $7
    (current_memory)
   )
   (i32.store8 offset=10118
    (i32.const 0)
    (i32.const 1)
   )
   (i32.store offset=10120
    (i32.const 0)
    (tee_local $7
     (i32.shl
      (get_local $7)
      (i32.const 16)
     )
    )
   )
  )
  (set_local $3
   (get_local $7)
  )
  (block $label$2
   (block $label$3
    (block $label$4
     (block $label$5
      (br_if $label$5
       (i32.le_u
        (tee_local $2
         (i32.shr_u
          (i32.add
           (get_local $7)
           (i32.const 65535)
          )
          (i32.const 16)
         )
        )
        (tee_local $8
         (current_memory)
        )
       )
      )
      (drop
       (grow_memory
        (i32.sub
         (get_local $2)
         (get_local $8)
        )
       )
      )
      (set_local $8
       (i32.const 0)
      )
      (br_if $label$4
       (i32.ne
        (get_local $2)
        (current_memory)
       )
      )
      (set_local $3
       (i32.load offset=10120
        (i32.const 0)
       )
      )
     )
     (set_local $8
      (i32.const 0)
     )
     (i32.store offset=10120
      (i32.const 0)
      (get_local $3)
     )
     (br_if $label$4
      (i32.lt_s
       (get_local $7)
       (i32.const 0)
      )
     )
     (set_local $2
      (i32.add
       (get_local $0)
       (i32.mul
        (get_local $1)
        (i32.const 12)
       )
      )
     )
     (set_local $7
      (i32.sub
       (i32.sub
        (i32.add
         (get_local $7)
         (select
          (i32.const 65536)
          (i32.const 131072)
          (tee_local $6
           (i32.lt_u
            (tee_local $8
             (i32.and
              (get_local $7)
              (i32.const 65535)
             )
            )
            (i32.const 64513)
           )
          )
         )
        )
        (select
         (get_local $8)
         (i32.and
          (get_local $7)
          (i32.const 131071)
         )
         (get_local $6)
        )
       )
       (get_local $7)
      )
     )
     (block $label$6
      (br_if $label$6
       (i32.load8_u offset=10118
        (i32.const 0)
       )
      )
      (set_local $3
       (current_memory)
      )
      (i32.store8 offset=10118
       (i32.const 0)
       (i32.const 1)
      )
      (i32.store offset=10120
       (i32.const 0)
       (tee_local $3
        (i32.shl
         (get_local $3)
         (i32.const 16)
        )
       )
      )
     )
     (set_local $2
      (i32.add
       (get_local $2)
       (i32.const 8192)
      )
     )
     (br_if $label$3
      (i32.lt_s
       (get_local $7)
       (i32.const 0)
      )
     )
     (set_local $6
      (get_local $3)
     )
     (block $label$7
      (br_if $label$7
       (i32.le_u
        (tee_local $8
         (i32.shr_u
          (i32.add
           (i32.add
            (tee_local $5
             (i32.and
              (i32.add
               (get_local $7)
               (i32.const 7)
              )
              (i32.const -8)
             )
            )
            (get_local $3)
           )
           (i32.const 65535)
          )
          (i32.const 16)
         )
        )
        (tee_local $4
         (current_memory)
        )
       )
      )
      (drop
       (grow_memory
        (i32.sub
         (get_local $8)
         (get_local $4)
        )
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $8)
        (current_memory)
       )
      )
      (set_local $6
       (i32.load offset=10120
        (i32.const 0)
       )
      )
     )
     (i32.store offset=10120
      (i32.const 0)
      (i32.add
       (get_local $6)
       (get_local $5)
      )
     )
     (br_if $label$3
      (i32.eq
       (get_local $3)
       (i32.const -1)
      )
     )
     (br_if $label$2
      (i32.eq
       (i32.add
        (tee_local $6
         (i32.load
          (i32.add
           (tee_local $1
            (i32.add
             (get_local $0)
             (i32.mul
              (get_local $1)
              (i32.const 12)
             )
            )
           )
           (i32.const 8196)
          )
         )
        )
        (tee_local $8
         (i32.load
          (get_local $2)
         )
        )
       )
       (get_local $3)
      )
     )
     (block $label$8
      (br_if $label$8
       (i32.eq
        (get_local $8)
        (tee_local $1
         (i32.load
          (tee_local $5
           (i32.add
            (get_local $1)
            (i32.const 8200)
           )
          )
         )
        )
       )
      )
      (i32.store
       (tee_local $6
        (i32.add
         (get_local $6)
         (get_local $1)
        )
       )
       (i32.or
        (i32.and
         (i32.load
          (get_local $6)
         )
         (i32.const -2147483648)
        )
        (i32.add
         (i32.sub
          (i32.const -4)
          (get_local $1)
         )
         (get_local $8)
        )
       )
      )
      (i32.store
       (get_local $5)
       (i32.load
        (get_local $2)
       )
      )
      (i32.store
       (get_local $6)
       (i32.and
        (i32.load
         (get_local $6)
        )
        (i32.const 2147483647)
       )
      )
     )
     (i32.store
      (tee_local $2
       (i32.add
        (get_local $0)
        (i32.const 8388)
       )
      )
      (tee_local $2
       (i32.add
        (i32.load
         (get_local $2)
        )
        (i32.const 1)
       )
      )
     )
     (i32.store
      (i32.add
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.mul
          (get_local $2)
          (i32.const 12)
         )
        )
       )
       (i32.const 8196)
      )
      (get_local $3)
     )
     (i32.store
      (tee_local $8
       (i32.add
        (get_local $0)
        (i32.const 8192)
       )
      )
      (get_local $7)
     )
    )
    (return
     (get_local $8)
    )
   )
   (block $label$9
    (br_if $label$9
     (i32.eq
      (tee_local $8
       (i32.load
        (get_local $2)
       )
      )
      (tee_local $7
       (i32.load
        (tee_local $1
         (i32.add
          (tee_local $3
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $1)
             (i32.const 12)
            )
           )
          )
          (i32.const 8200)
         )
        )
       )
      )
     )
    )
    (i32.store
     (tee_local $3
      (i32.add
       (i32.load
        (i32.add
         (get_local $3)
         (i32.const 8196)
        )
       )
       (get_local $7)
      )
     )
     (i32.or
      (i32.and
       (i32.load
        (get_local $3)
       )
       (i32.const -2147483648)
      )
      (i32.add
       (i32.sub
        (i32.const -4)
        (get_local $7)
       )
       (get_local $8)
      )
     )
    )
    (i32.store
     (get_local $1)
     (i32.load
      (get_local $2)
     )
    )
    (i32.store
     (get_local $3)
     (i32.and
      (i32.load
       (get_local $3)
      )
      (i32.const 2147483647)
     )
    )
   )
   (i32.store offset=8384
    (get_local $0)
    (tee_local $3
     (i32.add
      (i32.load
       (tee_local $7
        (i32.add
         (get_local $0)
         (i32.const 8388)
        )
       )
      )
      (i32.const 1)
     )
    )
   )
   (i32.store
    (get_local $7)
    (get_local $3)
   )
   (return
    (i32.const 0)
   )
  )
  (i32.store
   (get_local $2)
   (i32.add
    (get_local $8)
    (get_local $7)
   )
  )
  (get_local $2)
 )
 (func $free (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (get_local $0)
     )
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.load offset=10008
        (i32.const 0)
       )
      )
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.const 9816)
    )
    (set_local $1
     (i32.add
      (i32.mul
       (get_local $2)
       (i32.const 12)
      )
      (i32.const 9816)
     )
    )
    (loop $label$2
     (br_if $label$1
      (i32.eqz
       (tee_local $2
        (i32.load
         (i32.add
          (get_local $3)
          (i32.const 4)
         )
        )
       )
      )
     )
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (i32.add
         (get_local $2)
         (i32.const 4)
        )
        (get_local $0)
       )
      )
      (br_if $label$0
       (i32.gt_u
        (i32.add
         (get_local $2)
         (i32.load
          (get_local $3)
         )
        )
        (get_local $0)
       )
      )
     )
     (br_if $label$2
      (i32.lt_u
       (tee_local $3
        (i32.add
         (get_local $3)
         (i32.const 12)
        )
       )
       (get_local $1)
      )
     )
    )
   )
   (return)
  )
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const -4)
    )
   )
   (i32.and
    (i32.load
     (get_local $3)
    )
    (i32.const 2147483647)
   )
  )
 )
 (func $_Znwj (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (block $label$0
   (br_if $label$0
    (tee_local $0
     (call $malloc
      (tee_local $1
       (select
        (get_local $0)
        (i32.const 1)
        (get_local $0)
       )
      )
     )
    )
   )
   (loop $label$1
    (set_local $0
     (i32.const 0)
    )
    (br_if $label$0
     (i32.eqz
      (tee_local $2
       (i32.load offset=10124
        (i32.const 0)
       )
      )
     )
    )
    (call_indirect (type $FUNCSIG$v)
     (get_local $2)
    )
    (br_if $label$1
     (i32.eqz
      (tee_local $0
       (call $malloc
        (get_local $1)
       )
      )
     )
    )
   )
  )
  (get_local $0)
 )
 (func $_ZdlPv (param $0 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $0)
    )
   )
   (call $free
    (get_local $0)
   )
  )
 )
 (func $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv (param $0 i32)
  (call $abort)
  (unreachable)
 )
 (func $memcmp (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (set_local $5
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $2)
    )
   )
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.ne
       (tee_local $3
        (i32.load8_u
         (get_local $0)
        )
       )
       (tee_local $4
        (i32.load8_u
         (get_local $1)
        )
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (set_local $0
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (br_if $label$2
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const -1)
       )
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.sub
     (get_local $3)
     (get_local $4)
    )
   )
  )
  (get_local $5)
 )
 (func $__wasm_nullptr (type $FUNCSIG$v)
  (unreachable)
 )
)
