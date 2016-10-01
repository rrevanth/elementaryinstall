#!/bin/bash

# Fixes sudo issues
if (($EUID != 0)); then
  if [[ -t 1 ]]; then
    sudo "$0" "$@"
  else
    exec 1>output_file
    gksu "$0 $@"
  fi
  exit
fi



sudo add-apt-repository ppa:backbox/four

# sudo echo "deb http://ppa.launchpad.net/backbox/four/ubuntu trusty main
# deb-src http://ppa.launchpad.net/backbox/four/ubuntu trusty main" >> /etc/apt/sources.list.d/backbox-four-trusty.list
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78A7ABE1

: <<'Extras'

# DROPBOX PPA if you need

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list' 

Extras


: <<'SecurityToolsPPA'

# These PPA's include about 500+ hacking tools.if you are interested,run these commands

sudo add-apt-repository -y ppa:cybersec/chaos-ppa
sudo add-apt-repository -y ppa:cybersec/chaos-ppa-v1
sudo add-apt-repository -y ppa:cybersec/chaos-ppa-v2
sudo add-apt-repository -y ppa:cybersec/test
sudo add-apt-repository -y ppa:cybersec/trojan-horse

			[OR]

sudo add-apt-repository -y ppa:darklordpaunik8880/darkminttrustytahr
sudo add-apt-repository -y ppa:darklordpaunik8880/darkminttrustytahr2
sudo add-apt-repository -y ppa:darklordpaunik8880/darkminttrustytahr3
sudo add-apt-repository -y ppa:darklordpaunik8880/darkminttrustytahr4

SecurityToolsPPA


sudo apt-get update


echo "##################################################"
echo "              Added PPA Successfully              "
echo "##################################################"

echo "##################################################"
echo "               Have a good Day Sire               "
echo "##################################################"
