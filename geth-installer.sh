#!/bin/bash

#Upgrade Debian
echo -e "\e[34mPerforming Housekeeping - Update...\e[0m"
sudo apt-get -y update
echo -e "\e[34mPerforming Housekeeping - Upgrade...\e[0m"
sudo apt-get -y upgrade 

#Install geth
echo -e "\e[34mInstalling geth...\e[0m"
cd ~
wget https://gethstore.blob.core.windows.net/builds/geth-linux-arm7-1.6.5-cf87713d.tar.gz
tar -xzvf geth-linux-arm7-1.6.5-cf87713d.tar.gz
sudo cp geth-linux-arm7-1.6.5-cf87713d/geth /usr/local/bin
