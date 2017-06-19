#!/bin/bash

#Upgrade Debian
echo -e "\e[34mPerforming Housekeeping - Update...\e[0m"
sudo apt-get -y update
echo -e "\e[34mPerforming Housekeeping - Upgrade...\e[0m"
sudo apt-get -y upgrade 

#Install bitcoin
echo -e "\e[34mInstalling bitcoin...\e[0m"
cd ~
wget https://bitcoin.org/bin/bitcoin-core-0.14.2/bitcoin-0.14.2-arm-linux-gnueabihf.tar.gz
tar -xzvf bitcoin-0.14.2-arm-linux-gnueabihf.tar.gz
sudo cp bitcoin-0.14.2/bin/* /usr/local/bin
rm bitcoin-0.14.2-arm-linux-gnueabihf.tar.gz
rm -rf bitcoin-0.14.2
