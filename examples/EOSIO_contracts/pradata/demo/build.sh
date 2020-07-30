rm demo.wast demo.wasm
eosiocpp -o demo.wast demo.cpp

rm demo.abi
eosiocpp -g demo.abi demo.cpp
