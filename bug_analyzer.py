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
            logger.debugln(f'transfer found')
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
                        global_vars.find_ethereum_delegate_call()

        # 1. Count the non payable functions, finally get the number of payable functions.
        # 2. If there are payable functions in the contract but no *ethereum.call*, greedy exists.
        non_payable_count = 0
        offset = len(vm.module.imports)
        main_index = global_vars.main_function_address - len(vm.store.funcs) + len(funcs)
        for index, func in enumerate(funcs):
            if index == main_index:
                continue
            expr = func.expr
            is_payable = True
            for i, instr in enumerate(expr.data):
                if (instr.code == bin_format.call and vm.module_instance.funcaddrs[
                    instr.immediate_arguments] in global_vars.get_call_value_addr
                        and _is_non_payable_function(expr, i)):
                    non_payable_count += 1
                    is_payable = False
                    break
            if is_payable:
                global_vars.ETH_payable_function_address_set.add(index + offset)

        if non_payable_count <= len(funcs) - 2 and not global_vars.send_token_function_addr:
            global_vars.cannot_send_ETH = True

        # Detect Mishandled Exceptions
        # 1. Analyzing instruction sequentially.
        # 2. If the current instruction is *call*, then track the position of the *call* return result on the stack.
        # 3. If *ethereum.drop* and *ethereum.eq* do not appear in the interval of n instructions, then there is an error.
        '''for index, func in enumerate(funcs):
            expr = func.expr
            for i, instr in enumerate(expr.data):
                if (instr.code == bin_format.call):
                    # Track where this instruction is pushed onto the stack
                    call_result = stack.len()
                    for i,instr in enumerate():
                        '''




def check_block_dependence(block_number_flag: bool) -> None:
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
        global_vars.find_ethereum_delegate_call()


def check_ethereum_mishandled_exceptions_step_one(immediate_arguments:list) -> None:
    """During symbolic execution, call it to detect mishandled_exceptions errors
    """
    # Detect Mishandled Exceptions
    # 1. If the current instruction is *call*, and the parameter of *call* is *$ethereum.call* or *$ethereum.callCode*, 
    #    Then set 'mishandled_exceptions_flag', indicating that there may be a risk, and further testing is required
    #    Then potential *Mishandled Exceptions error* increase 
    # problematic_instructions = ['$ethereum.call','$ethereum.callCode']
    for i, argument in enumerate(immediate_arguments):
        if (argument in global_vars.mishandled_exceptions_call_function_addr):
            global_vars.mishandled_exceptions_flag = 1
    

    def check_ethereum_mishandled_exceptions_step_two(stack: 'Stack') -> None:
    """During symbolic execution, call it to detect mishandled_exceptions errors
    """
    # Detect Mishandled Exceptions
    # 2. If the 'mishandled_exceptions_flag' is 1, add the top element and position of the stack to 'stack_addr'(dict) for tracking
    #    Then potential *Mishandled Exceptions error* increase 
    if global_vars.mishandled_exceptions_flag == 1:
        if(stack.len not in stack_addr):
            global_vars.add_stack_addr(stack.len, stack.top())
        else :  # It means that the value at this position has been accidentally popped on the stack before, 
                # [TODO]so it is considered that there is a bug?
            global_vars.stack_addr[stack.len] = stack.top()
        global_vars.add_ethereum_mishandled_exceptions()
        global_vars.mishandled_exceptions_flag = 0

def check_ethereum_mishandled_exceptions_step_three_eqz(stack: 'Stack') -> None:
    # 3. If the current instruction is  *eqz*, check whether the position of the top element of the stack is being tracked 
    #    and whether the top element of the stack is the element being tracked.
    #    [TODO} top().n means the real value of the top of the stack? 
    if (stack.len in global_vars.stack_addr and stack.top().n == global_vars.stack_addr[stack.len]):
        global_vars.del_ethereum_mishandled_exceptions()

        
def check_ethereum_mishandled_exceptions_step_three_eq( a: 'int', b: 'int', a_len: 'int') -> None:
    # 3. If the current instruction is  *eq*, Check if the top of the stack(b) is 0, 
    #    if yes, check if the top of the stack(a) after popping the stack is the tracked element
    if not utils.is_symbolic(b):
        if b == 0):
            if (a_len in global_vars.stack_addr and a == global_vars.stack_addr[a_len]):
                global_vars.del_ethereum_mishandled_exceptions()
                global_vars.stack_addr.del(a_len)


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
