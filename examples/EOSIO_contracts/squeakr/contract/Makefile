CLEOS = cleos
CONTRACT = squeakrdappx
PUBLIC_KEY=EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

build:
	eosio-cpp -abigen squeakr.cpp -o squeakr.wasm 
	
clean:
	rm -f squeakr.wasm squeakr.abi

deploy: build
	$(CLEOS) set contract $(CONTRACT) . squeakr.wasm squeakr.abi
	
post:
	$(CLEOS) push action $(CONTRACT) post '["angelosqueak", "Secret text", "nonce etc"]' -p angelosqueak
	
followreq:
	$(CLEOS) push action $(CONTRACT) followreq '["alicesqueakr", "angelosqueak"]' -p alicesqueakr
	
accept:
	$(CLEOS) push action $(CONTRACT) accept '["angelosqueak", "alicesqueakr"]' -p angelosqueak

admclear:
	$(CLEOS) push action $(CONTRACT) admclear '["$(CONTRACT)"]' -p $(CONTRACT)
	
show:
	$(CLEOS) get table $(CONTRACT) $(CONTRACT) user
	$(CLEOS) get table $(CONTRACT) $(CONTRACT) squeak
	$(CLEOS) get table $(CONTRACT) $(CONTRACT) request
	$(CLEOS) get table $(CONTRACT) $(CONTRACT) follower

fundpriveos:
	$(CLEOS) push action priveosrules prepare '["$(CONTRACT)", "4,EOS"]' -p $(CONTRACT)
	$(CLEOS) transfer $(CONTRACT) priveosrules "10.0000 EOS"

	
setup:
	$(CLEOS) system newaccount --stake-net "1.0000 EOS" --stake-cpu "1.0000 EOS" --buy-ram-kbytes 8000 eosio alicesqueakr $(PUBLIC_KEY) $(PUBLIC_KEY)

	$(CLEOS) system newaccount --stake-net "1.0000 EOS" --stake-cpu "1.0000 EOS" --buy-ram-kbytes 8000 eosio angelosqueak $(PUBLIC_KEY) $(PUBLIC_KEY)
	$(CLEOS) system newaccount --stake-net "1.0000 EOS" --stake-cpu "1.0000 EOS" --buy-ram-kbytes 8000 eosio $(CONTRACT) $(PUBLIC_KEY) $(PUBLIC_KEY)