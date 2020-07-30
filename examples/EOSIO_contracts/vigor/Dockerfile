FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl libicu60 libusb-1.0-0 libcurl3-gnutls

RUN curl -LO https://github.com/EOSIO/eos/releases/download/v1.7.1/eosio_1.7.1-1-ubuntu-18.04_amd64.deb \
    && dpkg -i eosio_1.7.1-1-ubuntu-18.04_amd64.deb

RUN curl -LO https://github.com/EOSIO/eosio.cdt/releases/download/v1.6.1/eosio.cdt_1.6.1-1_amd64.deb \
    && dpkg -i eosio.cdt_1.6.1-1_amd64.deb

RUN curl -LO https://github.com/EOSIO/eosio.cdt/archive/v1.6.1.tar.gz && tar -xvzf v1.6.1.tar.gz --one-top-level=eosio.cdt --strip-components 1

RUN cd /eosio.cdt/ && curl -LO https://github.com/EOSIO/eosio.contracts/archive/v1.6.0.tar.gz && tar -xvzf v1.6.0.tar.gz --one-top-level=eosio.contracts --strip-components 1

# Required by the oracle updater script
RUN apt-get update && apt-get install -y nodejs npm
