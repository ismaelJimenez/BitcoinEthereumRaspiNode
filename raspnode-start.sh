#!/bin/bash

location=/media/pi/My_Files

#Start bitcoin
bitcoind -datadir=$location/bitcoin -daemon

#Start ethereum
echo "Ethereum server starting"
nohup geth --datadir $location/ethereum 2>~/geth-log &
disown
