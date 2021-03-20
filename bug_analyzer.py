#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
The analysis logic module. It consists some analysis functions.
"""
from typing import Tuple

import logger
import structure
import bin_format
import z3
import number
from z3.z3util import get_vars
from runtime import Label, Value
from runtime import WasmFunc
from global_variables import global_vars
import utils


def cur_state_analysis(store, frame, stack, expr, pc, solver=None):
    """Analyze current state after executing an instruction. When symbolic
    execution, if the global mode is vulnerability detection model, the function
    will execute the corresponding logic.

    Args:
        store: the function address of current module
        frame: current runtime frame
        stack: the stack for current state
        expr: the instructions to execute
        pc: the program counter
        solver: z3 solver

    Returns:

    """
    if global_vars.forged_detection_mode:
        forged_transfer_analysis(store, frame, stack, expr, pc)
        return

    if global_vars.fake_detection_mode:
        fake_eos_analysis(store, frame, stack, expr, pc, solver)
        return

    if _is_transfer_function(store, frame, stack, expr, pc):
        detect_forged_transfer(store, frame, global_vars.transfer_function_index)


def locate_transfer(vm, name):
    """Using specific parameters to locate transfer function.

    Args:
        vm: virtual machine includes all env information
        name: the name of contract

    Returns:

    """
    if global_vars.apply_function_address is None:
        return

    # check whether the type is valid transfer type
    apply_func_type = structure.FunctionType()
    apply_func_type.args = bytearray([bin_format.i64, bin_format.i64, bin_format.i64])
    apply_func_type.rets = bytearray()

    apply_func = vm.store.funcs[vm.module_instance.funcaddrs[global_vars.apply_function_address]]
    global_vars.locate()
    if apply_func.functype == apply_func_type:
        params = [utils.eos_abi_to_int(name), utils.eos_abi_to_int('eosio.token'), utils.eos_abi_to_int('transfer')]
        global_vars.locate()
        try:
            vm.exec_by_address(global_vars.apply_function_address, params)
        except AssertionError as e:
            logger.println(f'unreachable transfer: {e}')
        except SystemExit as e:
            logger.infoln(f'transfer found')
    global_vars.sym_exec()


def function_analysis(vm) -> None:
    """Analysis function, it read the opcode and arguments of function 
    and detect vulnerability of smart contract. The analysis result will 
    be store in global varibles.

    Args:
        vm: the virtual include env and structure.
    """

    funcs = vm.module.funcs
    # if the analyzed contract is ethereum
    if global_vars.contract_type == 'ethereum':
        # 1. Analyzing instruction sequentially.
        # 2. If the current instruction is *call* and its argument is *ethereum.delegateCall*, then checking.
        # 3. The parameters of ethereum.delegateCall are on stack, and the first parameter is
        #    address to delegate call.
        # 4. It is dangerous delegate call if the address is source from input.
        for index, func in enumerate(funcs):
            expr = func.expr
            for i, instr in enumerate(expr.data):
                if instr.code == bin_format.call and vm.module_instance.funcaddrs[instr.immediate_arguments] \
                        in global_vars.call_delegate_addr:
                    if expr.data[i - 1] not in (bin_format.i32_const, bin_format.i64_const):
                        # global_vars.find_ethereum_delegate_call()
                        pass
        global_vars.library_offset = len(vm.store.funcs) - 125 - library_function_dict['offset'] - 1
        detect_greedy(vm)
        check_block_dependence_static(vm)

def detect_greedy(vm) -> None:
    """This function is used to detect greedy vulnerabilities

    Args:
        vm: the virtual include env and structure.
    """
    global library_function_dict
    funcs = vm.module.funcs
    # if the analyzed contract is ethereum
    if global_vars.contract_type == 'ethereum':
        # 1. Count the non payable functions, finally get the number of payable functions.
        # 2. If there are payable functions in the contract but no *ethereum.call*, greedy exists.
        non_payable_count = 0
        offset = len(vm.module.imports)
        main_index = global_vars.main_function_address - len(vm.store.funcs) + len(funcs)
        exist_send_or_transfer = False
        payable_function = 0 
        for index, func in enumerate(funcs):
            if exist_send_or_transfer:
                break
            expr = func.expr
            if index == main_index:
                pc_start_main_func = 0
                pc_end_main_func = 0
                pc_start_fallback = 0
                pc_end_fallback = 0
                for i, instr in enumerate(expr.data):
                    if instr.code == bin_format.i64_const and instr.immediate_arguments > 10000000:
                        pc_start_main_func = i
                    elif instr.code == bin_format.else_:
                        pc_end_main_func = i
                    elif call_library_function(instr, global_vars.library_offset, '$iszero'):
                        pc_start_fallback = i
                    elif call_library_function(instr, global_vars.library_offset, '$stop'):
                        pc_end_fallback = i
                    if pc_start_main_func > 0 and pc_end_main_func > 0:
                        if check_function_payable(expr.data[pc_start_main_func:pc_end_main_func+1]):
                            payable_function += 1
                        pc_start_main_func = 0
                        pc_end_main_func = 0
                    if pc_start_fallback > 0 and pc_end_fallback > 0:
                        if check_function_payable(expr.data[pc_start_fallback:pc_end_fallback+1]):
                            payable_function += 1
                        pc_start_fallback = 0
                        pc_end_fallback = 0
                continue
            if len(funcs) - index <= 125:
                continue
            is_payable = True
            for i, instr in enumerate(expr.data):
                if call_library_function(instr, global_vars.library_offset, '$call'):
                    exist_send_or_transfer = True 
                non_payable_count += 1
                is_payable = False
                    # break
            if is_payable:
                global_vars.ETH_payable_function_address_set.add(index + offset)
        if not exist_send_or_transfer and payable_function:
            global_vars.ethereum_greedy = 1

def check_block_dependence_static(vm) -> None:
    """This function is used to detect block dependence vulnerabilities, 
    This function uses static analysis of the instruction sequence to detect vulnerabilities

    Args:
        vm: the virtual include env and structure.
    """
    global library_function_dict
    funcs = vm.module.funcs
    # if the analyzed contract is ethereum
    if global_vars.contract_type == 'ethereum':
        offset = len(vm.module.imports)
        main_index = global_vars.main_function_address - len(vm.store.funcs) + len(funcs)
        exist_timestamp_or_number = False
        for index, func in enumerate(funcs):
            if exist_timestamp_or_number:
                break
            if index == main_index:
                continue
            expr = func.expr
            if len(funcs) - index <= 125:
                continue
            for i, instr in enumerate(expr.data):
                if call_library_function(instr, global_vars.library_offset, '$number') or call_library_function(instr, global_vars.library_offset, '$timestamp'):
                    exist_timestamp_or_number = True 
                    break
        if exist_timestamp_or_number:
            # global_vars.block_dependency_count += 1
            pass

def find_symbolic_in_solver(solver:'solver'):
    """This function is used to separate the symbol value from the solver, and add it in dict of global_vars 

    Args:
        solver: current z3 solver.
    """
    list_solver = solver.units()
    r = str()
    for ret in global_vars.dict_block_solver:
        for l in list_solver:
            if str(l).find(str(ret)) != -1:
                r = ret
    if r:
        global_vars.add_dict_block_solver(r, 1)

def check_block_dependence_dynamic(solver:'solver'):
    """This function is used to detect block dependence vulnerabilities, 

    Args:
        vm: the virtual include env and structure.
    """
    if global_vars.dict_block_solver:
        for ret in global_vars.dict_block_solver:
            if len(global_vars.dict_block_solver[ret]) < 2:
                continue
            if str(global_vars.dict_block_solver[ret][0]) == str(solver):
                global_vars.block_dependency_count += 1
                global_vars.dict_block_solver.pop(ret)
                break
                
    else:
        pass

def check_reentrancy_bug(memory, solver, path_condition:list = None):
    """This function is used to detect reentrancy vulnerabilities, 

    Args:
        path_condition: current path condition
        memory: current memory of Wasm
        solver: current z3 solver
    """
    list_solver = solver.units()
    for expr in list_solver: 
        if not z3.is_expr(expr): 
            continue
        vars = get_vars(expr)
        flag_empty = 0
        for var in vars:
            if var in global_vars.dict_symbolic_address: 
                flag_empty += 1
                tmp_dict = global_vars.find_dict_root(var)
                if not tmp_dict:
                    continue
                for item in tmp_dict: 
                    if item in global_vars.list_storageStore:
                        continue
                    else:
                        global_vars.find_reentrancy_detection()
        if flag_empty == 0:
            global_vars.find_reentrancy_detection()

def call_library_function(instr: structure.Instruction, library_offset: int, library_func_name: str) -> bool:
    """Check whether the current instruction is *call* and whether its parameter is a specific library function

    Args:
        instr: the instruction now check
        library_offset: offset between simple functions and library functions 
        library_func_name: name of library function being compared
    """
    global library_function_dict
    if instr.code == bin_format.call and instr.immediate_arguments == (library_offset + library_function_dict[library_func_name]):
        return True
    else:
        return False

def check_function_payable(instrs:list) -> bool:
    """
    Check whether the function contains the keyword 'payable'

    Args:
        instrs: the instructions of function
    """
    exist_callvalue = False
    exist_revert = False
    for instr in instrs:
        if call_library_function(instr, global_vars.library_offset, '$callvalue'):
            exist_callvalue = True
        if call_library_function(instr, global_vars.library_offset, '$revert'):
            exist_revert = True
        if exist_callvalue and exist_revert:
            return False
    return True

def check_block_dependence_old(block_number_flag: bool) -> None:
    """During symbolic execution, it is called when the 
    transfer call is satisfied and the parameters used 
    in the call are related to the block information.
    """
    if block_number_flag:
        global_vars.find_block_dependence()


def check_ethereum_greedy(address: int) -> None:
    """During symbolic execution, it is called when call
    instruction execution to determine that greedy vulnerability
    exists."""
    if global_vars.cannot_send_ETH and address in global_vars.ETH_payable_function_address_set:
        global_vars.ethereum_greedy = 1


def check_ethereum_delegate_call(instr: 'Instruction') -> None:
    """During symbolic execution, check whether the function 
    called by delegateCall is externally imported and verify 
    the correctness of the analysis.
    """
    if instr in (bin_format.i32_const, bin_format.i64_const):
        # global_vars.find_ethereum_delegate_call()
        pass

def check_mishandled_exception(solver: 'solver', pc: int) -> None:
    """This function is used to detect mishandled exception

    Args:
        solver: current z3 solver
        pc: current pc of all
    """
    if len(global_vars.call_symbolic_ret) > 0:
        list_solver = solver.units()
        r = str()
        for ret in global_vars.call_symbolic_ret:
            if pc - global_vars.call_symbolic_ret[ret] > 300:
                break
            for l in list_solver:
                if str(l).find(ret) != -1:
                    r = ret
        if r:
            global_vars.call_symbolic_ret.pop(r)

def detect_forged_transfer(store, frame, index):
    """Forge transfer notification vulnerability analysis function, and it is called
    when engine execute tee_local instruction in symbolic execution.

    Args:
        frame: the current execution frame
        store: the variables collection
        index: the index of transfer function

    Returns:

    """

    global_vars.forged_detect()

    module = frame.module
    table = store.tables[module.tableaddrs[0]]
    transfer_func = store.funcs[table.elem[index]]
    params = utils.gen_symbolic_args(transfer_func)
    global_vars.vm.exec_by_index(index, params)
    if not global_vars.found_to_check:
        global_vars.find_forged_notification()
    global_vars.sym_exec() # set the detection mode to False


def forged_transfer_analysis(store, frame, stack, expr, pc):
    global_vars.pc = pc
    instructions = expr.data
    if pc > len(instructions) - 5:
        return

    contract_name_int64 = global_vars.contract_name_int64
    self_locals = global_vars.self_locals
    unpack_locals = global_vars.unpack_locals
    eosio_assert_addrs = global_vars.eosio_assert_addrs
    to_locals = global_vars.to_locals

    if instructions[pc].code == bin_format.get_local and _is_unpack(frame.module, store, instructions, pc):
        local_number = instructions[pc].immediate_arguments
        unpack_locals.add(local_number)
        _fill_memory(frame.locals[local_number].n + instructions[pc + 1].immediate_arguments, 16,
                     store.mems[frame.module.memaddrs[0]])
        global_vars.to_offset = instructions[pc + 1].immediate_arguments + 8
        global_vars.shadow_ranges.add(range(pc, pc + 4))

    # check if exist the comparison between _self and to
    if (instructions[pc].code == bin_format.get_local
            and instructions[pc].immediate_arguments == 0
            and instructions[pc + 1].code == bin_format.i64_load
            and instructions[pc + 1].immediate_arguments[1] == 0):
        if (instructions[pc + 2].code == bin_format.get_local
                and instructions[pc + 2].immediate_arguments == 2
                and instructions[pc + 3].code in (bin_format.i64_eq, bin_format.i64_ne)
                and ((instructions[pc + 4].code == bin_format.br_if)
                     or (instructions[pc + 4].code == bin_format.i32_const
                         and instructions[pc + 5].code == bin_format.call
                         and instructions[pc + 5].immediate_arguments in eosio_assert_addrs))):
            global_vars.found_to_check = True
        elif (instructions[pc + 2].code == bin_format.get_local
              and instructions[pc + 2].immediate_arguments in to_locals):
            global_vars.found_to_check = True
        elif (instructions[pc + 2].code == bin_format.get_local
              and instructions[pc + 2].immediate_arguments in unpack_locals
              and instructions[pc + 3].code == bin_format.i64_load
              and instructions[pc + 3].immediate_arguments == global_vars.to_offset):
            global_vars.found_to_check = True
        elif instructions[pc + 2].code in (bin_format.set_local, bin_format.tee_local):
            self_locals.add(instructions[pc + 2].immediate_arguments)
            global_vars.shadow_ranges.add(range(pc, pc + 3))
    if (instructions[pc].code == instructions[pc + 1].code == bin_format.get_local
            and (instructions[pc].immediate_arguments == 2
                 or instructions[pc].immediate_arguments in self_locals
                 or instructions[pc].immediate_arguments in to_locals)
            and (instructions[pc + 1].immediate_arguments == 2
                 or instructions[pc + 1].immediate_arguments in self_locals
                 or instructions[pc].immediate_arguments in to_locals)
            and instructions[pc + 2].code in (bin_format.i64_eq, bin_format.i64_ne)
            and ((instructions[pc + 3].code == bin_format.br_if)
                 or (instructions[pc + 3].code == bin_format.i32_const
                     and instructions[pc + 4].code == bin_format.call
                     and instructions[pc + 4].immediate_arguments in eosio_assert_addrs))):
        global_vars.found_to_check = True
    if (instructions[pc].code in (bin_format.i64_const, bin_format.get_local)
            and instructions[pc + 1].code in (bin_format.i64_const, bin_format.get_local)
            and instructions[pc].code != instructions[pc + 1].code
            and instructions[pc + 2].code in (bin_format.i64_eq, bin_format.i64_ne)
            and instructions[pc + 3].code in (bin_format.br_if,)
            and instructions[pc].immediate_arguments in (2, contract_name_int64)
            and instructions[pc + 1].immediate_arguments in (2, contract_name_int64)):
        global_vars.found_to_check = True
    if (instructions[pc].code == bin_format.get_local
            and instructions[pc].immediate_arguments in unpack_locals
            and instructions[pc + 1].code == bin_format.i64_load
            and instructions[pc + 1].immediate_arguments[1] == global_vars.to_offset):
        if instructions[pc + 2].code in (bin_format.tee_local, bin_format.set_local):
            to_locals.add(instructions[pc + 2].immediate_arguments)
            if (instructions[pc + 3].code == bin_format.get_local
                    and instructions[pc + 3].immediate_arguments == 0
                    and instructions[pc + 4].code == bin_format.i64_load):
                if (instructions[pc + 5].code in (bin_format.i64_eq, bin_format.i64_ne)
                        and instructions[pc + 6].code == bin_format.br_if):
                    global_vars.found_to_check = True
                if (instructions[pc + 5].code == bin_format.tee_local
                        and instructions[pc + 6].code in (bin_format.i64_eq, bin_format.i64_ne)
                        and instructions[pc + 7] == bin_format.br_if):
                    global_vars.found_to_check = True
            if (instructions[pc + 3].code in (bin_format.i64_eq, bin_format.i64_ne)
                    and instructions[pc + 4].code == bin_format.br_if):
                global_vars.found_to_check = True
            global_vars.shadow_ranges.add(range(pc, pc + 3))
        if (instructions[pc + 2].code == bin_format.get_local
                and instructions[pc + 2].immediate_arguments == 0
                and instructions[pc + 3].code == bin_format.i64_load
                and instructions[pc + 3].immediate_arguments[1] == 0):
            if (instructions[pc + 4].code in (bin_format.i64_eq, bin_format.i64_ne)
                    and instructions[pc + 5].code == bin_format.br_if):
                global_vars.found_to_check = True
            if (instructions[pc + 4].code == bin_format.tee_local
                    and instructions[pc + 5].code in (bin_format.i64_eq, bin_format.i64_ne)
                    and instructions[pc + 6] == bin_format.br_if):
                global_vars.found_to_check = True
            global_vars.shadow_ranges.add(range(pc, pc + 3))
        if (instructions[pc + 2].code == bin_format.get_local
                and instructions[pc + 2].immediate_arguments in self_locals
                and instructions[pc + 3].code in (bin_format.i64_eq, bin_format.i64_ne)
                and instructions[pc + 4].code == bin_format.br_if):
            global_vars.found_to_check = True


def detect_fake_eos(vm, name) -> None:
    """Fake eos transfer vulnerability analysis function.

    Args:
        name: the name of current contract
        vm: WebAssembly module execution environment

    Returns:

    """
    if global_vars.apply_function_address is None:
        return

    global_vars.fake_detect()  # set flag for fake detection
    func_type = structure.FunctionType()
    func_type.args = bytearray([bin_format.i64, bin_format.i64, bin_format.i64])
    func_type.rets = bytearray()
    apply_func = vm.store.funcs[vm.module_instance.funcaddrs[global_vars.apply_function_address]]
    global_vars.fake_detect()
    if apply_func.functype == func_type:
        params = utils.gen_symbolic_args(apply_func)
        global_vars.apply_params = params
        params[0] = utils.eos_abi_to_int(name)
        params[2] = utils.eos_abi_to_int('transfer')
        init_constraints = [params[0] != params[1], params[1] != utils.eos_abi_to_int('eosio.token')]
        vm.exec_by_address(global_vars.apply_function_address, params, init_constraints)
    global_vars.sym_exec() # set the detection mode to False


def fake_eos_analysis(store, frame, stack, expr, pc, solver=None):
    global_vars.pc = pc
    transfer_int64 = utils.eos_abi_to_int('transfer')
    action_param = 2
    end = len(expr.data)

    if _check_n_call(expr, pc):
        local_number = expr.data[pc + 7].immediate_arguments
        frame.locals[local_number] = Value.from_i64(_get_encoding(expr.data[pc+4].immediate_arguments))
        pc = expr.composition[pc + 8][-1]

    elif expr.data[pc].code == bin_format.call and expr.data[pc].immediate_arguments in global_vars.eosio_assert_addrs:
        cond = stack.data[-2].n
        if utils.is_all_real(cond):
            if not cond:
                pc = end
        else:
            solver.push()
            solver.add(z3.simplify(cond == 1))
            if utils.check_sat(solver) == z3.unsat:
                pc = end
            solver.pop()

    elif ((expr.data[pc].code == bin_format.get_local and expr.data[pc].immediate_arguments == action_param
           and expr.data[pc + 1].code == bin_format.i64_const
           and expr.data[pc + 1].immediate_arguments == transfer_int64)
          or (expr.data[pc].code == bin_format.i64_const and expr.data[pc].immediate_arguments == transfer_int64
              and expr.data[pc + 1].code == bin_format.get_local
              and expr.data[pc + 1].immediate_arguments == action_param)):
        if (expr.data[pc + 2].code in (bin_format.i64_eq, bin_format.i64_ne)
                and expr.data[pc + 3].code == bin_format.br_if):
            transfer_block_pc = (_get_branch_pc(expr.data[pc + 3].immediate_arguments, stack)
                                 if expr.data[pc + 2].code == bin_format.i64_eq else pc + 4)
            for i in range(transfer_block_pc, end - 2):
                if (expr.data[i].code == bin_format.call
                        and expr.data[i + 1].code == bin_format.drop
                        and expr.data[i + 2].code in (bin_format.br, bin_format.end)):
                    global_vars.find_fake_eos_transfer()
                if expr.data[i].code not in (bin_format.get_local, bin_format.i32_const, bin_format.i32_store,
                                             bin_format.i64_load, bin_format.i64_store, bin_format.i32_add):
                    break

    global_vars.pc = pc


def _check_n_call(expr: structure.Expression, pc: int, param_str: str = None) -> bool:
    """A helper function for main analysis function. The N() is a common called function
    in some instruction sequence which has vulnerabiliy. Of course, N() has its unique 
    pattern of instruction.

    Args:
        expr: the instructions sequence.
        pc: the pc of trigger instruction.
        param_str: the name string at data section.

    Returns:
        result: a bool variable, represent detected N call or not.
    """
    for target_instruction in N_call_instructions_sequence:
        i = expr.data[pc]
        opcode = i.code
        if target_instruction[0] != opcode:
            return False
        if target_instruction[1] and target_instruction[1] != i.immediate_arguments:
            return False
        pc += 1
    if not param_str:
        return True
    return param_str == global_vars.data_addr_dict[expr.data[pc - 3].immediate_arguments]


def _get_encoding(data_index: int) -> int:
    string = global_vars.data_addr_dict[data_index]
    return utils.eos_abi_to_int(string)


def _is_transfer_function(store, frame, stack, expr, pc) -> bool:
    if pc >= len(expr.data):
        return False
    if expr.data[pc].code not in (bin_format.call, bin_format.call_indirect):
        return False

    module = frame.module
    funcaddrs = module.funcaddrs
    table = store.tables[module.tableaddrs[0]]
    index = global_vars.transfer_function_index
    if (expr.data[pc].code == bin_format.call
            and funcaddrs[expr.data[pc].immediate_arguments] == table.elem[index]):
        return True
    if (expr.data[pc].code == bin_format.call_indirect and stack.len()
            and isinstance(stack.top(), Value) and stack.top().n == index):
        return True
    return False


def _has_transfer(vm):
    func_addr = vm.func_addr('apply')
    func = vm.store.funcs[vm.module_instance.funcaddrs[func_addr]]
    for instr in func.code.expr.data:
        if instr.code == bin_format.i64_const and instr.immediate_arguments == -3617168760277827584:
            return True
    return False


def _is_unpack(module, store, instructions, pc):
    if not (instructions[pc].code == bin_format.get_local
            and instructions[pc + 1].code == bin_format.i32_const
            and instructions[pc + 2].code == bin_format.i32_add
            and instructions[pc + 3].code == bin_format.call):
        return False
    func_addr = module.funcaddrs[instructions[pc + 3].immediate_arguments]
    func = store.funcs[func_addr]
    if (func.functype.args != bytearray([bin_format.i32])
            or func.functype.rets != bytearray()
            or not isinstance(func, WasmFunc)):
        return False
    has_action_data_size = False
    for instr in func.code.expr.data:
        if instr.code == bin_format.call and instr.immediate_arguments in global_vars.action_data_size_addrs:
            has_action_data_size = True
        if (has_action_data_size and instr.code == bin_format.call
                and instr.immediate_arguments in global_vars.read_action_data_addrs):
            return True
    return False


def _fill_memory(base_addr, byte_size, memory):
    for i in range(base_addr, base_addr + byte_size):
        memory.data[i] = z3.BitVec(f'param_byte_{i}', 8)


def _is_non_payable_function(expr: structure.Expression, pc: int) -> bool:
    """Checks whether the instruction sequence belong to a non payable function.

    Args:
        expr: instruction sequence.
        pc: starting point of instruction to analysis.

    Return:
        return true if is payable function, otherwise return false.
    """
    global non_payable_instruction_list

    for instruction in non_payable_instruction_list:
        i = expr.data[pc]
        opcode = i.code
        if opcode != instruction[0]:
            return False
        if instruction[1] and i.immediate_arguments != instruction[1]:
            return False
        pc += 1
    return True


def _get_branch_pc(label_tag, stack):
    label = [i for i in stack.data if isinstance(i, Label)][::-1][label_tag]
    return label.continuation


def count_instruction(funcs) -> Tuple[int, int]:
    """A helper function for statistics result of machine number format transformation instructions.

    Args:
        funcs: function set for instructions count.

    Returns:
        the number of instructions.
    """
    float_instructions_set = {
        bin_format.f32_convert_si32, bin_format.f32_convert_ui32, bin_format.f32_convert_si64,
        bin_format.f32_convert_ui64, bin_format.f32_reinterpret_i32, bin_format.f64_convert_si32,
        bin_format.f64_convert_ui32, bin_format.f64_convert_si64, bin_format.f64_convert_ui64,
        bin_format.f64_reinterpret_i64, bin_format.f32_load, bin_format.f32_store,
        bin_format.f32_const, bin_format.f32_eq, bin_format.f32_ne, bin_format.f32_lt,
        bin_format.f32_gt, bin_format.f32_le, bin_format.f32_ge, bin_format.f32_abs,
        bin_format.f32_neg, bin_format.f32_ceil, bin_format.f32_floor, bin_format.f32_trunc,
        bin_format.f32_nearest, bin_format.f32_sqrt, bin_format.f32_add, bin_format.f32_sub,
        bin_format.f32_mul, bin_format.f32_div, bin_format.f32_min, bin_format.f32_max,
        bin_format.f32_copysign, bin_format.i32_trunc_sf32, bin_format.i32_trunc_uf32,
        bin_format.i64_trunc_sf32, bin_format.i64_trunc_uf32, bin_format.f32_demote_f64,
        bin_format.f64_promote_f32, bin_format.f64_load, bin_format.f64_store,
        bin_format.f64_const, bin_format.f64_eq, bin_format.f64_ne, bin_format.f64_lt,
        bin_format.f64_gt, bin_format.f64_le, bin_format.f64_ge, bin_format.f64_abs,
        bin_format.f64_neg, bin_format.f64_ceil, bin_format.f64_floor, bin_format.f64_trunc,
        bin_format.f64_nearest, bin_format.f64_sqrt, bin_format.f64_add, bin_format.f64_sub,
        bin_format.f64_mul, bin_format.f64_div, bin_format.f64_min, bin_format.f64_max,
        bin_format.f64_copysign, bin_format.i32_trunc_sf64, bin_format.i32_trunc_uf64,
        bin_format.i64_trunc_sf64, bin_format.i64_trunc_uf64
    }
    float_count = count = 0

    for func in funcs:
        for instruction in func.expr.data:
            float_count += int(instruction.code in float_instructions_set)
            count += 1
    return float_count, count


# feature sequences used for forged transfer notification detection
instructions_list = [
    [bin_format.get_local, None],
    [bin_format.i64_load, None],
    [bin_format.i64_eq, None],
    [bin_format.br_if, None],
    [bin_format.i64_const, 0],
    [bin_format.set_local, None],
    [bin_format.i64_const, 59],
    [bin_format.set_local, None],
    [bin_format.i32_const, None],
    [bin_format.set_local, None],
    [bin_format.i64_const, 0]
]
instructions_reduced_list = [
    [bin_format.i64_const, 0],
    [bin_format.set_local, None],
    [bin_format.i64_const, None],
    [bin_format.set_local, 59],
    [bin_format.i32_const, None],
    [bin_format.set_local, None],
    [bin_format.i64_const, 0],
]

# determines whether it is a characteristic instruction sequence of a non payable function
non_payable_instruction_list = [
    [bin_format.call, None],
    [bin_format.block, None],
    [bin_format.get_local, None],
    [bin_format.i64_load, None],
    [bin_format.get_local, None],
    [bin_format.i32_const, None],
    [bin_format.i32_add, None],
    [bin_format.set_local, None],
    [bin_format.i64_load, None],
    [bin_format.i64_or, None],
    [bin_format.i64_const, None],
    [bin_format.i64_ne, None],
    [bin_format.br_if, None]
]

# Feature sequence of N macro calls
N_call_instructions_sequence = [
    [bin_format.i64_const, 0],
    [bin_format.set_local, None],
    [bin_format.i64_const, 59],
    [bin_format.set_local, None],
    [bin_format.i32_const, None],
    [bin_format.set_local, None],
    [bin_format.i64_const, 0]
]

library_function_dict = {
    'offset' : 33,
    '$add_carry' : 34,
    '$add' : 35,
    '$sub' : 36,
    '$sub320' : 37,
    '$sub512' : 38,
    '$mul_64x64_128' : 39,
    '$mul_128x128_256' : 40,
    '$mul_256x256_512' : 41,
    '$mul' : 42,
    '$div' : 43,
    '$sdiv' : 44,
    '$mod' : 45,
    '$mod320' : 46,
    '$mod512' : 47,
    '$smod' : 48,
    '$exp' : 49,
    '$addmod' : 50,
    '$mulmod' : 51,
    '$signextend' : 52,
    '$bit_negate' : 53,
    '$split' : 54,
    '$shl_internal' : 55,
    '$shr_internal' : 56,
    '$shl320_internal' : 57,
    '$shr320_internal' : 58,
    '$shl512_internal' : 59,
    '$shr512_internal' : 60,
    '$byte' : 61,
    '$xor' : 62,
    '$or' : 63,
    '$and' : 64,
    '$not' : 65,
    '$shl_single' : 66,
    '$shl' : 67,
    '$shr_single' : 68,
    '$shr' : 69,
    '$sar' : 70,
    '$iszero' : 71,
    '$iszero256' : 72,
    '$iszero320' : 73,
    '$iszero512' : 74,
    '$eq' : 75,
    '$cmp' : 76,
    '$lt_320x320_64' : 77,
    '$lt_512x512_64' : 78,
    '$lt_256x256_64' : 79,
    '$lt' : 80,
    '$gte_256x256_64' : 81,
    '$gte_320x320_64' : 82,
    '$gte_512x512_64' : 83,
    '$gt' : 84,
    '$slt' : 85,
    '$sgt' : 86,
    '$u256_to_u128' : 87,
    '$u256_to_i64' : 88,
    '$u256_to_i32' : 89,
    '$u256_to_byte' : 90,
    '$u256_to_i32ptr' : 91,
    '$to_internal_i32ptr' : 92,
    '$u256_to_address' : 93,
    '$bswap16' : 94,
    '$bswap32' : 95,
    '$bswap64' : 96,
    '$address' : 97,
    '$balance' : 98,
    '$selfbalance' : 99,
    '$chainid' : 100,
    '$origin' : 101,
    '$caller' : 102,
    '$callvalue' : 103,
    '$calldataload' : 104,
    '$calldatasize' : 105,
    '$calldatacopy' : 106,
    '$codesize' : 107,
    '$codecopy' : 108,
    '$datacopy' : 109,
    '$gasprice' : 110,
    '$extcodesize_internal' : 111,
    '$extcodesize' : 112,
    '$extcodehash' : 113,
    '$extcodecopy' : 114,
    '$returndatasize' : 115,
    '$returndatacopy' : 116,
    '$blockhash' : 117,
    '$coinbase' : 118,
    '$timestamp' : 119,
    '$number' : 120,
    '$difficulty' : 121,
    '$gaslimit' : 122,
    '$mload' : 123,
    '$mload_internal' : 124,
    '$mstore' : 125,
    '$mstore_internal' : 126,
    '$mstore_address' : 127,
    '$mstore8' : 128,
    '$msize' : 129,
    '$sload' : 130,
    '$sstore' : 131,
    '$gas' : 132,
    '$log0' : 133,
    '$log1' : 134,
    '$log2' : 135,
    '$log3' : 136,
    '$log4' : 137,
    '$create' : 138,
    '$call' : 139,
    '$callcode' : 140,
    '$delegatecall' : 141,
    '$staticcall' : 142,
    '$create2' : 143,
    '$selfdestruct' : 144,
    '$return' : 145,
    '$revert' : 146,
    '$invalid' : 147,
    '$stop' : 148,
    '$keccak256' : 149,
    '$or_bool' : 150,
    '$or_bool_320' : 151,
    '$or_bool_512' : 152,
    '$save_temp_mem_32' : 153,
    '$restore_temp_mem_32' : 154,
    '$save_temp_mem_64' : 155,
    '$restore_temp_mem_64' : 156,
    '$pop' : 157,
    '$memoryguard' : 158
}
