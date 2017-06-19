#!/bin/bash

location=/media/pi/My_Files

#Start bitcoin
bitcoind -datadir=$location/bitcoin -daemon
