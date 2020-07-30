rm pradata.wast pradata.wasm
eosiocpp -o pradata.wast pradata.cpp

rm pradata.abi
eosiocpp -g pradata.abi pradata.cpp
