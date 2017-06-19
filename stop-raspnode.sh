#!/bin/bash

location=/media/pi/My_Files

#Stop bitcoin
bitcoin-cli -datadir=$location/bitcoin stop

#Stop ethereum
echo -e "\e[34mStopping ethereum...\e[0m"
kill -SIGINT `pidof geth`
