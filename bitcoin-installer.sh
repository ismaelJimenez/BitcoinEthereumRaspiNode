#!/bin/bash

# To be executed after ethereum-installer.sh!

#Install dependencies
echo -e "\e[34mInstalling Dependencies...\e[0m"
sudo apt-get -y install autoconf libevent-dev libtool libssl-dev libboost-all-dev libminiupnpc-dev
sudo apt-get -y install qt4-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev

mkdir ~/bin
cd ~/bin

# Download the Berkeley database source code
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx
make -j4
sudo make install

#Install go-ethereum OR `geth`
echo -e "\e[34mInstalling bitcoin...\e[0m"
cd ~/
git clone -b 0.14 https://github.com/bitcoin/bitcoin.git
cd bitcoin/
./autogen.sh
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --enable-upnp-default --with-gui
make -j2
sudo make install