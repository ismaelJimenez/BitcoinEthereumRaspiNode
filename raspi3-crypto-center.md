# Raspberry 3 Cryptocurrency center for Bitcoin and Ethereum
## Install Raspbian on Raspberry Pi 3 (Headless)

1. Download lastest [Raspbian](https://downloads.raspberrypi.org/raspbian_latest) in your **Downloads** folder and unzip it.

2. Insert your SD card or USB flash drive

3. Identify its address by opening the "Disks" application and look for the "Device" line. If the line is in the /dev/mmcblk0p1 format, then your drive address is: /dev/mmcblk0. If it is in the /dev/sdb1 format, then the address is /dev/sdb

4. Unmount it by clicking in the square icon in the "Disks" application

5. Select your card from the list on the left, choose “Restore Disk Image” from the cog menu on the right, and select your img file.

6. Enable SSH by placing a file named “ssh” (without any extension) onto the boot partition of the SD card

7. You can now eject your removable drive, and put the SD card into the Raspberri.

8. Install the nmap package
```
sudo apt-get install nmap
```

To use nmap to scan the devices on your network, you need to know the subnet you are connected to. First find your own IP address, in other words the one of the computer you're using to find your Pi's IP address:

type into a terminal window
```
hostname -I
```
Now you have the IP address of your computer, you will scan the whole subnet for other devices. For example, if your IP address is 192.168.2.5, other devices will be at addresses like 192.168.2.2, 192.168.2.3, 192.168.2.4, etc. The notation of this subnet range is 192.168.2.0/24 (this covers 192.168.2.0 to  192.168.2.255).

Now use the nmap command with the -sn flag (ping scan) on the whole subnet range. This may take a few seconds:
```
nmap -sn 192.168.2.0/24
```

Ping scan just pings all the IP addresses to see if they respond. For each device that responds to the ping, the output shows the hostname and IP address like so:
```
Starting Nmap 6.40 ( http://nmap.org ) at 2017-06-16 18:31 CEST
Nmap scan report for Ismael-MBP (192.168.2.4)
Host is up (0.0010s latency).
Nmap scan report for ubuntu (192.168.2.5)
Host is up (0.0010s latency).
Nmap scan report for raspberrypi (192.168.2.109)
Host is up (0.0030s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 2.41 seconds
```
Here you can see a device with hostname raspberrypi has IP address 192.168.2.109.

9. Open your terminal and type:
```
ssh pi@THE_IP_YOU_JUST_FOUND
(password raspberry)
```
10. configure your Pi via
```
sudo raspi-config
```
Now, enable VNC Server by doing the following:

Navigate to Interfacing Options.

Scroll down and select VNC > Yes.

Select "8 Advanced Options" then select "Hostname"

Edit the hostname to “raspnode" without quotes (or to your desired hostname)

Select "OK"

Here you can also change the default user (which is "pi") and password (which is "raspberry"). We'll leave these as is for the tutorial. If you change your username, make sure to use that instead of "pi" when it shows up in this tutorial.

To set your timezone:

Select "4 Internationalisation Options"

Select "Change Timezone"

Go through the selection process to select your timezone, then select "OK"

Once done, select "Finished" and your Raspberry Pi will reboot.

11. If you're connecting from the compatible [VNC Viewer app from RealVNC](https://www.realvnc.com/download/viewer/), enter the user name and password you normally use to log in to your user account on the Raspberry Pi. By default, these credentials are pi and raspberry.

12. Connect the Raspi to the wifi and exit VNC mode. Connect again to the Raspi via ssh for the following steps of the tutorial.

## Enlarge Swap File
A swap file allows the microCD card to be used as extra memory if needed. It is slower and heavy use will shorten the life of a microSD card. Raspbian defaults to a 100Mb swap file which is not actually needed to build and run Bitcoin core under normal operating conditions. However if you are expecting to download the whole blockchain on the raspnode or the blockchain gets significantly behind, the downloading of extra blocks to catch up can exceed the built in memory and cause Bitcoin core to crash. Enlarging the swap file by a little bit protects against this possibility.

Edit /etc/dphys-swap:
```
sudo nano /etc/dphys-swapfile
```

And change the default size of 100
```
CONF_SWAPSIZE=100
```
To 1000
```
CONF_SWAPSIZE=1000
```
Save and exit. Then run:
```
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

## Install Ethereum
Install geth with following [script](../master/geth-installer.sh). When asked accept default options, unless you know what you are doing.

## Install Bitcoin Core
14. Download and install the packages we will need for Bitcoin Core 
```
sudo apt-get install autoconf libevent-dev libtool libssl-dev libboost-all-dev libminiupnpc-dev -y
```
15. Download and install the packages we will need for bitcoin-qt
```
sudo apt-get install qt4-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev -y
```
16. Make a directory to download required files:
```
mkdir ~/bin
cd ~/bin
```
Download the Berkeley database source code, unzip it, then build the BerkeleyDB.
```
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx
make -j4
```
The "make -j4" command should take around 5 minutes to complete. If you get errors, then remove the "-j4" and just execute "make". This will take around 20 minutes.
```
sudo make install
```
17. Install Bitcoin
```
cd ~/
git clone -b 0.14 https://github.com/bitcoin/bitcoin.git
cd bitcoin/
./autogen.sh
./configure CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib" --enable-upnp-default --with-gui
```
For more info see: http://raspnode.com/diyBitcoin.html and https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md

18. Once that completes, then run:
```
make -j2
```
The "make -j2" command should take many hours. If you get errors using "-j2", then just run "make" but it will take around twice as long to build.
```
sudo make install
```
--- OLD ---
13. Download latest Bitcoin core from https://bitcoin.org/en/download

13. Type in a terminal
```
tar xzf bitcoin-0.13.1-x86_64-linux-gnu.tar.gz
sudo install -m 0755 -o root -g root -t /usr/local/bin bitcoin-0.13.1/bin/*
bitcoind -datadir=/media/pi/My_Files/bitcoin
```
--- OLD ---
# Usage
## Bitcoin
```
bitcoind -datadir=/media/pi/My_Files/bitcoin
```
### Usefull Commands
* bitcoin-cli -datadir=/media/pi/My_Files/bitcoin getblockcount

## Ethereum
```
~/go-ethereum/build/bin/geth --datadir <path to data directory>
```
If hard drive is not ext4, then disable inter-process communication by adding --ipcdisable flag
# Update
## Bitcoin
* Check for updates in https://bitcoin.org/en/download, and if any follow steps 12 and 13

## Ethereum
```
cd home/<username>/go-ethereum
git pull
make geth
```
