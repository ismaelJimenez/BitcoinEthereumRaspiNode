#!/bin/bash

version=0.14.2

#Upgrade Debian
echo -e "\e[34mPerforming Housekeeping - Update...\e[0m"
sudo apt-get -y update
echo -e "\e[34mPerforming Housekeeping - Upgrade...\e[0m"
sudo apt-get -y upgrade 

#Install bitcoin
echo -e "\e[34mInstalling bitcoin...\e[0m"
cd ~
wget https://bitcoin.org/bin/bitcoin-core-$version/bitcoin-$version-arm-linux-gnueabihf.tar.gz
tar -xzvf bitcoin-$version-arm-linux-gnueabihf.tar.gz
sudo cp bitcoin-$version/bin/* /usr/local/bin
rm bitcoin-$version-arm-linux-gnueabihf.tar.gz
rm -rf bitcoin-$version
