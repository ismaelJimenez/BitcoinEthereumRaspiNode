#!/bin/bash

location=/media/pi/My_Files

#Start bitcoin
echo -e "\e[34mBitcoin latest block...\e[0m"
bitcoin-cli -datadir=$location/bitcoin getblockcount
echo -e "\e[Ethereum latest action...\e[0m"
tail -1 ~/geth-log

