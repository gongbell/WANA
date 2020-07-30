build: wast

clean:
	rm signupeoseos.wast
	rm signupeoseos.wasm

abi:
	eosiocpp -g signupeoseos.abi signupeoseos.hpp

wast:
	eosiocpp -o signupeoseos.wast signupeoseos.cpp

deploy:
	cleos set contract signupeoseos ../signupeoseos -p signupeoseos

build_and_deploy: build deploy
