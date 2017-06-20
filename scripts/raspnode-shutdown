#!/bin/bash

location=/media/pi/My_Files

#Stop bitcoin
bitcoin-cli -datadir=$location/bitcoin stop

#Stop ethereum
echo "Ethereum server stopping"
kill -SIGINT `pidof geth`

# Shutdown RASPi
sudo shutdown -h now
