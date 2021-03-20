#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
The module provides simulation of import function.
"""
import bin_format
import utils
from global_variables import global_vars
import logger
import number
import z3
from random import randint
from runtime import Value, GlobalInstance
from bug_analyzer import check_block_dependence_dynamic
from bug_analyzer import check_reentrancy_bug



def get_generator():
    """A generator for symbolic variable generating.

    Returns:
        Generator: A generator.
    """
    cur = 0
    while True:
        yield cur
        cur += 1


class EosEmulator:
    """A emulator of library functions of EOS.IO blockchain platform.
    """
    counter = get_generator()

    def __init__(self):
        pass

    # Assert function
    @classmethod
    def assert_recover_key(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def assert_sha256(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def assert_sha1(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def assert_sha512(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def assert_ripemd160(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def eosio_assert(cls, ctx, args):
        expression = args[0]
        ctx.solver.add(expression == 1)

    @classmethod
    def eosio_assert_message(cls, ctx, args):
        cls.eosio_assert(cls, ctx, args)

    @classmethod
    def eosio_assert_code(cls, ctx, args):
        cls.eosio_assert(cls, ctx, args)

    @classmethod
    def eosio_exit(cls, ctx, args):
        ctx.solver.add(0 == 1)  # add a false expression to pruning

    @classmethod
    def abort(cls, ctx, args):
        cls.eosio_assert(cls, ctx, [0, 'abort()'])

    # No effect function
    @classmethod
    def checktime(cls, ctx, args):
        pass

    @classmethod
    def prints(cls, ctx, args):
        pass

    @classmethod
    def prints_l(cls, ctx, args):
        pass

    @classmethod
    def printi(cls, ctx, args):
        pass

    @classmethod
    def printui(cls, ctx, args):
        pass

    @classmethod
    def printi128(cls, ctx, args):
        pass

    @classmethod
    def printui128(cls, ctx, args):
        pass

    @classmethod
    def printsf(cls, ctx, args):
        pass

    @classmethod
    def printdf(cls, ctx, args):
        pass

    @classmethod
    def printqf(cls, ctx, args):
        pass

    @classmethod
    def printn(cls, ctx, args):
        pass

    @classmethod
    def printhex(cls, ctx, args):
        pass

    @classmethod
    def set_resource_limits(cls, ctx, args):
        pass

    @classmethod
    def set_blockchain_parameters_packed(cls, ctx, args):
        pass

    @classmethod
    def set_privileged(cls, ctx, args):
        pass

    @classmethod
    def preactivate_feature(cls, ctx, args):
        pass

    @classmethod
    def is_feature_active(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'is_feature_active_{next(cls.counter)}')

    @classmethod
    def is_privileged(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'is_privileged_{next(cls.counter)}')

    @classmethod
    def transaction_size(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'transaction_size_{next(cls.counter)}')

    @classmethod
    def expiration(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'expiration_{next(cls.counter)}')

    @classmethod
    def tapos_block_num(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'tapos_block_num_{next(cls.counter)}')

    @classmethod
    def tapos_block_prefix(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'tapos_block_prefix_{next(cls.counter)}')

    @classmethod
    def get_permission_last_used(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'get_permission_last_used_{next(cls.counter)}')

    @classmethod
    def get_account_creation_time(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'get_account_creation_time_{next(cls.counter)}')

    @classmethod
    def current_time(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'current_time_{next(cls.counter)}')

    @classmethod
    def publication_time(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'publication_time_{next(cls.counter)}')

    @classmethod
    def is_feature_activated(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'is_feature_activated_{next(cls.counter)}')

    @classmethod
    def get_sender(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'get_sender_{next(cls.counter)}')

    @classmethod
    def action_data_size(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'action_data_size_{next(cls.counter)}')

    @classmethod
    def current_receiver(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'current_receiver_{next(cls.counter)}')

    @classmethod
    def has_auth(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'has_auth_{next(cls.counter)}')

    @classmethod
    def is_account(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'is_account_{next(cls.counter)}')

    @classmethod
    def cancel_deferred(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'cancel_deferred_{next(cls.counter)}')

    @classmethod
    def memcmp(cls, ctx, args):
        # [TODO] side effect
        return utils.gen_symbolic_value(bin_format.i32, f'memcmp_{next(cls.counter)}')

    @classmethod
    def set_proposed_producers(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'set_proposed_producers_{next(cls.counter)}')

    @classmethod
    def set_proposed_producers_ex(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'set_proposed_producers_ex_{next(cls.counter)}')

    @classmethod
    def get_blockchain_parameters_packed(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'get_blockchain_parameters_packed_{next(cls.counter)}')

    @classmethod
    def get_active_producers(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i64, f'get_active_producers_{next(cls.counter)}')

    # Computation functions
    @classmethod
    def ashlti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def ashrti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def lshlti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def lshrti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def divti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def udivti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def modti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def umodti3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def multi3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def addtf3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def subtf3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def multf3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def divtf3(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def eqtf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def netf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def getf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def gttf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def lttf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def letf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def cmptf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def unordtf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def negtf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatsitf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatunsitf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatditf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatunditf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floattidf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatuntidf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def floatsidf(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def extendsftf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def extenddftf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixtfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixtfdi(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixtfsi(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixunstfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixunstfdi(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixunstfsi(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixsfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixdfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixunssfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def fixunsdfti(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def trunctfdf2(cls, ctx, args):
        # if utils.is_all_real(args):
        #     return int(bin(args[0]) + bin(args[1])[2:], base=2)
        # args = [utils.to_symbolic(arg, 64) for arg in args]
        # z3.Concat(*args)
        pass

    @classmethod
    def trunctfsf2(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def sha1(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def sha256(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def sha512(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def ripemd160(cls, ctx, args):
        # [TODO] Implement
        pass

    # Data writing functions
    @classmethod
    def get_resource_limits(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def read_action_data(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def read_transaction(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def get_action(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def get_context_free_data(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def memcpy(cls, ctx, args):
        # [TODO] Implement
        pass

    @classmethod
    def memmove(cls, ctx, args):
        # [TODO]
        pass

    @classmethod
    def memset(cls, ctx, args):
        # [TODO]
        pass

    # Permission function
    @classmethod
    def check_transaction_authorization(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'check_transaction_authorization_{next(cls.counter)}')

    @classmethod
    def check_permission_authorization(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'check_permission_authorization_{next(cls.counter)}')

    @classmethod
    def require_auth(cls, ctx, args):
        pass

    @classmethod
    def require_auth2(cls, ctx, args):
        pass

    # Other
    @classmethod
    def activate_feature(cls, ctx, args):
        cls.eosio_assert(cls, ctx, [0])

    @classmethod
    def db_store_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_store_i64_{next(cls.counter)}')

    @classmethod
    def db_update_i64(cls, ctx, args):
        pass

    @classmethod
    def db_remove_i64(cls, ctx, args):
        pass

    @classmethod
    def db_get_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_get_i64_{next(cls.counter)}')

    @classmethod
    def db_next_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_next_i64_{next(cls.counter)}')

    @classmethod
    def db_previous_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_previous_i64_{next(cls.counter)}')

    @classmethod
    def db_find_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_find_i64_{next(cls.counter)}')

    @classmethod
    def db_lowerbound_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_lowerbound_i64_{next(cls.counter)}')

    @classmethod
    def db_upperbound_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_upperbound_i64_{next(cls.counter)}')

    @classmethod
    def db_end_i64(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'db_end_i64_{next(cls.counter)}')

    @classmethod
    def recover_key(cls, ctx, args):
        return utils.gen_symbolic_value(bin_format.i32, f'recover_key_{next(cls.counter)}')

    @classmethod
    def require_recipient(cls, ctx, args):
        pass

    @classmethod
    def send_inline(cls, ctx, args):
        pass

    @classmethod
    def send_context_free_inline(cls, ctx, args):
        pass

    @classmethod
    def send_deferred(cls, ctx, args):
        pass


class EthereumEmulator:
    """A emulator of library functions of Ethereum Wasm blockchain platform.
    """

    counter = get_generator()

    def __init__(self):
        pass

    @classmethod
    def useGas(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def getAddress(cls, args, solver, memory):
        return []

    @classmethod
    def getExternalBalance(cls, args, solver, memory):
        # 0.7.5 solc has bug in this function
        # address = args[0].n
        address = 32
        result = args[1].n
        for i in range(4):
            v = utils.gen_symbolic_value(bin_format.i64, f'getExternalBalance_{global_vars.num_getExternalBalance}')
            memory.data[address:address + 8] = number.MemoryStore.pack_i64(v)
            global_vars.add_num_getExternalBalance()
            address += 8
        return []

    @classmethod
    def getBlockHash(cls, args, solver, memory):
        pass

    @classmethod
    def call(cls, args, solver, memory):
        r = global_vars.add_flag_num_host()
        r = utils.gen_symbolic_value(bin_format.i32, f'call_{r}')
        global_vars.call_symbolic_ret[f'{r}'] = global_vars.cur_sum_pc
        logger.infoln(f'save eth.call and cur_sum_pc{global_vars.call_symbolic_ret}')
        check_block_dependence_dynamic(solver)
        check_reentrancy_bug(memory, solver)
        return r

    @classmethod
    def callDataCopy(cls, args, solver, memory):
        address = args[0].n
        # [TODO] Really simulate callDataCopy, such as setting several symbol values for callDataCopy, 
        # and setting the offset according to the offset required by the contract, etc.
        for i in range(4):
            v = utils.gen_symbolic_value(bin_format.i64, f'callDataCopy_{global_vars.num_callDataCopy}')
            memory.data[address:address + 8] = number.MemoryStore.pack_i64(v)
            global_vars.add_num_callDataCopy()
            address += 8
        return []

    @classmethod
    def getCallDataSize(cls, args, solver, memory):
        global_vars.add_flag_getCallDataSize()
        if len(solver.units()) > 1:
            r = randint(68, 999)
            return r
        else:
            r = utils.gen_symbolic_value(bin_format.i32, f'getCallDataSize_{global_vars.flag_getCallDataSize}')
            return r

    @classmethod
    def callCode(cls, args, solver, memory):
        pass

    @classmethod
    def callDelegate(cls, args, solver, memory):
        r = global_vars.add_flag_num_host()
        r = utils.gen_symbolic_value(bin_format.i32, f'callDelegate_{r}')
        a = args[2].n # 数据内存地址
        b = args[1].n # 发送地址内存地址
        l = args[3].n
        for i in range(4):
            if utils.is_symbolic(memory.data[a]):
                tmp_address = z3.simplify(number.MemoryLoad.i64(memory.data[a:a + 8]))
            else:
                tmp_address = number.MemoryLoad.i64(memory.data[a:a + 8])
            if utils.is_symbolic(memory.data[b]):
                tmp_address1 = z3.simplify(number.MemoryLoad.i64(memory.data[b:b + 8]))
            else:
                tmp_address1 = number.MemoryLoad.i64(memory.data[b:b + 8])
            if utils.is_symbolic(tmp_address):
                # [TODO] update to bug_analyzer
                print('find sym')
                global_vars.find_ethereum_delegate_call()
            pass
        for item in global_vars.dict_symbolic_address:
            tmp = global_vars.dict_symbolic_address[item]
            if isinstance(tmp, int):
                print(a, global_vars.dict_symbolic_address[item])
                l = max(l, 64)
                if a <= tmp <= a + l:
                    print(a, item, 'find sym')
                    global_vars.find_ethereum_delegate_call()
        return [r]

    @classmethod
    def callStatic(cls, args, solver, memory):
        pass

    @classmethod
    def storageStore(cls, args, solver, memory):
        a = 0
        list_value = list()
        for i in range(4):
            if i == 0:
                if utils.is_symbolic(memory.data[a]):
                    tmp_address = z3.simplify(number.MemoryLoad.i64(memory.data[a:a + 8]))
                else:
                    tmp_address = number.MemoryLoad.i64(memory.data[a:a + 8])
            else:
                if utils.is_symbolic(memory.data[a]):
                    tmp_address += z3.simplify(number.MemoryLoad.i64(memory.data[a:a + 8]))
                else:
                    tmp_address += number.MemoryLoad.i64(memory.data[a:a + 8])

            if utils.is_symbolic(memory.data[a + 32]):
                list_value.append(z3.simplify(number.MemoryLoad.i64(memory.data[a + 32:a + 32 + 8])))
            else:
                list_value.append(number.MemoryLoad.i64(memory.data[a + 32:a + 32 + 8]))
            a += 8
        for item in list_value:
            if item in global_vars.dict_symbolic_address:
                if global_vars.dict_symbolic_address[item] == tmp_address:
                    global_vars.list_storageStore.append(item)
        return []

    @classmethod
    def storageLoad(cls, args, solver, memory):
        a = 32
        list_v = list()
        for i in range(4):
            v = utils.gen_symbolic_value(bin_format.i64, f'storageLoad_{global_vars.num_storageLoad}')
            list_v.append(v)
            global_vars.add_num_storageLoad()
            memory.data[a:a + 8] = number.MemoryStore.pack_i64(v)
            if i == 0:
                if utils.is_symbolic(memory.data[a-32]):
                    tmp = z3.simplify(number.MemoryLoad.i64(memory.data[a-32:a + 8-32]))
                else:
                    tmp = number.MemoryLoad.i64(memory.data[a-32:a + 8-32])
            else:
                if utils.is_symbolic(memory.data[a-32]):
                    tmp += z3.simplify(number.MemoryLoad.i64(memory.data[a-32:a + 8-32]))
                else:
                    tmp += number.MemoryLoad.i64(memory.data[a-32:a + 8-32])
            a += 8
        for item in list_v:
            global_vars.add_dict_symbolic_address(item, tmp)
        return []

    @classmethod
    def getCaller(cls, args, solver, memory):
        address = args[0].n
        for i in range(4):
            v = utils.gen_symbolic_value(bin_format.i64, f'getCaller_{global_vars.num_getCaller}')
            memory.data[address:address + 8] = number.MemoryStore.pack_i64(v)
            global_vars.add_num_getCaller()
            address += 8
        return []

    @classmethod
    def getCallValue(cls, args, solver, memory):
        address = args[0].n
        if global_vars.flag_getCallValue_in_function:
            for i in range(4):
                v = utils.gen_symbolic_value(bin_format.i64, f'getCallValue_{global_vars.num_getCallValue}')
                memory.data[address:address + 8] = number.MemoryStore.pack_i64(v)
                global_vars.add_num_getCallValue()
                address += 8
        else:
            for i in range(32):
                memory.data[address + i] = 0
        return []

    @classmethod
    def codeCopy(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def getCodeSize(cls, args, solver, memory):
        pass

    @classmethod
    def getBlockCoinbase(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def create(cls, args, solver, memory):
        pass

    @classmethod
    def getBlockDifficulty(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def externalCodeCopy(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def getExternalCodeSize(cls, args, solver, memory):
        r = randint(0,20)
        r = utils.gen_symbolic_value(bin_format.i32, f'getExternalCodeSize_{r}')
        return r

    @classmethod
    def getGasLeft(cls, args, solver, memory):
        r = utils.gen_symbolic_value(bin_format.i64, f'getGasLeft')
        return r

    @classmethod
    def getBlockGasLimit(cls, args, solver, memory):
        pass

    @classmethod
    def getTxGasPrice(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def log(cls, args, solver, memory):
        pass

    @classmethod
    def getBlockNumber(cls, args, solver, memory):
        r = randint(0,20)
        r = utils.gen_symbolic_value(bin_format.i64, f'getBlockNumber_{r}')
        global_vars.add_dict_block_solver(str(r), solver)
        return r

    @classmethod
    def getTxOrigin(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def finish(cls, args, solver, memory):
        global_vars.add_flag_revert()
        logger.infoln(f'eth.finish')
        return []

    @classmethod
    def revert(cls, args, solver, memory):
        global_vars.add_flag_revert()
        logger.infoln(f'eth.revert')
        return []

    @classmethod
    def getReturnDataSize(cls, args, solver, memory):
        r = global_vars.add_flag_num_host()
        r = utils.gen_symbolic_value(bin_format.i32, f'getReturnDataSize_{r}')
        return r

    @classmethod
    def returnDataCopy(cls, args, solver, memory):
        # [TODO]
        return []

    @classmethod
    def selfDestruct(cls, args, solver, memory):
        global_vars.add_flag_revert()
        logger.infoln(f'eth.selfDestruct')
        pass

    @classmethod
    def getBlockTimestamp(cls, args, solver, memory):
        r = randint(0,20)
        r = utils.gen_symbolic_value(bin_format.i64, f'getBlockTimestamp_{r}')
        global_vars.add_dict_block_solver(str(r), solver)
        return r

class EthereumWasmFunc:
    """ A emulator of wasm functions of Ethereum Wasm blockchain platform.
        Returns: 0, if do nothing
                 other, The return value will be placed on the top of the stack
    """

    def __init__(self):
        pass

    @classmethod
    def add_carry(cls, args, solver, store):
        flag_ = 1
        for v in valn:
            if utils.is_symbolic(v.n):
                flag_ = 0
        if flag_ == 1:
            t = valn[0].n + valn[1].n
            r =  t + valn[2].n
            t1 = int(number.int2u64(t) < number.int2u64(valn[0].n))
            t2 = int(number.int2u64(r) < number.int2u64(t))
            r_c = number.int2u32(t1 | t2) 
            flag_skip = 1
            store.globals[module.globaladdrs[0]] = GlobalInstance(Value(bin_format.i64, r_c), True)
            return [Value.from_i64(r)]
        return 0

    @classmethod
    def add(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sub(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sub320(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sub512(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mul_64x64_128(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mul_128x128_256(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mul_256x256_512(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mul(cls, args, solver, store):
        if utils.is_all_real(args[0].n, args[1].n, args[2].n, args[3].n, args[4].n, args[5].n, args[6].n, args[7].n):
            return 0
        else:
            list_mul_symbolic = list()
            for pos in range(8):
                if utils.is_symbolic(args[pos].n):
                    list_mul_symbolic.append(args[pos].n)
            r = list()

            ret = utils.gen_symbolic_value(bin_format.i64, f'mul_{global_vars.num_mul}')
            r.append(Value(bin_format.i64, ret))
            global_vars.add_num_mul()        
            global_vars.add_dict_symbolic_address(ret, list_mul_symbolic)

            for i in range(3):
                ret = utils.gen_symbolic_value(bin_format.i64, f'mul_{global_vars.num_mul}')
                r.append(GlobalInstance(Value(bin_format.i64, ret), True))
                global_vars.add_num_mul()        
                global_vars.add_dict_symbolic_address(ret, list_mul_symbolic)

            return r

    @classmethod
    def div(cls, args, solver, store):
        if utils.is_all_real(args[0].n, args[1].n, args[2].n, args[3].n, args[4].n, args[5].n, args[6].n, args[7].n):
            return 0
        else:
            list_div_symbolic = list()
            for pos in range(8):
                if utils.is_symbolic(args[pos].n):
                    list_div_symbolic.append(args[pos].n)
            r = list()
            
            ret = utils.gen_symbolic_value(bin_format.i64, f'div_{global_vars.num_div}')
            r.append(Value(bin_format.i64, ret))
            global_vars.add_num_div()
            global_vars.add_dict_symbolic_address(ret, list_div_symbolic)

            for i in range(3):
                ret = utils.gen_symbolic_value(bin_format.i64, f'div_{global_vars.num_div}')
                r.append(GlobalInstance(Value(bin_format.i64, ret), True))
                global_vars.add_num_div()        
                global_vars.add_dict_symbolic_address(ret, list_div_symbolic)

            return r

    @classmethod
    def sdiv(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mod(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mod320(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mod512(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def smod(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def exp(cls, args, solver, store):
        # [TODO]
        pass
    @classmethod
    def addmod(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mulmod(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def signextend(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def bit_negate(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def split(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shl_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shr_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shl320_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shr320_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shl512_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shr512_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def byte(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def xor(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def or_(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def and_(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def not_(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shl_single(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shl(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shr_single(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def shr(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sar(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def iszero(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def iszero256(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def iszero320(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def iszero512(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def eq(cls, args, solver, store):
        r = [Value.from_i64(0), GlobalInstance(Value(bin_format.i64, 0), True), GlobalInstance(Value(bin_format.i64, 0), True)]
        ret = utils.gen_symbolic_value(bin_format.i64, f'eq_{global_vars.add_flag_num_wasm()}')
        r.append(GlobalInstance(Value(bin_format.i64, ret), True))
        return r

    @classmethod
    def cmp_(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def lt_320x320_64(cls, args, solver, store):
        if utils.is_all_real(args[0].n, args[1].n, args[2].n, args[3].n, args[4].n, args[5].n, args[6].n, args[7].n, args[8].n, args[9].n):
            return 0
        else:
            for i, item in enumerate(args):
                args[i] = utils.to_symbolic(item.n, 64)
            x = z3.Concat(args[0], args[1], args[2], args[3], args[4])
            y = z3.Concat(args[5], args[6], args[7], args[8], args[9])
            return Value.from_i32(z3.simplify(z3.If(z3.ULT(x, y), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))))

    @classmethod
    def lt_512x512_64(cls, args, solver, store):
        if utils.is_all_real(args[0].n, args[1].n, args[2].n, args[3].n, args[4].n, args[5].n, args[6].n, args[7].n, 
                                args[8].n, args[9].n, args[10].n, args[11].n, args[12].n, args[13].n, args[14].n, args[15].n):
            return 0
        else:
            for i, item in enumerate(args):
                args[i] = utils.to_symbolic(item.n, 64)
            x = z3.Concat(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7])
            y = z3.Concat(args[8], args[9], args[10], args[11], args[12], args[13], args[14], args[15])
            return [Value.from_i32(z3.simplify(z3.If(z3.ULT(x, y), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))))]

    @classmethod
    def lt_256x256_64(cls, args, solver, store):
        ''' This function is used to quickly process the comparison of 256-bit data and is a summary of the function.
            Only handle the case where the parameter contains a symbol value.
        '''
        if utils.is_all_real(args[0].n, args[1].n, args[2].n, args[3].n, args[4].n, args[5].n, args[6].n, args[7].n):
            return 0
        else:
            for i, item in enumerate(args):
                args[i] = utils.to_symbolic(item.n, 64)
            x = z3.Concat(args[0], args[1], args[2], args[3])
            y = z3.Concat(args[4], args[5], args[6], args[7])
            return [Value.from_i32(z3.simplify(z3.If(z3.ULT(x, y), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))))]

    @classmethod
    def lt(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gte_256x256_64(cls, args, solver, store):
        # [TODO]
        pass
    @classmethod
    def gte_320x320_64(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gte_512x512_64(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gt(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def slt(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sgt(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_u128(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_i64(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_i32(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_byte(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_i32ptr(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def to_internal_i32ptr(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def u256_to_address(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def bswap16(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def bswap32(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def bswap64(cls, args, solver, store):
        # [TODO] better to sumilate this func, maybe z3.solver can do it?
        if utils.is_symbolic(args[0].n):
            return [args[0]]
        else:
            return 0

    @classmethod
    def address(cls, args, solver, store):
        # [TODO]
        pass


    @classmethod
    def balance(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def selfbalance(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def chainid(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def origin(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def caller(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def callvalue(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def calldataload(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def calldatasize(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def calldatacopy(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def codesize(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def codecopy(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def datacopy(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gasprice(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def extcodesize_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def extcodesize(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def extcodehash(cls, args, solver, store):
        # [TODO]
        pass
    @classmethod
    def extcodecopy(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def returndatasize(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def returndatacopy(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def blockhash(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def coinbase(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def timestamp(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def number(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def difficulty(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gaslimit(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mload(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mload_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mstore(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mstore_internal(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mstore_address(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def mstore8(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def msize(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sload(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def sstore(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def gas(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def log0(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def log1(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def log2(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def log3(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def log4(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def create(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def call(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def callcode(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def delegatecall(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def staticcall(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def create2(cls, args, solver, store):
        # [TODO]
        pass
    @classmethod
    def selfdestruct(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def return_(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def revert(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def invalid(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def stop(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def keccak256(cls, args, solver, store):
        # [TODO] Maybe need to add it to the symbol table to achieve the correspondence of the relationship
        ret = utils.gen_symbolic_value(bin_format.i64, f'keccak256_{global_vars.num_keccak256}')
        r = [Value(bin_format.i64, ret)]
        global_vars.add_num_keccak256()
        for i in range(3):
            ret = utils.gen_symbolic_value(bin_format.i64, f'keccak256_{global_vars.num_keccak256}')
            r.append(GlobalInstance(Value(bin_format.i64, ret), True))
            global_vars.add_num_keccak256()
        return r

    @classmethod
    def or_bool(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def or_bool_320(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def or_bool_512(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def save_temp_mem_32(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def restore_temp_mem_32(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def save_temp_mem_64(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def restore_temp_mem_64(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def pop(cls, args, solver, store):
        # [TODO]
        pass

    @classmethod
    def memoryguard(cls, args, solver, store):
        # [TODO]
        pass


# The map of module-name to function.
hostfunc_map = {
    'env': {
        'assert_recover_key': EosEmulator.assert_recover_key,
        'assert_sha256': EosEmulator.assert_sha256,
        'assert_sha1': EosEmulator.assert_sha1,
        'assert_sha512': EosEmulator.assert_sha512,
        'assert_ripemd160': EosEmulator.assert_ripemd160,
        'eosio_assert': EosEmulator.eosio_assert,
        'eosio_assert_message': EosEmulator.eosio_assert_message,
        'eosio_assert_code': EosEmulator.eosio_assert_code,
        'eosio_exit': EosEmulator.eosio_exit,
        'abort': EosEmulator.abort,
        'checktime': EosEmulator.checktime,
        'prints': EosEmulator.prints,
        'prints_l': EosEmulator.prints_l,
        'printi': EosEmulator.printi,
        'printui': EosEmulator.printui,
        'printi128': EosEmulator.printi128,
        'printui128': EosEmulator.printui128,
        'printsf': EosEmulator.printsf,
        'printdf': EosEmulator.printdf,
        'printqf': EosEmulator.printqf,
        'printn': EosEmulator.printn,
        'printhex': EosEmulator.printhex,
        'set_resource_limits': EosEmulator.set_resource_limits,
        'set_blockchain_parameters_packed': EosEmulator.set_blockchain_parameters_packed,
        'set_privileged': EosEmulator.set_privileged,
        'preactivate_feature': EosEmulator.preactivate_feature,
        'is_feature_active': EosEmulator.is_feature_active,
        'is_privileged': EosEmulator.is_privileged,
        'transaction_size': EosEmulator.transaction_size,
        'expiration': EosEmulator.expiration,
        'tapos_block_num': EosEmulator.tapos_block_num,
        'tapos_block_prefix': EosEmulator.tapos_block_prefix,
        'get_permission_last_used': EosEmulator.get_permission_last_used,
        'get_account_creation_time': EosEmulator.get_account_creation_time,
        'current_time': EosEmulator.current_time,
        'publication_time': EosEmulator.publication_time,
        'is_feature_activated': EosEmulator.is_feature_activated,
        'get_sender': EosEmulator.get_sender,
        'action_data_size': EosEmulator.action_data_size,
        'current_receiver': EosEmulator.current_receiver,
        'has_auth': EosEmulator.has_auth,
        'is_account': EosEmulator.is_account,
        'cancel_deferred': EosEmulator.cancel_deferred,
        'memcmp': EosEmulator.memcmp,
        'set_proposed_producers': EosEmulator.set_proposed_producers,
        'set_proposed_producers_ex': EosEmulator.set_proposed_producers_ex,
        'get_blockchain_parameters_packed': EosEmulator.get_blockchain_parameters_packed,
        'get_active_producers': EosEmulator.get_active_producers,
        'ashlti3': EosEmulator.ashlti3,
        'ashrti3': EosEmulator.ashrti3,
        'lshlti3': EosEmulator.lshlti3,
        'lshrti3': EosEmulator.lshrti3,
        'divti3': EosEmulator.divti3,
        'udivti3': EosEmulator.udivti3,
        'modti3': EosEmulator.modti3,
        'umodti3': EosEmulator.umodti3,
        'multi3': EosEmulator.multi3,
        'addtf3': EosEmulator.addtf3,
        'subtf3': EosEmulator.subtf3,
        'multf3': EosEmulator.multf3,
        'divtf3': EosEmulator.divtf3,
        'eqtf2': EosEmulator.eqtf2,
        'netf2': EosEmulator.netf2,
        'getf2': EosEmulator.getf2,
        'gttf2': EosEmulator.gttf2,
        'lttf2': EosEmulator.lttf2,
        'letf2': EosEmulator.letf2,
        'cmptf2': EosEmulator.cmptf2,
        'unordtf2': EosEmulator.unordtf2,
        'negtf2': EosEmulator.negtf2,
        'floatsitf': EosEmulator.floatsitf,
        'floatunsitf': EosEmulator.floatunsitf,
        'floatditf': EosEmulator.floatditf,
        'floatunditf': EosEmulator.floatunditf,
        'floattidf': EosEmulator.floattidf,
        'floatuntidf': EosEmulator.floatuntidf,
        'floatsidf': EosEmulator.floatsidf,
        'extendsftf2': EosEmulator.extendsftf2,
        'extenddftf2': EosEmulator.extenddftf2,
        'fixtfti': EosEmulator.fixtfti,
        'fixtfdi': EosEmulator.fixtfdi,
        'fixtfsi': EosEmulator.fixtfsi,
        'fixunstfti': EosEmulator.fixunstfti,
        'fixunstfdi': EosEmulator.fixunstfdi,
        'fixunstfsi': EosEmulator.fixunstfsi,
        'fixsfti': EosEmulator.fixsfti,
        'fixdfti': EosEmulator.fixdfti,
        'fixunssfti': EosEmulator.fixunssfti,
        'fixunsdfti': EosEmulator.fixunsdfti,
        'trunctfdf2': EosEmulator.trunctfdf2,
        'trunctfsf2': EosEmulator.trunctfsf2,
        'sha1': EosEmulator.sha1,
        'sha256': EosEmulator.sha256,
        'sha512': EosEmulator.sha512,
        'ripemd160': EosEmulator.ripemd160,
        'get_resource_limits': EosEmulator.get_resource_limits,
        'read_action_data': EosEmulator.read_action_data,
        'read_transaction': EosEmulator.read_transaction,
        'get_action': EosEmulator.get_action,
        'get_context_free_data': EosEmulator.get_context_free_data,
        'memcpy': EosEmulator.memcpy,
        'memmove': EosEmulator.memmove,
        'memset': EosEmulator.memset,
        'check_transaction_authorization': EosEmulator.check_transaction_authorization,
        'check_permission_authorization': EosEmulator.check_permission_authorization,
        'require_auth': EosEmulator.require_auth,
        'require_auth2': EosEmulator.require_auth2,
        'activate_feature': EosEmulator.activate_feature,
        'db_store_i64': EosEmulator.db_store_i64,
        'db_update_i64': EosEmulator.db_update_i64,
        'db_remove_i64': EosEmulator.db_remove_i64,
        'db_get_i64': EosEmulator.db_get_i64,
        'db_next_i64': EosEmulator.db_next_i64,
        'db_previous_i64': EosEmulator.db_previous_i64,
        'db_find_i64': EosEmulator.db_find_i64,
        'db_lowerbound_i64': EosEmulator.db_lowerbound_i64,
        'db_upperbound_i64': EosEmulator.db_upperbound_i64,
        'db_end_i64': EosEmulator.db_end_i64,
        'recover_key': EosEmulator.recover_key,
        'require_recipient': EosEmulator.require_recipient,
        'send_inline': EosEmulator.send_inline,
        'send_context_free_inline': EosEmulator.send_context_free_inline,
        'send_deferred': EosEmulator.send_deferred
    },
    'ethereum': {
        'useGas': EthereumEmulator.useGas,
        'getAddress': EthereumEmulator.getAddress,
        'getExternalBalance': EthereumEmulator.getExternalBalance,
        'getBlockHash': EthereumEmulator.getBlockHash,
        'call': EthereumEmulator.call,
        'callDataCopy': EthereumEmulator.callDataCopy,
        'getCallDataSize': EthereumEmulator.getCallDataSize,
        'callCode': EthereumEmulator.callCode,
        'callDelegate': EthereumEmulator.callDelegate,
        'callStatic': EthereumEmulator.callStatic,
        'storageStore': EthereumEmulator.storageStore,
        'storageLoad': EthereumEmulator.storageLoad,
        'getCaller': EthereumEmulator.getCaller,
        'getCallValue': EthereumEmulator.getCallValue,
        'codeCopy': EthereumEmulator.codeCopy,
        'getCodeSize': EthereumEmulator.getCodeSize,
        'getBlockCoinbase': EthereumEmulator.getBlockCoinbase,
        'create': EthereumEmulator.create,
        'getBlockDifficulty': EthereumEmulator.getBlockDifficulty,
        'externalCodeCopy': EthereumEmulator.externalCodeCopy,
        'getExternalCodeSize': EthereumEmulator.getExternalCodeSize,
        'getGasLeft': EthereumEmulator.getGasLeft,
        'getBlockGasLimit': EthereumEmulator.getBlockGasLimit,
        'getTxGasPrice': EthereumEmulator.getTxGasPrice,
        'log': EthereumEmulator.log,
        'getBlockNumber': EthereumEmulator.getBlockNumber,
        'getTxOrigin': EthereumEmulator.getTxOrigin,
        'finish': EthereumEmulator.finish,
        'revert': EthereumEmulator.revert,
        'getReturnDataSize': EthereumEmulator.getReturnDataSize,
        'returnDataCopy': EthereumEmulator.returnDataCopy,
        'selfDestruct': EthereumEmulator.selfDestruct,
        'getBlockTimestamp': EthereumEmulator.getBlockTimestamp
    }
}

wasmfunc_map = {
    'ethereum': {
        '$add_carry' : EthereumWasmFunc.add_carry,
        '$add' : EthereumWasmFunc.add,
        '$sub' : EthereumWasmFunc.sub,
        '$sub320' : EthereumWasmFunc.sub320,
        '$sub512' : EthereumWasmFunc.sub512,
        '$mul_64x64_128' : EthereumWasmFunc.mul_64x64_128,
        '$mul_128x128_256' : EthereumWasmFunc.mul_128x128_256,
        '$mul_256x256_512' : EthereumWasmFunc.mul_256x256_512,
        '$mul' : EthereumWasmFunc.mul,
        '$div' : EthereumWasmFunc.div,
        '$sdiv' : EthereumWasmFunc.sdiv,
        '$mod' : EthereumWasmFunc.mod,
        '$mod320' : EthereumWasmFunc.mod320,
        '$mod512' : EthereumWasmFunc.mod512,
        '$smod' : EthereumWasmFunc.smod,
        '$exp' : EthereumWasmFunc.exp,
        '$addmod' : EthereumWasmFunc.addmod,
        '$mulmod' : EthereumWasmFunc.mulmod,
        '$signextend' : EthereumWasmFunc.signextend,
        '$bit_negate' : EthereumWasmFunc.bit_negate,
        '$split' : EthereumWasmFunc.split,
        '$shl_internal' : EthereumWasmFunc.shl_internal,
        '$shr_internal' : EthereumWasmFunc.shr_internal,
        '$shl320_internal' : EthereumWasmFunc.shl320_internal,
        '$shr320_internal' : EthereumWasmFunc.shr320_internal,
        '$shl512_internal' : EthereumWasmFunc.shl512_internal,
        '$shr512_internal' : EthereumWasmFunc.shr512_internal,
        '$byte' : EthereumWasmFunc.byte,
        '$xor' : EthereumWasmFunc.xor,
        '$or' : EthereumWasmFunc.or_,
        '$and' : EthereumWasmFunc.and_,
        '$not' : EthereumWasmFunc.not_,
        '$shl_single' : EthereumWasmFunc.shl_single,
        '$shl' : EthereumWasmFunc.shl,
        '$shr_single' : EthereumWasmFunc.shr_single,
        '$shr' : EthereumWasmFunc.shr,
        '$sar' : EthereumWasmFunc.sar,
        '$iszero' : EthereumWasmFunc.iszero,
        '$iszero256' : EthereumWasmFunc.iszero256,
        '$iszero320' : EthereumWasmFunc.iszero320,
        '$iszero512' : EthereumWasmFunc.iszero512,
        '$eq' : EthereumWasmFunc.eq,
        '$cmp' : EthereumWasmFunc.cmp_,
        '$lt_320x320_64' : EthereumWasmFunc.lt_320x320_64,
        '$lt_512x512_64' : EthereumWasmFunc.lt_512x512_64,
        '$lt_256x256_64' : EthereumWasmFunc.lt_256x256_64,
        '$lt' : EthereumWasmFunc.lt,
        '$gte_256x256_64' : EthereumWasmFunc.gte_256x256_64,
        '$gte_320x320_64' : EthereumWasmFunc.gte_320x320_64,
        '$gte_512x512_64' : EthereumWasmFunc.gte_512x512_64,
        '$gt' : EthereumWasmFunc.gt,
        '$slt' : EthereumWasmFunc.slt,
        '$sgt' : EthereumWasmFunc.sgt,
        '$u256_to_u128' : EthereumWasmFunc.u256_to_u128,
        '$u256_to_i64' : EthereumWasmFunc.u256_to_i64,
        '$u256_to_i32' : EthereumWasmFunc.u256_to_i32,
        '$u256_to_byte' : EthereumWasmFunc.u256_to_byte,
        '$u256_to_i32ptr' : EthereumWasmFunc.u256_to_i32ptr,
        '$to_internal_i32ptr' : EthereumWasmFunc.to_internal_i32ptr,
        '$u256_to_address' : EthereumWasmFunc.u256_to_address,
        '$bswap16' : EthereumWasmFunc.bswap16,
        '$bswap32' : EthereumWasmFunc.bswap32,
        '$bswap64' : EthereumWasmFunc.bswap64,
        '$address' : EthereumWasmFunc.address,
        '$balance' : EthereumWasmFunc.balance,
        '$selfbalance' : EthereumWasmFunc.selfbalance,
        '$chainid' : EthereumWasmFunc.chainid,
        '$origin' : EthereumWasmFunc.origin,
        '$caller' : EthereumWasmFunc.caller,
        '$callvalue' : EthereumWasmFunc.callvalue,
        '$calldataload' : EthereumWasmFunc.calldataload,
        '$calldatasize' : EthereumWasmFunc.calldatasize,
        '$calldatacopy' : EthereumWasmFunc.calldatacopy,
        '$codesize' : EthereumWasmFunc.codesize,
        '$codecopy' : EthereumWasmFunc.codecopy,
        '$datacopy' : EthereumWasmFunc.datacopy,
        '$gasprice' : EthereumWasmFunc.gasprice,
        '$extcodesize_internal' : EthereumWasmFunc.extcodesize_internal,
        '$extcodesize' : EthereumWasmFunc.extcodesize,
        '$extcodehash' : EthereumWasmFunc.extcodehash,
        '$extcodecopy' : EthereumWasmFunc.extcodecopy,
        '$returndatasize' : EthereumWasmFunc.returndatasize,
        '$returndatacopy' : EthereumWasmFunc.returndatacopy,
        '$blockhash' : EthereumWasmFunc.blockhash,
        '$coinbase' : EthereumWasmFunc.coinbase,
        '$timestamp' : EthereumWasmFunc.timestamp,
        '$number' : EthereumWasmFunc.number,
        '$difficulty' : EthereumWasmFunc.difficulty,
        '$gaslimit' : EthereumWasmFunc.gaslimit,
        '$mload' : EthereumWasmFunc.mload,
        '$mload_internal' : EthereumWasmFunc.mload_internal,
        '$mstore' : EthereumWasmFunc.mstore,
        '$mstore_internal' : EthereumWasmFunc.mstore_internal,
        '$mstore_address' : EthereumWasmFunc.mstore_address,
        '$mstore8' : EthereumWasmFunc.mstore8,
        '$msize' : EthereumWasmFunc.msize,
        '$sload' : EthereumWasmFunc.sload,
        '$sstore' : EthereumWasmFunc.sstore,
        '$gas' : EthereumWasmFunc.gas,
        '$log0' : EthereumWasmFunc.log0,
        '$log1' : EthereumWasmFunc.log1,
        '$log2' : EthereumWasmFunc.log2,
        '$log3' : EthereumWasmFunc.log3,
        '$log4' : EthereumWasmFunc.log4,
        '$create' : EthereumWasmFunc.create,
        '$call' : EthereumWasmFunc.call,
        '$callcode' : EthereumWasmFunc.callcode,
        '$delegatecall' : EthereumWasmFunc.delegatecall,
        '$staticcall' : EthereumWasmFunc.staticcall,
        '$create2' : EthereumWasmFunc.create2,
        '$selfdestruct' : EthereumWasmFunc.selfdestruct,
        '$return' : EthereumWasmFunc.return_,
        '$revert' : EthereumWasmFunc.revert,
        '$invalid' : EthereumWasmFunc.invalid,
        '$stop' : EthereumWasmFunc.stop,
        '$keccak256' : EthereumWasmFunc.keccak256,
        '$or_bool' : EthereumWasmFunc.or_bool,
        '$or_bool_320' : EthereumWasmFunc.or_bool_320,
        '$or_bool_512' : EthereumWasmFunc.or_bool_512,
        '$save_temp_mem_32' : EthereumWasmFunc.save_temp_mem_32,
        '$restore_temp_mem_32' : EthereumWasmFunc.restore_temp_mem_32,
        '$save_temp_mem_64' : EthereumWasmFunc.save_temp_mem_64,
        '$restore_temp_mem_64' : EthereumWasmFunc.restore_temp_mem_64,
        '$pop' : EthereumWasmFunc.pop,
        '$memoryguard' : EthereumWasmFunc.memoryguard,
    }
}

realize_list_host = ['callDataCopy','storageStore','storageLoad','getCaller',
                'getCallValue','finish','revert','selfDestruct', 
                'getCallDataSize', 'getGasLeft', 'callDelegate',
                'getReturnDataSize', 'call', 'getBlockTimestamp',
                'getBlockNumber', 'getExternalCodeSize', 'getExternalBalance']

realize_list_wasm = ['$lt_320x320_64', '$lt_512x512_64', '$lt_256x256_64', '$bswap64', '$keccak256', '$eq', '$mul', '$div']