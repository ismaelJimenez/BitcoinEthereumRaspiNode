#!/bin/bash

location=/media/pi/My_Files

#Install bitcoin
echo -e "\e[34mStopping bitcoin daemon...\e[0m"
bitcoin.cli -datadir=$location/bitcoin stop
