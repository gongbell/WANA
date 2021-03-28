# WANA
A Symbolic Execution Engine for Wasm Bytecode and A Cross-Platform Smart Contract Vulnerability Detector

For technical details, please checkout our paper at arxiv: 

https://arxiv.org/abs/2007.15510

WANA: Symbolic Execution of Wasm Bytecode for Cross-Platform Smart Contract Vulnerability Detection

by Dong Wang, Bo Jiang, W.K. Chan

Please contact Dr. Bo Jiang (gongbell@gmail.com) if you have any questions. 

## Smart Contract
To evaluate a smart contract, the wasm smart contract is needed. The wasm bytecode file generated from two sources 
as following.

  + EOSIO smart contract. Using official development kit, developer could compile cpp or rust source code to wasm
  + Ethereum smart contract. By compiling solidity source code via [solc](https://github.com/ethereum/solidity/releases) (see below for details), 
  developer could get the corresponding wasm file.

Of course, WANA could execute any wasm file other than smart contract. Therefore, any valid wasm file will be 
symbolic executed correctly.

## Project Structure
The main components of WANA is as follow.
  + `wana.py` is the entry point, and it read a wasm file or directory include wasm files to symbolic execution.
  + `sym_exec.py` is the logic of symbolic execution, it includes the function-level and instruction-level execution.
  + `bug_analyzer.py` is the vulnerability analysis unit, therefor all record or pattern matching logic are here.
  + `global_variables.py` save states while symbolic execution, includes vulnerability count, loop depth and etc.
  + `bin_format.py` and `bin_reader.py` include bytecode binary representation and reading approach respectively.
  + `structure.py` and `runtime.py` represent WebAssembly bytecode structure and virtual machine runtime structure.
  + `number.py`, `utils.py` and `logger.py` are helper modules.
  + `emulator.py` is the module for library function emulating.
  
## Prerequisites
The following Python packages are required.
 + six==1.14.0
 + func_timeout==4.3.5
 + z3-solver==4.8.8.0

The project was developed under Ubuntu 18.04, therefore it is compatible with later version in principle.


## Usage
There should be a compiled smart contract in wasm format. The EOSIO and Ethereum smart contract could be 
compiled as follow.

### EOSIO smart contract
The EOSIO smart contract is developed using cpp or rust, like [appdemo](./examples/EOSIO_contracts/appdemo/appdemo.cpp).
Firstly, installing the [eosio.cdt](https://github.com/EOSIO/eosio.cdt) according to its 
[README](https://github.com/EOSIO/eosio.cdt/blob/master/README.md). Then, using the following command to compile the
above smart contract.
```bash
eosio-cpp appdemo.cpp -o appdemo.wasm
```

### Ethereum smart contract
The type of Ethereum smart contract source code is solidity. We have prepared the wasm file and its solidity 
source code that can be used for execution. If you want to compile solidity yourself, at present, solidity officially can complete the process
that compile smart contract from solidity to WebAssembly. This tool is [solc](https://github.com/ethereum/solidity/releases). 
However, it is still in the process of experimentation. Therefore, we recommend using the [0.7.5 version of solc](https://github.com/ethereum/solidity/releases/tag/v0.7.5). After download solc, using the following command to compile a smart contract. (**example.sol** is the smart contract path and **example_directory** is the output target directory)  
For example, [example.sol](./examples/Ethereum_contracts/delegatecall_samples/Router.sol).
```bash
./solc-static-linux --ewasm example.sol -o example_directory
```
This command will output two files, example.wasm and example.wast. Since solc is still in the experimental stage, 
the output example.wasm does not contain the execution logic of the smart contract. 
We need to separate the wasm code that is actually used for execution from example.wast.

### Analysis
The following command will analyze the EOSIO smart contract `contract.wasm` with timeout 20 seconds. The `-t` is 
optional, the symbolic execution won't be interrupted until complete analysis if `-t` not set.
```bash
python3 wana.py -t 20 -e contract.wasm
```

To analyze Ethereum smart contract, the option `--sol` is needed.
```bash
python3 wana.py --sol -e ethereum_contract.wasm
```

If you want to get complete execution information, you can set the option `--lvl`, `1` for basic information, the highest is `3`
```bash
python3 wana.py --sol -e --lvl 1 ethereum_contract.wasm
```

## Input and Output
At present, WANA only support wasm file as its input. The output, namely vulnerability report, is stdout. The output 
format is as follow.
```bash
contract.wasm: fake eos found
contract.wasm: forged transfer notification found
```

## Reference Website
1. https://webassembly.org/
2. https://github.com/WebAssembly/
3. https://developer.mozilla.org/en-US/docs/WebAssembly
4. https://github.com/EOSIO/eosio.cdt
5. https://github.com/second-state/SOLL
