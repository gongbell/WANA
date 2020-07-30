CPP=/usr/local/eosio/bin/eosiocpp
CLEOS=cli set contract
SOURCE=owdinnetwork
TARGET=owdinnetwork/owdinnetwork
WASTLOGS=log/wast_stdout.txt 2> log/wast_stderr.txt
ABILOGS=log/abi_stdout.txt 2> log/abi_stderr.txt


all: clear build deploy

wast:
	$(CPP) -o $(TARGET).wast $(TARGET).cpp  > $(WASTLOGS)

abi:
	$(CPP) -g $(TARGET).abi $(TARGET).cpp  > $(ABILOGS)

build: wast abi

del_log:
	rm -f log/*

del_wasm:
	rm -f $(TARGET).wast
	rm -f $(TARGET).wasm

del_abi:
	rm -f $(TARGET).abi

clear: del_log del_wasm del_abi

deploy:
	$(CLEOS) $(SOURCE) $(SOURCE)/ 

.PHONY: clear build

