#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
The module provides simulation of import function.
"""
import bin_format
import utils



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
    def useGas(cls, args):
        pass

    @classmethod
    def getAddress(cls, args):
        pass

    @classmethod
    def getExternalBalance(cls, args):
        pass

    @classmethod
    def getBlockHash(cls, args):
        pass

    @classmethod
    def call(cls, args):
        pass

    @classmethod
    def callDataCopy(cls, args):
        pass

    @classmethod
    def getCallDataSize(cls, args):
        pass

    @classmethod
    def callCode(cls, args):
        pass

    @classmethod
    def callDelegate(cls, args):
        pass

    @classmethod
    def callStatic(cls, args):
        pass

    @classmethod
    def storageStore(cls, args):
        pass

    @classmethod
    def storageLoad(cls, args):
        pass

    @classmethod
    def getCaller(cls, args):
        pass

    @classmethod
    def getCallValue(cls, args):
        pass

    @classmethod
    def codeCopy(cls, args):
        pass

    @classmethod
    def getCodeSize(cls, args):
        pass

    @classmethod
    def getBlockCoinbase(cls, args):
        pass

    @classmethod
    def create(cls, args):
        pass

    @classmethod
    def getBlockDifficulty(cls, args):
        pass

    @classmethod
    def externalCodeCopy(cls, args):
        pass

    @classmethod
    def getExternalCodeSize(cls, args):
        pass

    @classmethod
    def getGasLeft(cls, args):
        pass

    @classmethod
    def getBlockGasLimit(cls, args):
        pass

    @classmethod
    def getTxGasPrice(cls, args):
        pass

    @classmethod
    def log(cls, args):
        pass

    @classmethod
    def getBlockNumber(cls, args):
        pass

    @classmethod
    def getTxOrigin(cls, args):
        pass

    @classmethod
    def finish(cls, args):
        pass

    @classmethod
    def revert(cls, args):
        pass

    @classmethod
    def getReturnDataSize(cls, args):
        pass

    @classmethod
    def returnDataCopy(cls, args):
        pass

    @classmethod
    def selfDestruct(cls, args):
        pass

    @classmethod
    def getBlockTimestamp(cls, args):
        pass


# The map of module-name to function.
function_map = {
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
