#!/bin/bash

location=/media/pi/My_Files

#Install bitcoin
echo -e "\e[34mRunning bitcoin as daemon...\e[0m"
bitcoind -datadir=$location/bitcoin -daemon
