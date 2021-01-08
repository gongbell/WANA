# !/usr/bin/python3
# -*- coding: utf-8 -*-
"""
The main logic of symbolic execution. Apart from the execution logic, the module
contains some variables to help execution, some class to construct runtime structure.
"""
import math
import z3
import copy
import utils
from random import randint, uniform
from collections import defaultdict

import logger
import number
from global_variables import global_vars
from bug_analyzer import check_block_dependence
from bug_analyzer import check_ethereum_delegate_call
from bug_analyzer import check_ethereum_greedy
from bug_analyzer import cur_state_analysis
from bug_analyzer import check_mishandled_exception
from runtime import *
from bug_analyzer import library_function_dict
import pprint



# The variables will be used in exec() function.
path_condition = []
memory_address_symbolic_variable = {}
solver = z3.Solver()
recur_depth = 0
loop_depth_dict = defaultdict(int)
path_abort = False
path_depth = 0
block_number_flag = False
gas_cost = 0


class ModuleInstance:
    """A module instance is the runtime representation of a module. It is created by instantiating a module, and
    collects runtime representations of all entities that are imported, defined, or exported by the module.

    moduleinst ::= {
        types functype∗
        funcaddrs funcaddr∗
        tableaddrs tableaddr∗
        memaddrs memaddr∗
        globaladdrs globaladdr∗
        exports exportinst∗
    }

    Attributes:
        types: list of function type
        funcaddrs: function address of current module
        tableaddrs: table address of current module
        globaladdrs: global address of current module
        exports: the export instance of current module
    """

    def __init__(self):
        self.types: typing.List[structure.FunctionType] = []
        self.funcaddrs: typing.List[int] = []
        self.tableaddrs: typing.List[int] = []
        self.memaddrs: typing.List[int] = []
        self.globaladdrs: typing.List[int] = []
        self.exports: typing.List[ExportInstance] = []

    def instantiate(
            self,
            module: structure.Module,
            store: Store,
            externvals: typing.List[ExternValue] = None
    ):
        self.types = module.types
        # [TODO] : z3.If module is not valid, the panic
        for e in module.imports:
            assert e.kind in bin_format.extern_type

        assert len(module.imports) == len(externvals)

        for i in range(len(externvals)):
            e = externvals[i]
            assert e.extern_type in bin_format.extern_type
            if e.extern_type == bin_format.extern_func:
                a = store.funcs[e.addr]
                b = self.types[module.imports[i].desc]
                assert a.functype.args == b.args
                assert a.functype.rets == b.rets
            elif e.extern_type == bin_format.extern_table:
                a = store.tables[e.addr]
                b = module.imports[i].desc
                assert a.elemtype == b.elemtype
                assert import_matching_limits(b.limits, a.limits)
            elif e.extern_type == bin_format.extern_mem:
                a = store.mems[e.addr]
                b = module.imports[i].desc
                assert import_matching_limits(b, a.limits)
            elif e.extern_type == bin_format.extern_global:
                a = store.globals[e.addr]
                b = module.imports[i].desc
                assert a.value.valtype == b.valtype
        # Let vals be the vector of global initialization values determined by module and externvaln
        auxmod = ModuleInstance()
        auxmod.globaladdrs = [e.addr for e in externvals if e.extern_type == bin_format.extern_global]
        stack = Stack()
        frame = Frame(auxmod, [], 1, -1)
        stack.add(frame)
        vals = []
        for glob in module.globals:
            v = exec_expr(store, frame, stack, glob.expr, -1)[0][0]
            vals.append(v)
        assert isinstance(stack.pop(), Frame)

        # Allocation
        self.allocate(module, store, externvals, vals)

        # Push the frame F to the stack
        frame = Frame(self, [], 1, -1)
        stack.add(frame)
        # For each element segment in module.elem, then do:
        for e in module.elem:
            offset = exec_expr(store, frame, stack, e.expr, -1)[0][0]
            assert offset.valtype == bin_format.i32
            t = store.tables[self.tableaddrs[e.tableidx]]
            for i, elem in enumerate(e.init):
                t.elem[offset.n + i] = elem
        # For each data segment in module.data, then do:
        for e in module.data:
            offset = exec_expr(store, frame, stack, e.expr, -1)[0][0]
            assert offset.valtype == bin_format.i32
            m = store.mems[self.memaddrs[e.memidx]]
            end = offset.n + len(e.init)
            assert end <= len(m.data)
            m.data[offset.n: offset.n + len(e.init)] = e.init
            # store the abi name and its address
            global_vars.data_addr_dict[offset.n] = e.init.decode(errors='ignore').split('\00')[0]
        # Assert: due to validation, the frame F is now on the top of the stack.
        assert isinstance(stack.pop(), Frame)
        assert stack.len() == 0
        # z3.If the start function module.start is not empty, invoke the function instance.
        if module.start:
            logger.debugln(f'Running start function {module.start}:')
            call(self, module.start, store, stack)

    def allocate(
            self,
            module: structure.Module,
            store: Store,
            externvals: typing.List[ExternValue],
            vals: typing.List[Value]
    ):
        self.types = module.types
        # Imports
        self.funcaddrs.extend([e.addr for e in externvals if e.extern_type == bin_format.extern_func])
        self.tableaddrs.extend([e.addr for e in externvals if e.extern_type == bin_format.extern_table])
        self.memaddrs.extend([e.addr for e in externvals if e.extern_type == bin_format.extern_mem])
        self.globaladdrs.extend([e.addr for e in externvals if e.extern_type == bin_format.extern_global])
        # For each function func in module.funcs, then do:
        for func in module.funcs:
            functype = self.types[func.typeidx]
            funcinst = WasmFunc(functype, self, func)
            store.funcs.append(funcinst)
            self.funcaddrs.append(len(store.funcs) - 1)
        # For each table in module.tables, then do:
        for table in module.tables:
            tabletype = table.tabletype
            elemtype = tabletype.elemtype
            tableinst = TableInstance(elemtype, tabletype.limits)
            store.tables.append(tableinst)
            self.tableaddrs.append(len(store.tables) - 1)
        # For each memory module.mems, then do:
        for mem in module.mems:
            meminst = MemoryInstance(mem.memtype)
            store.mems.append(meminst)
            self.memaddrs.append(len(store.mems) - 1)
        # For each global in module.globals, then do:
        for i, glob in enumerate(module.globals):
            val = vals[i]
            if val.valtype != glob.globaltype.valtype:
                raise Exception('Mimatch valtype!')
            globalinst = GlobalInstance(val, glob.globaltype.mut)
            store.globals.append(globalinst)
            self.globaladdrs.append(len(store.globals) - 1)
        # For each export in module.exports, then do:
        for i, export in enumerate(module.exports):
            externval = ExternValue(export.kind, export.desc)
            exportinst = ExportInstance(export.name, externval)
            # set address of functions
            if export.name == 'apply' and export.kind == bin_format.extern_func:
                logger.debugln('apply address:', export.desc)
                global_vars.set_apply_function_addr(externval.addr)
            if export.name == 'main' and export.kind == bin_format.extern_func:
                logger.debugln('main address:', export.desc)
                global_vars.set_main_function_addr(externval.addr)
            self.exports.append(exportinst)


def import_matching_limits(limits1: structure.Limits, limits2: structure.Limits):
    """Check the limits is valid or not.

    Args:
        limits1: a limit instance
        limits2: a limit instance

    Returns:
        true if the limit is valid else false.
    """
    min1 = limits1.minimum
    max1 = limits1.maximum
    min2 = limits2.minimum
    max2 = limits2.maximum
    if max2 is None or (max1 is not None and max1 <= max2):
        return True
    return False


def hostfunc_call(
        _: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack
):
    """The function call lib function. It will pop the args from stack
    and return the result.

    Args:
        _: deprecated parameter.
        address: the address of function.
        store: store the functions.
        stack: the current stack.

    Returns:
        result: the list of result, only one elem.
    """
    f: HostFunc = store.funcs[address]

    valn = [stack.pop() for _ in f.functype.args][::-1]
    ctx = Ctx(store.mems)
    r = f.hostcode(ctx, *[e.n for e in valn])
    return [Value(f.functype.rets[0], r)]


