(module
 (type $FUNCSIG$vij (func (param i32 i64)))
 (type $FUNCSIG$vijjii (func (param i32 i64 i64 i32 i32)))
 (type $FUNCSIG$viji (func (param i32 i64 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vijii (func (param i32 i64 i32 i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$j (func (result i64)))
 (type $FUNCSIG$vjj (func (param i64 i64)))
 (type $FUNCSIG$vj (func (param i64)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ijjjjii (func (param i64 i64 i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$ijjjj (func (param i64 i64 i64 i64) (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vd (func (param f64)))
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
 (import "env" "memcpy" (func $memcpy (param i32 i32 i32) (result i32)))
 (import "env" "memmove" (func $memmove (param i32 i32 i32) (result i32)))
 (import "env" "printdf" (func $printdf (param f64)))
 (import "env" "printn" (func $printn (param i64)))
 (import "env" "prints" (func $prints (param i32)))
 (import "env" "printui" (func $printui (param i64)))
 (import "env" "read_action_data" (func $read_action_data (param i32 i32) (result i32)))
 (import "env" "require_auth" (func $require_auth (param i64)))
 (import "env" "require_auth2" (func $require_auth2 (param i64 i64)))
 (table 9 9 anyfunc)
 (elem (i32.const 0) $__wasm_nullptr $_ZN6ballot8rmmemberEy $_ZN6ballot7addvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE $_ZN6ballot6rmvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE $_ZN6ballot4initEy $_ZN6ballot7proposeEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_ $_ZN6ballot9addmemberEyymb $_ZN6ballot10rmproposalEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE $_ZN6ballot10countvotesERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE)
 (memory $0 1)
 (data (i32.const 4) "\a0g\00\00")
 (data (i32.const 16) "cannot create objects in table of another contract\00")
 (data (i32.const 80) "Contract Initialized by \00")
 (data (i32.const 112) "write\00")
 (data (i32.const 128) "object passed to iterator_to is not in multi_index\00")
 (data (i32.const 192) "cannot pass end iterator to modify\00")
 (data (i32.const 240) "object passed to modify is not in multi_index\00")
 (data (i32.const 288) "cannot modify objects in table of another contract\00")
 (data (i32.const 352) "updater cannot change primary key when modifying an object\00")
 (data (i32.const 416) "error reading iterator\00")
 (data (i32.const 448) "read\00")
 (data (i32.const 464) "Granter does not exist\00")
 (data (i32.const 496) "You do not have permission to add a new member!\00")
 (data (i32.const 544) "Member already exists!\00")
 (data (i32.const 576) "New Member Added: \00")
 (data (i32.const 608) "singleton does not exist\00")
 (data (i32.const 640) "cannot pass end iterator to erase\00")
 (data (i32.const 688) "cannot increment end iterator\00")
 (data (i32.const 720) "object passed to erase is not in multi_index\00")
 (data (i32.const 768) "cannot erase objects in table of another contract\00")
 (data (i32.const 832) "attempt to remove object that was not in multi_index\00")
 (data (i32.const 896) "Member does not exist!\00")
 (data (i32.const 928) "Creating new proposal\00")
 (data (i32.const 960) "Modifing existing proposal\00")
 (data (i32.const 992) "Proposal ID mismatch\00")
 (data (i32.const 1024) "get\00")
 (data (i32.const 1040) "Member does not exist\00")
 (data (i32.const 1072) "Proposal does not exist\00")
 (data (i32.const 1104) "Proposal: \00")
 (data (i32.const 1120) " removed from the database\n\00")
 (data (i32.const 1152) "Member does not exists!\00")
 (data (i32.const 1184) "Member already voted for this proposal\00")
 (data (i32.const 1232) "\'\00")
 (data (i32.const 1248) "\' voted for \'\00")
 (data (i32.const 1264) "\'\n\00")
 (data (i32.const 1280) "Removing vote for \'\00")
 (data (i32.const 1312) "Member has not voted for this proposals!\00")
 (data (i32.const 1360) "Total votes cast for this proposal: \00")
 (data (i32.const 1408) "\n\00")
 (data (i32.const 1424) "Total voting weight in existance: \00")
 (data (i32.const 1472) "Percentage needed: \00")
 (data (i32.const 1504) "Votes needed: \00")
 (data (i32.const 1520) "APPROVED!\n\00")
 (data (i32.const 1536) "NOT APPROVED!\n\00")
 (data (i32.const 1552) "onerror\00")
 (data (i32.const 1568) "eosio\00")
 (data (i32.const 1584) "onerror action\'s are only valid from the \"eosio\" system account\00")
 (data (i32.const 10048) "malloc_from_freed was designed to only be called after _heap was completely allocated\00")
 (export "memory" (memory $0))
 (export "_ZeqRK11checksum256S1_" (func $_ZeqRK11checksum256S1_))
 (export "_ZeqRK11checksum160S1_" (func $_ZeqRK11checksum160S1_))
 (export "_ZneRK11checksum160S1_" (func $_ZneRK11checksum160S1_))
 (export "now" (func $now))
 (export "_ZN5eosio12require_authERKNS_16permission_levelE" (func $_ZN5eosio12require_authERKNS_16permission_levelE))
 (export "_ZN6ballot4initEy" (func $_ZN6ballot4initEy))
 (export "_ZN6ballot9addmemberEyymb" (func $_ZN6ballot9addmemberEyymb))
 (export "_ZN6ballot8rmmemberEy" (func $_ZN6ballot8rmmemberEy))
 (export "_ZN6ballot7proposeEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_" (func $_ZN6ballot7proposeEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_))
 (export "_ZN6ballot10rmproposalEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE" (func $_ZN6ballot10rmproposalEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE))
 (export "_ZN6ballot7addvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE" (func $_ZN6ballot7addvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE))
 (export "_ZN6ballot6rmvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE" (func $_ZN6ballot6rmvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE))
 (export "_ZN6ballot10countvotesERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE" (func $_ZN6ballot10countvotesERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE))
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
 (func $_ZN6ballot4initEy (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
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
     (i32.const 64)
    )
   )
  )
  (call $require_auth
   (i64.load
    (get_local $0)
   )
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store
   (get_local $8)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 48)
    )
    (get_local $8)
    (i32.const 4)
   )
  )
  (set_local $7
   (i32.load offset=48
    (get_local $8)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 48)
    )
    (i32.or
     (get_local $8)
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $3
   (i32.load offset=48
    (get_local $8)
   )
  )
  (i32.store
   (i32.add
    (get_local $8)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $8)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $8)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $8)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $8)
   (tee_local $4
    (i64.load
     (get_local $0)
    )
   )
  )
  (i64.store offset=48
   (get_local $8)
   (get_local $1)
  )
  (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3setERKS2_y
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
   (get_local $4)
  )
  (set_local $4
   (i64.extend_u/i32
    (i32.xor
     (i32.shr_u
      (tee_local $7
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $7
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $3
                (i32.mul
                 (get_local $3)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $3)
             )
             (i32.const 1540483477)
            )
            (i32.mul
             (i32.xor
              (i32.mul
               (i32.xor
                (i32.shr_u
                 (tee_local $7
                  (i32.mul
                   (get_local $7)
                   (i32.const 1540483477)
                  )
                 )
                 (i32.const 24)
                )
                (get_local $7)
               )
               (i32.const 1540483477)
              )
              (i32.const -561034072)
             )
             (i32.const 1540483477)
            )
           )
          )
          (i32.const 13)
         )
         (get_local $7)
        )
        (i32.const 1540483477)
       )
      )
      (i32.const 15)
     )
     (get_local $7)
    )
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $2
      (i32.load offset=24
       (get_local $8)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $7
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $8)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $2)
      )
     )
     (loop $label$3
      (set_local $3
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
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $3)
        )
       )
       (call $_ZdlPv
        (get_local $3)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $2)
        (get_local $7)
       )
      )
     )
     (set_local $7
      (i32.load
       (i32.add
        (get_local $8)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $7
     (get_local $2)
    )
   )
   (i32.store
    (get_local $6)
    (get_local $2)
   )
   (call $_ZdlPv
    (get_local $7)
   )
  )
  (set_local $5
   (i64.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 16)
  )
  (i32.store offset=36
   (tee_local $7
    (call $_Znwj
     (i32.const 48)
    )
   )
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (i64.store offset=8
   (get_local $7)
   (get_local $1)
  )
  (i64.store
   (get_local $7)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $7)
   (i64.const 0)
  )
  (i64.store offset=24
   (get_local $7)
   (get_local $1)
  )
  (i32.store8 offset=32
   (get_local $7)
   (i32.const 1)
  )
  (i32.store offset=56
   (get_local $8)
   (i32.add
    (get_local $8)
    (i32.const 33)
   )
  )
  (i32.store offset=52
   (get_local $8)
   (get_local $8)
  )
  (i32.store offset=48
   (get_local $8)
   (get_local $8)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot6MemberE
    (i32.add
     (get_local $8)
     (i32.const 48)
    )
    (get_local $7)
   )
  )
  (i32.store offset=40
   (get_local $7)
   (tee_local $2
    (call $db_store_i64
     (i64.load
      (i32.add
       (get_local $0)
       (i32.const 16)
      )
     )
     (i64.const -7880044397109182464)
     (get_local $5)
     (tee_local $4
      (i64.load
       (get_local $7)
      )
     )
     (get_local $8)
     (i32.const 33)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i64.lt_u
     (get_local $4)
     (i64.load
      (i32.add
       (get_local $0)
       (i32.const 24)
      )
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 24)
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
  (i32.store offset=48
   (get_local $8)
   (get_local $7)
  )
  (i64.store
   (get_local $8)
   (tee_local $4
    (i64.load
     (get_local $7)
    )
   )
  )
  (i32.store offset=44
   (get_local $8)
   (get_local $2)
  )
  (block $label$6
   (block $label$7
    (br_if $label$7
     (i32.ge_u
      (tee_local $3
       (i32.load
        (tee_local $6
         (i32.add
          (get_local $0)
          (i32.const 36)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 40)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $3)
     (get_local $4)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $2)
    )
    (i32.store offset=48
     (get_local $8)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $7)
    )
    (i32.store
     (get_local $6)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$6)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $0)
     (i32.const 32)
    )
    (i32.add
     (get_local $8)
     (i32.const 48)
    )
    (get_local $8)
    (i32.add
     (get_local $8)
     (i32.const 44)
    )
   )
  )
  (set_local $7
   (i32.load offset=48
    (get_local $8)
   )
  )
  (i32.store offset=48
   (get_local $8)
   (i32.const 0)
  )
  (block $label$8
   (br_if $label$8
    (i32.eqz
     (get_local $7)
    )
   )
   (call $_ZdlPv
    (get_local $7)
   )
  )
  (call $prints
   (i32.const 80)
  )
  (call $printn
   (get_local $1)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 64)
   )
  )
 )
 (func $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3setERKS2_y (param $0 i32) (param $1 i32) (param $2 i64)
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
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.eq
        (tee_local $3
         (i32.load
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
        (i32.load offset=24
         (get_local $0)
        )
       )
      )
      (call $eosio_assert
       (i32.eq
        (i32.load offset=8
         (tee_local $3
          (i32.load
           (i32.add
            (get_local $3)
            (i32.const -24)
           )
          )
         )
        )
        (get_local $0)
       )
       (i32.const 128)
      )
      (br_if $label$2
       (get_local $3)
      )
      (br $label$1)
     )
     (br_if $label$1
      (i32.lt_s
       (tee_local $3
        (call $db_find_i64
         (i64.load
          (get_local $0)
         )
         (i64.load offset=8
          (get_local $0)
         )
         (i64.const -4417020450001911808)
         (i64.const -4417020450001911808)
        )
       )
       (i32.const 0)
      )
     )
     (call $eosio_assert
      (i32.eq
       (i32.load offset=8
        (tee_local $3
         (call $_ZNK5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE31load_object_by_primary_iteratorEl
          (get_local $0)
          (get_local $3)
         )
        )
       )
       (get_local $0)
      )
      (i32.const 128)
     )
    )
    (i32.store
     (get_local $4)
     (get_local $1)
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 192)
    )
    (call $_ZN5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE6modifyIZNS4_3setERKS3_yEUlRS5_E_EEvRKS5_yOT_
     (get_local $0)
     (get_local $3)
     (get_local $2)
     (get_local $4)
    )
    (br $label$0)
   )
   (i32.store offset=8
    (get_local $4)
    (get_local $1)
   )
   (call $_ZN5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE7emplaceIZNS4_3setERKS3_yEUlRS5_E0_EENS6_14const_iteratorEyOT_
    (get_local $4)
    (get_local $0)
    (get_local $2)
    (i32.add
     (get_local $4)
     (i32.const 8)
    )
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
 (func $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot6MemberE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
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
   (i32.const 112)
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
   (i32.const 112)
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
   (i32.const 112)
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
   (i32.const 112)
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
  (i32.store8 offset=15
   (get_local $3)
   (i32.load8_u offset=32
    (get_local $1)
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
    (i32.const 0)
   )
   (i32.const 112)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
 (func $_ZNK5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (set_local $7
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $8)
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
    (set_local $5
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
      (tee_local $4
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
    (i32.const 416)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.le_u
       (get_local $4)
       (i32.const 512)
      )
     )
     (drop
      (call $db_get_i64
       (get_local $1)
       (tee_local $6
        (call $malloc
         (get_local $4)
        )
       )
       (get_local $4)
      )
     )
     (call $free
      (get_local $6)
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $6
      (i32.sub
       (get_local $8)
       (i32.and
        (i32.add
         (get_local $4)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
    (drop
     (call $db_get_i64
      (get_local $1)
      (get_local $6)
      (get_local $4)
     )
    )
   )
   (i32.store offset=8
    (tee_local $5
     (call $_Znwj
      (i32.const 24)
     )
    )
    (get_local $0)
   )
   (call $eosio_assert
    (i32.gt_u
     (get_local $4)
     (i32.const 7)
    )
    (i32.const 448)
   )
   (drop
    (call $memcpy
     (get_local $5)
     (get_local $6)
     (i32.const 8)
    )
   )
   (i32.store offset=12
    (get_local $5)
    (get_local $1)
   )
   (i32.store offset=24
    (get_local $7)
    (get_local $5)
   )
   (i64.store offset=16
    (get_local $7)
    (i64.const -4417020450001911808)
   )
   (i32.store offset=12
    (get_local $7)
    (tee_local $6
     (i32.load offset=12
      (get_local $5)
     )
    )
   )
   (block $label$6
    (block $label$7
     (br_if $label$7
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
      (i64.const -4417020450001911808)
     )
     (i32.store offset=16
      (get_local $4)
      (get_local $6)
     )
     (i32.store offset=24
      (get_local $7)
      (i32.const 0)
     )
     (i32.store
      (get_local $4)
      (get_local $5)
     )
     (i32.store
      (get_local $1)
      (i32.add
       (get_local $4)
       (i32.const 24)
      )
     )
     (br $label$6)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy14029723623707639808ENS1_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE8item_ptrENS_9allocatorIS9_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS8_4itemENS_14default_deleteISF_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 24)
     )
     (i32.add
      (get_local $7)
      (i32.const 24)
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
   (set_local $4
    (i32.load offset=24
     (get_local $7)
    )
   )
   (i32.store offset=24
    (get_local $7)
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
    (get_local $7)
    (i32.const 32)
   )
  )
  (get_local $5)
 )
 (func $_ZN5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE6modifyIZNS4_3setERKS3_yEUlRS5_E_EEvRKS5_yOT_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
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
  (call $eosio_assert
   (i32.eq
    (i32.load offset=8
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (i64.store
   (get_local $1)
   (i64.load
    (i32.load
     (get_local $3)
    )
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 352)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 112)
  )
  (drop
   (call $memcpy
    (get_local $4)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $db_update_i64
   (i32.load offset=12
    (get_local $1)
   )
   (get_local $2)
   (get_local $4)
   (i32.const 8)
  )
  (block $label$0
   (br_if $label$0
    (i64.gt_u
     (i64.load offset=16
      (get_local $0)
     )
     (i64.const -4417020450001911808)
    )
   )
   (i64.store
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i64.const -4417020450001911807)
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
 (func $_ZN5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE7emplaceIZNS4_3setERKS3_yEUlRS5_E0_EENS6_14const_iteratorEyOT_ (param $0 i32) (param $1 i32) (param $2 i64) (param $3 i32)
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
     (i32.const 32)
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
   (i32.const 16)
  )
  (i32.store offset=8
   (tee_local $4
    (call $_Znwj
     (i32.const 24)
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
  (call $eosio_assert
   (i32.const 1)
   (i32.const 112)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
    (get_local $4)
    (i32.const 8)
   )
  )
  (i32.store offset=12
   (get_local $4)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $1)
    )
    (i64.const -4417020450001911808)
    (get_local $2)
    (i64.const -4417020450001911808)
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (block $label$0
   (br_if $label$0
    (i64.gt_u
     (i64.load offset=16
      (get_local $1)
     )
     (i64.const -4417020450001911808)
    )
   )
   (i64.store
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i64.const -4417020450001911807)
   )
  )
  (i32.store offset=8
   (get_local $7)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $7)
   (i64.const -4417020450001911808)
  )
  (i32.store offset=4
   (get_local $7)
   (tee_local $5
    (i32.load offset=12
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
     (get_local $3)
     (i64.const -4417020450001911808)
    )
    (i32.store offset=16
     (get_local $3)
     (get_local $5)
    )
    (i32.store offset=8
     (get_local $7)
     (i32.const 0)
    )
    (i32.store
     (get_local $3)
     (get_local $4)
    )
    (i32.store
     (get_local $6)
     (i32.add
      (get_local $3)
      (i32.const 24)
     )
    )
    (br $label$1)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy14029723623707639808ENS1_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE8item_ptrENS_9allocatorIS9_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS8_4itemENS_14default_deleteISF_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.add
     (get_local $7)
     (i32.const 8)
    )
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
    (i32.add
     (get_local $7)
     (i32.const 4)
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
   (i32.load offset=8
    (get_local $7)
   )
  )
  (i32.store offset=8
   (get_local $7)
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
    (get_local $7)
    (i32.const 32)
   )
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy14029723623707639808ENS1_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE8item_ptrENS_9allocatorIS9_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS8_4itemENS_14default_deleteISF_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
 (func $_ZN6ballot9addmemberEyymb (type $FUNCSIG$vijjii) (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 i32)
  (local $14 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $14
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
    (get_local $14)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $14)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $14)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $14)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $14)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $7
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (get_local $14)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $5
      (i32.load offset=24
       (get_local $14)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $13
        (i32.load
         (tee_local $10
          (i32.add
           (get_local $14)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $5)
      )
     )
     (loop $label$3
      (set_local $6
       (i32.load
        (tee_local $13
         (i32.add
          (get_local $13)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $13)
       (i32.const 0)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $6)
        )
       )
       (call $_ZdlPv
        (get_local $6)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $5)
        (get_local $13)
       )
      )
     )
     (set_local $13
      (i32.load
       (i32.add
        (get_local $14)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $13
     (get_local $5)
    )
   )
   (i32.store
    (get_local $10)
    (get_local $5)
   )
   (call $_ZdlPv
    (get_local $13)
   )
  )
  (call $require_auth
   (get_local $7)
  )
  (call $require_auth
   (get_local $1)
  )
  (call $require_auth
   (get_local $2)
  )
  (i64.store
   (get_local $14)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (get_local $14)
    (i32.const 4)
   )
  )
  (set_local $13
   (i32.load offset=48
    (get_local $14)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (tee_local $6
     (i32.or
      (get_local $14)
      (i32.const 4)
     )
    )
    (i32.const 4)
   )
  )
  (set_local $5
   (i32.load offset=48
    (get_local $14)
   )
  )
  (i64.store
   (get_local $14)
   (get_local $2)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (get_local $14)
    (i32.const 4)
   )
  )
  (set_local $10
   (i32.load offset=48
    (get_local $14)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (get_local $6)
    (i32.const 4)
   )
  )
  (set_local $11
   (i32.shr_u
    (tee_local $8
     (i32.mul
      (i32.xor
       (i32.shr_u
        (tee_local $13
         (i32.xor
          (i32.mul
           (i32.xor
            (i32.shr_u
             (tee_local $6
              (i32.mul
               (get_local $5)
               (i32.const 1540483477)
              )
             )
             (i32.const 24)
            )
            (get_local $6)
           )
           (i32.const 1540483477)
          )
          (i32.mul
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $13
                (i32.mul
                 (get_local $13)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $13)
             )
             (i32.const 1540483477)
            )
            (i32.const -561034072)
           )
           (i32.const 1540483477)
          )
         )
        )
        (i32.const 13)
       )
       (get_local $13)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (i32.xor
     (i32.shr_u
      (tee_local $13
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $13
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $13
                (i32.mul
                 (i32.load offset=48
                  (get_local $14)
                 )
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $13)
             )
             (i32.const 1540483477)
            )
            (i32.mul
             (i32.xor
              (i32.mul
               (i32.xor
                (i32.shr_u
                 (tee_local $13
                  (i32.mul
                   (get_local $10)
                   (i32.const 1540483477)
                  )
                 )
                 (i32.const 24)
                )
                (get_local $13)
               )
               (i32.const 1540483477)
              )
              (i32.const -561034072)
             )
             (i32.const 1540483477)
            )
           )
          )
          (i32.const 13)
         )
         (get_local $13)
        )
        (i32.const 1540483477)
       )
      )
      (i32.const 15)
     )
     (get_local $13)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eq
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $13
    (i32.add
     (get_local $5)
     (i32.const -24)
    )
   )
   (set_local $10
    (i32.sub
     (i32.const 0)
     (get_local $9)
    )
   )
   (loop $label$6
    (br_if $label$5
     (i64.eq
      (i64.load
       (i32.load
        (get_local $13)
       )
      )
      (get_local $7)
     )
    )
    (set_local $5
     (get_local $13)
    )
    (set_local $13
     (tee_local $6
      (i32.add
       (get_local $13)
       (i32.const -24)
      )
     )
    )
    (br_if $label$6
     (i32.ne
      (i32.add
       (get_local $6)
       (get_local $10)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $6
   (i32.xor
    (get_local $11)
    (get_local $8)
   )
  )
  (set_local $8
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$7
   (block $label$8
    (br_if $label$8
     (i32.eq
      (get_local $5)
      (get_local $9)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $13
         (i32.load
          (i32.add
           (get_local $5)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $8)
     )
     (i32.const 128)
    )
    (br $label$7)
   )
   (set_local $13
    (i32.const 0)
   )
   (br_if $label$7
    (i32.lt_s
     (tee_local $5
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i64.const -7880044397109182464)
       (get_local $7)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=36
      (tee_local $13
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $8)
        (get_local $5)
       )
      )
     )
     (get_local $8)
    )
    (i32.const 128)
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (get_local $6)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $13)
    (i32.const 0)
   )
   (i32.const 464)
  )
  (call $eosio_assert
   (i32.load8_u offset=32
    (get_local $13)
   )
   (i32.const 496)
  )
  (block $label$9
   (br_if $label$9
    (i32.eq
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $13
    (i32.add
     (get_local $5)
     (i32.const -24)
    )
   )
   (set_local $10
    (i32.sub
     (i32.const 0)
     (get_local $9)
    )
   )
   (loop $label$10
    (br_if $label$9
     (i64.eq
      (i64.load
       (i32.load
        (get_local $13)
       )
      )
      (get_local $7)
     )
    )
    (set_local $5
     (get_local $13)
    )
    (set_local $13
     (tee_local $6
      (i32.add
       (get_local $13)
       (i32.const -24)
      )
     )
    )
    (br_if $label$10
     (i32.ne
      (i32.add
       (get_local $6)
       (get_local $10)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$11
   (block $label$12
    (br_if $label$12
     (i32.eq
      (get_local $5)
      (get_local $9)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $13
         (i32.load
          (i32.add
           (get_local $5)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $8)
     )
     (i32.const 128)
    )
    (set_local $6
     (i32.add
      (get_local $0)
      (i32.const 16)
     )
    )
    (br $label$11)
   )
   (set_local $13
    (i32.const 0)
   )
   (br_if $label$11
    (i32.lt_s
     (tee_local $5
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (i64.load
        (tee_local $6
         (i32.add
          (get_local $0)
          (i32.const 16)
         )
        )
       )
       (i64.const -7880044397109182464)
       (get_local $7)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=36
      (tee_local $13
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $8)
        (get_local $5)
       )
      )
     )
     (get_local $8)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (i32.eqz
    (get_local $13)
   )
   (i32.const 544)
  )
  (set_local $12
   (i64.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (call $current_receiver)
   )
   (i32.const 16)
  )
  (i32.store offset=36
   (tee_local $13
    (call $_Znwj
     (i32.const 48)
    )
   )
   (get_local $8)
  )
  (i64.store offset=8
   (get_local $13)
   (get_local $1)
  )
  (i64.store
   (get_local $13)
   (get_local $7)
  )
  (i64.store offset=16
   (get_local $13)
   (i64.extend_u/i32
    (get_local $3)
   )
  )
  (i64.store offset=24
   (get_local $13)
   (get_local $2)
  )
  (i32.store8 offset=32
   (get_local $13)
   (get_local $4)
  )
  (i32.store offset=56
   (get_local $14)
   (i32.add
    (get_local $14)
    (i32.const 33)
   )
  )
  (i32.store offset=52
   (get_local $14)
   (get_local $14)
  )
  (i32.store offset=48
   (get_local $14)
   (get_local $14)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot6MemberE
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (get_local $13)
   )
  )
  (i32.store offset=40
   (get_local $13)
   (tee_local $5
    (call $db_store_i64
     (i64.load
      (get_local $6)
     )
     (i64.const -7880044397109182464)
     (get_local $12)
     (tee_local $7
      (i64.load
       (get_local $13)
      )
     )
     (get_local $14)
     (i32.const 33)
    )
   )
  )
  (block $label$13
   (br_if $label$13
    (i64.lt_u
     (get_local $7)
     (i64.load
      (tee_local $6
       (i32.add
        (get_local $0)
        (i32.const 24)
       )
      )
     )
    )
   )
   (i64.store
    (get_local $6)
    (select
     (i64.const -2)
     (i64.add
      (get_local $7)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $7)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=48
   (get_local $14)
   (get_local $13)
  )
  (i64.store
   (get_local $14)
   (tee_local $7
    (i64.load
     (get_local $13)
    )
   )
  )
  (i32.store offset=44
   (get_local $14)
   (get_local $5)
  )
  (block $label$14
   (block $label$15
    (br_if $label$15
     (i32.ge_u
      (tee_local $6
       (i32.load
        (tee_local $10
         (i32.add
          (get_local $0)
          (i32.const 36)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 40)
       )
      )
     )
    )
    (i64.store offset=8
     (get_local $6)
     (get_local $7)
    )
    (i32.store offset=16
     (get_local $6)
     (get_local $5)
    )
    (i32.store offset=48
     (get_local $14)
     (i32.const 0)
    )
    (i32.store
     (get_local $6)
     (get_local $13)
    )
    (i32.store
     (get_local $10)
     (i32.add
      (get_local $6)
      (i32.const 24)
     )
    )
    (br $label$14)
   )
   (call $_ZNSt3__16vectorIN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
    (i32.add
     (get_local $0)
     (i32.const 32)
    )
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (get_local $14)
    (i32.add
     (get_local $14)
     (i32.const 44)
    )
   )
  )
  (set_local $13
   (i32.load offset=48
    (get_local $14)
   )
  )
  (i32.store offset=48
   (get_local $14)
   (i32.const 0)
  )
  (block $label$16
   (br_if $label$16
    (i32.eqz
     (get_local $13)
    )
   )
   (call $_ZdlPv
    (get_local $13)
   )
  )
  (call $prints
   (i32.const 576)
  )
  (call $printn
   (get_local $1)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $14)
    (i32.const 64)
   )
  )
 )
 (func $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv (param $0 i32) (result i64)
  (local $1 i32)
  (local $2 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eq
      (tee_local $2
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 28)
        )
       )
      )
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=8
       (tee_local $2
        (i32.load
         (i32.add
          (get_local $2)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $0)
     )
     (i32.const 128)
    )
    (br $label$0)
   )
   (set_local $2
    (i32.const 0)
   )
   (br_if $label$0
    (i32.lt_s
     (tee_local $1
      (call $db_find_i64
       (i64.load
        (get_local $0)
       )
       (i64.load offset=8
        (get_local $0)
       )
       (i64.const -4417020450001911808)
       (i64.const -4417020450001911808)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=8
      (tee_local $2
       (call $_ZNK5eosio11multi_indexILy14029723623707639808ENS_9singletonILy14029723623707639808EN6ballot8SettingsEE3rowEJEE31load_object_by_primary_iteratorEl
        (get_local $0)
        (get_local $1)
       )
      )
     )
     (get_local $0)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $2)
    (i32.const 0)
   )
   (i32.const 608)
  )
  (i64.load
   (get_local $2)
  )
 )
 (func $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
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
    (i32.const 416)
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
   (i32.store8 offset=32
    (tee_local $6
     (call $_Znwj
      (i32.const 48)
     )
    )
    (i32.const 0)
   )
   (i64.store offset=16
    (get_local $6)
    (i64.const 1)
   )
   (i32.store offset=36
    (get_local $6)
    (get_local $0)
   )
   (drop
    (call $_ZrsIN5eosio10datastreamIPKcEEERT_S6_RN6ballot6MemberE
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (get_local $6)
    )
   )
   (i32.store offset=40
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
     (i32.load offset=40
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
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
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
 (func $_ZrsIN5eosio10datastreamIPKcEEERT_S6_RN6ballot6MemberE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
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
   (i32.const 448)
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
   (i32.const 448)
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
   (i32.const 448)
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
   (i32.const 448)
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
   (i32.ne
    (i32.load offset=8
     (get_local $0)
    )
    (get_local $2)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store8 offset=32
   (get_local $1)
   (i32.ne
    (i32.load8_u offset=15
     (get_local $3)
    )
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN6ballot8rmmemberEy (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $8)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $8)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $8)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $8)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $8)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $2
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (get_local $8)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $3
      (i32.load offset=24
       (get_local $8)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $7
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $8)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $3)
      )
     )
     (loop $label$3
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
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $4)
        )
       )
       (call $_ZdlPv
        (get_local $4)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $3)
        (get_local $7)
       )
      )
     )
     (set_local $7
      (i32.load
       (i32.add
        (get_local $8)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $7
     (get_local $3)
    )
   )
   (i32.store
    (get_local $6)
    (get_local $3)
   )
   (call $_ZdlPv
    (get_local $7)
   )
  )
  (call $require_auth
   (get_local $2)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store
   (get_local $8)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 44)
    )
    (get_local $8)
    (i32.const 4)
   )
  )
  (set_local $7
   (i32.load offset=44
    (get_local $8)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $8)
     (i32.const 44)
    )
    (i32.or
     (get_local $8)
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $1
   (i64.extend_u/i32
    (i32.xor
     (i32.shr_u
      (tee_local $7
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $7
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $4
                (i32.mul
                 (i32.load offset=44
                  (get_local $8)
                 )
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $4)
             )
             (i32.const 1540483477)
            )
            (i32.mul
             (i32.xor
              (i32.mul
               (i32.xor
                (i32.shr_u
                 (tee_local $7
                  (i32.mul
                   (get_local $7)
                   (i32.const 1540483477)
                  )
                 )
                 (i32.const 24)
                )
                (get_local $7)
               )
               (i32.const 1540483477)
              )
              (i32.const -561034072)
             )
             (i32.const 1540483477)
            )
           )
          )
          (i32.const 13)
         )
         (get_local $7)
        )
        (i32.const 1540483477)
       )
      )
      (i32.const 15)
     )
     (get_local $7)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eq
     (tee_local $3
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $7
    (i32.add
     (get_local $3)
     (i32.const -24)
    )
   )
   (set_local $6
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$6
    (br_if $label$5
     (i64.eq
      (i64.load
       (i32.load
        (get_local $7)
       )
      )
      (get_local $1)
     )
    )
    (set_local $3
     (get_local $7)
    )
    (set_local $7
     (tee_local $4
      (i32.add
       (get_local $7)
       (i32.const -24)
      )
     )
    )
    (br_if $label$6
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
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$7
   (block $label$8
    (br_if $label$8
     (i32.eq
      (get_local $3)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $7
         (i32.load
          (i32.add
           (get_local $3)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $4)
     )
     (i32.const 128)
    )
    (br $label$7)
   )
   (set_local $7
    (i32.const 0)
   )
   (br_if $label$7
    (i32.lt_s
     (tee_local $3
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i64.const -7880044397109182464)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=36
      (tee_local $7
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $4)
        (get_local $3)
       )
      )
     )
     (get_local $4)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (tee_local $3
    (i32.ne
     (get_local $7)
     (i32.const 0)
    )
   )
   (i32.const 640)
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 688)
  )
  (block $label$9
   (br_if $label$9
    (i32.lt_s
     (tee_local $3
      (call $db_next_i64
       (i32.load offset=40
        (get_local $7)
       )
       (get_local $8)
      )
     )
     (i32.const 0)
    )
   )
   (drop
    (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
     (get_local $4)
     (get_local $3)
    )
   )
  )
  (call $_ZN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE5eraseERKS2_
   (get_local $4)
   (get_local $7)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE5eraseERKS2_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (call $eosio_assert
   (i32.eq
    (i32.load
     (i32.add
      (get_local $1)
      (i32.const 36)
     )
    )
    (get_local $0)
   )
   (i32.const 720)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 768)
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
   (i32.const 832)
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
   (i32.load offset=40
    (get_local $1)
   )
  )
 )
 (func $_ZN6ballot7proposeEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_ (type $FUNCSIG$vijii) (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $13
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 96)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $13)
    (i32.const 48)
   )
   (i32.const 0)
  )
  (i64.store offset=16
   (get_local $13)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=32
   (get_local $13)
   (i64.const -1)
  )
  (i64.store offset=40
   (get_local $13)
   (i64.const 0)
  )
  (i64.store offset=24
   (get_local $13)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $4
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (i32.add
     (get_local $13)
     (i32.const 16)
    )
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $11
      (i32.load offset=40
       (get_local $13)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $10
        (i32.load
         (tee_local $9
          (i32.add
           (get_local $13)
           (i32.const 44)
          )
         )
        )
       )
       (get_local $11)
      )
     )
     (loop $label$3
      (set_local $5
       (i32.load
        (tee_local $10
         (i32.add
          (get_local $10)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $10)
       (i32.const 0)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $5)
        )
       )
       (call $_ZdlPv
        (get_local $5)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $11)
        (get_local $10)
       )
      )
     )
     (set_local $10
      (i32.load
       (i32.add
        (get_local $13)
        (i32.const 40)
       )
      )
     )
     (br $label$1)
    )
    (set_local $10
     (get_local $11)
    )
   )
   (i32.store
    (get_local $9)
    (get_local $11)
   )
   (call $_ZdlPv
    (get_local $10)
   )
  )
  (call $require_auth
   (get_local $4)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store offset=16
   (get_local $13)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $13)
     (i32.const 64)
    )
    (i32.add
     (get_local $13)
     (i32.const 16)
    )
    (i32.const 4)
   )
  )
  (set_local $10
   (i32.load offset=64
    (get_local $13)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $13)
     (i32.const 64)
    )
    (i32.or
     (i32.add
      (get_local $13)
      (i32.const 16)
     )
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $8
   (i32.shr_u
    (tee_local $7
     (i32.mul
      (i32.xor
       (i32.shr_u
        (tee_local $10
         (i32.xor
          (i32.mul
           (i32.xor
            (i32.shr_u
             (tee_local $5
              (i32.mul
               (i32.load offset=64
                (get_local $13)
               )
               (i32.const 1540483477)
              )
             )
             (i32.const 24)
            )
            (get_local $5)
           )
           (i32.const 1540483477)
          )
          (i32.mul
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $10
                (i32.mul
                 (get_local $10)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $10)
             )
             (i32.const 1540483477)
            )
            (i32.const -561034072)
           )
           (i32.const 1540483477)
          )
         )
        )
        (i32.const 13)
       )
       (get_local $10)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (set_local $12
   (select
    (i32.load offset=8
     (get_local $2)
    )
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
    (tee_local $5
     (i32.and
      (tee_local $10
       (i32.load8_u
        (get_local $2)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (tee_local $6
       (select
        (i32.load offset=4
         (get_local $2)
        )
        (i32.shr_u
         (get_local $10)
         (i32.const 1)
        )
        (get_local $5)
       )
      )
      (i32.const 4)
     )
    )
    (set_local $11
     (get_local $6)
    )
    (set_local $10
     (get_local $12)
    )
    (set_local $5
     (get_local $6)
    )
    (loop $label$7
     (drop
      (call $memcpy
       (i32.add
        (get_local $13)
        (i32.const 16)
       )
       (get_local $10)
       (i32.const 4)
      )
     )
     (set_local $5
      (i32.xor
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $9
           (i32.mul
            (i32.load offset=16
             (get_local $13)
            )
            (i32.const 1540483477)
           )
          )
          (i32.const 24)
         )
         (get_local $9)
        )
        (i32.const 1540483477)
       )
       (i32.mul
        (get_local $5)
        (i32.const 1540483477)
       )
      )
     )
     (set_local $10
      (i32.add
       (get_local $10)
       (i32.const 4)
      )
     )
     (br_if $label$7
      (i32.gt_u
       (tee_local $11
        (i32.add
         (get_local $11)
         (i32.const -4)
        )
       )
       (i32.const 3)
      )
     )
    )
    (set_local $6
     (i32.sub
      (tee_local $10
       (i32.add
        (get_local $6)
        (i32.const -4)
       )
      )
      (tee_local $10
       (i32.and
        (get_local $10)
        (i32.const -4)
       )
      )
     )
    )
    (set_local $12
     (i32.add
      (i32.add
       (get_local $12)
       (get_local $10)
      )
      (i32.const 4)
     )
    )
    (br $label$5)
   )
   (set_local $5
    (get_local $6)
   )
  )
  (set_local $10
   (i32.xor
    (get_local $8)
    (get_local $7)
   )
  )
  (block $label$8
   (block $label$9
    (br_if $label$9
     (i32.eq
      (get_local $6)
      (i32.const 1)
     )
    )
    (block $label$10
     (br_if $label$10
      (i32.eq
       (get_local $6)
       (i32.const 2)
      )
     )
     (br_if $label$8
      (i32.ne
       (get_local $6)
       (i32.const 3)
      )
     )
     (set_local $5
      (i32.xor
       (i32.shl
        (i32.load8_u offset=2
         (get_local $12)
        )
        (i32.const 16)
       )
       (get_local $5)
      )
     )
    )
    (set_local $5
     (i32.xor
      (i32.shl
       (i32.load8_u offset=1
        (get_local $12)
       )
       (i32.const 8)
      )
      (get_local $5)
     )
    )
   )
   (set_local $5
    (i32.mul
     (i32.xor
      (i32.load8_u
       (get_local $12)
      )
      (get_local $5)
     )
     (i32.const 1540483477)
    )
   )
  )
  (set_local $1
   (i64.extend_u/i32
    (get_local $10)
   )
  )
  (i64.store offset=8
   (get_local $13)
   (i64.extend_u/i32
    (i32.xor
     (i32.shr_u
      (tee_local $10
       (i32.mul
        (i32.xor
         (i32.shr_u
          (get_local $5)
          (i32.const 13)
         )
         (get_local $5)
        )
        (i32.const 1540483477)
       )
      )
      (i32.const 15)
     )
     (get_local $10)
    )
   )
  )
  (block $label$11
   (br_if $label$11
    (i32.eq
     (tee_local $11
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $6
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $11)
     (i32.const -24)
    )
   )
   (set_local $9
    (i32.sub
     (i32.const 0)
     (get_local $6)
    )
   )
   (loop $label$12
    (br_if $label$11
     (i64.eq
      (i64.load
       (i32.load
        (get_local $10)
       )
      )
      (get_local $1)
     )
    )
    (set_local $11
     (get_local $10)
    )
    (set_local $10
     (tee_local $5
      (i32.add
       (get_local $10)
       (i32.const -24)
      )
     )
    )
    (br_if $label$12
     (i32.ne
      (i32.add
       (get_local $5)
       (get_local $9)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $10
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i32.eq
      (get_local $11)
      (get_local $6)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $5
         (i32.load
          (i32.add
           (get_local $11)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $10)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (block $label$15
    (br_if $label$15
     (i32.le_s
      (tee_local $5
       (call $db_find_i64
        (i64.load
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
        (i64.load
         (i32.add
          (get_local $0)
          (i32.const 16)
         )
        )
        (i64.const -7880044397109182464)
        (get_local $1)
       )
      )
      (i32.const -1)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=36
       (tee_local $5
        (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
         (get_local $10)
         (get_local $5)
        )
       )
      )
      (get_local $10)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (get_local $13)
   (get_local $5)
  )
  (i32.store
   (get_local $13)
   (get_local $10)
  )
  (call $eosio_assert
   (i32.ne
    (get_local $5)
    (i32.const 0)
   )
   (i32.const 896)
  )
  (set_local $1
   (i64.load offset=8
    (get_local $13)
   )
  )
  (block $label$16
   (br_if $label$16
    (i32.eq
     (tee_local $11
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 76)
       )
      )
     )
     (tee_local $6
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 72)
       )
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $11)
     (i32.const -24)
    )
   )
   (set_local $9
    (i32.sub
     (i32.const 0)
     (get_local $6)
    )
   )
   (loop $label$17
    (br_if $label$16
     (i64.eq
      (i64.load
       (i32.load
        (get_local $10)
       )
      )
      (get_local $1)
     )
    )
    (set_local $11
     (get_local $10)
    )
    (set_local $10
     (tee_local $5
      (i32.add
       (get_local $10)
       (i32.const -24)
      )
     )
    )
    (br_if $label$17
     (i32.ne
      (i32.add
       (get_local $5)
       (get_local $9)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
  (block $label$18
   (block $label$19
    (block $label$20
     (block $label$21
      (br_if $label$21
       (i32.eq
        (get_local $11)
        (get_local $6)
       )
      )
      (call $eosio_assert
       (i32.eq
        (i32.load offset=56
         (tee_local $10
          (i32.load
           (i32.add
            (get_local $11)
            (i32.const -24)
           )
          )
         )
        )
        (get_local $5)
       )
       (i32.const 128)
      )
      (br_if $label$20
       (get_local $10)
      )
      (br $label$19)
     )
     (br_if $label$19
      (i32.lt_s
       (tee_local $10
        (call $db_find_i64
         (i64.load
          (i32.add
           (get_local $0)
           (i32.const 48)
          )
         )
         (i64.load
          (i32.add
           (get_local $0)
           (i32.const 56)
          )
         )
         (i64.const -5915097263692054528)
         (get_local $1)
        )
       )
       (i32.const 0)
      )
     )
     (call $eosio_assert
      (i32.eq
       (i32.load offset=56
        (tee_local $10
         (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
          (get_local $5)
          (get_local $10)
         )
        )
       )
       (get_local $5)
      )
      (i32.const 128)
     )
    )
    (call $prints
     (i32.const 960)
    )
    (call $eosio_assert
     (i64.eq
      (i64.load
       (get_local $10)
      )
      (i64.load offset=8
       (get_local $13)
      )
     )
     (i32.const 992)
    )
    (i32.store offset=16
     (get_local $13)
     (get_local $3)
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 192)
    )
    (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_7proposeEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEESD_E3$_3EEvRKS2_yOT_
     (get_local $5)
     (get_local $10)
     (i32.add
      (get_local $13)
      (i32.const 16)
     )
    )
    (br $label$18)
   )
   (call $prints
    (i32.const 928)
   )
   (set_local $1
    (i64.load
     (get_local $0)
    )
   )
   (i32.store offset=24
    (get_local $13)
    (get_local $2)
   )
   (i32.store offset=28
    (get_local $13)
    (get_local $3)
   )
   (i32.store offset=20
    (get_local $13)
    (get_local $13)
   )
   (i32.store offset=16
    (get_local $13)
    (i32.add
     (get_local $13)
     (i32.const 8)
    )
   )
   (i64.store offset=88
    (get_local $13)
    (get_local $1)
   )
   (call $eosio_assert
    (i64.eq
     (i64.load
      (i32.add
       (get_local $0)
       (i32.const 48)
      )
     )
     (call $current_receiver)
    )
    (i32.const 16)
   )
   (i32.store offset=64
    (get_local $13)
    (get_local $5)
   )
   (i32.store offset=68
    (get_local $13)
    (i32.add
     (get_local $13)
     (i32.const 16)
    )
   )
   (i32.store offset=72
    (get_local $13)
    (i32.add
     (get_local $13)
     (i32.const 88)
    )
   )
   (i64.store offset=16 align=4
    (tee_local $10
     (call $_Znwj
      (i32.const 72)
     )
    )
    (i64.const 0)
   )
   (i64.store offset=24 align=4
    (get_local $10)
    (i64.const 0)
   )
   (i64.store offset=32 align=4
    (get_local $10)
    (i64.const 0)
   )
   (i64.store offset=40 align=4
    (get_local $10)
    (i64.const 0)
   )
   (i32.store offset=48
    (get_local $10)
    (i32.const 0)
   )
   (i32.store8 offset=52
    (get_local $10)
    (i32.const 0)
   )
   (i32.store offset=56
    (get_local $10)
    (get_local $5)
   )
   (call $_ZZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE7emplaceIZNS1_7proposeEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEESD_E3$_2EENS3_14const_iteratorEyOT_ENKUlRSG_E_clINS3_4itemEEEDaSI_
    (i32.add
     (get_local $13)
     (i32.const 64)
    )
    (get_local $10)
   )
   (i32.store offset=80
    (get_local $13)
    (get_local $10)
   )
   (i64.store offset=64
    (get_local $13)
    (tee_local $1
     (i64.load
      (get_local $10)
     )
    )
   )
   (i32.store offset=60
    (get_local $13)
    (tee_local $11
     (i32.load offset=60
      (get_local $10)
     )
    )
   )
   (block $label$22
    (block $label$23
     (br_if $label$23
      (i32.ge_u
       (tee_local $5
        (i32.load
         (tee_local $9
          (i32.add
           (get_local $0)
           (i32.const 76)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 80)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $5)
      (get_local $1)
     )
     (i32.store offset=16
      (get_local $5)
      (get_local $11)
     )
     (i32.store offset=80
      (get_local $13)
      (i32.const 0)
     )
     (i32.store
      (get_local $5)
      (get_local $10)
     )
     (i32.store
      (get_local $9)
      (i32.add
       (get_local $5)
       (i32.const 24)
      )
     )
     (br $label$22)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 72)
     )
     (i32.add
      (get_local $13)
      (i32.const 80)
     )
     (i32.add
      (get_local $13)
      (i32.const 64)
     )
     (i32.add
      (get_local $13)
      (i32.const 60)
     )
    )
   )
   (set_local $10
    (i32.load offset=80
     (get_local $13)
    )
   )
   (i32.store offset=80
    (get_local $13)
    (i32.const 0)
   )
   (br_if $label$18
    (i32.eqz
     (get_local $10)
    )
   )
   (block $label$24
    (br_if $label$24
     (i32.eqz
      (tee_local $5
       (i32.load offset=40
        (get_local $10)
       )
      )
     )
    )
    (i32.store
     (i32.add
      (get_local $10)
      (i32.const 44)
     )
     (get_local $5)
    )
    (call $_ZdlPv
     (get_local $5)
    )
   )
   (block $label$25
    (br_if $label$25
     (i32.eqz
      (i32.and
       (i32.load8_u offset=28
        (get_local $10)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load
      (i32.add
       (get_local $10)
       (i32.const 36)
      )
     )
    )
   )
   (block $label$26
    (br_if $label$26
     (i32.eqz
      (i32.and
       (i32.load8_u offset=16
        (get_local $10)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load
      (i32.add
       (get_local $10)
       (i32.const 24)
      )
     )
    )
   )
   (call $_ZdlPv
    (get_local $10)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $13)
    (i32.const 96)
   )
  )
 )
 (func $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
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
    (i32.const 416)
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
   (i64.store offset=16 align=4
    (tee_local $6
     (call $_Znwj
      (i32.const 72)
     )
    )
    (i64.const 0)
   )
   (i64.store offset=24 align=4
    (get_local $6)
    (i64.const 0)
   )
   (i64.store offset=32 align=4
    (get_local $6)
    (i64.const 0)
   )
   (i64.store offset=40 align=4
    (get_local $6)
    (i64.const 0)
   )
   (i32.store offset=48
    (get_local $6)
    (i32.const 0)
   )
   (i32.store8 offset=52
    (get_local $6)
    (i32.const 0)
   )
   (i32.store offset=56
    (get_local $6)
    (get_local $0)
   )
   (drop
    (call $_ZrsIN5eosio10datastreamIPKcEEERT_S6_RN6ballot8ProposalE
     (i32.add
      (get_local $8)
      (i32.const 32)
     )
     (get_local $6)
    )
   )
   (i32.store offset=60
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
     (i32.load offset=60
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
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
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
   (block $label$9
    (br_if $label$9
     (i32.eqz
      (tee_local $7
       (i32.load offset=40
        (get_local $4)
       )
      )
     )
    )
    (i32.store
     (i32.add
      (get_local $4)
      (i32.const 44)
     )
     (get_local $7)
    )
    (call $_ZdlPv
     (get_local $7)
    )
   )
   (block $label$10
    (br_if $label$10
     (i32.eqz
      (i32.and
       (i32.load8_u offset=28
        (get_local $4)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load
      (i32.add
       (get_local $4)
       (i32.const 36)
      )
     )
    )
   )
   (block $label$11
    (br_if $label$11
     (i32.eqz
      (i32.and
       (i32.load8_u offset=16
        (get_local $4)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load
      (i32.add
       (get_local $4)
       (i32.const 24)
      )
     )
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
 (func $_ZZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE7emplaceIZNS1_7proposeEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEESD_E3$_2EENS3_14const_iteratorEyOT_ENKUlRSG_E_clINS3_4itemEEEDaSI_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i64.store
   (get_local $1)
   (i64.load
    (i32.load
     (tee_local $6
      (i32.load offset=4
       (get_local $0)
      )
     )
    )
   )
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load offset=8
    (i32.load offset=4
     (i32.load offset=4
      (get_local $6)
     )
    )
   )
  )
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.load offset=8
     (get_local $6)
    )
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_
    (i32.add
     (get_local $1)
     (i32.const 28)
    )
    (i32.load offset=12
     (get_local $6)
    )
   )
  )
  (i32.store8 offset=52
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $6
    (get_local $5)
   )
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $6)
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.lt_u
      (tee_local $3
       (i32.load
        (get_local $6)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $5
     (call $malloc
      (get_local $3)
     )
    )
    (br $label$0)
   )
   (i32.store offset=4
    (i32.const 0)
    (tee_local $5
     (i32.sub
      (get_local $5)
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
  (i32.store offset=4
   (get_local $6)
   (get_local $5)
  )
  (i32.store
   (get_local $6)
   (get_local $5)
  )
  (i32.store offset=8
   (get_local $6)
   (i32.add
    (get_local $5)
    (get_local $3)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $6)
    (get_local $1)
   )
  )
  (i32.store offset=60
   (get_local $1)
   (call $db_store_i64
    (i64.load offset=8
     (get_local $2)
    )
    (i64.const -5915097263692054528)
    (i64.load
     (i32.load offset=8
      (get_local $0)
     )
    )
    (tee_local $4
     (i64.load
      (get_local $1)
     )
    )
    (get_local $5)
    (get_local $3)
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $5)
   )
  )
  (block $label$3
   (br_if $label$3
    (i64.lt_u
     (get_local $4)
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
    (i32.const 16)
   )
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $10
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $8
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $9
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
    (set_local $5
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (block $label$2
     (block $label$3
      (block $label$4
       (br_if $label$4
        (i32.ge_u
         (tee_local $9
          (i32.div_s
           (i32.sub
            (i32.load offset=8
             (get_local $0)
            )
            (get_local $9)
           )
           (i32.const 24)
          )
         )
         (i32.const 89478485)
        )
       )
       (i32.store
        (i32.add
         (get_local $10)
         (i32.const 24)
        )
        (get_local $5)
       )
       (set_local $5
        (i32.const 0)
       )
       (i32.store offset=20
        (get_local $10)
        (i32.const 0)
       )
       (set_local $7
        (i32.add
         (get_local $10)
         (i32.const 20)
        )
       )
       (br_if $label$2
        (i32.eqz
         (tee_local $9
          (select
           (get_local $8)
           (tee_local $9
            (i32.shl
             (get_local $9)
             (i32.const 1)
            )
           )
           (i32.lt_u
            (get_local $9)
            (get_local $8)
           )
          )
         )
        )
       )
       (set_local $5
        (get_local $9)
       )
       (br $label$3)
      )
      (i32.store
       (i32.add
        (get_local $10)
        (i32.const 24)
       )
       (get_local $5)
      )
      (i32.store offset=20
       (get_local $10)
       (i32.const 0)
      )
      (set_local $7
       (i32.add
        (get_local $10)
        (i32.const 20)
       )
      )
      (set_local $5
       (i32.const 178956970)
      )
     )
     (set_local $8
      (call $_Znwj
       (i32.mul
        (get_local $5)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $8
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (i32.store offset=8
   (get_local $10)
   (get_local $8)
  )
  (i32.store offset=12
   (get_local $10)
   (tee_local $9
    (i32.add
     (get_local $8)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
  )
  (i32.store
   (get_local $7)
   (tee_local $5
    (i32.add
     (get_local $8)
     (i32.mul
      (get_local $5)
      (i32.const 24)
     )
    )
   )
  )
  (set_local $8
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (set_local $1
   (i32.load
    (get_local $3)
   )
  )
  (set_local $6
   (i64.load
    (get_local $2)
   )
  )
  (i32.store
   (get_local $9)
   (get_local $8)
  )
  (i64.store offset=8
   (get_local $9)
   (get_local $6)
  )
  (i32.store offset=16
   (get_local $9)
   (get_local $1)
  )
  (i32.store offset=16
   (get_local $10)
   (tee_local $1
    (i32.add
     (get_local $9)
     (i32.const 24)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eq
     (tee_local $8
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
     )
     (tee_local $2
      (i32.load
       (get_local $0)
      )
     )
    )
   )
   (loop $label$6
    (set_local $1
     (i32.load
      (tee_local $5
       (i32.add
        (get_local $8)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $5)
     (i32.const 0)
    )
    (i32.store
     (i32.add
      (get_local $9)
      (i32.const -24)
     )
     (get_local $1)
    )
    (i32.store
     (i32.add
      (get_local $9)
      (i32.const -8)
     )
     (i32.load
      (i32.add
       (get_local $8)
       (i32.const -8)
      )
     )
    )
    (i32.store
     (i32.add
      (get_local $9)
      (i32.const -12)
     )
     (i32.load
      (i32.add
       (get_local $8)
       (i32.const -12)
      )
     )
    )
    (i32.store
     (i32.add
      (get_local $9)
      (i32.const -16)
     )
     (i32.load
      (i32.add
       (get_local $8)
       (i32.const -16)
      )
     )
    )
    (i32.store offset=12
     (get_local $10)
     (tee_local $9
      (i32.add
       (i32.load offset=12
        (get_local $10)
       )
       (i32.const -24)
      )
     )
    )
    (set_local $8
     (get_local $5)
    )
    (br_if $label$6
     (i32.ne
      (get_local $2)
      (get_local $5)
     )
    )
   )
   (set_local $8
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
   )
   (set_local $5
    (i32.load
     (get_local $7)
    )
   )
   (set_local $2
    (i32.load
     (get_local $0)
    )
   )
   (set_local $1
    (i32.load
     (i32.add
      (get_local $10)
      (i32.const 16)
     )
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $9)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $1)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $10)
     (i32.const 8)
    )
    (i32.const 8)
   )
   (get_local $8)
  )
  (set_local $8
   (i32.load
    (tee_local $9
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store
   (get_local $9)
   (get_local $5)
  )
  (i32.store offset=12
   (get_local $10)
   (get_local $2)
  )
  (i32.store
   (get_local $7)
   (get_local $8)
  )
  (i32.store offset=8
   (get_local $10)
   (get_local $2)
  )
  (drop
   (call $_ZNSt3__114__split_bufferIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrERNS_9allocatorIS6_EEED2Ev
    (i32.add
     (get_local $10)
     (i32.const 8)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $10)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_7proposeEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEESD_E3$_3EEvRKS2_yOT_ (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (set_local $3
   (i64.load
    (get_local $1)
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_
    (i32.add
     (get_local $1)
     (i32.const 28)
    )
    (i32.load
     (get_local $2)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (get_local $3)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 352)
  )
  (i32.store
   (tee_local $2
    (get_local $5)
   )
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $2)
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.lt_u
      (tee_local $4
       (i32.load
        (get_local $2)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $5
     (call $malloc
      (get_local $4)
     )
    )
    (br $label$0)
   )
   (i32.store offset=4
    (i32.const 0)
    (tee_local $5
     (i32.sub
      (get_local $5)
      (i32.and
       (i32.add
        (get_local $4)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (get_local $2)
   (get_local $5)
  )
  (i32.store
   (get_local $2)
   (get_local $5)
  )
  (i32.store offset=8
   (get_local $2)
   (i32.add
    (get_local $5)
    (get_local $4)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $2)
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=60
    (get_local $1)
   )
   (i64.const 0)
   (get_local $5)
   (get_local $4)
  )
  (block $label$2
   (br_if $label$2
    (i32.lt_u
     (get_local $4)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $5)
   )
  )
  (block $label$3
   (br_if $label$3
    (i64.lt_u
     (get_local $3)
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
    (get_local $2)
    (i32.const 16)
   )
  )
 )
 (func $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (i32.store
   (get_local $0)
   (tee_local $5
    (i32.add
     (i32.load
      (get_local $0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $4
   (i64.extend_u/i32
    (select
     (i32.load
      (i32.add
       (get_local $1)
       (i32.const 20)
      )
     )
     (i32.shr_u
      (tee_local $2
       (i32.load8_u offset=16
        (get_local $1)
       )
      )
      (i32.const 1)
     )
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
  )
  (loop $label$0
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.shr_u
       (get_local $4)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $5)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (tee_local $2
      (select
       (i32.load
        (i32.add
         (get_local $1)
         (i32.const 20)
        )
       )
       (i32.shr_u
        (tee_local $2
         (i32.load8_u
          (i32.add
           (get_local $1)
           (i32.const 16)
          )
         )
        )
        (i32.const 1)
       )
       (i32.and
        (get_local $2)
        (i32.const 1)
       )
      )
     )
    )
   )
   (i32.store
    (get_local $0)
    (tee_local $5
     (i32.add
      (get_local $2)
      (get_local $5)
     )
    )
   )
  )
  (set_local $4
   (i64.extend_u/i32
    (select
     (i32.load
      (i32.add
       (get_local $1)
       (i32.const 32)
      )
     )
     (i32.shr_u
      (tee_local $2
       (i32.load8_u offset=28
        (get_local $1)
       )
      )
      (i32.const 1)
     )
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
  )
  (loop $label$2
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (br_if $label$2
    (i64.ne
     (tee_local $4
      (i64.shr_u
       (get_local $4)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $5)
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (tee_local $2
      (select
       (i32.load
        (i32.add
         (get_local $1)
         (i32.const 32)
        )
       )
       (i32.shr_u
        (tee_local $2
         (i32.load8_u
          (i32.add
           (get_local $1)
           (i32.const 28)
          )
         )
        )
        (i32.const 1)
       )
       (i32.and
        (get_local $2)
        (i32.const 1)
       )
      )
     )
    )
   )
   (i32.store
    (get_local $0)
    (tee_local $5
     (i32.add
      (get_local $2)
      (get_local $5)
     )
    )
   )
  )
  (set_local $4
   (i64.extend_u/i32
    (i32.shr_s
     (tee_local $3
      (i32.sub
       (tee_local $2
        (i32.load
         (i32.add
          (get_local $1)
          (i32.const 44)
         )
        )
       )
       (tee_local $1
        (i32.load offset=40
         (get_local $1)
        )
       )
      )
     )
     (i32.const 4)
    )
   )
  )
  (loop $label$4
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (br_if $label$4
    (i64.ne
     (tee_local $4
      (i64.shr_u
       (get_local $4)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eq
     (get_local $1)
     (get_local $2)
    )
   )
   (set_local $5
    (i32.add
     (i32.and
      (get_local $3)
      (i32.const -16)
     )
     (get_local $5)
    )
   )
  )
  (i32.store
   (get_local $0)
   (i32.add
    (get_local $5)
    (i32.const 1)
   )
  )
  (get_local $0)
 )
 (func $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
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
   (i32.const 112)
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
   (i32.const 112)
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
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (set_local $0
   (call $_ZN5eosiolsINS_10datastreamIPcEEN6ballot4VoteEEERT_S7_RKNSt3__16vectorIT0_NS8_9allocatorISA_EEEE
    (call $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE
     (call $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE
      (get_local $0)
      (i32.add
       (get_local $1)
       (i32.const 16)
      )
     )
     (i32.add
      (get_local $1)
      (i32.const 28)
     )
    )
    (i32.add
     (get_local $1)
     (i32.const 40)
    )
   )
  )
  (i32.store8 offset=15
   (get_local $3)
   (i32.load8_u offset=52
    (get_local $1)
   )
  )
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
    (i32.const 0)
   )
   (i32.const 112)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $0)
    )
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
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
     (i32.const 16)
    )
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (select
     (i32.load offset=4
      (get_local $1)
     )
     (i32.shr_u
      (tee_local $5
       (i32.load8_u
        (get_local $1)
       )
      )
      (i32.const 1)
     )
     (i32.and
      (get_local $5)
      (i32.const 1)
     )
    )
   )
  )
  (set_local $6
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (set_local $5
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
  )
  (loop $label$0
   (set_local $2
    (i32.wrap/i64
     (get_local $7)
    )
   )
   (i32.store8 offset=15
    (get_local $8)
    (i32.or
     (i32.shl
      (tee_local $3
       (i64.ne
        (tee_local $7
         (i64.shr_u
          (get_local $7)
          (i64.const 7)
         )
        )
        (i64.const 0)
       )
      )
      (i32.const 7)
     )
     (i32.and
      (get_local $2)
      (i32.const 127)
     )
    )
   )
   (call $eosio_assert
    (i32.gt_s
     (i32.sub
      (i32.load
       (get_local $4)
      )
      (get_local $6)
     )
     (i32.const 0)
    )
    (i32.const 112)
   )
   (drop
    (call $memcpy
     (i32.load
      (get_local $5)
     )
     (i32.add
      (get_local $8)
      (i32.const 15)
     )
     (i32.const 1)
    )
   )
   (i32.store
    (get_local $5)
    (tee_local $6
     (i32.add
      (i32.load
       (get_local $5)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$0
    (get_local $3)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (tee_local $5
      (select
       (i32.load
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
       )
       (i32.shr_u
        (tee_local $5
         (i32.load8_u
          (get_local $1)
         )
        )
        (i32.const 1)
       )
       (tee_local $2
        (i32.and
         (get_local $5)
         (i32.const 1)
        )
       )
      )
     )
    )
   )
   (set_local $3
    (i32.load offset=8
     (get_local $1)
    )
   )
   (call $eosio_assert
    (i32.ge_s
     (i32.sub
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
      (get_local $6)
     )
     (get_local $5)
    )
    (i32.const 112)
   )
   (drop
    (call $memcpy
     (i32.load
      (tee_local $6
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
     )
     (select
      (get_local $3)
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
      (get_local $2)
     )
     (get_local $5)
    )
   )
   (i32.store
    (get_local $6)
    (i32.add
     (i32.load
      (get_local $6)
     )
     (get_local $5)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosiolsINS_10datastreamIPcEEN6ballot4VoteEEERT_S7_RKNSt3__16vectorIT0_NS8_9allocatorISA_EEEE (param $0 i32) (param $1 i32) (result i32)
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
     (i32.const 16)
    )
   )
  )
  (set_local $4
   (i64.extend_u/i32
    (i32.shr_s
     (i32.sub
      (i32.load offset=4
       (get_local $1)
      )
      (i32.load
       (get_local $1)
      )
     )
     (i32.const 4)
    )
   )
  )
  (set_local $5
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (loop $label$0
   (set_local $3
    (i32.wrap/i64
     (get_local $4)
    )
   )
   (i32.store8 offset=15
    (get_local $7)
    (i32.or
     (i32.shl
      (tee_local $6
       (i64.ne
        (tee_local $4
         (i64.shr_u
          (get_local $4)
          (i64.const 7)
         )
        )
        (i64.const 0)
       )
      )
      (i32.const 7)
     )
     (i32.and
      (get_local $3)
      (i32.const 127)
     )
    )
   )
   (call $eosio_assert
    (i32.gt_s
     (i32.sub
      (i32.load
       (get_local $2)
      )
      (get_local $5)
     )
     (i32.const 0)
    )
    (i32.const 112)
   )
   (drop
    (call $memcpy
     (i32.load
      (tee_local $3
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
     )
     (i32.add
      (get_local $7)
      (i32.const 15)
     )
     (i32.const 1)
    )
   )
   (i32.store
    (get_local $3)
    (tee_local $5
     (i32.add
      (i32.load
       (get_local $3)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$0
    (get_local $6)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eq
     (tee_local $6
      (i32.load
       (get_local $1)
      )
     )
     (tee_local $1
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 4)
       )
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $0)
     (i32.const 4)
    )
   )
   (loop $label$2
    (call $eosio_assert
     (i32.gt_s
      (i32.sub
       (i32.load
        (tee_local $2
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
       )
       (get_local $5)
      )
      (i32.const 7)
     )
     (i32.const 112)
    )
    (drop
     (call $memcpy
      (i32.load
       (get_local $3)
      )
      (get_local $6)
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $3)
     (tee_local $5
      (i32.add
       (i32.load
        (get_local $3)
       )
       (i32.const 8)
      )
     )
    )
    (call $eosio_assert
     (i32.gt_s
      (i32.sub
       (i32.load
        (get_local $2)
       )
       (get_local $5)
      )
      (i32.const 7)
     )
     (i32.const 112)
    )
    (drop
     (call $memcpy
      (i32.load
       (get_local $3)
      )
      (i32.add
       (get_local $6)
       (i32.const 8)
      )
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $3)
     (tee_local $5
      (i32.add
       (i32.load
        (get_local $3)
       )
       (i32.const 8)
      )
     )
    )
    (br_if $label$2
     (i32.ne
      (tee_local $6
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZNSt3__114__split_bufferIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrERNS_9allocatorIS6_EEED2Ev (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $2
      (i32.load offset=8
       (get_local $0)
      )
     )
     (tee_local $1
      (i32.load offset=4
       (get_local $0)
      )
     )
    )
   )
   (set_local $4
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
   (loop $label$1
    (i32.store
     (get_local $4)
     (tee_local $3
      (i32.add
       (get_local $2)
       (i32.const -24)
      )
     )
    )
    (set_local $2
     (i32.load
      (get_local $3)
     )
    )
    (i32.store
     (get_local $3)
     (i32.const 0)
    )
    (block $label$2
     (br_if $label$2
      (i32.eqz
       (get_local $2)
      )
     )
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $3
         (i32.load offset=40
          (get_local $2)
         )
        )
       )
      )
      (i32.store
       (i32.add
        (get_local $2)
        (i32.const 44)
       )
       (get_local $3)
      )
      (call $_ZdlPv
       (get_local $3)
      )
     )
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (i32.and
         (i32.load8_u offset=28
          (get_local $2)
         )
         (i32.const 1)
        )
       )
      )
      (call $_ZdlPv
       (i32.load
        (i32.add
         (get_local $2)
         (i32.const 36)
        )
       )
      )
     )
     (block $label$5
      (br_if $label$5
       (i32.eqz
        (i32.and
         (i32.load8_u offset=16
          (get_local $2)
         )
         (i32.const 1)
        )
       )
      )
      (call $_ZdlPv
       (i32.load
        (i32.add
         (get_local $2)
         (i32.const 24)
        )
       )
      )
     )
     (call $_ZdlPv
      (get_local $2)
     )
    )
    (br_if $label$1
     (i32.ne
      (tee_local $2
       (i32.load
        (get_local $4)
       )
      )
      (get_local $1)
     )
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i32.eqz
     (tee_local $2
      (i32.load
       (get_local $0)
      )
     )
    )
   )
   (call $_ZdlPv
    (get_local $2)
   )
  )
  (get_local $0)
 )
 (func $_ZrsIN5eosio10datastreamIPKcEEERT_S6_RN6ballot8ProposalE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
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
   (i32.const 448)
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
   (i32.const 448)
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
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.ne
    (i32.load offset=8
     (tee_local $0
      (call $_ZN5eosiorsINS_10datastreamIPKcEEN6ballot4VoteEEERT_S8_RNSt3__16vectorIT0_NS9_9allocatorISB_EEEE
       (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
        (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
         (get_local $0)
         (i32.add
          (get_local $1)
          (i32.const 16)
         )
        )
        (i32.add
         (get_local $1)
         (i32.const 28)
        )
       )
       (i32.add
        (get_local $1)
        (i32.const 40)
       )
      )
     )
    )
    (i32.load offset=4
     (get_local $0)
    )
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.add
    (i32.load offset=4
     (get_local $0)
    )
    (i32.const 1)
   )
  )
  (i32.store8 offset=52
   (get_local $1)
   (i32.ne
    (i32.load8_u offset=15
     (get_local $3)
    )
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (get_local $7)
   (i32.const 0)
  )
  (i64.store offset=16
   (get_local $7)
   (i64.const 0)
  )
  (drop
   (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__16vectorIcNS7_9allocatorIcEEEE
    (get_local $0)
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (block $label$6
         (block $label$7
          (block $label$8
           (br_if $label$8
            (i32.ne
             (tee_local $5
              (i32.load offset=20
               (get_local $7)
              )
             )
             (tee_local $4
              (i32.load offset=16
               (get_local $7)
              )
             )
            )
           )
           (br_if $label$7
            (i32.and
             (i32.load8_u
              (get_local $1)
             )
             (i32.const 1)
            )
           )
           (i32.store16
            (get_local $1)
            (i32.const 0)
           )
           (set_local $4
            (i32.add
             (get_local $1)
             (i32.const 8)
            )
           )
           (br $label$6)
          )
          (i32.store
           (i32.add
            (get_local $7)
            (i32.const 8)
           )
           (i32.const 0)
          )
          (i64.store
           (get_local $7)
           (i64.const 0)
          )
          (br_if $label$0
           (i32.ge_u
            (tee_local $2
             (i32.sub
              (get_local $5)
              (get_local $4)
             )
            )
            (i32.const -16)
           )
          )
          (br_if $label$5
           (i32.ge_u
            (get_local $2)
            (i32.const 11)
           )
          )
          (i32.store8
           (get_local $7)
           (i32.shl
            (get_local $2)
            (i32.const 1)
           )
          )
          (set_local $6
           (i32.or
            (get_local $7)
            (i32.const 1)
           )
          )
          (br_if $label$4
           (get_local $2)
          )
          (br $label$3)
         )
         (i32.store8
          (i32.load offset=8
           (get_local $1)
          )
          (i32.const 0)
         )
         (i32.store offset=4
          (get_local $1)
          (i32.const 0)
         )
         (set_local $4
          (i32.add
           (get_local $1)
           (i32.const 8)
          )
         )
        )
        (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEj
         (get_local $1)
         (i32.const 0)
        )
        (i32.store
         (get_local $4)
         (i32.const 0)
        )
        (i64.store align=4
         (get_local $1)
         (i64.const 0)
        )
        (br_if $label$2
         (tee_local $4
          (i32.load offset=16
           (get_local $7)
          )
         )
        )
        (br $label$1)
       )
       (set_local $6
        (call $_Znwj
         (tee_local $5
          (i32.and
           (i32.add
            (get_local $2)
            (i32.const 16)
           )
           (i32.const -16)
          )
         )
        )
       )
       (i32.store
        (get_local $7)
        (i32.or
         (get_local $5)
         (i32.const 1)
        )
       )
       (i32.store offset=8
        (get_local $7)
        (get_local $6)
       )
       (i32.store offset=4
        (get_local $7)
        (get_local $2)
       )
      )
      (set_local $3
       (get_local $2)
      )
      (set_local $5
       (get_local $6)
      )
      (loop $label$9
       (i32.store8
        (get_local $5)
        (i32.load8_u
         (get_local $4)
        )
       )
       (set_local $5
        (i32.add
         (get_local $5)
         (i32.const 1)
        )
       )
       (set_local $4
        (i32.add
         (get_local $4)
         (i32.const 1)
        )
       )
       (br_if $label$9
        (tee_local $3
         (i32.add
          (get_local $3)
          (i32.const -1)
         )
        )
       )
      )
      (set_local $6
       (i32.add
        (get_local $6)
        (get_local $2)
       )
      )
     )
     (i32.store8
      (get_local $6)
      (i32.const 0)
     )
     (block $label$10
      (block $label$11
       (br_if $label$11
        (i32.and
         (i32.load8_u
          (get_local $1)
         )
         (i32.const 1)
        )
       )
       (i32.store16
        (get_local $1)
        (i32.const 0)
       )
       (br $label$10)
      )
      (i32.store8
       (i32.load offset=8
        (get_local $1)
       )
       (i32.const 0)
      )
      (i32.store offset=4
       (get_local $1)
       (i32.const 0)
      )
     )
     (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEj
      (get_local $1)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const 8)
      )
      (i32.load
       (i32.add
        (get_local $7)
        (i32.const 8)
       )
      )
     )
     (i64.store align=4
      (get_local $1)
      (i64.load
       (get_local $7)
      )
     )
     (br_if $label$1
      (i32.eqz
       (tee_local $4
        (i32.load offset=16
         (get_local $7)
        )
       )
      )
     )
    )
    (i32.store offset=20
     (get_local $7)
     (get_local $4)
    )
    (call $_ZdlPv
     (get_local $4)
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $7)
     (i32.const 32)
    )
   )
   (return
    (get_local $0)
   )
  )
  (call $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
   (get_local $7)
  )
  (unreachable)
 )
 (func $_ZN5eosiorsINS_10datastreamIPKcEEN6ballot4VoteEEERT_S8_RNSt3__16vectorIT0_NS9_9allocatorISB_EEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (set_local $7
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $6
   (i32.const 0)
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (set_local $3
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
  )
  (loop $label$0
   (call $eosio_assert
    (i32.lt_u
     (get_local $7)
     (i32.load
      (get_local $2)
     )
    )
    (i32.const 1024)
   )
   (set_local $4
    (i32.load8_u
     (tee_local $7
      (i32.load
       (get_local $3)
      )
     )
    )
   )
   (i32.store
    (get_local $3)
    (tee_local $7
     (i32.add
      (get_local $7)
      (i32.const 1)
     )
    )
   )
   (set_local $5
    (i64.or
     (i64.extend_u/i32
      (i32.shl
       (i32.and
        (get_local $4)
        (i32.const 127)
       )
       (tee_local $6
        (i32.and
         (get_local $6)
         (i32.const 255)
        )
       )
      )
     )
     (get_local $5)
    )
   )
   (set_local $6
    (i32.add
     (get_local $6)
     (i32.const 7)
    )
   )
   (br_if $label$0
    (i32.shr_u
     (get_local $4)
     (i32.const 7)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.le_u
       (tee_local $4
        (i32.wrap/i64
         (get_local $5)
        )
       )
       (tee_local $6
        (i32.shr_s
         (i32.sub
          (tee_local $2
           (i32.load offset=4
            (get_local $1)
           )
          )
          (tee_local $7
           (i32.load
            (get_local $1)
           )
          )
         )
         (i32.const 4)
        )
       )
      )
     )
     (call $_ZNSt3__16vectorIN6ballot4VoteENS_9allocatorIS2_EEE8__appendEj
      (get_local $1)
      (i32.sub
       (get_local $4)
       (get_local $6)
      )
     )
     (br_if $label$2
      (i32.ne
       (tee_local $7
        (i32.load
         (get_local $1)
        )
       )
       (tee_local $2
        (i32.load
         (i32.add
          (get_local $1)
          (i32.const 4)
         )
        )
       )
      )
     )
     (br $label$1)
    )
    (block $label$4
     (br_if $label$4
      (i32.ge_u
       (get_local $4)
       (get_local $6)
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const 4)
      )
      (tee_local $2
       (i32.add
        (get_local $7)
        (i32.shl
         (get_local $4)
         (i32.const 4)
        )
       )
      )
     )
    )
    (br_if $label$1
     (i32.eq
      (get_local $7)
      (get_local $2)
     )
    )
   )
   (set_local $6
    (i32.load
     (tee_local $4
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
   )
   (loop $label$5
    (call $eosio_assert
     (i32.gt_u
      (i32.sub
       (i32.load
        (tee_local $3
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
       )
       (get_local $6)
      )
      (i32.const 7)
     )
     (i32.const 448)
    )
    (drop
     (call $memcpy
      (get_local $7)
      (i32.load
       (get_local $4)
      )
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $4)
     (tee_local $6
      (i32.add
       (i32.load
        (get_local $4)
       )
       (i32.const 8)
      )
     )
    )
    (call $eosio_assert
     (i32.gt_u
      (i32.sub
       (i32.load
        (get_local $3)
       )
       (get_local $6)
      )
      (i32.const 7)
     )
     (i32.const 448)
    )
    (drop
     (call $memcpy
      (i32.add
       (get_local $7)
       (i32.const 8)
      )
      (i32.load
       (get_local $4)
      )
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $4)
     (tee_local $6
      (i32.add
       (i32.load
        (get_local $4)
       )
       (i32.const 8)
      )
     )
    )
    (br_if $label$5
     (i32.ne
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const 16)
       )
      )
      (get_local $2)
     )
    )
   )
  )
  (get_local $0)
 )
 (func $_ZNSt3__16vectorIN6ballot4VoteENS_9allocatorIS2_EEE8__appendEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i32.ge_u
          (i32.shr_s
           (i32.sub
            (tee_local $2
             (i32.load offset=8
              (get_local $0)
             )
            )
            (tee_local $6
             (i32.load offset=4
              (get_local $0)
             )
            )
           )
           (i32.const 4)
          )
          (get_local $1)
         )
        )
        (br_if $label$3
         (i32.ge_u
          (tee_local $4
           (i32.add
            (tee_local $3
             (i32.shr_s
              (i32.sub
               (get_local $6)
               (tee_local $5
                (i32.load
                 (get_local $0)
                )
               )
              )
              (i32.const 4)
             )
            )
            (get_local $1)
           )
          )
          (i32.const 268435456)
         )
        )
        (set_local $6
         (i32.const 268435455)
        )
        (block $label$6
         (br_if $label$6
          (i32.gt_u
           (i32.shr_s
            (tee_local $2
             (i32.sub
              (get_local $2)
              (get_local $5)
             )
            )
            (i32.const 4)
           )
           (i32.const 134217726)
          )
         )
         (br_if $label$4
          (i32.eqz
           (tee_local $6
            (select
             (get_local $4)
             (tee_local $6
              (i32.shr_s
               (get_local $2)
               (i32.const 3)
              )
             )
             (i32.lt_u
              (get_local $6)
              (get_local $4)
             )
            )
           )
          )
         )
         (br_if $label$2
          (i32.ge_u
           (get_local $6)
           (i32.const 268435456)
          )
         )
        )
        (set_local $2
         (call $_Znwj
          (i32.shl
           (get_local $6)
           (i32.const 4)
          )
         )
        )
        (br $label$1)
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
       (loop $label$7
        (i64.store
         (get_local $6)
         (i64.const 0)
        )
        (i64.store
         (i32.add
          (get_local $6)
          (i32.const 8)
         )
         (i64.const 0)
        )
        (i32.store
         (get_local $0)
         (tee_local $6
          (i32.add
           (i32.load
            (get_local $0)
           )
           (i32.const 16)
          )
         )
        )
        (br_if $label$7
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const -1)
          )
         )
        )
        (br $label$0)
       )
      )
      (set_local $6
       (i32.const 0)
      )
      (set_local $2
       (i32.const 0)
      )
      (br $label$1)
     )
     (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
      (get_local $0)
     )
     (unreachable)
    )
    (call $abort)
    (unreachable)
   )
   (set_local $4
    (i32.add
     (get_local $2)
     (i32.shl
      (get_local $6)
      (i32.const 4)
     )
    )
   )
   (set_local $6
    (tee_local $5
     (i32.add
      (get_local $2)
      (i32.shl
       (get_local $3)
       (i32.const 4)
      )
     )
    )
   )
   (loop $label$8
    (i64.store
     (get_local $6)
     (i64.const 0)
    )
    (i64.store
     (i32.add
      (get_local $6)
      (i32.const 8)
     )
     (i64.const 0)
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (i32.const 16)
     )
    )
    (br_if $label$8
     (tee_local $1
      (i32.add
       (get_local $1)
       (i32.const -1)
      )
     )
    )
   )
   (set_local $5
    (i32.sub
     (get_local $5)
     (tee_local $2
      (i32.sub
       (i32.load
        (tee_local $3
         (i32.add
          (get_local $0)
          (i32.const 4)
         )
        )
       )
       (tee_local $1
        (i32.load
         (get_local $0)
        )
       )
      )
     )
    )
   )
   (block $label$9
    (br_if $label$9
     (i32.lt_s
      (get_local $2)
      (i32.const 1)
     )
    )
    (drop
     (call $memcpy
      (get_local $5)
      (get_local $1)
      (get_local $2)
     )
    )
    (set_local $1
     (i32.load
      (get_local $0)
     )
    )
   )
   (i32.store
    (get_local $0)
    (get_local $5)
   )
   (i32.store
    (get_local $3)
    (get_local $6)
   )
   (i32.store
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (get_local $4)
   )
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (call $_ZdlPv
    (get_local $1)
   )
   (return)
  )
 )
 (func $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__16vectorIcNS7_9allocatorIcEEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (set_local $5
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $7
   (i32.const 0)
  )
  (set_local $6
   (i64.const 0)
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (set_local $3
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
  )
  (loop $label$0
   (call $eosio_assert
    (i32.lt_u
     (get_local $5)
     (i32.load
      (get_local $2)
     )
    )
    (i32.const 1024)
   )
   (set_local $4
    (i32.load8_u
     (tee_local $5
      (i32.load
       (get_local $3)
      )
     )
    )
   )
   (i32.store
    (get_local $3)
    (tee_local $5
     (i32.add
      (get_local $5)
      (i32.const 1)
     )
    )
   )
   (set_local $6
    (i64.or
     (i64.extend_u/i32
      (i32.shl
       (i32.and
        (get_local $4)
        (i32.const 127)
       )
       (tee_local $7
        (i32.and
         (get_local $7)
         (i32.const 255)
        )
       )
      )
     )
     (get_local $6)
    )
   )
   (set_local $7
    (i32.add
     (get_local $7)
     (i32.const 7)
    )
   )
   (br_if $label$0
    (i32.shr_u
     (get_local $4)
     (i32.const 7)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.le_u
      (tee_local $3
       (i32.wrap/i64
        (get_local $6)
       )
      )
      (tee_local $2
       (i32.sub
        (tee_local $7
         (i32.load offset=4
          (get_local $1)
         )
        )
        (tee_local $4
         (i32.load
          (get_local $1)
         )
        )
       )
      )
     )
    )
    (call $_ZNSt3__16vectorIcNS_9allocatorIcEEE8__appendEj
     (get_local $1)
     (i32.sub
      (get_local $3)
      (get_local $2)
     )
    )
    (set_local $5
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $1)
       (i32.const 4)
      )
     )
    )
    (set_local $4
     (i32.load
      (get_local $1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.ge_u
     (get_local $3)
     (get_local $2)
    )
   )
   (i32.store
    (i32.add
     (get_local $1)
     (i32.const 4)
    )
    (tee_local $7
     (i32.add
      (get_local $4)
      (get_local $3)
     )
    )
   )
  )
  (call $eosio_assert
   (i32.ge_u
    (i32.sub
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
     )
     (get_local $5)
    )
    (tee_local $5
     (i32.sub
      (get_local $7)
      (get_local $4)
     )
    )
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (get_local $4)
    (i32.load
     (tee_local $7
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (get_local $5)
   )
  )
  (i32.store
   (get_local $7)
   (i32.add
    (i32.load
     (get_local $7)
    )
    (get_local $5)
   )
  )
  (get_local $0)
 )
 (func $_ZNSt3__16vectorIcNS_9allocatorIcEEE8__appendEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (br_if $label$4
        (i32.ge_u
         (i32.sub
          (tee_local $2
           (i32.load offset=8
            (get_local $0)
           )
          )
          (tee_local $6
           (i32.load offset=4
            (get_local $0)
           )
          )
         )
         (get_local $1)
        )
       )
       (br_if $label$2
        (i32.le_s
         (tee_local $4
          (i32.add
           (tee_local $3
            (i32.sub
             (get_local $6)
             (tee_local $5
              (i32.load
               (get_local $0)
              )
             )
            )
           )
           (get_local $1)
          )
         )
         (i32.const -1)
        )
       )
       (set_local $6
        (i32.const 2147483647)
       )
       (block $label$5
        (br_if $label$5
         (i32.gt_u
          (tee_local $2
           (i32.sub
            (get_local $2)
            (get_local $5)
           )
          )
          (i32.const 1073741822)
         )
        )
        (br_if $label$3
         (i32.eqz
          (tee_local $6
           (select
            (get_local $4)
            (tee_local $6
             (i32.shl
              (get_local $2)
              (i32.const 1)
             )
            )
            (i32.lt_u
             (get_local $6)
             (get_local $4)
            )
           )
          )
         )
        )
       )
       (set_local $2
        (call $_Znwj
         (get_local $6)
        )
       )
       (br $label$1)
      )
      (set_local $0
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
      (loop $label$6
       (i32.store8
        (get_local $6)
        (i32.const 0)
       )
       (i32.store
        (get_local $0)
        (tee_local $6
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.const 1)
         )
        )
       )
       (br_if $label$6
        (tee_local $1
         (i32.add
          (get_local $1)
          (i32.const -1)
         )
        )
       )
       (br $label$0)
      )
     )
     (set_local $6
      (i32.const 0)
     )
     (set_local $2
      (i32.const 0)
     )
     (br $label$1)
    )
    (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
     (get_local $0)
    )
    (unreachable)
   )
   (set_local $4
    (i32.add
     (get_local $2)
     (get_local $6)
    )
   )
   (set_local $6
    (tee_local $5
     (i32.add
      (get_local $2)
      (get_local $3)
     )
    )
   )
   (loop $label$7
    (i32.store8
     (get_local $6)
     (i32.const 0)
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (i32.const 1)
     )
    )
    (br_if $label$7
     (tee_local $1
      (i32.add
       (get_local $1)
       (i32.const -1)
      )
     )
    )
   )
   (set_local $5
    (i32.sub
     (get_local $5)
     (tee_local $2
      (i32.sub
       (i32.load
        (tee_local $3
         (i32.add
          (get_local $0)
          (i32.const 4)
         )
        )
       )
       (tee_local $1
        (i32.load
         (get_local $0)
        )
       )
      )
     )
    )
   )
   (block $label$8
    (br_if $label$8
     (i32.lt_s
      (get_local $2)
      (i32.const 1)
     )
    )
    (drop
     (call $memcpy
      (get_local $5)
      (get_local $1)
      (get_local $2)
     )
    )
    (set_local $1
     (i32.load
      (get_local $0)
     )
    )
   )
   (i32.store
    (get_local $0)
    (get_local $5)
   )
   (i32.store
    (get_local $3)
    (get_local $6)
   )
   (i32.store
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (get_local $4)
   )
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (call $_ZdlPv
    (get_local $1)
   )
   (return)
  )
 )
 (func $_ZN6ballot10rmproposalEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE (type $FUNCSIG$viji) (param $0 i32) (param $1 i64) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $11)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $11)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $11)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $11)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $11)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $3
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (get_local $11)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $9
      (i32.load offset=24
       (get_local $11)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $8
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $11)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $9)
      )
     )
     (loop $label$3
      (set_local $4
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
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $4)
        )
       )
       (call $_ZdlPv
        (get_local $4)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $9)
        (get_local $8)
       )
      )
     )
     (set_local $8
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $8
     (get_local $9)
    )
   )
   (i32.store
    (get_local $5)
    (get_local $9)
   )
   (call $_ZdlPv
    (get_local $8)
   )
  )
  (call $require_auth
   (get_local $3)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store
   (get_local $11)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 44)
    )
    (get_local $11)
    (i32.const 4)
   )
  )
  (set_local $8
   (i32.load offset=44
    (get_local $11)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 44)
    )
    (i32.or
     (get_local $11)
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $7
   (i32.shr_u
    (tee_local $6
     (i32.mul
      (i32.xor
       (i32.shr_u
        (tee_local $8
         (i32.xor
          (i32.mul
           (i32.xor
            (i32.shr_u
             (tee_local $4
              (i32.mul
               (i32.load offset=44
                (get_local $11)
               )
               (i32.const 1540483477)
              )
             )
             (i32.const 24)
            )
            (get_local $4)
           )
           (i32.const 1540483477)
          )
          (i32.mul
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $8
                (i32.mul
                 (get_local $8)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $8)
             )
             (i32.const 1540483477)
            )
            (i32.const -561034072)
           )
           (i32.const 1540483477)
          )
         )
        )
        (i32.const 13)
       )
       (get_local $8)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (set_local $10
   (select
    (i32.load offset=8
     (get_local $2)
    )
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
    (tee_local $4
     (i32.and
      (tee_local $8
       (i32.load8_u
        (get_local $2)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (tee_local $5
       (select
        (i32.load offset=4
         (get_local $2)
        )
        (i32.shr_u
         (get_local $8)
         (i32.const 1)
        )
        (get_local $4)
       )
      )
      (i32.const 4)
     )
    )
    (set_local $9
     (get_local $5)
    )
    (set_local $8
     (get_local $10)
    )
    (set_local $4
     (get_local $5)
    )
    (loop $label$7
     (drop
      (call $memcpy
       (get_local $11)
       (get_local $8)
       (i32.const 4)
      )
     )
     (set_local $4
      (i32.xor
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $2
           (i32.mul
            (i32.load
             (get_local $11)
            )
            (i32.const 1540483477)
           )
          )
          (i32.const 24)
         )
         (get_local $2)
        )
        (i32.const 1540483477)
       )
       (i32.mul
        (get_local $4)
        (i32.const 1540483477)
       )
      )
     )
     (set_local $8
      (i32.add
       (get_local $8)
       (i32.const 4)
      )
     )
     (br_if $label$7
      (i32.gt_u
       (tee_local $9
        (i32.add
         (get_local $9)
         (i32.const -4)
        )
       )
       (i32.const 3)
      )
     )
    )
    (set_local $5
     (i32.sub
      (tee_local $8
       (i32.add
        (get_local $5)
        (i32.const -4)
       )
      )
      (tee_local $8
       (i32.and
        (get_local $8)
        (i32.const -4)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (i32.add
       (get_local $10)
       (get_local $8)
      )
      (i32.const 4)
     )
    )
    (br $label$5)
   )
   (set_local $4
    (get_local $5)
   )
  )
  (set_local $8
   (i32.xor
    (get_local $7)
    (get_local $6)
   )
  )
  (block $label$8
   (block $label$9
    (br_if $label$9
     (i32.eq
      (get_local $5)
      (i32.const 1)
     )
    )
    (block $label$10
     (br_if $label$10
      (i32.eq
       (get_local $5)
       (i32.const 2)
      )
     )
     (br_if $label$8
      (i32.ne
       (get_local $5)
       (i32.const 3)
      )
     )
     (set_local $4
      (i32.xor
       (i32.shl
        (i32.load8_u offset=2
         (get_local $10)
        )
        (i32.const 16)
       )
       (get_local $4)
      )
     )
    )
    (set_local $4
     (i32.xor
      (i32.shl
       (i32.load8_u offset=1
        (get_local $10)
       )
       (i32.const 8)
      )
      (get_local $4)
     )
    )
   )
   (set_local $4
    (i32.mul
     (i32.xor
      (i32.load8_u
       (get_local $10)
      )
      (get_local $4)
     )
     (i32.const 1540483477)
    )
   )
  )
  (set_local $1
   (i64.extend_u/i32
    (get_local $8)
   )
  )
  (set_local $6
   (i32.shr_u
    (tee_local $10
     (i32.mul
      (i32.xor
       (i32.shr_u
        (get_local $4)
        (i32.const 13)
       )
       (get_local $4)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (block $label$11
   (br_if $label$11
    (i32.eq
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (get_local $9)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$12
    (br_if $label$11
     (i64.eq
      (i64.load
       (i32.load
        (get_local $8)
       )
      )
      (get_local $1)
     )
    )
    (set_local $9
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
    (br_if $label$12
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $2
   (i32.xor
    (get_local $6)
    (get_local $10)
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i32.eq
      (get_local $9)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $8
         (i32.load
          (i32.add
           (get_local $9)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $4)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (set_local $8
    (i32.const 0)
   )
   (br_if $label$13
    (i32.lt_s
     (tee_local $9
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i64.const -7880044397109182464)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=36
      (tee_local $8
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $4)
        (get_local $9)
       )
      )
     )
     (get_local $4)
    )
    (i32.const 128)
   )
  )
  (set_local $1
   (i64.extend_u/i32
    (get_local $2)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $8)
    (i32.const 0)
   )
   (i32.const 1040)
  )
  (block $label$15
   (br_if $label$15
    (i32.eq
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 76)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 72)
       )
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (get_local $9)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$16
    (br_if $label$15
     (i64.eq
      (i64.load
       (i32.load
        (get_local $8)
       )
      )
      (get_local $1)
     )
    )
    (set_local $9
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
    (br_if $label$16
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
  (block $label$17
   (block $label$18
    (br_if $label$18
     (i32.eq
      (get_local $9)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=56
       (tee_local $8
        (i32.load
         (i32.add
          (get_local $9)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $4)
     )
     (i32.const 128)
    )
    (br $label$17)
   )
   (set_local $8
    (i32.const 0)
   )
   (br_if $label$17
    (i32.lt_s
     (tee_local $9
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 48)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 56)
        )
       )
       (i64.const -5915097263692054528)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=56
      (tee_local $8
       (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
        (get_local $4)
        (get_local $9)
       )
      )
     )
     (get_local $4)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (tee_local $9
    (i32.ne
     (get_local $8)
     (i32.const 0)
    )
   )
   (i32.const 1072)
  )
  (call $eosio_assert
   (get_local $9)
   (i32.const 640)
  )
  (call $eosio_assert
   (get_local $9)
   (i32.const 688)
  )
  (block $label$19
   (br_if $label$19
    (i32.lt_s
     (tee_local $9
      (call $db_next_i64
       (i32.load offset=60
        (get_local $8)
       )
       (get_local $11)
      )
     )
     (i32.const 0)
    )
   )
   (drop
    (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
     (get_local $4)
     (get_local $9)
    )
   )
  )
  (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE5eraseERKS2_
   (get_local $4)
   (get_local $8)
  )
  (block $label$20
   (block $label$21
    (br_if $label$21
     (i32.and
      (i32.load8_u offset=16
       (get_local $8)
      )
      (i32.const 1)
     )
    )
    (set_local $8
     (i32.add
      (i32.add
       (get_local $8)
       (i32.const 16)
      )
      (i32.const 1)
     )
    )
    (br $label$20)
   )
   (set_local $8
    (i32.load
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
    )
   )
  )
  (call $prints
   (i32.const 1104)
  )
  (call $prints
   (get_local $8)
  )
  (call $prints
   (i32.const 1120)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE5eraseERKS2_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 720)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 768)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (tee_local $4
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
   (set_local $5
    (i32.sub
     (i32.const 0)
     (get_local $3)
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
     (i64.eq
      (i64.load
       (i32.load
        (get_local $6)
       )
      )
      (get_local $2)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $8
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $8)
       (get_local $5)
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
   (i32.const 832)
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
      (tee_local $6
       (i32.load
        (get_local $4)
       )
      )
     )
    )
    (set_local $3
     (i32.sub
      (i32.const 0)
      (get_local $6)
     )
    )
    (set_local $6
     (get_local $8)
    )
    (loop $label$4
     (set_local $5
      (i32.load
       (tee_local $8
        (i32.add
         (get_local $6)
         (i32.const 24)
        )
       )
      )
     )
     (i32.store
      (get_local $8)
      (i32.const 0)
     )
     (set_local $7
      (i32.load
       (get_local $6)
      )
     )
     (i32.store
      (get_local $6)
      (get_local $5)
     )
     (block $label$5
      (br_if $label$5
       (i32.eqz
        (get_local $7)
       )
      )
      (block $label$6
       (br_if $label$6
        (i32.eqz
         (tee_local $5
          (i32.load offset=40
           (get_local $7)
          )
         )
        )
       )
       (i32.store
        (i32.add
         (get_local $7)
         (i32.const 44)
        )
        (get_local $5)
       )
       (call $_ZdlPv
        (get_local $5)
       )
      )
      (block $label$7
       (br_if $label$7
        (i32.eqz
         (i32.and
          (i32.load8_u offset=28
           (get_local $7)
          )
          (i32.const 1)
         )
        )
       )
       (call $_ZdlPv
        (i32.load
         (i32.add
          (get_local $7)
          (i32.const 36)
         )
        )
       )
      )
      (block $label$8
       (br_if $label$8
        (i32.eqz
         (i32.and
          (i32.load8_u offset=16
           (get_local $7)
          )
          (i32.const 1)
         )
        )
       )
       (call $_ZdlPv
        (i32.load
         (i32.add
          (get_local $7)
          (i32.const 24)
         )
        )
       )
      )
      (call $_ZdlPv
       (get_local $7)
      )
     )
     (i32.store
      (i32.add
       (get_local $6)
       (i32.const 16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 40)
       )
      )
     )
     (i64.store
      (i32.add
       (get_local $6)
       (i32.const 8)
      )
      (i64.load
       (i32.add
        (get_local $6)
        (i32.const 32)
       )
      )
     )
     (set_local $6
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
   (loop $label$9
    (set_local $6
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
    (block $label$10
     (br_if $label$10
      (i32.eqz
       (get_local $6)
      )
     )
     (block $label$11
      (br_if $label$11
       (i32.eqz
        (tee_local $5
         (i32.load offset=40
          (get_local $6)
         )
        )
       )
      )
      (i32.store
       (i32.add
        (get_local $6)
        (i32.const 44)
       )
       (get_local $5)
      )
      (call $_ZdlPv
       (get_local $5)
      )
     )
     (block $label$12
      (br_if $label$12
       (i32.eqz
        (i32.and
         (i32.load8_u offset=28
          (get_local $6)
         )
         (i32.const 1)
        )
       )
      )
      (call $_ZdlPv
       (i32.load
        (i32.add
         (get_local $6)
         (i32.const 36)
        )
       )
      )
     )
     (block $label$13
      (br_if $label$13
       (i32.eqz
        (i32.and
         (i32.load8_u offset=16
          (get_local $6)
         )
         (i32.const 1)
        )
       )
      )
      (call $_ZdlPv
       (i32.load
        (i32.add
         (get_local $6)
         (i32.const 24)
        )
       )
      )
     )
     (call $_ZdlPv
      (get_local $6)
     )
    )
    (br_if $label$9
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
   (i32.load offset=60
    (get_local $1)
   )
  )
 )
 (func $_ZN6ballot7addvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE (type $FUNCSIG$viji) (param $0 i32) (param $1 i64) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $11)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $11)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $11)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $11)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $11)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $3
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (get_local $11)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $8
      (i32.load offset=24
       (get_local $11)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $10
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $11)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $8)
      )
     )
     (loop $label$3
      (set_local $4
       (i32.load
        (tee_local $10
         (i32.add
          (get_local $10)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $10)
       (i32.const 0)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $4)
        )
       )
       (call $_ZdlPv
        (get_local $4)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $8)
        (get_local $10)
       )
      )
     )
     (set_local $10
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $10
     (get_local $8)
    )
   )
   (i32.store
    (get_local $5)
    (get_local $8)
   )
   (call $_ZdlPv
    (get_local $10)
   )
  )
  (call $require_auth
   (get_local $3)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store
   (get_local $11)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 40)
    )
    (get_local $11)
    (i32.const 4)
   )
  )
  (set_local $10
   (i32.load offset=40
    (get_local $11)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 40)
    )
    (i32.or
     (get_local $11)
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $7
   (i32.shr_u
    (tee_local $6
     (i32.mul
      (i32.xor
       (i32.shr_u
        (tee_local $10
         (i32.xor
          (i32.mul
           (i32.xor
            (i32.shr_u
             (tee_local $4
              (i32.mul
               (i32.load offset=40
                (get_local $11)
               )
               (i32.const 1540483477)
              )
             )
             (i32.const 24)
            )
            (get_local $4)
           )
           (i32.const 1540483477)
          )
          (i32.mul
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $10
                (i32.mul
                 (get_local $10)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $10)
             )
             (i32.const 1540483477)
            )
            (i32.const -561034072)
           )
           (i32.const 1540483477)
          )
         )
        )
        (i32.const 13)
       )
       (get_local $10)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (set_local $9
   (select
    (i32.load offset=8
     (get_local $2)
    )
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
    (tee_local $4
     (i32.and
      (tee_local $10
       (i32.load8_u
        (get_local $2)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (tee_local $5
       (select
        (i32.load offset=4
         (get_local $2)
        )
        (i32.shr_u
         (get_local $10)
         (i32.const 1)
        )
        (get_local $4)
       )
      )
      (i32.const 4)
     )
    )
    (set_local $8
     (get_local $5)
    )
    (set_local $10
     (get_local $9)
    )
    (set_local $4
     (get_local $5)
    )
    (loop $label$7
     (drop
      (call $memcpy
       (get_local $11)
       (get_local $10)
       (i32.const 4)
      )
     )
     (set_local $4
      (i32.xor
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $2
           (i32.mul
            (i32.load
             (get_local $11)
            )
            (i32.const 1540483477)
           )
          )
          (i32.const 24)
         )
         (get_local $2)
        )
        (i32.const 1540483477)
       )
       (i32.mul
        (get_local $4)
        (i32.const 1540483477)
       )
      )
     )
     (set_local $10
      (i32.add
       (get_local $10)
       (i32.const 4)
      )
     )
     (br_if $label$7
      (i32.gt_u
       (tee_local $8
        (i32.add
         (get_local $8)
         (i32.const -4)
        )
       )
       (i32.const 3)
      )
     )
    )
    (set_local $5
     (i32.sub
      (tee_local $10
       (i32.add
        (get_local $5)
        (i32.const -4)
       )
      )
      (tee_local $10
       (i32.and
        (get_local $10)
        (i32.const -4)
       )
      )
     )
    )
    (set_local $9
     (i32.add
      (i32.add
       (get_local $9)
       (get_local $10)
      )
      (i32.const 4)
     )
    )
    (br $label$5)
   )
   (set_local $4
    (get_local $5)
   )
  )
  (set_local $10
   (i32.xor
    (get_local $7)
    (get_local $6)
   )
  )
  (block $label$8
   (block $label$9
    (br_if $label$9
     (i32.eq
      (get_local $5)
      (i32.const 1)
     )
    )
    (block $label$10
     (br_if $label$10
      (i32.eq
       (get_local $5)
       (i32.const 2)
      )
     )
     (br_if $label$8
      (i32.ne
       (get_local $5)
       (i32.const 3)
      )
     )
     (set_local $4
      (i32.xor
       (i32.shl
        (i32.load8_u offset=2
         (get_local $9)
        )
        (i32.const 16)
       )
       (get_local $4)
      )
     )
    )
    (set_local $4
     (i32.xor
      (i32.shl
       (i32.load8_u offset=1
        (get_local $9)
       )
       (i32.const 8)
      )
      (get_local $4)
     )
    )
   )
   (set_local $4
    (i32.mul
     (i32.xor
      (i32.load8_u
       (get_local $9)
      )
      (get_local $4)
     )
     (i32.const 1540483477)
    )
   )
  )
  (set_local $3
   (i64.extend_u/i32
    (get_local $10)
   )
  )
  (set_local $6
   (i32.shr_u
    (tee_local $9
     (i32.mul
      (i32.xor
       (i32.shr_u
        (get_local $4)
        (i32.const 13)
       )
       (get_local $4)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (block $label$11
   (br_if $label$11
    (i32.eq
     (tee_local $8
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $8)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$12
    (br_if $label$11
     (i64.eq
      (i64.load
       (i32.load
        (get_local $10)
       )
      )
      (get_local $3)
     )
    )
    (set_local $8
     (get_local $10)
    )
    (set_local $10
     (tee_local $4
      (i32.add
       (get_local $10)
       (i32.const -24)
      )
     )
    )
    (br_if $label$12
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $2
   (i32.xor
    (get_local $6)
    (get_local $9)
   )
  )
  (set_local $10
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i32.eq
      (get_local $8)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $4
         (i32.load
          (i32.add
           (get_local $8)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $10)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (block $label$15
    (br_if $label$15
     (i32.le_s
      (tee_local $4
       (call $db_find_i64
        (i64.load
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
        (i64.load
         (i32.add
          (get_local $0)
          (i32.const 16)
         )
        )
        (i64.const -7880044397109182464)
        (get_local $3)
       )
      )
      (i32.const -1)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=36
       (tee_local $4
        (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
         (get_local $10)
         (get_local $4)
        )
       )
      )
      (get_local $10)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (set_local $4
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (get_local $11)
   (get_local $4)
  )
  (i32.store
   (get_local $11)
   (get_local $10)
  )
  (set_local $3
   (i64.extend_u/i32
    (get_local $2)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $4)
    (i32.const 0)
   )
   (i32.const 1152)
  )
  (block $label$16
   (br_if $label$16
    (i32.eq
     (tee_local $8
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 76)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 72)
       )
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $8)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$17
    (br_if $label$16
     (i64.eq
      (i64.load
       (i32.load
        (get_local $10)
       )
      )
      (get_local $3)
     )
    )
    (set_local $8
     (get_local $10)
    )
    (set_local $10
     (tee_local $4
      (i32.add
       (get_local $10)
       (i32.const -24)
      )
     )
    )
    (br_if $label$17
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
  (block $label$18
   (block $label$19
    (br_if $label$19
     (i32.eq
      (get_local $8)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=56
       (tee_local $8
        (i32.load
         (i32.add
          (get_local $8)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $2)
     )
     (i32.const 128)
    )
    (br $label$18)
   )
   (set_local $8
    (i32.const 0)
   )
   (br_if $label$18
    (i32.lt_s
     (tee_local $10
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 48)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 56)
        )
       )
       (i64.const -5915097263692054528)
       (get_local $3)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=56
      (tee_local $8
       (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
        (get_local $2)
        (get_local $10)
       )
      )
     )
     (get_local $2)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (tee_local $0
    (i32.ne
     (get_local $8)
     (i32.const 0)
    )
   )
   (i32.const 1072)
  )
  (block $label$20
   (br_if $label$20
    (i32.eq
     (tee_local $10
      (i32.load offset=40
       (get_local $8)
      )
     )
     (i32.load
      (tee_local $4
       (i32.add
        (get_local $8)
        (i32.const 44)
       )
      )
     )
    )
   )
   (loop $label$21
    (call $eosio_assert
     (i64.ne
      (i64.load
       (i32.add
        (get_local $10)
        (i32.const 8)
       )
      )
      (get_local $1)
     )
     (i32.const 1184)
    )
    (br_if $label$21
     (i32.ne
      (tee_local $10
       (i32.add
        (get_local $10)
        (i32.const 16)
       )
      )
      (i32.load
       (get_local $4)
      )
     )
    )
   )
  )
  (i32.store offset=40
   (get_local $11)
   (get_local $11)
  )
  (call $eosio_assert
   (get_local $0)
   (i32.const 192)
  )
  (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_7addvoteEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_4EEvRKS2_yOT_
   (get_local $2)
   (get_local $8)
   (i32.add
    (get_local $11)
    (i32.const 40)
   )
  )
  (block $label$22
   (block $label$23
    (br_if $label$23
     (i32.and
      (i32.load8_u offset=16
       (get_local $8)
      )
      (i32.const 1)
     )
    )
    (set_local $10
     (i32.add
      (i32.add
       (get_local $8)
       (i32.const 16)
      )
      (i32.const 1)
     )
    )
    (br $label$22)
   )
   (set_local $10
    (i32.load
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
    )
   )
  )
  (call $prints
   (i32.const 1232)
  )
  (call $printn
   (get_local $1)
  )
  (call $prints
   (i32.const 1248)
  )
  (call $prints
   (get_local $10)
  )
  (call $prints
   (i32.const 1264)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_7addvoteEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_4EEvRKS2_yOT_ (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $5
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (set_local $3
   (i64.load
    (get_local $1)
   )
  )
  (i64.store
   (tee_local $6
    (get_local $5)
   )
   (i64.load offset=16
    (tee_local $2
     (i32.load offset=4
      (i32.load
       (get_local $2)
      )
     )
    )
   )
  )
  (i64.store offset=8
   (get_local $6)
   (i64.load offset=8
    (get_local $2)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eq
      (tee_local $4
       (i32.load
        (tee_local $2
         (i32.add
          (get_local $1)
          (i32.const 44)
         )
        )
       )
      )
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 48)
       )
      )
     )
    )
    (i64.store
     (get_local $4)
     (i64.load
      (get_local $6)
     )
    )
    (i64.store
     (i32.add
      (get_local $4)
      (i32.const 8)
     )
     (i64.load
      (i32.add
       (get_local $6)
       (i32.const 8)
      )
     )
    )
    (i32.store
     (get_local $2)
     (i32.add
      (i32.load
       (get_local $2)
      )
      (i32.const 16)
     )
    )
    (br $label$0)
   )
   (call $_ZNSt3__16vectorIN6ballot4VoteENS_9allocatorIS2_EEE21__push_back_slow_pathIRKS2_EEvOT_
    (i32.add
     (get_local $1)
     (i32.const 40)
    )
    (get_local $6)
   )
  )
  (call $eosio_assert
   (i64.eq
    (get_local $3)
    (i64.load
     (get_local $1)
    )
   )
   (i32.const 352)
  )
  (i32.store
   (get_local $6)
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $6)
    (get_local $1)
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.lt_u
      (tee_local $2
       (i32.load
        (get_local $6)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $5
     (call $malloc
      (get_local $2)
     )
    )
    (br $label$2)
   )
   (i32.store offset=4
    (i32.const 0)
    (tee_local $5
     (i32.sub
      (get_local $5)
      (i32.and
       (i32.add
        (get_local $2)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (get_local $6)
   (get_local $5)
  )
  (i32.store
   (get_local $6)
   (get_local $5)
  )
  (i32.store offset=8
   (get_local $6)
   (i32.add
    (get_local $5)
    (get_local $2)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $6)
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=60
    (get_local $1)
   )
   (i64.const 0)
   (get_local $5)
   (get_local $2)
  )
  (block $label$4
   (br_if $label$4
    (i32.lt_u
     (get_local $2)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $5)
   )
  )
  (block $label$5
   (br_if $label$5
    (i64.lt_u
     (get_local $3)
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
    (i32.const 16)
   )
  )
 )
 (func $_ZNSt3__16vectorIN6ballot4VoteENS_9allocatorIS2_EEE21__push_back_slow_pathIRKS2_EEvOT_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.ge_u
       (tee_local $3
        (i32.add
         (tee_local $2
          (i32.shr_s
           (i32.sub
            (tee_local $6
             (i32.load offset=4
              (get_local $0)
             )
            )
            (tee_local $5
             (i32.load
              (get_local $0)
             )
            )
           )
           (i32.const 4)
          )
         )
         (i32.const 1)
        )
       )
       (i32.const 268435456)
      )
     )
     (set_local $4
      (i32.const 268435455)
     )
     (block $label$3
      (block $label$4
       (br_if $label$4
        (i32.gt_u
         (i32.shr_s
          (tee_local $7
           (i32.sub
            (i32.load offset=8
             (get_local $0)
            )
            (get_local $5)
           )
          )
          (i32.const 4)
         )
         (i32.const 134217726)
        )
       )
       (br_if $label$3
        (i32.eqz
         (tee_local $4
          (select
           (get_local $3)
           (tee_local $4
            (i32.shr_s
             (get_local $7)
             (i32.const 3)
            )
           )
           (i32.lt_u
            (get_local $4)
            (get_local $3)
           )
          )
         )
        )
       )
       (br_if $label$1
        (i32.ge_u
         (get_local $4)
         (i32.const 268435456)
        )
       )
      )
      (set_local $7
       (call $_Znwj
        (i32.shl
         (get_local $4)
         (i32.const 4)
        )
       )
      )
      (set_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (set_local $5
       (i32.load
        (get_local $0)
       )
      )
      (br $label$0)
     )
     (set_local $4
      (i32.const 0)
     )
     (set_local $7
      (i32.const 0)
     )
     (br $label$0)
    )
    (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
     (get_local $0)
    )
    (unreachable)
   )
   (call $abort)
   (unreachable)
  )
  (i64.store
   (tee_local $3
    (i32.add
     (get_local $7)
     (i32.shl
      (get_local $2)
      (i32.const 4)
     )
    )
   )
   (i64.load
    (get_local $1)
   )
  )
  (i64.store
   (i32.add
    (get_local $3)
    (i32.const 8)
   )
   (i64.load
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
   )
  )
  (set_local $6
   (i32.sub
    (get_local $3)
    (tee_local $1
     (i32.sub
      (get_local $6)
      (get_local $5)
     )
    )
   )
  )
  (set_local $4
   (i32.add
    (get_local $7)
    (i32.shl
     (get_local $4)
     (i32.const 4)
    )
   )
  )
  (set_local $3
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.lt_s
     (get_local $1)
     (i32.const 1)
    )
   )
   (drop
    (call $memcpy
     (get_local $6)
     (get_local $5)
     (get_local $1)
    )
   )
   (set_local $5
    (i32.load
     (get_local $0)
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $6)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $3)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$6
   (br_if $label$6
    (i32.eqz
     (get_local $5)
    )
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
 )
 (func $_ZN6ballot6rmvoteEyRKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE (type $FUNCSIG$viji) (param $0 i32) (param $1 i64) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $11)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i64.store
   (get_local $11)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=16
   (get_local $11)
   (i64.const -1)
  )
  (i64.store offset=24
   (get_local $11)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $11)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $3
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (get_local $11)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $9
      (i32.load offset=24
       (get_local $11)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $8
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $11)
           (i32.const 28)
          )
         )
        )
       )
       (get_local $9)
      )
     )
     (loop $label$3
      (set_local $4
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
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $4)
        )
       )
       (call $_ZdlPv
        (get_local $4)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $9)
        (get_local $8)
       )
      )
     )
     (set_local $8
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 24)
       )
      )
     )
     (br $label$1)
    )
    (set_local $8
     (get_local $9)
    )
   )
   (i32.store
    (get_local $5)
    (get_local $9)
   )
   (call $_ZdlPv
    (get_local $8)
   )
  )
  (call $require_auth
   (get_local $3)
  )
  (call $require_auth
   (get_local $1)
  )
  (i64.store
   (get_local $11)
   (get_local $1)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 40)
    )
    (get_local $11)
    (i32.const 4)
   )
  )
  (set_local $8
   (i32.load offset=40
    (get_local $11)
   )
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $11)
     (i32.const 40)
    )
    (i32.or
     (get_local $11)
     (i32.const 4)
    )
    (i32.const 4)
   )
  )
  (set_local $7
   (i32.shr_u
    (tee_local $6
     (i32.mul
      (i32.xor
       (i32.shr_u
        (tee_local $8
         (i32.xor
          (i32.mul
           (i32.xor
            (i32.shr_u
             (tee_local $4
              (i32.mul
               (i32.load offset=40
                (get_local $11)
               )
               (i32.const 1540483477)
              )
             )
             (i32.const 24)
            )
            (get_local $4)
           )
           (i32.const 1540483477)
          )
          (i32.mul
           (i32.xor
            (i32.mul
             (i32.xor
              (i32.shr_u
               (tee_local $8
                (i32.mul
                 (get_local $8)
                 (i32.const 1540483477)
                )
               )
               (i32.const 24)
              )
              (get_local $8)
             )
             (i32.const 1540483477)
            )
            (i32.const -561034072)
           )
           (i32.const 1540483477)
          )
         )
        )
        (i32.const 13)
       )
       (get_local $8)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (set_local $10
   (select
    (i32.load offset=8
     (get_local $2)
    )
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
    (tee_local $4
     (i32.and
      (tee_local $8
       (i32.load8_u
        (get_local $2)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (tee_local $5
       (select
        (i32.load offset=4
         (get_local $2)
        )
        (i32.shr_u
         (get_local $8)
         (i32.const 1)
        )
        (get_local $4)
       )
      )
      (i32.const 4)
     )
    )
    (set_local $9
     (get_local $5)
    )
    (set_local $8
     (get_local $10)
    )
    (set_local $4
     (get_local $5)
    )
    (loop $label$7
     (drop
      (call $memcpy
       (get_local $11)
       (get_local $8)
       (i32.const 4)
      )
     )
     (set_local $4
      (i32.xor
       (i32.mul
        (i32.xor
         (i32.shr_u
          (tee_local $2
           (i32.mul
            (i32.load
             (get_local $11)
            )
            (i32.const 1540483477)
           )
          )
          (i32.const 24)
         )
         (get_local $2)
        )
        (i32.const 1540483477)
       )
       (i32.mul
        (get_local $4)
        (i32.const 1540483477)
       )
      )
     )
     (set_local $8
      (i32.add
       (get_local $8)
       (i32.const 4)
      )
     )
     (br_if $label$7
      (i32.gt_u
       (tee_local $9
        (i32.add
         (get_local $9)
         (i32.const -4)
        )
       )
       (i32.const 3)
      )
     )
    )
    (set_local $5
     (i32.sub
      (tee_local $8
       (i32.add
        (get_local $5)
        (i32.const -4)
       )
      )
      (tee_local $8
       (i32.and
        (get_local $8)
        (i32.const -4)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (i32.add
       (get_local $10)
       (get_local $8)
      )
      (i32.const 4)
     )
    )
    (br $label$5)
   )
   (set_local $4
    (get_local $5)
   )
  )
  (set_local $8
   (i32.xor
    (get_local $7)
    (get_local $6)
   )
  )
  (block $label$8
   (block $label$9
    (br_if $label$9
     (i32.eq
      (get_local $5)
      (i32.const 1)
     )
    )
    (block $label$10
     (br_if $label$10
      (i32.eq
       (get_local $5)
       (i32.const 2)
      )
     )
     (br_if $label$8
      (i32.ne
       (get_local $5)
       (i32.const 3)
      )
     )
     (set_local $4
      (i32.xor
       (i32.shl
        (i32.load8_u offset=2
         (get_local $10)
        )
        (i32.const 16)
       )
       (get_local $4)
      )
     )
    )
    (set_local $4
     (i32.xor
      (i32.shl
       (i32.load8_u offset=1
        (get_local $10)
       )
       (i32.const 8)
      )
      (get_local $4)
     )
    )
   )
   (set_local $4
    (i32.mul
     (i32.xor
      (i32.load8_u
       (get_local $10)
      )
      (get_local $4)
     )
     (i32.const 1540483477)
    )
   )
  )
  (set_local $3
   (i64.extend_u/i32
    (get_local $8)
   )
  )
  (set_local $6
   (i32.shr_u
    (tee_local $10
     (i32.mul
      (i32.xor
       (i32.shr_u
        (get_local $4)
        (i32.const 13)
       )
       (get_local $4)
      )
      (i32.const 1540483477)
     )
    )
    (i32.const 15)
   )
  )
  (block $label$11
   (br_if $label$11
    (i32.eq
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 36)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 32)
       )
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (get_local $9)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$12
    (br_if $label$11
     (i64.eq
      (i64.load
       (i32.load
        (get_local $8)
       )
      )
      (get_local $3)
     )
    )
    (set_local $9
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
    (br_if $label$12
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $2
   (i32.xor
    (get_local $6)
    (get_local $10)
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i32.eq
      (get_local $9)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load
       (i32.add
        (tee_local $8
         (i32.load
          (i32.add
           (get_local $9)
           (i32.const -24)
          )
         )
        )
        (i32.const 36)
       )
      )
      (get_local $4)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (set_local $8
    (i32.const 0)
   )
   (br_if $label$13
    (i32.lt_s
     (tee_local $9
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i64.const -7880044397109182464)
       (get_local $3)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=36
      (tee_local $8
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $4)
        (get_local $9)
       )
      )
     )
     (get_local $4)
    )
    (i32.const 128)
   )
  )
  (set_local $3
   (i64.extend_u/i32
    (get_local $2)
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $8)
    (i32.const 0)
   )
   (i32.const 1152)
  )
  (block $label$15
   (br_if $label$15
    (i32.eq
     (tee_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 76)
       )
      )
     )
     (tee_local $5
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 72)
       )
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (get_local $9)
     (i32.const -24)
    )
   )
   (set_local $2
    (i32.sub
     (i32.const 0)
     (get_local $5)
    )
   )
   (loop $label$16
    (br_if $label$15
     (i64.eq
      (i64.load
       (i32.load
        (get_local $8)
       )
      )
      (get_local $3)
     )
    )
    (set_local $9
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
    (br_if $label$16
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $2)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
  (block $label$17
   (block $label$18
    (br_if $label$18
     (i32.eq
      (get_local $9)
      (get_local $5)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=56
       (tee_local $9
        (i32.load
         (i32.add
          (get_local $9)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $2)
     )
     (i32.const 128)
    )
    (br $label$17)
   )
   (set_local $9
    (i32.const 0)
   )
   (br_if $label$17
    (i32.lt_s
     (tee_local $8
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 48)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 56)
        )
       )
       (i64.const -5915097263692054528)
       (get_local $3)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=56
      (tee_local $9
       (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
        (get_local $2)
        (get_local $8)
       )
      )
     )
     (get_local $2)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (tee_local $0
    (i32.ne
     (get_local $9)
     (i32.const 0)
    )
   )
   (i32.const 1072)
  )
  (i32.store
   (get_local $11)
   (tee_local $8
    (i32.load offset=40
     (get_local $9)
    )
   )
  )
  (block $label$19
   (block $label$20
    (block $label$21
     (br_if $label$21
      (i32.eq
       (get_local $8)
       (tee_local $4
        (i32.load
         (i32.add
          (get_local $9)
          (i32.const 44)
         )
        )
       )
      )
     )
     (loop $label$22
      (br_if $label$20
       (i64.eq
        (i64.load
         (i32.add
          (get_local $8)
          (i32.const 8)
         )
        )
        (get_local $1)
       )
      )
      (i32.store
       (get_local $11)
       (tee_local $8
        (i32.add
         (get_local $8)
         (i32.const 16)
        )
       )
      )
      (br_if $label$22
       (i32.ne
        (get_local $4)
        (get_local $8)
       )
      )
     )
    )
    (call $eosio_assert
     (i32.const 0)
     (i32.const 1312)
    )
    (br $label$19)
   )
   (call $prints
    (i32.const 1280)
   )
   (call $printn
    (get_local $1)
   )
   (call $prints
    (i32.const 1264)
   )
   (i32.store offset=40
    (get_local $11)
    (get_local $11)
   )
   (call $eosio_assert
    (get_local $0)
    (i32.const 192)
   )
   (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_6rmvoteEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_5EEvRKS2_yOT_
    (get_local $2)
    (get_local $9)
    (i32.add
     (get_local $11)
     (i32.const 40)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_6rmvoteEyRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_5EEvRKS2_yOT_ (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (set_local $9
   (tee_local $10
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
   (get_local $10)
  )
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (set_local $8
   (tee_local $3
    (i64.load
     (get_local $1)
    )
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $6
      (i32.shr_s
       (tee_local $5
        (i32.sub
         (i32.load
          (tee_local $7
           (i32.add
            (get_local $1)
            (i32.const 44)
           )
          )
         )
         (tee_local $4
          (i32.add
           (tee_local $2
            (i32.load
             (i32.load
              (get_local $2)
             )
            )
           )
           (i32.const 16)
          )
         )
        )
       )
       (i32.const 4)
      )
     )
    )
   )
   (drop
    (call $memmove
     (get_local $2)
     (get_local $4)
     (get_local $5)
    )
   )
   (set_local $8
    (i64.load
     (get_local $1)
    )
   )
  )
  (i32.store
   (get_local $7)
   (i32.add
    (get_local $2)
    (i32.shl
     (get_local $6)
     (i32.const 4)
    )
   )
  )
  (call $eosio_assert
   (i64.eq
    (get_local $3)
    (get_local $8)
   )
   (i32.const 352)
  )
  (i32.store
   (get_local $9)
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $9)
    (get_local $1)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.lt_u
      (tee_local $7
       (i32.load
        (get_local $9)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $2
     (call $malloc
      (get_local $7)
     )
    )
    (br $label$1)
   )
   (i32.store offset=4
    (i32.const 0)
    (tee_local $2
     (i32.sub
      (get_local $10)
      (i32.and
       (i32.add
        (get_local $7)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (get_local $9)
   (get_local $2)
  )
  (i32.store
   (get_local $9)
   (get_local $2)
  )
  (i32.store offset=8
   (get_local $9)
   (i32.add
    (get_local $2)
    (get_local $7)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $9)
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=60
    (get_local $1)
   )
   (i64.const 0)
   (get_local $2)
   (get_local $7)
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_u
     (get_local $7)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $2)
   )
  )
  (block $label$4
   (br_if $label$4
    (i64.lt_u
     (get_local $3)
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
    (get_local $9)
    (i32.const 16)
   )
  )
 )
 (func $_ZN6ballot10countvotesERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE (type $FUNCSIG$vii) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 f64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i64)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $11)
    (i32.const 40)
   )
   (i32.const 0)
  )
  (i64.store offset=8
   (get_local $11)
   (i64.const 4153192298164781056)
  )
  (i64.store offset=24
   (get_local $11)
   (i64.const -1)
  )
  (i64.store offset=32
   (get_local $11)
   (i64.const 0)
  )
  (i64.store offset=16
   (get_local $11)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $8
   (call $_ZN5eosio9singletonILy14029723623707639808EN6ballot8SettingsEE3getEv
    (i32.add
     (get_local $11)
     (i32.const 8)
    )
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $6
      (i32.load offset=32
       (get_local $11)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $9
        (i32.load
         (tee_local $3
          (i32.add
           (get_local $11)
           (i32.const 36)
          )
         )
        )
       )
       (get_local $6)
      )
     )
     (loop $label$3
      (set_local $2
       (i32.load
        (tee_local $9
         (i32.add
          (get_local $9)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $9)
       (i32.const 0)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $2)
        )
       )
       (call $_ZdlPv
        (get_local $2)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $6)
        (get_local $9)
       )
      )
     )
     (set_local $9
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 32)
       )
      )
     )
     (br $label$1)
    )
    (set_local $9
     (get_local $6)
    )
   )
   (i32.store
    (get_local $3)
    (get_local $6)
   )
   (call $_ZdlPv
    (get_local $9)
   )
  )
  (call $require_auth
   (get_local $8)
  )
  (set_local $7
   (select
    (i32.load offset=8
     (get_local $1)
    )
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
    (tee_local $2
     (i32.and
      (tee_local $9
       (i32.load8_u
        (get_local $1)
       )
      )
      (i32.const 1)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (block $label$7
     (block $label$8
      (br_if $label$8
       (i32.lt_u
        (tee_local $3
         (select
          (i32.load offset=4
           (get_local $1)
          )
          (i32.shr_u
           (get_local $9)
           (i32.const 1)
          )
          (get_local $2)
         )
        )
        (i32.const 4)
       )
      )
      (set_local $6
       (get_local $3)
      )
      (set_local $9
       (get_local $7)
      )
      (set_local $2
       (get_local $3)
      )
      (loop $label$9
       (drop
        (call $memcpy
         (i32.add
          (get_local $11)
          (i32.const 8)
         )
         (get_local $9)
         (i32.const 4)
        )
       )
       (set_local $2
        (i32.xor
         (i32.mul
          (i32.xor
           (i32.shr_u
            (tee_local $1
             (i32.mul
              (i32.load offset=8
               (get_local $11)
              )
              (i32.const 1540483477)
             )
            )
            (i32.const 24)
           )
           (get_local $1)
          )
          (i32.const 1540483477)
         )
         (i32.mul
          (get_local $2)
          (i32.const 1540483477)
         )
        )
       )
       (set_local $9
        (i32.add
         (get_local $9)
         (i32.const 4)
        )
       )
       (br_if $label$9
        (i32.gt_u
         (tee_local $6
          (i32.add
           (get_local $6)
           (i32.const -4)
          )
         )
         (i32.const 3)
        )
       )
      )
      (set_local $7
       (i32.add
        (i32.add
         (get_local $7)
         (tee_local $6
          (i32.and
           (tee_local $9
            (i32.add
             (get_local $3)
             (i32.const -4)
            )
           )
           (i32.const -4)
          )
         )
        )
        (i32.const 4)
       )
      )
      (br_if $label$7
       (i32.ne
        (tee_local $3
         (i32.sub
          (get_local $9)
          (get_local $6)
         )
        )
        (i32.const 1)
       )
      )
      (br $label$6)
     )
     (set_local $2
      (get_local $3)
     )
     (br_if $label$6
      (i32.eq
       (get_local $3)
       (i32.const 1)
      )
     )
    )
    (block $label$10
     (br_if $label$10
      (i32.eq
       (get_local $3)
       (i32.const 2)
      )
     )
     (br_if $label$5
      (i32.ne
       (get_local $3)
       (i32.const 3)
      )
     )
     (set_local $2
      (i32.xor
       (i32.shl
        (i32.load8_u offset=2
         (get_local $7)
        )
        (i32.const 16)
       )
       (get_local $2)
      )
     )
    )
    (set_local $2
     (i32.xor
      (i32.shl
       (i32.load8_u offset=1
        (get_local $7)
       )
       (i32.const 8)
      )
      (get_local $2)
     )
    )
   )
   (set_local $2
    (i32.mul
     (i32.xor
      (i32.load8_u
       (get_local $7)
      )
      (get_local $2)
     )
     (i32.const 1540483477)
    )
   )
  )
  (set_local $8
   (i64.extend_u/i32
    (i32.xor
     (i32.shr_u
      (tee_local $9
       (i32.mul
        (i32.xor
         (i32.shr_u
          (get_local $2)
          (i32.const 13)
         )
         (get_local $2)
        )
        (i32.const 1540483477)
       )
      )
      (i32.const 15)
     )
     (get_local $9)
    )
   )
  )
  (block $label$11
   (br_if $label$11
    (i32.eq
     (tee_local $6
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 76)
       )
      )
     )
     (tee_local $3
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 72)
       )
      )
     )
    )
   )
   (set_local $9
    (i32.add
     (get_local $6)
     (i32.const -24)
    )
   )
   (set_local $1
    (i32.sub
     (i32.const 0)
     (get_local $3)
    )
   )
   (loop $label$12
    (br_if $label$11
     (i64.eq
      (i64.load
       (i32.load
        (get_local $9)
       )
      )
      (get_local $8)
     )
    )
    (set_local $6
     (get_local $9)
    )
    (set_local $9
     (tee_local $2
      (i32.add
       (get_local $9)
       (i32.const -24)
      )
     )
    )
    (br_if $label$12
     (i32.ne
      (i32.add
       (get_local $2)
       (get_local $1)
      )
      (i32.const -24)
     )
    )
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.const 48)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i32.eq
      (get_local $6)
      (get_local $3)
     )
    )
    (call $eosio_assert
     (i32.eq
      (i32.load offset=56
       (tee_local $6
        (i32.load
         (i32.add
          (get_local $6)
          (i32.const -24)
         )
        )
       )
      )
      (get_local $1)
     )
     (i32.const 128)
    )
    (br $label$13)
   )
   (set_local $6
    (i32.const 0)
   )
   (br_if $label$13
    (i32.lt_s
     (tee_local $9
      (call $db_find_i64
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 48)
        )
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 56)
        )
       )
       (i64.const -5915097263692054528)
       (get_local $8)
      )
     )
     (i32.const 0)
    )
   )
   (call $eosio_assert
    (i32.eq
     (i32.load offset=56
      (tee_local $6
       (call $_ZNK5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE31load_object_by_primary_iteratorEl
        (get_local $1)
        (get_local $9)
       )
      )
     )
     (get_local $1)
    )
    (i32.const 128)
   )
  )
  (call $eosio_assert
   (tee_local $3
    (i32.ne
     (get_local $6)
     (i32.const 0)
    )
   )
   (i32.const 1072)
  )
  (set_local $10
   (i64.const 0)
  )
  (set_local $8
   (i64.const 0)
  )
  (block $label$15
   (br_if $label$15
    (i32.eq
     (tee_local $9
      (i32.load offset=40
       (get_local $6)
      )
     )
     (tee_local $2
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 44)
       )
      )
     )
    )
   )
   (set_local $8
    (i64.const 0)
   )
   (loop $label$16
    (set_local $8
     (i64.add
      (i64.load
       (get_local $9)
      )
      (get_local $8)
     )
    )
    (br_if $label$16
     (i32.ne
      (get_local $2)
      (tee_local $9
       (i32.add
        (get_local $9)
        (i32.const 16)
       )
      )
     )
    )
   )
  )
  (call $prints
   (i32.const 1360)
  )
  (call $printui
   (get_local $8)
  )
  (call $prints
   (i32.const 1408)
  )
  (block $label$17
   (br_if $label$17
    (i32.lt_s
     (tee_local $9
      (call $db_lowerbound_i64
       (i64.load offset=8
        (get_local $0)
       )
       (i64.load
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i64.const -7880044397109182464)
       (i64.const 0)
      )
     )
     (i32.const 0)
    )
   )
   (set_local $10
    (i64.load offset=16
     (tee_local $9
      (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
       (tee_local $2
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
       (get_local $9)
      )
     )
    )
   )
   (call $eosio_assert
    (i32.const 1)
    (i32.const 688)
   )
   (br_if $label$17
    (i32.lt_s
     (tee_local $9
      (call $db_next_i64
       (i32.load offset=40
        (get_local $9)
       )
       (i32.add
        (get_local $11)
        (i32.const 8)
       )
      )
     )
     (i32.const 0)
    )
   )
   (loop $label$18
    (set_local $4
     (i64.load offset=16
      (tee_local $9
       (call $_ZNK5eosio11multi_indexILy10566699676600369152EN6ballot6MemberEJEE31load_object_by_primary_iteratorEl
        (get_local $2)
        (get_local $9)
       )
      )
     )
    )
    (call $eosio_assert
     (i32.const 1)
     (i32.const 688)
    )
    (set_local $10
     (i64.add
      (get_local $4)
      (get_local $10)
     )
    )
    (br_if $label$18
     (i32.ge_s
      (tee_local $9
       (call $db_next_i64
        (i32.load offset=40
         (get_local $9)
        )
        (i32.add
         (get_local $11)
         (i32.const 8)
        )
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (call $prints
   (i32.const 1424)
  )
  (call $printui
   (get_local $10)
  )
  (call $prints
   (i32.const 1408)
  )
  (call $prints
   (i32.const 1472)
  )
  (call $printdf
   (f64.const 0.75)
  )
  (call $prints
   (i32.const 1408)
  )
  (call $prints
   (i32.const 1504)
  )
  (call $printdf
   (tee_local $5
    (f64.mul
     (f64.convert_u/i64
      (get_local $10)
     )
     (f64.const 0.75)
    )
   )
  )
  (call $prints
   (i32.const 1408)
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 192)
  )
  (block $label$19
   (block $label$20
    (br_if $label$20
     (i32.eqz
      (f64.gt
       (f64.convert_u/i64
        (get_local $8)
       )
       (get_local $5)
      )
     )
    )
    (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_10countvotesERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_6EEvRKS2_yOT_
     (get_local $1)
     (get_local $6)
    )
    (call $prints
     (i32.const 1520)
    )
    (br $label$19)
   )
   (call $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_10countvotesERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_7EEvRKS2_yOT_
    (get_local $1)
    (get_local $6)
   )
   (call $prints
    (i32.const 1536)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_10countvotesERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_6EEvRKS2_yOT_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (i32.store8 offset=52
   (get_local $1)
   (i32.const 1)
  )
  (set_local $2
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 352)
  )
  (i32.store
   (tee_local $5
    (get_local $4)
   )
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $5)
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.lt_u
      (tee_local $3
       (i32.load
        (get_local $5)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $4
     (call $malloc
      (get_local $3)
     )
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
        (get_local $3)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (get_local $5)
   (get_local $4)
  )
  (i32.store
   (get_local $5)
   (get_local $4)
  )
  (i32.store offset=8
   (get_local $5)
   (i32.add
    (get_local $4)
    (get_local $3)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $5)
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=60
    (get_local $1)
   )
   (i64.const 0)
   (get_local $4)
   (get_local $3)
  )
  (block $label$2
   (br_if $label$2
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $4)
   )
  )
  (block $label$3
   (br_if $label$3
    (i64.lt_u
     (get_local $2)
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
      (get_local $2)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $2)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 16)
   )
  )
 )
 (func $_ZN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE6modifyIZNS1_10countvotesERKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3$_7EEvRKS2_yOT_ (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
  (call $eosio_assert
   (i32.eq
    (i32.load offset=56
     (get_local $1)
    )
    (get_local $0)
   )
   (i32.const 240)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (call $current_receiver)
   )
   (i32.const 288)
  )
  (i32.store8 offset=52
   (get_local $1)
   (i32.const 0)
  )
  (set_local $2
   (i64.load
    (get_local $1)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 352)
  )
  (i32.store
   (tee_local $5
    (get_local $4)
   )
   (i32.const 0)
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIjEEERT_S4_RKN6ballot8ProposalE
    (get_local $5)
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.lt_u
      (tee_local $3
       (i32.load
        (get_local $5)
       )
      )
      (i32.const 513)
     )
    )
    (set_local $4
     (call $malloc
      (get_local $3)
     )
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
        (get_local $3)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (get_local $5)
   (get_local $4)
  )
  (i32.store
   (get_local $5)
   (get_local $4)
  )
  (i32.store offset=8
   (get_local $5)
   (i32.add
    (get_local $4)
    (get_local $3)
   )
  )
  (drop
   (call $_ZlsIN5eosio10datastreamIPcEEERT_S5_RKN6ballot8ProposalE
    (get_local $5)
    (get_local $1)
   )
  )
  (call $db_update_i64
   (i32.load offset=60
    (get_local $1)
   )
   (i64.const 0)
   (get_local $4)
   (get_local $3)
  )
  (block $label$2
   (br_if $label$2
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $4)
   )
  )
  (block $label$3
   (br_if $label$3
    (i64.lt_u
     (get_local $2)
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
      (get_local $2)
      (i64.const 1)
     )
     (i64.gt_u
      (get_local $2)
      (i64.const -3)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 16)
   )
  )
 )
 (func $apply (param $0 i64) (param $1 i64) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 224)
    )
   )
  )
  (set_local $8
   (i64.const 0)
  )
  (set_local $7
   (i64.const 59)
  )
  (set_local $6
   (i32.const 1552)
  )
  (set_local $9
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
          (get_local $8)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $3
             (i32.load8_s
              (get_local $6)
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
       (set_local $10
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $8)
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
     (set_local $10
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
    (set_local $10
     (i64.shl
      (i64.and
       (get_local $10)
       (i64.const 31)
      )
      (i64.and
       (get_local $7)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $6
    (i32.add
     (get_local $6)
     (i32.const 1)
    )
   )
   (set_local $8
    (i64.add
     (get_local $8)
     (i64.const 1)
    )
   )
   (set_local $9
    (i64.or
     (get_local $10)
     (get_local $9)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $7
      (i64.add
       (get_local $7)
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
     (get_local $9)
     (get_local $2)
    )
   )
   (set_local $8
    (i64.const 0)
   )
   (set_local $7
    (i64.const 59)
   )
   (set_local $6
    (i32.const 1568)
   )
   (set_local $9
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
           (get_local $8)
           (i64.const 4)
          )
         )
         (br_if $label$11
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $3
              (i32.load8_s
               (get_local $6)
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
        (set_local $10
         (i64.const 0)
        )
        (br_if $label$9
         (i64.le_u
          (get_local $8)
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
      (set_local $10
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
     (set_local $10
      (i64.shl
       (i64.and
        (get_local $10)
        (i64.const 31)
       )
       (i64.and
        (get_local $7)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (i32.const 1)
     )
    )
    (set_local $8
     (i64.add
      (get_local $8)
      (i64.const 1)
     )
    )
    (set_local $9
     (i64.or
      (get_local $10)
      (get_local $9)
     )
    )
    (br_if $label$7
     (i64.ne
      (tee_local $7
       (i64.add
        (get_local $7)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (call $eosio_assert
    (i64.eq
     (get_local $9)
     (get_local $1)
    )
    (i32.const 1584)
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
    (set_local $8
     (i64.const 0)
    )
    (set_local $7
     (i64.const 59)
    )
    (set_local $6
     (i32.const 1552)
    )
    (set_local $9
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
            (get_local $8)
            (i64.const 6)
           )
          )
          (br_if $label$19
           (i32.gt_u
            (i32.and
             (i32.add
              (tee_local $3
               (i32.load8_s
                (get_local $6)
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
         (set_local $10
          (i64.const 0)
         )
         (br_if $label$17
          (i64.le_u
           (get_local $8)
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
       (set_local $10
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
      (set_local $10
       (i64.shl
        (i64.and
         (get_local $10)
         (i64.const 31)
        )
        (i64.and
         (get_local $7)
         (i64.const 4294967295)
        )
       )
      )
     )
     (set_local $6
      (i32.add
       (get_local $6)
       (i32.const 1)
      )
     )
     (set_local $8
      (i64.add
       (get_local $8)
       (i64.const 1)
      )
     )
     (set_local $9
      (i64.or
       (get_local $10)
       (get_local $9)
      )
     )
     (br_if $label$15
      (i64.ne
       (tee_local $7
        (i64.add
         (get_local $7)
         (i64.const -5)
        )
       )
       (i64.const -6)
      )
     )
    )
    (br_if $label$13
     (i64.ne
      (get_local $9)
      (get_local $2)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $11)
     (i32.const 152)
    )
    (get_local $0)
   )
   (i64.store
    (i32.add
     (get_local $11)
     (i32.const 160)
    )
    (i64.const -1)
   )
   (i64.store
    (i32.add
     (get_local $11)
     (i32.const 168)
    )
    (i64.const 0)
   )
   (i32.store
    (i32.add
     (get_local $11)
     (i32.const 176)
    )
    (i32.const 0)
   )
   (i64.store offset=144
    (get_local $11)
    (get_local $0)
   )
   (i64.store offset=136
    (get_local $11)
    (get_local $0)
   )
   (i64.store offset=184
    (get_local $11)
    (get_local $0)
   )
   (i64.store
    (i32.add
     (get_local $11)
     (i32.const 192)
    )
    (get_local $0)
   )
   (i64.store
    (i32.add
     (get_local $11)
     (i32.const 200)
    )
    (i64.const -1)
   )
   (i32.store
    (i32.add
     (get_local $11)
     (i32.const 208)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $11)
     (i32.const 212)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $11)
     (i32.const 216)
    )
    (i32.const 0)
   )
   (block $label$21
    (block $label$22
     (block $label$23
      (block $label$24
       (block $label$25
        (block $label$26
         (block $label$27
          (block $label$28
           (br_if $label$28
            (i64.gt_s
             (get_local $2)
             (i64.const 3626283120069181439)
            )
           )
           (br_if $label$27
            (i64.gt_s
             (get_local $2)
             (i64.const -4851649661222240257)
            )
           )
           (br_if $label$25
            (i64.eq
             (get_local $2)
             (i64.const -5915097261842366464)
            )
           )
           (br_if $label$21
            (i64.ne
             (get_local $2)
             (i64.const -4853568554919788544)
            )
           )
           (i32.store offset=116
            (get_local $11)
            (i32.const 0)
           )
           (i32.store offset=112
            (get_local $11)
            (i32.const 1)
           )
           (i64.store offset=24 align=4
            (get_local $11)
            (i64.load offset=112
             (get_local $11)
            )
           )
           (drop
            (call $_ZN5eosio14execute_actionI6ballotS1_JyEEEbPT_MT0_FvDpT1_E
             (i32.add
              (get_local $11)
              (i32.const 136)
             )
             (i32.add
              (get_local $11)
              (i32.const 24)
             )
            )
           )
           (br $label$21)
          )
          (br_if $label$26
           (i64.gt_s
            (get_local $2)
            (i64.const 4986959157855125503)
           )
          )
          (br_if $label$24
           (i64.eq
            (get_local $2)
            (i64.const 3626283120069181440)
           )
          )
          (br_if $label$21
           (i64.ne
            (get_local $2)
            (i64.const 3626447068991586304)
           )
          )
          (i32.store offset=92
           (get_local $11)
           (i32.const 0)
          )
          (i32.store offset=88
           (get_local $11)
           (i32.const 2)
          )
          (i64.store offset=48 align=4
           (get_local $11)
           (i64.load offset=88
            (get_local $11)
           )
          )
          (drop
           (call $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E
            (i32.add
             (get_local $11)
             (i32.const 136)
            )
            (i32.add
             (get_local $11)
             (i32.const 48)
            )
           )
          )
          (br $label$21)
         )
         (br_if $label$23
          (i64.eq
           (get_local $2)
           (i64.const -4851649661222240256)
          )
         )
         (br_if $label$21
          (i64.ne
           (get_local $2)
           (i64.const -4848322189402832896)
          )
         )
         (i32.store offset=84
          (get_local $11)
          (i32.const 0)
         )
         (i32.store offset=80
          (get_local $11)
          (i32.const 3)
         )
         (i64.store offset=56 align=4
          (get_local $11)
          (i64.load offset=80
           (get_local $11)
          )
         )
         (drop
          (call $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E
           (i32.add
            (get_local $11)
            (i32.const 136)
           )
           (i32.add
            (get_local $11)
            (i32.const 56)
           )
          )
         )
         (br $label$21)
        )
        (br_if $label$22
         (i64.eq
          (get_local $2)
          (i64.const 4986959157855125504)
         )
        )
        (br_if $label$21
         (i64.ne
          (get_local $2)
          (i64.const 8421045207927095296)
         )
        )
        (i32.store offset=132
         (get_local $11)
         (i32.const 0)
        )
        (i32.store offset=128
         (get_local $11)
         (i32.const 4)
        )
        (i64.store offset=8 align=4
         (get_local $11)
         (i64.load offset=128
          (get_local $11)
         )
        )
        (drop
         (call $_ZN5eosio14execute_actionI6ballotS1_JyEEEbPT_MT0_FvDpT1_E
          (i32.add
           (get_local $11)
           (i32.const 136)
          )
          (i32.add
           (get_local $11)
           (i32.const 8)
          )
         )
        )
        (br $label$21)
       )
       (i32.store offset=108
        (get_local $11)
        (i32.const 0)
       )
       (i32.store offset=104
        (get_local $11)
        (i32.const 5)
       )
       (i64.store offset=32 align=4
        (get_local $11)
        (i64.load offset=104
         (get_local $11)
        )
       )
       (drop
        (call $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEESA_EEEbPT_MT0_FvDpT1_E
         (i32.add
          (get_local $11)
          (i32.const 136)
         )
         (i32.add
          (get_local $11)
          (i32.const 32)
         )
        )
       )
       (br $label$21)
      )
      (i32.store offset=124
       (get_local $11)
       (i32.const 0)
      )
      (i32.store offset=120
       (get_local $11)
       (i32.const 6)
      )
      (i64.store offset=16 align=4
       (get_local $11)
       (i64.load offset=120
        (get_local $11)
       )
      )
      (drop
       (call $_ZN5eosio14execute_actionI6ballotS1_JyymbEEEbPT_MT0_FvDpT1_E
        (i32.add
         (get_local $11)
         (i32.const 136)
        )
        (i32.add
         (get_local $11)
         (i32.const 16)
        )
       )
      )
      (br $label$21)
     )
     (i32.store offset=100
      (get_local $11)
      (i32.const 0)
     )
     (i32.store offset=96
      (get_local $11)
      (i32.const 7)
     )
     (i64.store offset=40 align=4
      (get_local $11)
      (i64.load offset=96
       (get_local $11)
      )
     )
     (drop
      (call $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E
       (i32.add
        (get_local $11)
        (i32.const 136)
       )
       (i32.add
        (get_local $11)
        (i32.const 40)
       )
      )
     )
     (br $label$21)
    )
    (i32.store offset=76
     (get_local $11)
     (i32.const 0)
    )
    (i32.store offset=72
     (get_local $11)
     (i32.const 8)
    )
    (i64.store offset=64 align=4
     (get_local $11)
     (i64.load offset=72
      (get_local $11)
     )
    )
    (drop
     (call $_ZN5eosio14execute_actionI6ballotS1_JRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E
      (i32.add
       (get_local $11)
       (i32.const 136)
      )
      (i32.add
       (get_local $11)
       (i32.const 64)
      )
     )
    )
   )
   (drop
    (call $_ZNSt3__113__vector_baseIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrENS_9allocatorIS6_EEED2Ev
     (i32.add
      (get_local $11)
      (i32.const 208)
     )
    )
   )
   (br_if $label$13
    (i32.eqz
     (tee_local $4
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 168)
       )
      )
     )
    )
   )
   (block $label$29
    (block $label$30
     (br_if $label$30
      (i32.eq
       (tee_local $6
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $11)
           (i32.const 172)
          )
         )
        )
       )
       (get_local $4)
      )
     )
     (loop $label$31
      (set_local $3
       (i32.load
        (tee_local $6
         (i32.add
          (get_local $6)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $6)
       (i32.const 0)
      )
      (block $label$32
       (br_if $label$32
        (i32.eqz
         (get_local $3)
        )
       )
       (call $_ZdlPv
        (get_local $3)
       )
      )
      (br_if $label$31
       (i32.ne
        (get_local $4)
        (get_local $6)
       )
      )
     )
     (set_local $6
      (i32.load
       (i32.add
        (get_local $11)
        (i32.const 168)
       )
      )
     )
     (br $label$29)
    )
    (set_local $6
     (get_local $4)
    )
   )
   (i32.store
    (get_local $5)
    (get_local $4)
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 224)
   )
  )
 )
 (func $_ZN5eosio14execute_actionI6ballotS1_JyEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
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
   (i32.const 448)
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
 (func $_ZN5eosio14execute_actionI6ballotS1_JyymbEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (set_local $7
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
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
  (set_local $6
   (i32.load
    (get_local $1)
   )
  )
  (set_local $1
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
     (set_local $1
      (call $malloc
       (get_local $3)
      )
     )
     (br $label$1)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $1
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
     (get_local $1)
     (get_local $3)
    )
   )
  )
  (i64.store offset=16
   (get_local $7)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $7)
   (i64.const 0)
  )
  (i32.store offset=24
   (get_local $7)
   (i32.const 0)
  )
  (i32.store8 offset=28
   (get_local $7)
   (i32.const 0)
  )
  (i32.store offset=36
   (get_local $7)
   (get_local $1)
  )
  (i32.store offset=32
   (get_local $7)
   (get_local $1)
  )
  (i32.store offset=40
   (get_local $7)
   (i32.add
    (get_local $1)
    (get_local $3)
   )
  )
  (i32.store offset=48
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 32)
   )
  )
  (i32.store offset=56
   (get_local $7)
   (i32.add
    (get_local $7)
    (i32.const 8)
   )
  )
  (call $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyymbEEELi0EEEZN5eosiorsINSA_10datastreamIPKcEEJyymbEEERT_SH_RNS7_IJDpT0_EEEEUlSH_E_EEvRKSG_RKT0_
   (i32.add
    (get_local $7)
    (i32.const 56)
   )
   (i32.add
    (get_local $7)
    (i32.const 48)
   )
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $1)
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
  (set_local $3
   (i32.load8_u
    (i32.add
     (get_local $7)
     (i32.const 28)
    )
   )
  )
  (set_local $8
   (i32.load
    (i32.add
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i64.load
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
   )
  )
  (set_local $4
   (i64.load offset=8
    (get_local $7)
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $6
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $6)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vijjii)
   (get_local $1)
   (get_local $4)
   (get_local $5)
   (get_local $8)
   (i32.ne
    (i32.and
     (get_local $3)
     (i32.const 255)
    )
    (i32.const 0)
   )
   (get_local $6)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 64)
   )
  )
  (i32.const 1)
 )
 (func $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEESA_EEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (i32.store offset=44
   (tee_local $2
    (get_local $3)
   )
   (get_local $0)
  )
  (i32.store offset=32
   (get_local $2)
   (i32.load
    (get_local $1)
   )
  )
  (i32.store offset=36
   (get_local $2)
   (i32.load offset=4
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $0
         (call $action_data_size)
        )
       )
      )
      (br_if $label$2
       (i32.lt_u
        (get_local $0)
        (i32.const 513)
       )
      )
      (set_local $1
       (call $malloc
        (get_local $0)
       )
      )
      (br $label$1)
     )
     (set_local $1
      (i32.const 0)
     )
     (br $label$0)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $1
      (i32.sub
       (get_local $3)
       (i32.and
        (i32.add
         (get_local $0)
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
     (get_local $1)
     (get_local $0)
    )
   )
  )
  (i64.store
   (i32.add
    (get_local $2)
    (i32.const 16)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (get_local $2)
    (i32.const 24)
   )
   (i64.const 0)
  )
  (i64.store
   (get_local $2)
   (i64.const 0)
  )
  (i64.store offset=8
   (get_local $2)
   (i64.const 0)
  )
  (i32.store offset=56
   (get_local $2)
   (i32.add
    (get_local $1)
    (get_local $0)
   )
  )
  (i32.store offset=48
   (get_local $2)
   (get_local $1)
  )
  (call $eosio_assert
   (i32.gt_u
    (get_local $0)
    (i32.const 7)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (get_local $2)
    (get_local $1)
    (i32.const 8)
   )
  )
  (i32.store offset=52
   (get_local $2)
   (i32.add
    (get_local $1)
    (i32.const 8)
   )
  )
  (drop
   (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
    (i32.add
     (get_local $2)
     (i32.const 48)
    )
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
   )
  )
  (drop
   (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
    (i32.add
     (get_local $2)
     (i32.const 48)
    )
    (i32.add
     (get_local $2)
     (i32.const 20)
    )
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.lt_u
     (get_local $0)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $1)
   )
  )
  (i32.store offset=52
   (get_local $2)
   (i32.add
    (get_local $2)
    (i32.const 32)
   )
  )
  (i32.store offset=48
   (get_local $2)
   (i32.add
    (get_local $2)
    (i32.const 44)
   )
  )
  (call $_ZN5boost4mp116detail16tuple_apply_implIRZN5eosio14execute_actionI6ballotS5_JyRKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEESE_EEEbPT_MT0_FvDpT1_EEUlDpT_E_RNS6_5tupleIJySC_SC_EEEJLj0ELj1ELj2EEEEDTclclsr3stdE7forwardISF_Efp_Espclsr3stdE3getIXT1_EEclsr3stdE7forwardISH_Efp0_EEEEOSF_OSH_NS0_16integer_sequenceIjJXspT1_EEEE
   (i32.add
    (get_local $2)
    (i32.const 48)
   )
   (get_local $2)
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (i32.and
      (i32.load8_u offset=20
       (get_local $2)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load
     (i32.add
      (get_local $2)
      (i32.const 28)
     )
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i32.eqz
     (i32.and
      (i32.load8_u offset=8
       (get_local $2)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load
     (i32.add
      (get_local $2)
      (i32.const 16)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $2)
    (i32.const 64)
   )
  )
  (i32.const 1)
 )
 (func $_ZN5eosio14execute_actionI6ballotS1_JyRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (set_local $6
   (tee_local $7
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
   (get_local $7)
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
  (set_local $1
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
     (set_local $1
      (call $malloc
       (get_local $3)
      )
     )
     (br $label$1)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $1
      (i32.sub
       (get_local $7)
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
     (get_local $1)
     (get_local $3)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $6)
    (i32.const 24)
   )
   (i32.const 0)
  )
  (i64.store offset=8
   (get_local $6)
   (i64.const 0)
  )
  (i64.store offset=16
   (get_local $6)
   (i64.const 0)
  )
  (i32.store offset=40
   (get_local $6)
   (i32.add
    (get_local $1)
    (get_local $3)
   )
  )
  (i32.store offset=32
   (get_local $6)
   (get_local $1)
  )
  (call $eosio_assert
   (i32.gt_u
    (get_local $3)
    (i32.const 7)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const 8)
    )
    (get_local $1)
    (i32.const 8)
   )
  )
  (i32.store offset=36
   (get_local $6)
   (i32.add
    (get_local $1)
    (i32.const 8)
   )
  )
  (drop
   (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
    (i32.add
     (get_local $6)
     (i32.const 32)
    )
    (tee_local $7
     (i32.add
      (i32.add
       (get_local $6)
       (i32.const 8)
      )
      (i32.const 8)
     )
    )
   )
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $1)
   )
  )
  (set_local $4
   (i64.load offset=8
    (get_local $6)
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
    (i32.add
     (get_local $6)
     (i32.const 32)
    )
    (get_local $7)
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
  (block $label$4
   (br_if $label$4
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
  (call_indirect (type $FUNCSIG$viji)
   (get_local $1)
   (get_local $4)
   (i32.add
    (get_local $6)
    (i32.const 32)
   )
   (get_local $5)
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (i32.and
      (i32.load8_u offset=32
       (get_local $6)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load offset=40
     (get_local $6)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i32.eqz
     (i32.and
      (i32.load8_u offset=16
       (get_local $6)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load
     (i32.add
      (get_local $6)
      (i32.const 24)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 48)
   )
  )
  (i32.const 1)
 )
 (func $_ZN5eosio14execute_actionI6ballotS1_JRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $5
   (tee_local $6
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $6)
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $4
   (i32.load
    (get_local $1)
   )
  )
  (set_local $1
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
     (set_local $1
      (call $malloc
       (get_local $3)
      )
     )
     (br $label$1)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $1
      (i32.sub
       (get_local $6)
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
     (get_local $1)
     (get_local $3)
    )
   )
  )
  (i32.store offset=8
   (get_local $5)
   (i32.const 0)
  )
  (i64.store
   (get_local $5)
   (i64.const 0)
  )
  (i32.store offset=20
   (get_local $5)
   (get_local $1)
  )
  (i32.store offset=16
   (get_local $5)
   (get_local $1)
  )
  (i32.store offset=24
   (get_local $5)
   (i32.add
    (get_local $1)
    (get_local $3)
   )
  )
  (drop
   (call $_ZN5eosiorsINS_10datastreamIPKcEEEERT_S6_RNSt3__112basic_stringIcNS7_11char_traitsIcEENS7_9allocatorIcEEEE
    (i32.add
     (get_local $5)
     (i32.const 16)
    )
    (get_local $5)
   )
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $1)
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
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
    (i32.add
     (get_local $5)
     (i32.const 16)
    )
    (get_local $5)
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $4
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $4)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vii)
   (get_local $1)
   (i32.add
    (get_local $5)
    (i32.const 16)
   )
   (get_local $4)
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (i32.and
      (i32.load8_u offset=16
       (get_local $5)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load offset=24
     (get_local $5)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i32.eqz
     (i32.and
      (i32.load8_u
       (get_local $5)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load
     (i32.add
      (get_local $5)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $5)
    (i32.const 32)
   )
  )
  (i32.const 1)
 )
 (func $_ZNSt3__113__vector_baseIN5eosio11multi_indexILy12531646810017497088EN6ballot8ProposalEJEE8item_ptrENS_9allocatorIS6_EEED2Ev (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $1
      (i32.load
       (get_local $0)
      )
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $4
        (i32.load offset=4
         (get_local $0)
        )
       )
       (get_local $1)
      )
     )
     (loop $label$3
      (set_local $2
       (i32.load
        (tee_local $4
         (i32.add
          (get_local $4)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $4)
       (i32.const 0)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (get_local $2)
        )
       )
       (block $label$5
        (br_if $label$5
         (i32.eqz
          (tee_local $3
           (i32.load offset=40
            (get_local $2)
           )
          )
         )
        )
        (i32.store
         (i32.add
          (get_local $2)
          (i32.const 44)
         )
         (get_local $3)
        )
        (call $_ZdlPv
         (get_local $3)
        )
       )
       (block $label$6
        (br_if $label$6
         (i32.eqz
          (i32.and
           (i32.load8_u offset=28
            (get_local $2)
           )
           (i32.const 1)
          )
         )
        )
        (call $_ZdlPv
         (i32.load
          (i32.add
           (get_local $2)
           (i32.const 36)
          )
         )
        )
       )
       (block $label$7
        (br_if $label$7
         (i32.eqz
          (i32.and
           (i32.load8_u offset=16
            (get_local $2)
           )
           (i32.const 1)
          )
         )
        )
        (call $_ZdlPv
         (i32.load
          (i32.add
           (get_local $2)
           (i32.const 24)
          )
         )
        )
       )
       (call $_ZdlPv
        (get_local $2)
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $1)
        (get_local $4)
       )
      )
     )
     (set_local $2
      (i32.load
       (get_local $0)
      )
     )
     (br $label$1)
    )
    (set_local $2
     (get_local $1)
    )
   )
   (i32.store
    (i32.add
     (get_local $0)
     (i32.const 4)
    )
    (get_local $1)
   )
   (call $_ZdlPv
    (get_local $2)
   )
  )
  (get_local $0)
 )
 (func $_ZN5boost4mp116detail16tuple_apply_implIRZN5eosio14execute_actionI6ballotS5_JyRKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEESE_EEEbPT_MT0_FvDpT1_EEUlDpT_E_RNS6_5tupleIJySC_SC_EEEJLj0ELj1ELj2EEEEDTclclsr3stdE7forwardISF_Efp_Espclsr3stdE3getIXT1_EEclsr3stdE7forwardISH_Efp0_EEEEOSF_OSH_NS0_16integer_sequenceIjJXspT1_EEEE (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (set_local $2
   (i64.load
    (get_local $1)
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
    (i32.add
     (get_local $4)
     (i32.const 16)
    )
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
    (get_local $4)
    (i32.add
     (get_local $1)
     (i32.const 20)
    )
   )
  )
  (set_local $0
   (i32.add
    (i32.load
     (i32.load
      (get_local $0)
     )
    )
    (i32.shr_s
     (tee_local $3
      (i32.load offset=4
       (tee_local $1
        (i32.load offset=4
         (get_local $0)
        )
       )
      )
     )
     (i32.const 1)
    )
   )
  )
  (set_local $1
   (i32.load
    (get_local $1)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (i32.and
      (get_local $3)
      (i32.const 1)
     )
    )
   )
   (set_local $1
    (i32.load
     (i32.add
      (i32.load
       (get_local $0)
      )
      (get_local $1)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vijii)
   (get_local $0)
   (get_local $2)
   (i32.add
    (get_local $4)
    (i32.const 16)
   )
   (get_local $4)
   (get_local $1)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load8_u
       (get_local $4)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load offset=8
     (get_local $4)
    )
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.eqz
     (i32.and
      (i32.load8_u offset=16
       (get_local $4)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load offset=24
     (get_local $4)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyymbEEELi0EEEZN5eosiorsINSA_10datastreamIPKcEEJyymbEEERT_SH_RNS7_IJDpT0_EEEEUlSH_E_EEvRKSG_RKT0_ (param $0 i32) (param $1 i32)
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
  (set_local $3
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $2
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $2)
     )
    )
    (i32.const 7)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (get_local $3)
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (i32.add
    (i32.load offset=4
     (get_local $2)
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
      (tee_local $2
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $2)
     )
    )
    (i32.const 7)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (i32.add
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $2
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $2)
     )
    )
    (i32.const 3)
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (i32.add
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.ne
    (i32.load offset=8
     (tee_local $1
      (i32.load
       (get_local $1)
      )
     )
    )
    (i32.load offset=4
     (get_local $1)
    )
   )
   (i32.const 448)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $4)
     (i32.const 15)
    )
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $1)
   (i32.add
    (i32.load offset=4
     (get_local $1)
    )
    (i32.const 1)
   )
  )
  (i32.store8 offset=20
   (get_local $0)
   (i32.ne
    (i32.load8_u offset=15
     (get_local $4)
    )
    (i32.const 0)
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
   (i32.const 1648)
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
       (i32.const 10048)
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
      (i32.load8_u offset=10134
       (i32.const 0)
      )
     )
    )
    (set_local $7
     (i32.load offset=10136
      (i32.const 0)
     )
    )
    (br $label$0)
   )
   (set_local $7
    (current_memory)
   )
   (i32.store8 offset=10134
    (i32.const 0)
    (i32.const 1)
   )
   (i32.store offset=10136
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
       (i32.load offset=10136
        (i32.const 0)
       )
      )
     )
     (set_local $8
      (i32.const 0)
     )
     (i32.store offset=10136
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
       (i32.load8_u offset=10134
        (i32.const 0)
       )
      )
      (set_local $3
       (current_memory)
      )
      (i32.store8 offset=10134
       (i32.const 0)
       (i32.const 1)
      )
      (i32.store offset=10136
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
       (i32.load offset=10136
        (i32.const 0)
       )
      )
     )
     (i32.store offset=10136
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
       (i32.load offset=10032
        (i32.const 0)
       )
      )
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.const 9840)
    )
    (set_local $1
     (i32.add
      (i32.mul
       (get_local $2)
       (i32.const 12)
      )
      (i32.const 9840)
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
       (i32.load offset=10140
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
 (func $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv (param $0 i32)
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_ (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.eq
        (get_local $0)
        (get_local $1)
       )
      )
      (set_local $2
       (select
        (i32.load offset=4
         (get_local $1)
        )
        (i32.shr_u
         (tee_local $2
          (i32.load8_u
           (get_local $1)
          )
         )
         (i32.const 1)
        )
        (tee_local $4
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
        )
       )
      )
      (set_local $5
       (i32.add
        (get_local $1)
        (i32.const 1)
       )
      )
      (set_local $6
       (i32.load offset=8
        (get_local $1)
       )
      )
      (set_local $1
       (i32.const 10)
      )
      (block $label$4
       (br_if $label$4
        (i32.eqz
         (i32.and
          (tee_local $3
           (i32.load8_u
            (get_local $0)
           )
          )
          (i32.const 1)
         )
        )
       )
       (set_local $1
        (i32.add
         (i32.and
          (tee_local $3
           (i32.load
            (get_local $0)
           )
          )
          (i32.const -2)
         )
         (i32.const -1)
        )
       )
      )
      (set_local $5
       (select
        (get_local $6)
        (get_local $5)
        (get_local $4)
       )
      )
      (set_local $4
       (i32.and
        (get_local $3)
        (i32.const 1)
       )
      )
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i32.le_u
           (get_local $2)
           (get_local $1)
          )
         )
         (br_if $label$6
          (get_local $4)
         )
         (set_local $3
          (i32.shr_u
           (i32.and
            (get_local $3)
            (i32.const 254)
           )
           (i32.const 1)
          )
         )
         (br $label$5)
        )
        (br_if $label$2
         (get_local $4)
        )
        (set_local $1
         (i32.add
          (get_local $0)
          (i32.const 1)
         )
        )
        (br_if $label$1
         (get_local $2)
        )
        (br $label$0)
       )
       (set_local $3
        (i32.load offset=4
         (get_local $0)
        )
       )
      )
      (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__grow_by_and_replaceEjjjjjjPKc
       (get_local $0)
       (get_local $1)
       (i32.sub
        (get_local $2)
        (get_local $1)
       )
       (get_local $3)
       (i32.const 0)
       (get_local $3)
       (get_local $2)
       (get_local $5)
      )
     )
     (return
      (get_local $0)
     )
    )
    (set_local $1
     (i32.load offset=8
      (get_local $0)
     )
    )
    (br_if $label$0
     (i32.eqz
      (get_local $2)
     )
    )
   )
   (drop
    (call $memmove
     (get_local $1)
     (get_local $5)
     (get_local $2)
    )
   )
  )
  (i32.store8
   (i32.add
    (get_local $1)
    (get_local $2)
   )
   (i32.const 0)
  )
  (block $label$8
   (br_if $label$8
    (i32.and
     (i32.load8_u
      (get_local $0)
     )
     (i32.const 1)
    )
   )
   (i32.store8
    (get_local $0)
    (i32.shl
     (get_local $2)
     (i32.const 1)
    )
   )
   (return
    (get_local $0)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (get_local $2)
  )
  (get_local $0)
 )
 (func $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__grow_by_and_replaceEjjjjjjPKc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_u
     (i32.sub
      (i32.const -18)
      (get_local $1)
     )
     (get_local $2)
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.and
       (i32.load8_u
        (get_local $0)
       )
       (i32.const 1)
      )
     )
     (set_local $9
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (br $label$1)
    )
    (set_local $9
     (i32.load offset=8
      (get_local $0)
     )
    )
   )
   (set_local $10
    (i32.const -17)
   )
   (block $label$3
    (br_if $label$3
     (i32.gt_u
      (get_local $1)
      (i32.const 2147483622)
     )
    )
    (set_local $10
     (i32.const 11)
    )
    (br_if $label$3
     (i32.lt_u
      (tee_local $2
       (select
        (tee_local $8
         (i32.shl
          (get_local $1)
          (i32.const 1)
         )
        )
        (tee_local $2
         (i32.add
          (get_local $2)
          (get_local $1)
         )
        )
        (i32.lt_u
         (get_local $2)
         (get_local $8)
        )
       )
      )
      (i32.const 11)
     )
    )
    (set_local $10
     (i32.and
      (i32.add
       (get_local $2)
       (i32.const 16)
      )
      (i32.const -16)
     )
    )
   )
   (set_local $2
    (call $_Znwj
     (get_local $10)
    )
   )
   (block $label$4
    (br_if $label$4
     (i32.eqz
      (get_local $4)
     )
    )
    (drop
     (call $memcpy
      (get_local $2)
      (get_local $9)
      (get_local $4)
     )
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.eqz
      (get_local $6)
     )
    )
    (drop
     (call $memcpy
      (i32.add
       (get_local $2)
       (get_local $4)
      )
      (get_local $7)
      (get_local $6)
     )
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.eqz
      (tee_local $7
       (i32.sub
        (tee_local $3
         (i32.sub
          (get_local $3)
          (get_local $5)
         )
        )
        (get_local $4)
       )
      )
     )
    )
    (drop
     (call $memcpy
      (i32.add
       (i32.add
        (get_local $2)
        (get_local $4)
       )
       (get_local $6)
      )
      (i32.add
       (i32.add
        (get_local $9)
        (get_local $4)
       )
       (get_local $5)
      )
      (get_local $7)
     )
    )
   )
   (block $label$7
    (br_if $label$7
     (i32.eq
      (get_local $1)
      (i32.const 10)
     )
    )
    (call $_ZdlPv
     (get_local $9)
    )
   )
   (i32.store offset=8
    (get_local $0)
    (get_local $2)
   )
   (i32.store
    (get_local $0)
    (i32.or
     (get_local $10)
     (i32.const 1)
    )
   )
   (i32.store offset=4
    (get_local $0)
    (tee_local $4
     (i32.add
      (get_local $3)
      (get_local $6)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $2)
     (get_local $4)
    )
    (i32.const 0)
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (br_if $label$0
    (i32.ge_u
     (get_local $1)
     (i32.const -16)
    )
   )
   (set_local $2
    (i32.const 10)
   )
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (i32.and
       (tee_local $5
        (i32.load8_u
         (get_local $0)
        )
       )
       (i32.const 1)
      )
     )
    )
    (set_local $2
     (i32.add
      (i32.and
       (tee_local $5
        (i32.load
         (get_local $0)
        )
       )
       (i32.const -2)
      )
      (i32.const -1)
     )
    )
   )
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.and
       (get_local $5)
       (i32.const 1)
      )
     )
     (set_local $3
      (i32.shr_u
       (i32.and
        (get_local $5)
        (i32.const 254)
       )
       (i32.const 1)
      )
     )
     (br $label$2)
    )
    (set_local $3
     (i32.load offset=4
      (get_local $0)
     )
    )
   )
   (set_local $4
    (i32.const 10)
   )
   (block $label$4
    (br_if $label$4
     (i32.lt_u
      (tee_local $1
       (select
        (get_local $3)
        (get_local $1)
        (i32.gt_u
         (get_local $3)
         (get_local $1)
        )
       )
      )
      (i32.const 11)
     )
    )
    (set_local $4
     (i32.add
      (i32.and
       (i32.add
        (get_local $1)
        (i32.const 16)
       )
       (i32.const -16)
      )
      (i32.const -1)
     )
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.eq
      (get_local $4)
      (get_local $2)
     )
    )
    (block $label$6
     (block $label$7
      (br_if $label$7
       (i32.ne
        (get_local $4)
        (i32.const 10)
       )
      )
      (set_local $6
       (i32.const 1)
      )
      (set_local $1
       (i32.add
        (get_local $0)
        (i32.const 1)
       )
      )
      (set_local $2
       (i32.load offset=8
        (get_local $0)
       )
      )
      (set_local $7
       (i32.const 0)
      )
      (br $label$6)
     )
     (set_local $1
      (call $_Znwj
       (i32.add
        (get_local $4)
        (i32.const 1)
       )
      )
     )
     (block $label$8
      (br_if $label$8
       (i32.gt_u
        (get_local $4)
        (get_local $2)
       )
      )
      (br_if $label$5
       (i32.eqz
        (get_local $1)
       )
      )
     )
     (block $label$9
      (br_if $label$9
       (i32.and
        (tee_local $5
         (i32.load8_u
          (get_local $0)
         )
        )
        (i32.const 1)
       )
      )
      (set_local $7
       (i32.const 1)
      )
      (set_local $2
       (i32.add
        (get_local $0)
        (i32.const 1)
       )
      )
      (set_local $6
       (i32.const 0)
      )
      (br $label$6)
     )
     (set_local $2
      (i32.load offset=8
       (get_local $0)
      )
     )
     (set_local $6
      (i32.const 1)
     )
     (set_local $7
      (i32.const 1)
     )
    )
    (block $label$10
     (block $label$11
      (br_if $label$11
       (i32.and
        (get_local $5)
        (i32.const 1)
       )
      )
      (set_local $5
       (i32.shr_u
        (i32.and
         (get_local $5)
         (i32.const 254)
        )
        (i32.const 1)
       )
      )
      (br $label$10)
     )
     (set_local $5
      (i32.load offset=4
       (get_local $0)
      )
     )
    )
    (block $label$12
     (br_if $label$12
      (i32.eqz
       (tee_local $5
        (i32.add
         (get_local $5)
         (i32.const 1)
        )
       )
      )
     )
     (drop
      (call $memcpy
       (get_local $1)
       (get_local $2)
       (get_local $5)
      )
     )
    )
    (block $label$13
     (br_if $label$13
      (i32.eqz
       (get_local $6)
      )
     )
     (call $_ZdlPv
      (get_local $2)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.eqz
       (get_local $7)
      )
     )
     (i32.store offset=4
      (get_local $0)
      (get_local $3)
     )
     (i32.store offset=8
      (get_local $0)
      (get_local $1)
     )
     (i32.store
      (get_local $0)
      (i32.or
       (i32.add
        (get_local $4)
        (i32.const 1)
       )
       (i32.const 1)
      )
     )
     (return)
    )
    (i32.store8
     (get_local $0)
     (i32.shl
      (get_local $3)
      (i32.const 1)
     )
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv (param $0 i32)
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_ (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i64.store align=4
   (get_local $0)
   (i64.const 0)
  )
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.and
     (i32.load8_u
      (get_local $1)
     )
     (i32.const 1)
    )
   )
   (i64.store align=4
    (get_local $0)
    (i64.load align=4
     (get_local $1)
    )
   )
   (i32.store
    (get_local $3)
    (i32.load
     (i32.add
      (get_local $1)
      (i32.const 8)
     )
    )
   )
   (return
    (get_local $0)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ge_u
     (tee_local $3
      (i32.load offset=4
       (get_local $1)
      )
     )
     (i32.const -16)
    )
   )
   (set_local $2
    (i32.load offset=8
     (get_local $1)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.ge_u
        (get_local $3)
        (i32.const 11)
       )
      )
      (i32.store8
       (get_local $0)
       (i32.shl
        (get_local $3)
        (i32.const 1)
       )
      )
      (set_local $1
       (i32.add
        (get_local $0)
        (i32.const 1)
       )
      )
      (br_if $label$3
       (get_local $3)
      )
      (br $label$2)
     )
     (set_local $1
      (call $_Znwj
       (tee_local $4
        (i32.and
         (i32.add
          (get_local $3)
          (i32.const 16)
         )
         (i32.const -16)
        )
       )
      )
     )
     (i32.store
      (get_local $0)
      (i32.or
       (get_local $4)
       (i32.const 1)
      )
     )
     (i32.store offset=8
      (get_local $0)
      (get_local $1)
     )
     (i32.store offset=4
      (get_local $0)
      (get_local $3)
     )
    )
    (drop
     (call $memcpy
      (get_local $1)
      (get_local $2)
      (get_local $3)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $1)
     (get_local $3)
    )
    (i32.const 0)
   )
   (return
    (get_local $0)
   )
  )
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
