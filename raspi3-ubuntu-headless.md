# Install Raspbian on Raspberry Pi 3 (Headless)

1. Download lastest [Raspbian](https://downloads.raspberrypi.org/raspbian_latest) in your **Downloads** folder and unzip it.

2. Insert your SD card or USB flash drive

3. Identify its address by opening the "Disks" application and look for the "Device" line. If the line is in the /dev/mmcblk0p1 format, then your drive address is: /dev/mmcblk0. If it is in the /dev/sdb1 format, then the address is /dev/sdb

4. Unmount it by clicking in the square icon in the "Disks" application

5. Open a terminal (Ctrl+Alt+T) to copy the image to your removable drive
```
sudo dd if=~/Downloads/<image file> of=<drive address> bs=32M
```

6. Then, run the sync command to finalize the process
```
sudo sync
```
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
