#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
The module is the global variables store the bug count and execution path and etc.
For simplicity, it only contain the unique object global_variables_instance of class
GlobalVariables.
"""
import utils


class GlobalVariables:
    def __init__(self, contract_type: str = 'eos') -> None:
        # program counter
        self.pc = 0

        # global path conditions and path results
        self.path_conditions_and_results = {"path_conditions": [], "results": []}

        # last stack
        self.last_stack = []

        # mark the type of smart contract
        self.contract_type = contract_type

        # the bug flags variables
        # block dependency bugs
        self.block_dependency_count = 0
        self.tapos_block_function_addr = list()
        self.block_number_id_list = list()
        self.send_token_function_addr = list()

        # ethereum delegate call bugs
        self.ethereum_delegate_call = 0
        self.call_delegate_addr = list()

        # ethereum greedy bugs
        self.ethereum_greedy = 0
        self.main_function_address = None
        self.get_call_value_addr = list()
        self.cannot_send_ETH = False
        self.ETH_payable_function_address_set = set()

        # ethereum expensive fallback bugs
        self.ethereum_revert_addr = list()
        self.expensive_fallback = 0
        self.max_gas_cost = 0

        # mode flag
        self.location_mode = False
        self.fake_detection_mode = False
        self.forged_detection_mode = False

        # forged transfer notification bugs
        self.vm = None
        self.forged_transfer_notification_count = 0
        self.found_to_check = False
        self.transfer_function_index = None
        self.self_locals = set()
        self.to_locals = set()
        self.unpack_locals = set()
        self.to_offset = None
        self.contract_name_int64 = None
        self.eosio_assert_addrs = set()
        self.action_data_size_addrs = set()
        self.read_action_data_addrs = set()
        self.require_auth_addrs = set()
        self.shadow_ranges = set()

        # fake eos transfer bugs
        self.apply_function_address = None
        self.apply_params = []
        self.fake_eos_transfer_count = 0
        self.data_addr_dict = {}
        self.eosio_token_locals = set()

        # loop depth limit
        self.LOOP_DEPTH_LIMIT = 10
        self.BRANCH_DEPTH_LIMIT = 20

        # unreachable count
        self.unreachable_count = 0

        # offset of library func in wasm and library 
        self.library_offset = 0

        # flag to simulate eth.callDataCopy
        self.flag_callDataCopy = 0
        self.num_callDataCopy = 0

        # flag to simulate eth.getCallValue
        self.flag_getCallValue = 0

        # flag to simulate eth.revert
        self.flag_revert = 0

        # flag to simulate eth.getCallDataSize, 0 -> symbolic, 1 -> real(>4)
        self.flag_getCallDataSize = 0

        # flag to detect mishandled exception
        self.flag_call_mishandled_exception = 0
        self.call_symbolic_ret = dict()

        # sum of pc 
        self.sum_pc = list()
        self.cur_sum_pc = 0

    def re_init(self) -> None:
        self.__init__(self.contract_type)

    def clear_count(self) -> None:
        self.block_dependency_count = 0
        self.fake_eos_transfer_count = 0
        self.ethereum_delegate_call = 0
        self.forged_transfer_notification_count = 0

        self.vm = None
        self.found_to_check = False
        self.transfer_function_index = None
        self.self_locals = set()
        self.to_locals = set()
        self.unpack_locals = set()
        self.to_offset = None
        self.contract_name_int64 = None
        self.eosio_assert_addrs = set()
        self.action_data_size_addrs = set()
        self.read_action_data_addrs = set()
        self.require_auth_addrs = set()
        self.shadow_ranges = set()

        self.apply_function_address = None

    def sym_exec(self):
        self.fake_detection_mode = False
        self.forged_detection_mode = False
        self.location_mode = False

    def locate(self):
        self.location_mode = True

    def fake_detect(self):
        self.fake_detection_mode = True

    def forged_detect(self):
        self.forged_detection_mode = True

    @property
    def detection_mode(self):
        return self.fake_detection_mode or self.forged_detection_mode

    def set_name_int64(self, name):
        self.contract_name_int64 = utils.eos_abi_to_int(name)

    def add_cond_and_results(self, path_condition: list, left_branch_res: list) -> None:
        self.path_conditions_and_results["path_conditions"].append(path_condition[:])
        self.path_conditions_and_results["results"].append(left_branch_res[:])

    def add_tapos_block_function_addr(self, address: int) -> None:
        self.tapos_block_function_addr.append(address)

    def add_random_number_id(self, number_id: int) -> None:
        self.block_number_id_list.append(number_id)

    def add_send_token_function_addr(self, address: int) -> None:
        self.send_token_function_addr.append(address)

    def add_call_delegate_addr(self, address: int) -> None:
        self.call_delegate_addr.append(address)

    def add_revert_addr(self, address: int) -> None:
        self.ethereum_revert_addr.append(address)

    def add_get_call_value_addr(self, address: int) -> None:
        self.get_call_value_addr.append(address)

    def set_main_function_addr(self, address: int) -> None:
        self.main_function_address = address

    def set_apply_function_addr(self, address: int) -> None:
        self.apply_function_address = address

    def find_forged_notification(self):
        self.forged_transfer_notification_count = 1

    def find_block_dependence(self) -> None:
        self.block_dependency_count += 1

    def find_fake_eos_transfer(self) -> None:
        self.fake_eos_transfer_count = 1

    def find_ethereum_delegate_call(self) -> None:
        self.ethereum_delegate_call += 1

    def find_ethereum_greedy(self) -> None:
        self.ethereum_greedy = 1

    def add_flag_callDataCopy(self) -> None:
        self.flag_callDataCopy += 1

    def clear_flag_callDataCopy(self) -> None:
        self.flag_callDataCopy = 0

    def add_num_callDataCopy(self) -> None:
        self.num_callDataCopy += 1

    def clear_num_callDataCopy(self) -> None:
        self.num_callDataCopy = 0

    def add_flag_getCallValue(self) -> None:
        self.flag_getCallValue += 1

    def clear_flag_getCallValue(self) -> None:
        self.flag_getCallValue = 0

    def add_flag_revert(self) -> None:
        self.flag_revert = 1

    def clear_flag_revert(self) -> None:
        self.flag_revert = 0

    def add_flag_getCallDataSize(self) -> None:
        self.flag_getCallDataSize += 1

    def clear_flag_getCallDataSize(self) -> None:
        self.flag_getCallDataSize = 0

global_vars = GlobalVariables()
