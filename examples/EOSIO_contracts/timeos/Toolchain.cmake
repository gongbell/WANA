set(WASM_INSTALL_DIR $ENV{HOME}/opt/wasm CACHE PATH "Path to wasm compiler instalation dir")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_CXX_COMPILER
        ${WASM_INSTALL_DIR}/bin/clang++ --target=wasm32)
set(CMAKE_CXX_CREATE_SHARED_LIBRARY
        "${WASM_INSTALL_DIR}/bin/llvm-link -only-needed -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
