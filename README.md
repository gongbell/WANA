# WANA
A Symbolic Execution Engine for Wasm Bytecode and A Cross-Platform Smart Contract Vulnerability Detector

## Smart Contract
To evaluate a smart contract, the wasm smart contract is needed. The wasm bytecode file generated from two sources 
as following.

  + EOSIO smart contract. Using official development kit, developer could compile cpp or rust source code to wasm
  + Ethereum smart contract. By compiling solidity source code via [soll](https://github.com/second-state/SOLL) or 
    [solang](https://github.com/hyperledger-labs/solang), developer could get the corresponding wasm file.

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
  
## Usage
Firstly, the prerequisites in [requirements.txt](./requirements.txt) should be correctly installed. 

The following command will analyze the EOSIO smart contract `contract.wasm` with timeout 20 seconds. The `-t` is 
optional, the symbolic execution won't be interrupted until complete analysis if `-t` not set.
```bash
python3 wana.py -t 20 -e contract.wasm
```

Using the follow command, WANA will analyze all smart contracts in the directory `contracts_directory`.
```bash
python3 wana.py -a contracts_directory/
```

To analyze Ethereum smart contract, the option `--sol` is needed.
```bash
python3 wana.py --sol -e ethereum_contract.wasm
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


