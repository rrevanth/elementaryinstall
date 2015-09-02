#!/bin/bash

# Setting MTU to 1200 so ec2 ssh can be done with some routers and in some networks
ip link set dev eth0 mtu 1200
ip link set dev wlan0 mtu 1200
