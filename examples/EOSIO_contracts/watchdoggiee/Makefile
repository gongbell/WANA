CONTRACT=watchdoggiee

all: $(CONTRACT).wasm $(CONTRACT).abi

%.wasm: %.cpp
	eosio-cpp -o $@ $<

%.abi: %.cpp
	eosio-abigen --contract=$(CONTRACT) --output=$@ $<

clean:
	rm -f $(CONTRACT).wasm $(CONTRACT).abi