def fake_hostfunc_call(
        _: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack,
        m
):  
    """When the lib function is not exist, the hostfunc_call will crash, so the
    fake_hostfunc_call is useful because the analysis tool could not get the lib
    function.

    Args:
        _: deprecated parameter.
        address: the address of function.
        store: store the functions.
        stack: the current stack.

    Returns:
        result: the list of result, only one elem.
    """
    f: HostFunc = store.funcs[address]
    valn = [stack.pop() for _ in f.functype.args][::-1]
    # [TODO] A good method for return value.
    if f.funcname:
        logger.printt(f'call eth.hostfunc : {f.funcname} {address}')
    if len(f.functype.rets) <= 0:
        if f.funcname == 'revert':
            global_vars.add_flag_revert()
            logger.printt(f'eth.revert')
        if f.funcname == 'finish':
            global_vars.add_flag_revert()
            logger.printt(f'eth.finish')
        elif f.funcname == 'callDataCopy': # or f.funcname == 'getCallValue':
            if f.funcname == 'callDataCopy':
                global_vars.add_flag_callDataCopy()
                # print(f'call eth.callDataCopy flag: {global_vars.flag_callDataCopy}')
            for j in range(32):
                m.data[j] = randint(1, 9)
            # print(m.data[:40])
        elif f.funcname == 'getCallValue':
            global_vars.add_flag_getCallValue()
            for j in range(32):
                m.data[j] = 0
            # print(m.data[:40])
            # print(f'call eth.getCallValue flag: {global_vars.flag_getCallValue}')
        elif f.funcname == 'callDataCopy':
            global_vars.add_flag_getCaller()


        return []
    if f.funcname == 'getCallDataSize':
        global_vars.add_flag_getCallDataSize()
        # print(global_vars.flag_getCallDataSize)
        if len(solver.units()) > 1:
            # if it is twice call eth.getCallDataSize, return ranint(4,999)
            r = randint(68, 999)
            # print(f'this is {global_vars.flag_getCallDataSize} time eth.getCallDataSize')
        else:
            r = utils.gen_symbolic_value(bin_format.i32, f'getCallDataSize_{global_vars.flag_getCallDataSize}')
    elif f.funcname == 'getGasLeft':
        r = utils.gen_symbolic_value(bin_format.i64, f'getGasLeft')
    elif f.funcname == 'callDelegate':
        r = randint(0, 9)
        r = utils.gen_symbolic_value(bin_format.i32, f'callDelegate_{r}')
    elif f.funcname == 'getReturnDataSize':
        r = randint(0, 9)
        r = utils.gen_symbolic_value(bin_format.i32, f'getReturnDataSize_{r}')
    elif f.funcname == 'callDelegate':
        r = randint(0, 9)
        r = utils.gen_symbolic_value(bin_format.i32, f'callDelegate_{r}')
    elif f.funcname == 'call':
        r = randint(0, 9)
        r = utils.gen_symbolic_value(bin_format.i32, f'call_{r}')
        global_vars.call_symbolic_ret[f'{r}'] = global_vars.cur_sum_pc
        logger.printt(f'save eth.call and cur_sum_pc{global_vars.call_symbolic_ret}')
    elif f.functype.rets[0] == bin_format.i32:
        r = randint(0, 0)
    elif f.functype.rets[0] == bin_format.i64:
        r = randint(0, 0)
    elif f.functype.rets[0] == bin_format.f32:
        r = uniform(0, 1)
    else:
        r = uniform(0, 1)
    return [Value(f.functype.rets[0], r)]


