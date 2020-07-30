##############################################
#eosio install package method
sudo apt remove eosio
wget https://github.com/eosio/eos/releases/download/v1.7.4/eosio_1.7.4-1-ubuntu-18.04_amd64.deb
sudo apt install ./eosio_1.7.4-1-ubuntu-18.04_amd64.deb
##############################################
#eosio install script method
git clone --recursive https://github.com/EOSIO/eos.git --branch v1.7.4 --single-branch
cd scripts
#Could not find a package configuration file provided by "libbsoncxx" with
# eos/plugins/mongo_db_plugin/CMakeLists.txt find_package(libbsoncxx-static REQUIRED) -> find_package(libbsoncxx REQUIRED)
# eos/plugins/mongo_db_plugin/CMakeLists.txt : if (LIBMONGOC-1.0_FOUND) -> if (LIBMONGOC_FOUND)
# eos/scripts/eosio_build.sh --> -DBUILD_MONGO_DB_PLUGIN=false 
./eosio_build.sh
sudo ./eosio_install.sh
#put into .bashrc
alias nodeos=~/opt/eosio/bin/nodeos
alias cleos=~/opt/eosio/bin/cleos
alias keosd=~/opt/eosio/bin/keosd
source ~/.bashrc
##############################################
# installing eosio manual method
#Could not find a package configuration file provided by "libbsoncxx" with
wget https://github.com/mongodb/mongo-c-driver/releases/download/1.14.0/mongo-c-driver-1.14.0.tar.gz
tar xzf mongo-c-driver-1.14.0.tar.gz
cd mongo-c-driver-1.14.0
mkdir cmake-build
cd cmake-build
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF ..

git clone https://github.com/mongodb/mongo-cxx-driver.git --branch r3.4.0 --single-branch
--branch releases/stable --depth 1
cd mongo-cxx-driver/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
make -j$( sysctl -in machdep.cpu.core_count )
sudo make install
#boost 1.67
git clone --recursive https://github.com/boostorg/boost.git --branch boost-1.67.0 --single-branch
cd boost
./bootstrap.sh
sudo ./b2 install
 cat /usr/include/boost/version.hpp | grep "BOOST_LIB_VERSION"
 cat /usr/local/include/boost/version.hpp | grep "BOOST_LIB_VERSION"
 sudo add-apt-repository ppa:mhier/libboost-latest
sudo apt update
sudo apt install libboost1.67
sudo ldconfig
##############################################
#eosio.contracts
git clone --recursive https://github.com/EOSIO/eosio.contracts.git --branch v1.6.1 --single-branch
git tag -l
git checkout tags/v1.6.1
git show
git log -1
##############################################
#eosio-cdt install package method
sudo apt remove eosio.cdt
wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.5.0/eosio.cdt_1.5.0-1_amd64.deb
sudo apt install ./eosio.cdt_1.5.0-1_amd64.deb
#eosio-cdt install script method
git clone --recursive https://github.com/eosio/eosio.cdt --branch v1.5.0 --single-branch
cd eosio.cdt
./build.sh
sudo ./install.sh
##############################################