#!/bin/bash

location=/media/pi/My_Files

#Install bitcoin
bitcoind -datadir=$location/bitcoin -daemon