def wasmfunc_call(
        module: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack
):
    """The function call the internal wasm function.

    Args:
        module: the current module.
        address: the address of function.
        store: store the functions.
        stack: the current stack.

    Returns:
        r: the list of result, only one elem.
    """
    f: WasmFunc = store.funcs[address]
    code = f.code.expr.data
    flag_callDataCopy = 0
    flag_getCallValue = 0
    flag_getCaller = 0
    flag_not_print = 0
    flag_eq = 0
    flag_lt = 0
    func_name = list()
    if address - global_vars.library_offset > 32:
        func_name = list(library_function_dict.keys())[list(library_function_dict.values()).index(address-global_vars.library_offset)]
        logger.printt(f'wasmfunc call: {func_name} {address} {global_vars.library_offset}')
        if func_name == '$mload_internal':
            logger.lvl = 0
            flag_not_print = 1
            # print('$mload_internal: stop print')
            global_vars.add_flag_callDataCopy()
            global_vars.add_flag_getCallValue()
            global_vars.add_flag_getCaller()

        elif func_name == '$mstore_internal':
            logger.lvl = 0
            flag_not_print = 1
            # print('$mstore_internal: stop print')
        elif func_name == '$calldataload':
            flag_callDataCopy = 1
        elif func_name == '$callvalue':
            flag_getCallValue = 1
            # print(global_vars.flag_getCallValue, flag_getCallValue)
        elif func_name == '$caller':
            flag_getCaller = 1.
            print(f'flag {flag_getCaller}')

    else:
        # print(f'wasmfunc call: {address}')
        pass
    
    
    valn = [stack.pop() for _ in f.functype.args][::-1]
    val0 = []
    for e in f.code.locals:
        if e == bin_format.i32:
            val0.append(Value.from_i32(0))
        elif e == bin_format.i64:
            val0.append(Value.from_i64(0))
        elif e == bin_format.f32:
            val0.append(Value.from_f32(0))
        else:
            val0.append(Value.from_f64(0))
    frame = Frame(module, valn + val0, len(f.functype.rets), len(code))

    if func_name == '$eq':
        if utils.is_symbolic(frame.locals[0].n) and utils.is_symbolic(frame.locals[1].n) and utils.is_symbolic(frame.locals[2].n) and utils.is_symbolic(frame.locals[3].n):
            flag_eq = 1
            logger.lvl = 0
            flag_not_print = 1

    if func_name == '$lt':
        if utils.is_symbolic(frame.locals[0].n) and utils.is_symbolic(frame.locals[1].n) and utils.is_symbolic(frame.locals[2].n) and utils.is_symbolic(frame.locals[3].n):
            logger.printt('lt left is symbolic')
            flag_lt = 1
        elif utils.is_symbolic(frame.locals[4].n) and utils.is_symbolic(frame.locals[5].n) and utils.is_symbolic(frame.locals[6].n) and utils.is_symbolic(frame.locals[7].n):
            logger.printt('lt right is symbolic')
            flag_lt = 2
        logger.lvl = 0
        flag_not_print = 1

    if func_name == '$add' or func_name == 'iszero':
        logger.lvl = 0
        flag_not_print = 1

    stack.add(frame)
    stack.add(Label(len(f.functype.rets), len(code)))
    # An expression is evaluated relative to a current frame pointing to its containing module instance.
    r, new_stack = exec_expr(store, frame, stack, f.code.expr, -1)
    if flag_not_print == 1:
        flag_not_print = 0
        logger.lvl = 1
        # print('$mload_internal or $mstore_internal: resume print')
    if global_vars.flag_callDataCopy > 1 and flag_callDataCopy:
        # 向栈顶压一个符号值
        ret = utils.gen_symbolic_value(bin_format.i64, f'callDataCopy_{global_vars.num_callDataCopy}')
        r = Value(bin_format.i64, ret)
        global_vars.add_num_callDataCopy()

        ret = utils.gen_symbolic_value(bin_format.i64, f'callDataCopy_{global_vars.num_callDataCopy}')
        store.globals[module.globaladdrs[0]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_callDataCopy()

        ret = utils.gen_symbolic_value(bin_format.i64, f'callDataCopy_{global_vars.num_callDataCopy}')
        store.globals[module.globaladdrs[1]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_callDataCopy()

        ret = utils.gen_symbolic_value(bin_format.i64, f'callDataCopy_{global_vars.num_callDataCopy}')
        store.globals[module.globaladdrs[2]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_callDataCopy()
        #[TODO] num_callDataCopy清零的函数没有调用

        global_vars.clear_flag_callDataCopy()
        global_vars.clear_flag_getCallValue()
        global_vars.clear_flag_getCaller()


        flag_callDataCopy = 0
        r = [r]
        # return [r]
        # simulate eth.getCallValue
    if global_vars.flag_getCallValue > 1 and flag_getCallValue:
        # print(f'eth.getCallValue -> mload_internal return flag:{global_vars.flag_getCallValue} {flag_getCallValue}')
        global_vars.clear_flag_callDataCopy()
        global_vars.clear_flag_getCallValue()
        global_vars.clear_flag_getCaller()

    if global_vars.flag_getCaller > 1 and flag_getCaller:
        # 向栈顶压一个符号值
        ret = utils.gen_symbolic_value(bin_format.i64, f'getCaller_{global_vars.num_getCaller}')
        r = Value(bin_format.i64, ret)
        global_vars.add_num_getCaller()

        ret = utils.gen_symbolic_value(bin_format.i64, f'getCaller_{global_vars.num_getCaller}')
        store.globals[module.globaladdrs[0]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_getCaller()

        ret = utils.gen_symbolic_value(bin_format.i64, f'getCaller_{global_vars.num_getCaller}')
        store.globals[module.globaladdrs[1]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_getCaller()

        ret = utils.gen_symbolic_value(bin_format.i64, f'getCaller_{global_vars.num_getCaller}')
        store.globals[module.globaladdrs[2]] = GlobalInstance(Value(bin_format.i64, ret), True)
        global_vars.add_num_getCaller()
        #[TODO] num_callDataCopy清零的函数没有调用

        global_vars.clear_flag_callDataCopy()
        global_vars.clear_flag_getCallValue()
        global_vars.clear_flag_getCaller()

        flag_getCaller = 0
        r = [r]
        # return [r]
        # simulate eth.getCallValue
    if func_name == '$eq' and flag_eq == 1:
        flag_eq = 0
        r = Value.from_i64(0)
        store.globals[module.globaladdrs[0]] = GlobalInstance(Value(bin_format.i64, 0), True)
        store.globals[module.globaladdrs[1]] = GlobalInstance(Value(bin_format.i64, 0), True)
        ret = utils.gen_symbolic_value(bin_format.i64, f'eq_{0}')
        store.globals[module.globaladdrs[2]] = GlobalInstance(Value(bin_format.i64, ret), True)
        r = [r]

    if func_name == '$lt' and flag_lt:
        flag_lt = 0
        store.globals[module.globaladdrs[0]] = GlobalInstance(Value(bin_format.i64, 0), True)
        store.globals[module.globaladdrs[1]] = GlobalInstance(Value(bin_format.i64, 0), True)
        r = randint(0, 99)
        ret = utils.gen_symbolic_value(bin_format.i64, f'lt_{r}')
        store.globals[module.globaladdrs[2]] = GlobalInstance(Value(bin_format.i64, ret), True)
        print('finish lt')
        r = Value.from_i64(0)
        r = [r]

    # Exit
    while not isinstance(new_stack.pop(), Frame):
        if new_stack.len() <= 0:
            raise Exception('Signature mismatch in call!')
    if any(id(elem) in global_vars.block_number_id_list for elem in valn):
        global_vars.add_random_number_id(id(r[0]))
    # print(f'old stack  {stack}')
    # print(f'new——stack {new_stack}')
    if str(stack) != str(new_stack):
        # print('change right')
        pass
    stack.data[:] = new_stack.data
    # print(f'now stack {stack}')
    return r


def fake_wasmfunc_call(
        module: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack
):
    """The fake function call the internal wasm function.

    Args:
        module: the current module.
        address: the address of function.
        store: store the functions.
        stack: the current stack.

    Returns:
        r: the list of fake result, only one elem at present.
    """
    f: WasmFunc = store.funcs[address]
    valn = [stack.pop() for _ in f.functype.args][::-1]
    if len(f.functype.rets) <= 0:
        return []
    if f.functype.rets[0] == bin_format.i32:
        r = randint(0, 1927)
    elif f.functype.rets[0] == bin_format.i64:
        r = randint(0, 1927)
    elif f.functype.rets[0] == bin_format.f32:
        r = uniform(0, 1)
    else:
        r = uniform(0, 1)
    return [Value(f.functype.rets[0], r)]


def call(
        module: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack,
        init_constraints: list = (),
):
    """The function call the internal wasm function or lib function.

    Args:
        module: the current module.
        address: the address of function.
        store: store the functions.
        stack: the current stack.
        init_constraints: initial function's args constraints.

    Returns:
        r: the list of result, only one elem.
    """
    f = store.funcs[address]
    assert len(f.functype.rets) <= 1
    for i, t in enumerate(f.functype.args[::-1]):
        ia = t
        ib = stack.data[-1 - i]
        if ia != ib.valtype:
            raise Exception('Signature mismatch in call!')
    init_variables(init_constraints)  # add initial constraints
    if isinstance(f, WasmFunc):
        return wasmfunc_call(module, address, store, stack)
    if isinstance(f, HostFunc):
        return hostfunc_call(module, address, store, stack)


def fake_call(
        module: ModuleInstance,
        address: int,
        store: Store,
        stack: Stack,
        m
):
    """The function call the internal wasm function or lib function. 
    It does not execute lib function and only return a valid random 
    result.

    Args:
        module: the current module.
        address: the address of function.
        store: store the functions.
        stack: the current stack.

    Returns:
        r: the list of result, only one elem.
    """
    f = store.funcs[address]
    assert len(f.functype.rets) <= 1
    for i, t in enumerate(f.functype.args[::-1]):
        ia = t
        ib = stack.data[-1 - i]
        if ia != ib.valtype:
            raise Exception('Signature mismatch in call!')
    if isinstance(f, WasmFunc):
        if global_vars.detection_mode:
            return fake_wasmfunc_call(module, address, store, stack)
        r = wasmfunc_call(module, address, store, stack)
        # print(stack)
        return r
        # return wasmfunc_call(module, address, store, stack)
    if isinstance(f, HostFunc):
        return fake_hostfunc_call(module, address, store, stack, m)


def spec_br(l: int, stack: Stack) -> int:
    """Process branch instruction.

    Args:
        l: the pc of Label.
        stack: the runtime stack.
    
    Returns:
        result: the target position of branch instruction.
    """
    # Let L be hte l-th label appearing on the stack, starting from the top and counting from zero.
    L = [i for i in stack.data if isinstance(i, Label)][::-1][l]
    n = L.arity
    v = [stack.pop() for _ in range(n)][::-1]

    s = 0
    while True:
        e = stack.pop()
        if isinstance(e, Label):
            s += 1
            if s == l + 1:
                break
    stack.ext(v)
    return L.continuation - 1


def init_variables(init_constraints: list = ()) -> None:
    """Initialize the variables.
    """
    global path_condition, memory_address_symbolic_variable, gas_cost, solver, \
        recur_depth, loop_depth_dict, path_abort, path_depth, block_number_flag
    solver = z3.Solver()
    solver.add(init_constraints)
    path_condition = list(init_constraints)
    memory_address_symbolic_variable = {}
    recur_depth = 0
    loop_depth_dict = defaultdict(int)
    path_abort = False
    path_depth = 0
    block_number_flag = False
    gas_cost = 0


def exec_expr(
        store: Store,
        frame: Frame,
        stack: Stack,
        expr: structure.Expression,
        pc: int = -1
):
    """An expression is evaluated relative to a current frame pointing to its containing module instance.
    1. Jump to the start of the instruction sequence instr∗ of the expression.
    2. Execute the instruction sequence.
    3. Assert: due to validation, the top of the stack contains a value.
    4. Pop the value val from the stack.

    Args:
        store: the function address of current module
        frame: current runtime frame
        stack: the stack for current state
        expr: the instructions to execute
        pc: the program counter

    Returns:
        stack and executed result

    Raises:
        AttributeError: if the Label instance is read for getting value
        z3Exception: if the symbolic variable is converted
    """
    global path_abort, path_depth, recur_depth, loop_depth_dict, block_number_flag, gas_cost
    branch_res = []
    module = frame.module
    if not expr.data:
        raise Exception('Empty init expr!')

    while True:
        global_vars.cur_sum_pc += 1
        pc += 1

        if path_abort or pc >= len(expr.data):
            logger.printt('function return; path_abort or pc >= len(expr.data)')
            break

        # Analysis current state to update some variables and detect vulnerability
        if global_vars.detection_mode:
            cur_state_analysis(store, frame, stack, expr, pc, solver)
            pc = global_vars.pc

        i = expr.data[pc]

        logger.debugln(f'{str(i) :<18} {stack} {pc} {global_vars.cur_sum_pc}')
        # log.println(f'{str(i):<18} {stack}')

        # accumulate the gas cost to detect expensive fallback
        gas_cost += bin_format.gas_cost.get(i, 0)
        global_vars.max_gas_cost = max(global_vars.max_gas_cost, gas_cost)

        if logger.lvl >= 2:
            # for ii, l in enumerate(frame.locals):
            #     if ii == 11:
            #         print(type(l))
            #     print(f'{ii}: {bin_format.valtype[l.valtype][0]} {l.n} {type(l)}')
            ls = [f'{i}: {bin_format.valtype[l.valtype][0]} {l.n}' for i, l in enumerate(frame.locals)]
            gs = [f'{i}: {"mut " if g.mut else ""}{bin_format.valtype[g.value.valtype][0]} {g.value.n}' for i, g in
                  enumerate(store.globals)]
            for n, e in (('locals', ls), ('globals', gs)):
                logger.verboseln(f'{" " * 18} {str(n) + ":":<8} [{", ".join(e)}]')

        opcode = i.code
        if bin_format.unreachable <= opcode <= bin_format.call_indirect:
            if opcode == bin_format.unreachable:
                global_vars.unreachable_count += 1
                raise Exception('unreachable')
                break
                # raise AssertionError('Unreachable opcode!')
            if opcode == bin_format.nop:
                continue
            if opcode == bin_format.block:
                arity = int(i.immediate_arguments != bin_format.empty)
                stack.add(Label(arity, expr.composition[pc][-1] + 1))
                continue
            if opcode == bin_format.loop:
                stack.add(Label(0, expr.composition[pc][0]))
                continue
            if opcode == bin_format.if_:
                object_c = stack.pop()
                c = object_c.n
                arity = int(i.immediate_arguments != bin_format.empty)
                stack.add(Label(arity, expr.composition[pc][-1] + 1))
                # print(f'pc:{expr.composition[pc][-1] + 1} after if stack:{stack}')
                if utils.is_all_real(c):
                    if c != 0:
                        continue
                    if len(expr.composition[pc]) > 2:
                        pc = expr.composition[pc][1]
                        continue
                    pc = expr.composition[pc][-1] - 1
                    continue
                else:
                    solver.push()
                    solver.add(c != 0)
                    check_mishandled_exception(solver, global_vars.cur_sum_pc)
                    logger.printt(solver)
                    logger.debugln(f'left branch ({pc}: {i})')
                    path_depth += 1
                    if recur_depth > global_vars.BRANCH_DEPTH_LIMIT:
                        if utils.is_symbolic(c): #and c
                            # print(solver.check() == z3.unsat)
                            # print(c,type(c),object_c,type(object_c))
                            logger.printt(f'recur {recur_depth}')
                            solver.pop()
                            # 有时候返回数字0回栈顶不是个好的选择，如果if判断的栈顶元素是位向量，且内容为0，那么我们就返回它本身
                            return [object_c], global_vars.last_stack[-1]
                        return [], global_vars.last_stack[-1]
                    global_vars.last_stack.append(stack)
                    try:
                        if solver.check() == z3.unsat:
                            logger.debugln(f'({pc}: {i}) infeasible path detected!')
                            # solver.pop()
                            # print(solver)
                            new_stack = copy.deepcopy(stack)
                            new_stack.pop()
                        else:
                            # Execute the left branch
                            new_store = copy.deepcopy(store)
                            new_frame = copy.deepcopy(frame)
                            new_stack = copy.deepcopy(stack)
                            # print(f'new stack:{new_stack}')
                            new_expr = copy.deepcopy(expr)
                            new_pc = pc
                            block_number_flag = id(c) in global_vars.block_number_id_list or block_number_flag  # set flag if "c" is associated with the block number
                            path_condition.append(c != 0)
                            recur_depth += 1
                            gas_cost -= bin_format.gas_cost.get(i, 0)
                            global_vars.sum_pc.append(global_vars.cur_sum_pc)
                            left_branch_res, new_stack = exec_expr(new_store, new_frame, new_stack, new_expr, new_pc)
                            logger.debugln(f'leave left branch{pc}')
                            gas_cost += bin_format.gas_cost.get(i, 0)
                            recur_depth -= 1
                            if path_abort:
                                path_abort = False
                                new_stack = copy.deepcopy(stack)
                            else:
                                branch_res += left_branch_res
                                if len(left_branch_res) <= 1:
                                    global_vars.add_cond_and_results(path_condition[:], left_branch_res[:])
                            path_condition.pop()
                    except TimeoutError:
                        logger.debugln('Timeout in path exploration.')
                    except Exception as e:
                        logger.debugln(f'Exception: {e}')
                        global_vars.cur_sum_pc = global_vars.sum_pc.pop()
                        # print('sum_pc:', global_vars.cur_sum_pc)
                        # print('行号', e.__traceback__.tb_lineno)
                    path_depth -= 1


                    # print(f'right before {solver}')
                    solver.pop()
                    # print(f'right pop {solver}')
                    solver.push()
                    # print(f'right push {solver}')
                    solver.add(c == 0)
                    logger.printt(solver)
                    logger.debugln(f'right branch ({pc}: {i})')
                    try:
                        if solver.check() == z3.unsat:
                            logger.debugln(f'({pc}: {i}) infeasible path detected!')
                            # solver.pop()
                            # print(f'solver')
                            new_stack = stack
                        else:
                            # Execute the right branch
                            new_store = copy.deepcopy(store)
                            new_frame = copy.deepcopy(frame)
                            new_stack = copy.deepcopy(stack)
                            new_expr = copy.deepcopy(expr)
                            new_pc = expr.composition[pc][1] if len(expr.composition[pc]) > 2 else expr.composition[pc][
                                                                                                       -1] - 1
                            block_number_flag = True if id(
                                c) in global_vars.block_number_id_list else block_number_flag  # set flag if "c" is associated with the block number
                            path_condition.append(c == 0)
                            recur_depth += 1
                            gas_cost -= bin_format.gas_cost.get(i, 0)
                            global_vars.sum_pc.append(global_vars.cur_sum_pc)
                            right_branch_res, new_stack = exec_expr(new_store, new_frame, new_stack, new_expr, new_pc)
                            logger.debugln(f'leave right branch {pc}')
                            print(new_stack)
                            gas_cost += bin_format.gas_cost.get(i, 0)
                            recur_depth -= 1
                            if path_abort:
                                if path_depth <= 0:
                                    temp_stack = Stack()
                                    temp_stack.add(frame)
                                    print(f'right path_depth <= 0')
                                    return branch_res, temp_stack
                                else:
                                    print('aaa')
                                    new_stack = global_vars.last_stack[-1]
                            else:
                                branch_res += right_branch_res
                                if len(right_branch_res) <= 1:
                                    global_vars.add_cond_and_results(path_condition[:], right_branch_res[:])
                            path_condition.pop()
                    except TimeoutError as e:
                        raise e
                    except Exception as e:
                        logger.debugln(f'Exception1: {e}')
                        global_vars.cur_sum_pc = global_vars.sum_pc.pop()
                        # print('行号', e.__traceback__.tb_lineno)
                        # print('sum_pc:', global_vars.cur_sum_pc)


                    solver.pop()
                    if path_depth <= 0:
                        print(f'path_depth <= 0')
                        temp_stack = Stack()
                        temp_stack.add(frame)
                        return branch_res, temp_stack
                    global_vars.last_stack.pop()
                    print(new_stack)
                    return branch_res, new_stack

            if opcode == bin_format.else_:
                for i in range(len(stack.data)):
                    i = -1 - i
                    e = stack.data[i]
                    if isinstance(e, Label):
                        pc = e.continuation - 1
                        # print(stack)
                        logger.printt(pc)
                        del stack.data[i]
                        break
                continue
            if opcode == bin_format.end:
                # label{instr*} val* end -> val*
                if stack.status() == Label:
                    for i in range(len(stack.data)):
                        i = -1 - i
                        if isinstance(stack.data[i], Label):
                            del stack.data[i]
                            break
                    continue
                # frame{F} val* end -> val*
                v = [stack.pop() for _ in range(frame.arity)][::-1]
                stack.ext(v)
                continue
            if opcode == bin_format.br:
                # too many loop depth
                if loop_depth_dict[i.immediate_arguments] > global_vars.LOOP_DEPTH_LIMIT:
                    continue
                # record the loop depth
                loop_depth_dict[i.immediate_arguments] += 1
                pc = spec_br(i.immediate_arguments, stack)
                continue
            if opcode == bin_format.br_if:
                c = stack.pop().n
                if utils.is_all_real(c):
                    # too many loop depth
                    if loop_depth_dict[i.immediate_arguments] > global_vars.LOOP_DEPTH_LIMIT:
                        continue

                    if c == 0:
                        continue

                    # record the loop depth
                    loop_depth_dict[i.immediate_arguments] += 1
                    pc = spec_br(i.immediate_arguments, stack)
                    continue
                else:
                    solver.push()
                    solver.add(c == 0)
                    logger.debugln(f'left branch ({pc}: {i})')
                    path_depth += 1
                    if recur_depth > global_vars.BRANCH_DEPTH_LIMIT:
                        # print('return -> recur_depth > global_vars.BRANCH_DEPTH_LIMIT')
                        return branch_res, global_vars.last_stack[-1] if global_vars.last_stack != [] else None
                    global_vars.last_stack.append(stack)
                    try:
                        if solver.check() == z3.unsat:
                            logger.debugln(f'({pc}: {i}) infeasible path detected!')
                            new_stack = stack
                        else:
                            # Execute the left branch
                            new_store = copy.deepcopy(store)
                            new_frame = copy.deepcopy(frame)
                            new_stack = copy.deepcopy(stack)
                            new_expr = copy.deepcopy(expr)
                            new_pc = pc
                            block_number_flag = id(
                                c) in global_vars.block_number_id_list or block_number_flag  # set flag if "c" is associated with the block number
                            path_condition.append(c == 0)
                            recur_depth += 1
                            gas_cost -= bin_format.gas_cost.get(i, 0)
                            left_branch_res, new_stack = exec_expr(new_store, new_frame, new_stack, new_expr, new_pc)
                            gas_cost += bin_format.gas_cost.get(i, 0)
                            recur_depth -= 1
                            if path_abort:
                                path_abort = False
                                new_stack = copy.deepcopy(stack)
                            else:
                                branch_res += left_branch_res
                                if len(left_branch_res) == 1:
                                    global_vars.add_cond_and_results(path_condition[:], left_branch_res[:])
                            path_condition.pop()
                    except TimeoutError:
                        raise
                    except Exception as e:
                        logger.debugln('Exception')
                    path_depth -= 1
                    solver.pop()

                    solver.push()
                    solver.add(c != 0)
                    logger.debugln(f'left branch ({pc}: {i})')
                    try:
                        if solver.check() == z3.unsat:
                            logger.debugln(f'({pc}: {i}) infeasible path detected!')
                            new_stack = stack
                        else:
                            # Execute the right branch
                            new_store = copy.deepcopy(store)
                            new_frame = copy.deepcopy(frame)
                            new_stack = copy.deepcopy(stack)
                            new_expr = copy.deepcopy(expr)
                            new_pc = spec_br(i.immediate_arguments, new_stack)
                            block_number_flag = True if id(
                                c) in global_vars.block_number_id_list else block_number_flag  # set flag if "c" is associated with the block number
                            path_condition.append(c != 0)
                            recur_depth += 1
                            gas_cost -= bin_format.gas_cost.get(i, 0)
                            right_branch_res, new_stack = exec_expr(new_store, new_frame, new_stack, new_expr, new_pc)
                            gas_cost += bin_format.gas_cost.get(i, 0)
                            recur_depth -= 1
                            if path_abort:
                                if path_depth <= 0:
                                    temp_stack = Stack()
                                    temp_stack.add(frame)
                                    # print('return -> br_if path_depth<=0')
                                    return branch_res, temp_stack
                                else:
                                    new_stack = global_vars.last_stack[-1]
                            else:
                                branch_res += right_branch_res
                                if len(right_branch_res) <= 1:
                                    global_vars.add_cond_and_results(path_condition[:], right_branch_res[:])
                            path_condition.pop()
                    except TimeoutError:
                        raise
                    except Exception as e:
                        logger.debugln('Exception')

                    solver.pop()
                    if path_depth <= 0:
                        temp_stack = Stack()
                        temp_stack.add(frame)
                        print('return -> br_if2 path_depth<=0')
                        return branch_res, temp_stack
                    global_vars.last_stack.pop()
                    # print('return -> br_if')
                    return branch_res, new_stack

            # [TODO] Ready to implement symbolic execution.
            if opcode == bin_format.br_table:
                a = i.immediate_arguments[0]
                l = i.immediate_arguments[1]
                c = stack.pop().n
                if 0 <= c < len(a):
                    l = a[c]
                pc = spec_br(l, stack)
                continue

            if opcode == bin_format.return_:
                v = [stack.pop() for _ in range(frame.arity)][::-1]
                while True:
                    e = stack.pop()
                    if isinstance(e, Frame):
                        stack.add(e)
                        break
                stack.ext(v)
                rint('return -> br_if2 path_depth<=0')
                break

            if opcode == bin_format.call:
                m = store.mems[module.memaddrs[0]]
                # tmp = stack
                r = fake_call(module, module.funcaddrs[i.immediate_arguments], store, stack, m)
                # print(r)
                # print(tmp)
                # print(stack)
                stack.ext(r)
                # print(stack)

                if global_vars.flag_revert > 0:
                    global_vars.clear_flag_revert()
                    raise Exception('call eth.revert')

                # store the address of the block number or block prefix
                if module.funcaddrs[i.immediate_arguments] in global_vars.tapos_block_function_addr:
                    global_vars.add_random_number_id(id(r[0]))

                # detect the send token call
                if module.funcaddrs[i.immediate_arguments] in global_vars.send_token_function_addr:
                    check_block_dependence(block_number_flag)

                # detect the ethereum delegate call
                if module.funcaddrs[i.immediate_arguments] in global_vars.call_delegate_addr:
                    check_ethereum_delegate_call(expr.data[pc - 1])


                # detect the ethereum greedy bug: is the function called a payable?
                check_ethereum_greedy(module.funcaddrs[i.immediate_arguments])
                continue

            if opcode == bin_format.call_indirect:
                if i.immediate_arguments[1] != 0x00:
                    raise Exception('Zero byte malformed in call_indirect!')
                idx = stack.pop().n
                tab = store.tables[module.tableaddrs[0]]
                while utils.is_symbolic(idx) or idx not in range(len(tab.elem)) or tab.elem[idx] is None:
                    idx = randint(0, len(tab.elem) - 1)
                    logger.println('Invalid function index in table.')

                if global_vars.location_mode:
                    # found transfer index!
                    global_vars.transfer_function_index = idx
                    raise SystemExit('found transfer function')
                r = fake_call(module, tab.elem[idx], store, stack)
                stack.ext(r)

                # there may exists random number bug, therefore count the function call
                if tab.elem[idx] in global_vars.tapos_block_function_addr:
                    global_vars.add_random_number_id(id(r[0]))

                # detect the ethereum greedy bug: is the function called a payable?
                check_ethereum_greedy(module.funcaddrs[i.immediate_arguments])
                continue
            continue

        if opcode == bin_format.drop:
            stack.pop()
            continue

        if opcode == bin_format.select:
            cond = stack.pop().n
            a = stack.pop()
            b = stack.pop()
            if utils.is_all_real(cond):
                if cond:
                    stack.add(b)
                else:
                    stack.add(a)
            else:
                a.n = (utils.to_symbolic(a.n, 32) if a.valtype in (bin_format.i32, bin_format.f32)
                       else utils.to_symbolic(a.n, 64))
                b.n = (utils.to_symbolic(b.n, 32) if a.valtype in (bin_format.i32, bin_format.f32)
                       else utils.to_symbolic(b.n, 64))
                computed = Value(a.valtype, z3.simplify(z3.If(cond == 0, a.n, b.n)))
                stack.add(computed)
            continue

        if opcode == bin_format.get_local:
            stack.add(frame.locals[i.immediate_arguments])
            continue

        if opcode == bin_format.set_local:
            if i.immediate_arguments >= len(frame.locals):
                print("越界")
                frame.locals.extend([Value.from_i32(0) for _ in range(i.immediate_arguments - len(frame.locals) + 1)])
            tmp = stack.pop()
            # print(f'settt{i.immediate_arguments} {tmp},{type(tmp)}')
            # frame.locals[i.immediate_arguments] = stack.pop()
            frame.locals[i.immediate_arguments] = tmp
            continue

        if opcode == bin_format.tee_local:
            frame.locals[i.immediate_arguments] = stack.top()
            continue

        if opcode == bin_format.get_global:
            # [TODO]
            if len(store.globals) <= 0:
                stack.add(Value.from_i32(0))
            else:
                stack.add(store.globals[module.globaladdrs[i.immediate_arguments]].value)
            continue

        if opcode == bin_format.set_global:
            store.globals[module.globaladdrs[i.immediate_arguments]] = GlobalInstance(stack.pop(), True)
            continue

        if bin_format.i32_load <= opcode <= bin_format.grow_memory:
            m = store.mems[module.memaddrs[0]]
            if bin_format.i32_load <= opcode <= bin_format.i64_load32_u:
                logger.verboseln(f'm.data state {m.data}')
                # logger.debugln(f'm.data state {m.data}')
                a = stack.pop().n + i.immediate_arguments[1]
                if utils.is_symbolic(a):
                    a = z3.simplify(a)
                    if opcode == bin_format.i32_load:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 4)
                        stack.add(Value.from_i32(number.MemoryLoad.i32(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 4])))
                        continue
                    if opcode == bin_format.i64_load:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 8))
                        stack.add(Value.from_i64(number.MemoryLoad.i64(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 8])))
                        continue
                    if opcode == bin_format.f32_load:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 4)
                        stack.add(Value.from_f32(number.LittleEndian.f32(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 4])))
                        continue
                    if opcode == bin_format.f64_load:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 8))
                        stack.add(Value.from_f64(number.LittleEndian.f64(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 8])))
                        continue
                    if opcode == bin_format.i32_load8_s:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 1)
                        stack.add(Value.from_i32(number.MemoryLoad.i8(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 1])))
                        continue
                    if opcode == bin_format.i32_load8_u:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 1))
                        stack.add(Value.from_i32(number.MemoryLoad.u8(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 1])))
                        continue
                    if opcode == bin_format.i32_load16_s:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 2))
                        stack.add(Value.from_i32(number.MemoryLoad.i16(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 2])))
                        continue
                    if opcode == bin_format.i32_load16_u:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 2))
                        stack.add(Value.from_i32(number.MemoryLoad.u16(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 2])))
                        continue
                    if opcode == bin_format.i64_load8_s:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 1))
                        stack.add(Value.from_i64(number.MemoryLoad.i8(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 1])))
                        continue
                    if opcode == bin_format.i64_load8_u:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 1))
                        stack.add(Value.from_i64(number.MemoryLoad.u8(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 1])))
                        continue
                    if opcode == bin_format.i64_load16_s:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 2))
                        stack.add(Value.from_i64(number.MemoryLoad.i16(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 2])))
                        continue
                    if opcode == bin_format.i64_load16_u:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 2))
                        stack.add(Value.from_i64(number.MemoryLoad.u16(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 2])))
                        continue
                    if opcode == bin_format.i64_load32_s:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 4))
                        stack.add(Value.from_i64(number.MemoryLoad.i32(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 4])))
                        continue
                    if opcode == bin_format.i64_load32_u:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = (randint(0, len(m.data) - 4))
                        stack.add(Value.from_i64(number.MemoryLoad.u32(
                            m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[a] + 4])))
                        continue
                    continue

                if a + bin_format.opcodes[opcode][2] > len(m.data):
                    path_abort = True
                    temp_stack = Stack()
                    temp_stack.add(frame)
                    if path_depth <= 0:
                        return branch_res, temp_stack
                    else:
                        return branch_res, temp_stack
                    # raise Exception('Out of bounds memory access!')
                if opcode == bin_format.i32_load:
                    # [TODO] a better method to process out of index
                    a = a if 0 <= a <= len(m.data) - 4 else randint(0, len(m.data) - 4)
                    stack.add(Value.from_i32(number.MemoryLoad.i32(m.data[a:a + 4])))
                    continue
                if opcode == bin_format.i64_load:
                    # [TODO] a better method to process out of index
                    a = a if 0 <= a <= len(m.data) - 8 else randint(0, len(m.data) - 8)
                    stack.add(Value.from_i64(number.MemoryLoad.i64(m.data[a:a + 8])))
                    continue

                # [TODO] Using some approaches to implement float byte-store.
                if opcode == bin_format.f32_load:
                    stack.add(Value.from_f32(number.LittleEndian.f32(m.data[a:a + 4])))
                    continue
                if opcode == bin_format.f64_load:
                    stack.add(Value.from_f64(number.LittleEndian.f64(m.data[a:a + 8])))
                    continue

                if opcode == bin_format.i32_load8_s:
                    stack.add(Value.from_i32(number.MemoryLoad.i8(m.data[a:a + 1])))
                    continue
                if opcode == bin_format.i32_load8_u:
                    stack.add(Value.from_i32(number.MemoryLoad.u8(m.data[a:a + 1])))
                    continue
                if opcode == bin_format.i32_load16_s:
                    stack.add(Value.from_i32(number.MemoryLoad.i16(m.data[a:a + 2])))
                    continue
                if opcode == bin_format.i32_load16_u:
                    stack.add(Value.from_i32(number.MemoryLoad.u16(m.data[a:a + 2])))
                    continue
                if opcode == bin_format.i64_load8_s:
                    stack.add(Value.from_i64(number.MemoryLoad.i8(m.data[a:a + 1])))
                    continue
                if opcode == bin_format.i64_load8_u:
                    stack.add(Value.from_i64(number.MemoryLoad.u8(m.data[a:a + 1])))
                    continue
                if opcode == bin_format.i64_load16_s:
                    stack.add(Value.from_i64(number.MemoryLoad.i16(m.data[a:a + 2])))
                    continue
                if opcode == bin_format.i64_load16_u:
                    stack.add(Value.from_i64(number.MemoryLoad.u16(m.data[a:a + 2])))
                    continue
                if opcode == bin_format.i64_load32_s:
                    stack.add(Value.from_i64(number.MemoryLoad.i32(m.data[a:a + 4])))
                    continue
                if opcode == bin_format.i64_load32_u:
                    stack.add(Value.from_i64(number.MemoryLoad.u32(m.data[a:a + 4])))
                    continue
                continue

            if bin_format.i32_store <= opcode <= bin_format.i64_store32:
                v = stack.pop().n
                a = stack.pop().n + i.immediate_arguments[1]
                if utils.is_symbolic(a):
                    a = z3.simplify(a)
                    if opcode == bin_format.i32_store:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 4)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 4] = number.MemoryStore.pack_i32(v)
                        continue
                    if opcode == bin_format.i64_store:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 8)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 8] = number.MemoryStore.pack_i64(v)
                        continue
                    if opcode == bin_format.f32_store:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 4)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 4] = number.MemoryStore.pack_f32(v)
                        continue
                    if opcode == bin_format.f64_store:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 8)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 8] = number.MemoryStore.pack_f64(v)
                        continue
                    if opcode == bin_format.i32_store8:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 1)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 1] = number.MemoryStore.pack_i8(v)
                        continue
                    if opcode == bin_format.i32_store16:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 2)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 2] = number.MemoryStore.pack_i16(v)
                        continue
                    if opcode == bin_format.i64_store8:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 1)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 1] = number.MemoryStore.pack_i8(v)
                        continue
                    if opcode == bin_format.i64_store16:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 2)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 2] = number.MemoryStore.pack_i16(v)
                        continue
                    if opcode == bin_format.i64_store32:
                        if a not in memory_address_symbolic_variable:
                            memory_address_symbolic_variable[a] = randint(0, len(m.data) - 4)
                        m.data[memory_address_symbolic_variable[a]:memory_address_symbolic_variable[
                                                                       a] + 4] = number.MemoryStore.pack_i32(v)
                        continue
                    continue

                if a + bin_format.opcodes[opcode][2] > len(m.data):
                    path_abort = True
                    temp_stack = Stack()
                    temp_stack.add(frame)
                    if path_depth <= 0:
                        return branch_res, temp_stack
                    else:
                        return branch_res, temp_stack
                    raise Exception('Out of bounds memory access!')
                if opcode == bin_format.i32_store:
                    m.data[a:a + 4] = number.MemoryStore.pack_i32(v)
                    continue
                if opcode == bin_format.i64_store:
                    m.data[a:a + 8] = number.MemoryStore.pack_i64(v)
                    # print(m.data[a:a + 8])
                    # print(a,v)
                    # print(number.MemoryStore.pack_i64(128))
                    continue

                if opcode == bin_format.f32_store:
                    m.data[a:a + 4] = number.MemoryStore.pack_f32(v)
                    continue
                if opcode == bin_format.f64_store:
                    m.data[a:a + 8] = number.MemoryStore.pack_f64(v)
                    continue

                if opcode == bin_format.i32_store8:
                    m.data[a:a + 1] = number.MemoryStore.pack_i8(v)
                    continue
                if opcode == bin_format.i32_store16:
                    m.data[a:a + 2] = number.MemoryStore.pack_i16(v)
                    continue
                if opcode == bin_format.i64_store8:
                    m.data[a:a + 1] = number.MemoryStore.pack_i8(v)
                    continue
                if opcode == bin_format.i64_store16:
                    m.data[a:a + 2] = number.MemoryStore.pack_i16(v)
                    continue
                if opcode == bin_format.i64_store32:
                    m.data[a:a + 4] = number.MemoryStore.pack_i32(v)
                    continue
                continue
            if opcode == bin_format.current_memory:
                stack.add(Value.from_i32(m.size))
                continue

            # [TODO] z3.If the grow size is a symbol, it could be difficult to execute. Current method
            #        is a simple random integer. There may exists bug.
            if opcode == bin_format.grow_memory:
                cur_size = m.size
                grow_size = stack.pop().n
                if not utils.is_all_real(grow_size) or grow_size > 100:
                    grow_size = randint(0, 100)
                m.grow(grow_size)
                stack.add(Value.from_i32(cur_size))
                continue
            continue

        if bin_format.i32_const <= opcode <= bin_format.f64_const:
            if opcode == bin_format.i32_const:
                stack.add(Value.from_i32(i.immediate_arguments))
                continue
            if opcode == bin_format.i64_const:
                stack.add(Value.from_i64(i.immediate_arguments))
                continue
            if opcode == bin_format.f32_const:
                stack.add(Value.from_f32(i.immediate_arguments))
                continue
            if opcode == bin_format.f64_const:
                stack.add(Value.from_f64(i.immediate_arguments))
                continue
            continue
        if opcode == bin_format.i32_eqz:
            object_a = stack.pop()
            a = object_a.n
            if utils.is_all_real(a):
                computed = int(a == 0)
            else:
                computed = z3.If(a == 0, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
            object_c = Value.from_i32(computed)
            # detect the random number
            if id(object_a) in global_vars.block_number_id_list:
                global_vars.add_random_number_id(id(object_c))
            stack.add(object_c)
            continue

        if bin_format.i32_eq <= opcode <= bin_format.i32_geu:
            object_b = stack.pop()
            b = object_b.n
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = (id(object_a) in global_vars.block_number_id_list
                                  or id(object_b) in global_vars.block_number_id_list)

            if opcode == bin_format.i32_eq:
                if utils.is_all_real(a, b):
                    computed = int(a == b)
                    # print(f'computed: {computed} {type(computed)}')
                else:
                    computed = z3.simplify(z3.If(a == b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                # print(f'a type:{type(a)} b type:{type(b)} a eq b type:{type(object_c)}')
                stack.add(object_c)

            elif opcode == bin_format.i32_ne:
                if utils.is_all_real(a, b):
                    computed = int(a != b)
                else:
                    computed = z3.simplify(z3.If(a != b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_lts:
                if utils.is_all_real(a, b):
                    computed = int(a < b)
                else:
                    computed = z3.simplify(z3.If(a < b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_ltu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u32(a) < number.int2u32(b))
                else:
                    computed = z3.simplify(z3.If(z3.ULT(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_gts:
                if utils.is_all_real(a, b):
                    computed = int(a > b)
                else:
                    computed = z3.simplify(z3.If(a > b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_gtu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u32(a) > number.int2u32(b))
                else:
                    computed = z3.simplify(z3.If(z3.UGT(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_les:
                if utils.is_all_real(a, b):
                    computed = int(a <= b)
                else:
                    computed = z3.simplify(z3.If(a <= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_leu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u32(a) <= number.int2u32(b))
                else:
                    computed = z3.simplify(z3.If(z3.ULE(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_ges:
                if utils.is_all_real(a, b):
                    computed = int(a >= b)
                else:
                    computed = z3.simplify(z3.If(a >= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_geu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u32(a) >= number.int2u32(b))
                else:
                    computed = z3.simplify(z3.If(z3.UGE(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        if opcode == bin_format.i64_eqz:
            object_a = stack.pop()
            a = object_a.n
            if utils.is_all_real(a):
                computed = int(a == 0)
            else:
                computed = z3.simplify(z3.If(a == 0, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
            object_c = Value.from_i32(computed)
            # detect the random number
            if id(object_a) in global_vars.block_number_id_list:
                global_vars.add_random_number_id(id(object_c))
            stack.add(object_c)
            continue
        if bin_format.i64_eq <= opcode <= bin_format.i64_geu:
            object_b = stack.pop()
            b = object_b.n
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = (id(object_a) in global_vars.block_number_id_list
                                  or id(object_b) in global_vars.block_number_id_list)

            if opcode == bin_format.i64_eq:
                if utils.is_all_real(a, b):
                    computed = int(a == b)
                else:
                    computed = z3.simplify(z3.If(a == b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_ne:
                if utils.is_all_real(a, b):
                    computed = int(a != b)
                else:
                    computed = z3.simplify(z3.If(a != b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_lts:
                if utils.is_all_real(a, b):
                    computed = int(a < b)
                else:
                    computed = z3.simplify(z3.If(a < b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_ltu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u64(a) < number.int2u64(b))
                else:
                    computed = z3.simplify(z3.If(z3.ULT(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                # print(f'ltu:computed:{computed} {type(computed)} object_c:{object_c} {type(object_c)}')
                stack.add(object_c)

            elif opcode == bin_format.i64_gts:
                if utils.is_all_real(a, b):
                    computed = int(a > b)
                else:
                    computed = z3.simplify(z3.If(a > b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_gtu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u64(a) > number.int2u64(b))
                else:
                    computed = z3.simplify(z3.If(z3.UGT(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_les:
                if utils.is_all_real(a, b):
                    computed = int(a <= b)
                else:
                    computed = z3.simplify(z3.If(a <= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_leu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u64(a) <= number.int2u64(b))
                else:
                    computed = z3.simplify(z3.If(z3.ULE(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_ges:
                if utils.is_all_real(a, b):
                    computed = int(a >= b)
                else:
                    computed = z3.simplify(z3.If(a >= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_geu:
                if utils.is_all_real(a, b):
                    computed = int(number.int2u64(a) >= number.int2u64(b))
                else:
                    computed = z3.simplify(z3.If(z3.UGE(a, b), z3.BitVecVal(1, 32), z3.BitVecVal(0, 32)))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        if bin_format.f32_eq <= opcode <= bin_format.f64_ge:
            b = stack.pop().n
            a = stack.pop().n
            if utils.is_all_real(a, b):
                if opcode == bin_format.f32_eq:
                    stack.add(Value.from_i32(int(a == b)))
                    continue
                if opcode == bin_format.f32_ne:
                    stack.add(Value.from_i32(int(a != b)))
                    continue
                if opcode == bin_format.f32_lt:
                    stack.add(Value.from_i32(int(a < b)))
                    continue
                if opcode == bin_format.f32_gt:
                    stack.add(Value.from_i32(int(a > b)))
                    continue
                if opcode == bin_format.f32_le:
                    stack.add(Value.from_i32(int(a <= b)))
                    continue
                if opcode == bin_format.f32_ge:
                    stack.add(Value.from_i32(int(a >= b)))
                    continue
                if opcode == bin_format.f64_eq:
                    stack.add(Value.from_i32(int(a == b)))
                    continue
                if opcode == bin_format.f64_ne:
                    stack.add(Value.from_i32(int(a != b)))
                    continue
                if opcode == bin_format.f64_lt:
                    stack.add(Value.from_i32(int(a < b)))
                    continue
                if opcode == bin_format.f64_gt:
                    stack.add(Value.from_i32(int(a > b)))
                    continue
                if opcode == bin_format.f64_le:
                    stack.add(Value.from_i32(int(a <= b)))
                    continue
                if opcode == bin_format.f64_ge:
                    stack.add(Value.from_i32(int(a >= b)))
                    continue
            else:
                if opcode == bin_format.f32_eq:
                    computed = z3.If(a == b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f32_ne:
                    computed = z3.If(a != b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f32_lt:
                    computed = z3.If(a < b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f32_gt:
                    computed = z3.If(a > b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f32_le:
                    computed = z3.If(a <= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f32_ge:
                    computed = z3.If(a >= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_eq:
                    computed = z3.If(a == b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_ne:
                    computed = z3.If(a != b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_lt:
                    computed = z3.If(a < b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_gt:
                    computed = z3.If(a > b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_le:
                    computed = z3.If(a <= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
                if opcode == bin_format.f64_ge:
                    computed = z3.If(a >= b, z3.BitVecVal(1, 32), z3.BitVecVal(0, 32))
                    stack.add(Value.from_i32(computed))
                    continue
            continue

        # [TODO] Difficulty to symbolic execution.
        if bin_format.i32_clz <= opcode <= bin_format.i32_popcnt:
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = id(object_a) in global_vars.block_number_id_list
            if opcode == bin_format.i32_clz:
                if utils.is_all_real(a):
                    c = 0
                    while c < 32 and (a & 0x80000000) == 0:
                        c += 1
                        a *= 2
                else:

                    c = 0
                object_c = Value.from_i32(c)
                stack.add(object_c)

            elif opcode == bin_format.i32_ctz:
                if utils.is_all_real(a):
                    c = 0
                    while c < 32 and (a % 2) == 0:
                        c += 1
                        a /= 2
                else:
                    c = 0
                object_c = Value.from_i32(c)
                stack.add(object_c)

            elif opcode == bin_format.i32_popcnt:
                if utils.is_all_real(a):
                    c = 0
                    for i in range(32):
                        if 0x1 & a:
                            c += 1
                        a //= 2
                else:
                    c = 0
                object_c = Value.from_i32(c)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        if bin_format.i32_add <= opcode <= bin_format.i32_rotr:
            object_b = stack.pop()
            b = object_b.n
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = (id(object_a) in global_vars.block_number_id_list
                                  or id(object_b) in global_vars.block_number_id_list)

            if opcode in [
                bin_format.i32_divs,
                bin_format.i32_divu,
                bin_format.i32_rems,
                bin_format.i32_remu,
            ]:
                if utils.is_all_real(b) and b == 0:
                    logger.println('Integer divide by zero!')
                    b = 1
                elif not utils.is_all_real(b):
                    solver.push()
                    solver.add(z3.Not(b == 0))
                    if utils.check_sat(solver) == z3.unsat:
                        logger.println('Integer divide by zero!')
                        b = 1
                    solver.pop()
            if opcode == bin_format.i32_add:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(a + b)
                else:
                    computed = z3.simplify(a + b)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_sub:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(a - b)
                else:
                    computed = z3.simplify(a - b)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_mul:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(a * b)
                else:
                    computed = z3.simplify(a * b)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_divs:
                if utils.is_all_real(a, b):
                    if a == 0x8000000 and b == -1:
                        raise Exception('Integer overflow!')
                    computed = number.idiv_s(a, b)
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    solver.push()
                    solver.add((a / b) < 0)
                    sign = -1 if utils.check_sat(solver) == z3.sat else 1
                    a, b = utils.sym_abs(a), utils.sym_abs(b)
                    computed = z3.simplify(sign * (a / b))
                    solver.pop()
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_divu:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(number.int2u32(a) // number.int2u32(b))
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    computed = z3.simplify(z3.UDiv(a, b))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_rems:
                if utils.is_all_real(a, b):
                    computed = number.irem_s(a, b)
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    solver.push()
                    solver.add(a < 0)
                    sign = -1 if utils.check_sat(solver) == z3.sat else 1
                    solver.pop()
                    a, b = utils.sym_abs(a), utils.sym_abs(b)
                    computed = z3.simplify(sign * (a % b))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_remu:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(number.int2u32(a) % number.int2u32(b))
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    computed = z3.simplify(z3.URem(a, b))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_and:
                computed = a & b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_or:
                computed = a | b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_xor:
                computed = a ^ b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_shl:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(a << (b % 0x20))
                else:
                    computed = z3.simplify(
                        a << (b & 0x1F))  # [TODO] Two implementation " & 0x1F" and " % 0x20" are equvalent.
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_shrs:
                if utils.is_all_real(a, b):
                    computed = a >> (b % 0x20)
                else:
                    computed = z3.simplify(a >> (b & 0x1F))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_shru:
                if utils.is_all_real(a, b):
                    computed = number.int2u32(a) >> (b % 0x20)
                else:
                    computed = z3.simplify(z3.LShR(a, b & 0x1F))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_rotl:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(number.rotl_u32(a, b))
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    computed = z3.simplify(z3.RotateLeft(a, b))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            elif opcode == bin_format.i32_rotr:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(number.rotr_u32(a, b))
                else:
                    a, b = utils.to_symbolic(a, 32), utils.to_symbolic(b, 32)
                    computed = z3.simplify(z3.RotateRight(a, b))
                object_c = Value.from_i32(computed)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        # [TODO] Diffculty to find an approach to implement the instruction.
        if bin_format.i64_clz <= opcode <= bin_format.i64_popcnt:
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = True if id(object_a) in global_vars.block_number_id_list else False

            if opcode == bin_format.i64_clz:
                if a < 0:
                    stack.add(object_a)
                    continue
                c = 1
                while c < 63 and (a & 0x4000000000000000) == 0:
                    c += 1
                    a *= 2
                object_c = Value.from_i64(c)
                stack.add(object_c)

            elif opcode == bin_format.i64_ctz:
                c = 0
                while c < 64 and (a % 2) == 0:
                    c += 1
                    a /= 2
                object_c = Value.from_i64(c)
                stack.add(object_c)

            elif opcode == bin_format.i64_popcnt:
                c = 0
                for i in range(64):
                    if 0x1 & a:
                        c += 1
                    a //= 2
                object_c = Value.from_i64(c)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        if opcode >= bin_format.i64_add and opcode <= bin_format.i64_rotr:
            object_b = stack.pop()
            b = object_b.n
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = (id(object_a) in global_vars.block_number_id_list
                                  or id(object_b) in global_vars.block_number_id_list)

            if opcode in [
                bin_format.i64_divs,
                bin_format.i64_divu,
                bin_format.i64_rems,
                bin_format.i64_remu,
            ]:
                if utils.is_all_real(b) and b == 0:
                    logger.println('Integer divide by zero!')
                    b = 1
                elif not utils.is_all_real(b):
                    solver.push()
                    solver.add(z3.Not(b == 0))
                    if utils.check_sat(solver) == z3.unsat:
                        logger.println('Integer divide by zero!')
                        b = 1
                    solver.pop()
            if opcode == bin_format.i64_add:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(a + b)
                else:
                    computed = z3.simplify(a + b)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_sub:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(a - b)
                else:
                    computed = z3.simplify(a - b)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_mul:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(a * b)
                else:
                    computed = z3.simplify(a * b)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_divs:
                if utils.is_all_real(a, b):
                    if a == 0x80000000 and b == -1:
                        raise Exception('Integer overflow!')
                    computed = number.idiv_s(a, b)
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    solver.push()
                    solver.add((a / b) < 0)
                    sign = -1 if utils.check_sat(solver) == z3.sat else 1
                    a, b = utils.sym_abs(a), utils.sym_abs(b)
                    computed = z3.simplify(sign * (a / b))
                    solver.pop()
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_divu:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(number.int2u64(a) // number.int2u64(b))
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    computed = z3.simplify(z3.UDiv(a, b))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_rems:
                if utils.is_all_real(a, b):
                    computed = number.irem_s(a, b)
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    solver.push()
                    solver.add(a < 0)
                    sign = -1 if utils.check_sat(solver) == z3.sat else 1
                    solver.pop()
                    a, b = utils.sym_abs(a), utils.sym_abs(b)
                    computed = z3.simplify(sign * (a % b))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_remu:
                if utils.is_all_real(a, b):
                    computed = number.int2i32(number.int2u64(a) % number.int2u64(b))
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    computed = z3.simplify(z3.URem(a, b))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_and:
                computed = a & b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_or:
                computed = a | b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_xor:
                computed = a ^ b
                if z3.is_expr(computed):
                    computed = z3.simplify(computed)
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_shl:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(a << (b % 0x40))
                else:
                    computed = z3.simplify(a << (b & 0x3F))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_shrs:
                if utils.is_all_real(a, b):
                    computed = a >> (b % 0x40)
                else:
                    computed = z3.simplify(a >> (b & 0x3F))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_shru:
                if utils.is_all_real(a, b):
                    computed = number.int2u64(a) >> (b % 0x40)
                elif utils.is_all_real(a) and utils.is_symbolic(b):
                    computed = z3.simplify(number.int2u64(a) >> (b & 0x3F))
                else:
                    b = utils.to_symbolic(b, 64)
                    computed = z3.simplify(z3.LShR(a, b & 0x3F))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_rotl:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(number.rotr_u64(a, b))
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    computed = z3.simplify(z3.RotateLeft(a, b))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            elif opcode == bin_format.i64_rotr:
                if utils.is_all_real(a, b):
                    computed = number.int2i64(number.rotr_u64(a, b))
                else:
                    a, b = utils.to_symbolic(a, 64), utils.to_symbolic(b, 64)
                    computed = z3.simplify(z3.RotateRight(a, b))
                object_c = Value.from_i64(computed)
                stack.add(object_c)

            if random_number_flag:
                global_vars.add_random_number_id(id(object_c))
            continue

        # [TODO] float number problems.
        if bin_format.f32_abs <= opcode <= bin_format.f32_sqrt:
            a = stack.pop().n
            if opcode == bin_format.f32_abs:
                if utils.is_all_real(a):
                    stack.add(Value.from_f32(abs(a)))
                else:
                    stack.add(Value.from_f32(z3.fpAbs(a)))
                continue
            if opcode == bin_format.f32_neg:
                stack.add(Value.from_f32(-a))
                continue
            # [TODO]: the follow 3 op cannot implement at present
            if opcode == bin_format.f32_ceil:
                stack.add(Value.from_f32(math.ceil(a)))
                continue
            if opcode == bin_format.f32_floor:
                stack.add(Value.from_f32(math.floor(a)))
                continue
            if opcode == bin_format.f32_trunc:
                stack.add(Value.from_f32(math.trunc(a)))
                continue
            if opcode == bin_format.f32_nearest:  # depend on f32_ceil
                ceil = math.ceil(a)
                if ceil - a <= 0.5:
                    r = ceil
                else:
                    r = ceil - 1
                stack.add(Value.from_f32(r))
                continue
            if opcode == bin_format.f32_sqrt:
                if utils.is_all_real(a):
                    stack.add(Value.from_f32(math.sqrt(a)))
                else:
                    stack.add(Value.from_f32(z3.fpSqrt(a)))
                continue
            continue
        if bin_format.f32_add <= opcode <= bin_format.f32_copysign:
            b = stack.pop().n
            a = stack.pop().n
            if opcode == bin_format.f32_add:
                stack.add(Value.from_f32(a + b))
                continue
            if opcode == bin_format.f32_sub:
                stack.add(Value.from_f32(a - b))
                continue
            if opcode == bin_format.f32_mul:
                stack.add(Value.from_f32(a * b))
                continue
            if opcode == bin_format.f32_div:
                if utils.is_all_real(b) and abs(b - 0.0) < 1e-10:
                    b = 1.0
                stack.add(Value.from_f32(a / b))
                continue
            if opcode == bin_format.f32_min:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f32(min(a, b)))
                else:
                    stack.add(Value.from_f32(z3.fpMin(a, b)))
                continue
            if opcode == bin_format.f32_max:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f32(max(a, b)))
                else:
                    stack.add(Value.from_f32(z3.fpMax(a, b)))
                continue
            if opcode == bin_format.f32_copysign:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f32(math.copysign(a, b)))
                elif utils.is_all_real(b):
                    stack.add(Value.from_f32(z3.fpAbs(a) * (1 if b > 0 else -1)))
                elif utils.is_all_real(a):
                    stack.add(Value.from_f32(abs(a) * z3.If(b > 0, z3.BitVecVal(1, 32), z3.BitVecVal(-1, 32))))
                else:
                    stack.add(Value.from_f32(z3.fpAbs(a) * z3.If(b > 0, z3.BitVecVal(1, 32), z3.BitVecVal(-1, 32))))
                continue
            continue
        if bin_format.f64_abs <= opcode <= bin_format.f64_sqrt:
            a = stack.pop().n
            if opcode == bin_format.f64_abs:
                if utils.is_all_real(a):
                    stack.add(Value.from_f64(abs(a)))
                else:
                    stack.add(Value.from_f64(z3.fpAbs(a)))
                continue
            if opcode == bin_format.f64_neg:
                stack.add(Value.from_f64(-a))
                continue
            # [TODO]: cannot implement at present
            if opcode == bin_format.f64_ceil:
                stack.add(Value.from_f64(math.ceil(a)))
                continue
            if opcode == bin_format.f64_floor:
                stack.add(Value.from_f64(math.floor(a)))
                continue
            if opcode == bin_format.f64_trunc:
                stack.add(Value.from_f64(math.trunc(a)))
                continue
            if opcode == bin_format.f64_nearest:
                ceil = math.ceil(a)
                if ceil - a <= 0.5:
                    r = ceil
                else:
                    r = ceil - 1
                stack.add(Value.from_f64(r))
                continue
            if opcode == bin_format.f64_sqrt:
                stack.add(Value.from_f64(math.sqrt(a)))
                continue
            continue
        if bin_format.f64_add <= opcode <= bin_format.f64_copysign:
            b = stack.pop().n
            a = stack.pop().n
            if opcode == bin_format.f64_add:
                stack.add(Value.from_f64(a + b))
                continue
            if opcode == bin_format.f64_sub:
                stack.add(Value.from_f64(a - b))
                continue
            if opcode == bin_format.f64_mul:
                stack.add(Value.from_f64(a * b))
                continue
            if opcode == bin_format.f64_div:
                if utils.is_all_real(b) and abs(b - 0.0) < 1e-10:
                    logger.println('float division by zero!')
                    b = 1.0
                stack.add(Value.from_f64(a / b))
                continue
            if opcode == bin_format.f64_min:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f64(min(a, b)))
                else:
                    stack.add(Value.from_f64(z3.fpMin(a, b)))
                continue
            if opcode == bin_format.f64_max:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f64(max(a, b)))
                else:
                    stack.add(Value.from_f64(z3.fpMax(a, b)))
                continue
            if opcode == bin_format.f64_copysign:
                if utils.is_all_real(a, b):
                    stack.add(Value.from_f64(math.copysign(a, b)))
                elif utils.is_all_real(b):
                    stack.add(Value.from_f64(z3.fpAbs(a) * (1 if b > 0 else -1)))
                elif utils.is_all_real(a):
                    stack.add(Value.from_f64(abs(a) * z3.If(b > 0, z3.BitVecVal(1, 32), z3.BitVecVal(-1, 32))))
                else:
                    stack.add(Value.from_f64(z3.fpAbs(a) * z3.If(b > 0, z3.BitVecVal(1, 32), z3.BitVecVal(-1, 32))))
                continue
            continue
        if bin_format.i32_wrap_i64 <= opcode <= bin_format.f64_promote_f32:
            object_a = stack.pop()
            a = object_a.n

            # detect the random number
            random_number_flag = id(object_a) in global_vars.block_number_id_list

            if opcode in [
                bin_format.i32_trunc_sf32,
                bin_format.i32_trunc_uf32,
                bin_format.i32_trunc_sf64,
                bin_format.i32_trunc_uf64,
                bin_format.i64_trunc_sf32,
                bin_format.i64_trunc_uf32,
                bin_format.i64_trunc_sf64,
                bin_format.i64_trunc_uf64,
            ]:
                if utils.is_all_real(a) and math.isnan(a):
                    raise Exception('Invalid conversion to integer!')
            if opcode == bin_format.i32_wrap_i64:
                stack.add(Value.from_i32(number.int2i32(a)))
                continue
            if opcode == bin_format.i32_trunc_sf32:
                if utils.is_all_real(a):
                    if a > 2 ** 31 - 1 or a < -2 ** 32:
                        raise Exception('Integer overflow!')
                    stack.add(Value.from_i32(int(a)))
                else:
                    stack.add(Value.from_i32(0))
                continue
            if opcode == bin_format.i32_trunc_uf32:
                if utils.is_all_real(a):
                    if a > 2 ** 32 - 1 or a < -1:
                        raise Exception('Integer overflow!')
                    stack.add(Value.from_i32(int(a)))
                else:
                    stack.add(Value.from_i32(0))
                continue
            if opcode == bin_format.i32_trunc_sf64:
                if utils.is_all_real(a):
                    if a > 2 ** 31 - 1 or a < -2 ** 32:
                        raise Exception('Integer overflow!')
                    stack.add(Value.from_i32(int(a)))
                else:
                    stack.add(Value.from_i32(0))
                continue
            if opcode == bin_format.i32_trunc_uf64:
                if utils.is_all_real(a):
                    if a >= 2 ** 32 - 1 or a < -1:
                        raise Exception('Integer overflow!')
                    stack.add(Value.from_i32(int(a)))
                else:
                    stack.add(Value.from_i32(0))
                continue
            if opcode == bin_format.i64_extend_si32:
                if utils.is_all_real(a):
                    stack.add(Value.from_i64(a))
                else:
                    stack.add(Value.from_i64(z3.SignExt(a, 32)))
                continue
            if opcode == bin_format.i64_extend_ui32:
                if utils.is_all_real(a):
                    stack.add(Value.from_i64(number.int2u32(a)))
                else:
                    stack.add(Value.from_i64(z3.ZeroExt(32, a)))
                continue
            if opcode == bin_format.i64_trunc_sf32:
                if a > 2 ** 63 - 1 or a < -2 ** 63:
                    raise Exception('Integer overflow!')
                stack.add(Value.from_i64(int(a)))
                continue
            if opcode == bin_format.i64_trunc_uf32:
                if a > 2 ** 64 - 1 or a < -1:
                    raise Exception('Integer overflow!')
                stack.add(Value.from_i64(int(a)))
                continue
            if opcode == bin_format.i64_trunc_sf64:
                stack.add(Value.from_i64(int(a)))
                continue
            if opcode == bin_format.i64_trunc_uf64:
                if a < -1:
                    raise Exception('Integer overflow!')
                stack.add(Value.from_i64(int(a)))
                continue
            if opcode == bin_format.f32_convert_si32:
                stack.add(Value.from_f32(a))
                continue
            if opcode == bin_format.f32_convert_ui32:
                stack.add(Value.from_f32(number.int2u32(a)))
                continue
            if opcode == bin_format.f32_convert_si64:
                stack.add(Value.from_f32(a))
                continue
            if opcode == bin_format.f32_convert_ui64:
                stack.add(Value.from_f32(number.int2u64(a)))
                continue
            if opcode == bin_format.f32_demote_f64:
                stack.add(Value.from_f32(a))
                continue
            if opcode == bin_format.f64_convert_si32:
                stack.add(Value.from_f64(a))
                continue
            if opcode == bin_format.f64_convert_ui32:
                stack.add(Value.from_f64(number.int2u32(a)))
                continue
            if opcode == bin_format.f64_convert_si64:
                stack.add(Value.from_f64(a))
                continue
            if opcode == bin_format.f64_convert_ui64:
                stack.add(Value.from_f64(number.int2u64(a)))
                continue
            if opcode == bin_format.f64_promote_f32:
                stack.add(Value.from_f64(a))
                continue
            continue
        if bin_format.i32_reinterpret_f32 <= opcode <= bin_format.f64_reinterpret_i64:
            a = stack.pop().n
            if opcode == bin_format.i32_reinterpret_f32:
                stack.add(Value.from_i32(number.f322i32(a)))
                continue
            if opcode == bin_format.i64_reinterpret_f64:
                stack.add(Value.from_i64(number.f642i64(a)))
                continue
            if opcode == bin_format.f32_reinterpret_i32:
                stack.add(Value.from_f32(number.i322f32(a)))
                continue
            if opcode == bin_format.f64_reinterpret_i64:
                stack.add(Value.from_f64(number.i642f64(a)))
                continue
            continue
    # print('自然return')
    return [stack.pop() for _ in range(frame.arity)][::-1], stack
