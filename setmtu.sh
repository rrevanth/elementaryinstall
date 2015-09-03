#!/bin/bash

# Setting MTU to 1200 so ec2 ssh can be done with some routers and in some networks
if [[ "$1" != "" ]]; then
    mtuval=$1
else
	echo "Enter the MTU value less than 1500 that you want to set for eth and wlan followed by [ENTER]:"
	read mtuval
fi
read -p "Set value $mtuval for LAN? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Setting MTU value for elan0
	sudo ip link set dev eth0 mtu $mtuval
	echo ""
	echo "ETHERNET : `ip link show dev eth0 | awk '{print $5}'`"
else
	echo "Skipping elan0"
fi
read -p "Set value $mtuval for WLAN? " -n 1 -r
echo "
"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Setting MTU value for wlan0
	sudo ip link set dev wlan0 mtu $mtuval
	echo""
	echo "WLAN : `ip link show dev wlan0 | awk '{print $5}'`"
else
	echo "Skipping wlan0"
fi
echo "

		MTU value set accordingly.
		If you want to check the values
		run | ip link | in terminal

"
