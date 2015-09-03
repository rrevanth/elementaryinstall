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

# PPA for elementary tweaks
sudo add-apt-repository -y ppa:linrunner/tlp					# PPA for Power Saving things
sudo apt-add-repository -y ppa:mc3man/trusty-media
sudo add-apt-repository -y ppa:webupd8team/java					# Java PPA
sudo apt-add-repository -y ppa:elementary-os/unstable-upstream
sudo add-apt-repository -y ppa:birdie-team/stable
sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt-add-repository -y ppa:bablu-boy/nutty-daily
sudo apt-add-repository -y ppa:hourglass-team/hourglass-daily
sudo apt-add-repository -y ppa:agronick/ppa
sudo apt-add-repository -y ppa:tomato-team/tomato-stable
sudo apt-add-repository -y ppa:justsomedood/justsomeelementary
sudo apt-add-repository -y ppa:elementary-os/daily
sudo apt-add-repository -y ppa:cybre/imgurcontract
sudo apt-add-repository -y ppa:l-admin-3/apps-daily
sudo apt-add-repository -y ppa:gnumdk/lollypop
sudo apt-add-repository -y ppa:w-vollprecht/ppa 				# PPA for Uberwriter
sudo apt-add-repository -y ppa:nathandyer/vocal-daily
sudo apt-add-repository -y ppa:birdie-team/stable
sudo apt-add-repository -y stock
sudo apt-add-repository -y ppa:fabiozaramella/screenshot-tool
sudo add-apt-repository -y ppa:saiarcot895/myppa				# PPA for apt-fast
sudo add-apt-repository -y ppa:yannubuntu/boot-repair			# PPA for boot-repair
sudo add-apt-repository -y ppa:elementaryos-fr-community/ppa 	# Community PPA
sudo apt-add-repository -y ppa:numix/ppa 						# PPA for Numix Theme
sudo add-apt-repository -y ppa:captiva/ppa 						# PPA for Captiva Icons

# PPA import and Install for Elementary Tweaks
curl -sL http://i-hate-farms.github.io/spores/install | sudo bash -


sudo add-apt-repository -y ppa:cybre/elementaryplus			# PPA for elementaryplus

# Popular ARC theme adding to source list
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.04/Release.key
sudo apt-key add - < Release.key


sudo add-apt-repository -y ppa:me-davidsansome/clementine		# PPA for clementine
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:plushuang-tw/uget-stable			# PPA for uget

# PPA for darktable, A photo workflow software
sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
# PPA for Rapid Photo Downloader
sudo add-apt-repository -y ppa:dlynch3

# PPA add for play on linux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
sudo add-apt-repository -y ppa:wfg/0ad

# PPA for NodeJS
curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -

# PPA for ioJS addition to Node for ES6 compatibility
curl -sL https://deb.nodesource.com/setup_iojs_3.x | sudo -E bash -


# sudo add-apt-repository -y ppa:eviltwin1/feedreader-stable	: Backup PPA for feedreader
# sudo add-apt-repository -y ppa:webupd8team/sublime-text-3		: Backup PPA for sublime
# sudo add-apt-repository -y ppa:cybre/elementaryplus			: Backup PPA for elementaryplus
# sudo add-apt-repository -y ppa:mpstark/elementary-tweaks-daily: Backup PPA for elementarytweaks

# Google Chrome Stable Adding Repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# deadsnakes python repository with *all* python versions
sudo add-apt-repository -y ppa:fkrull/deadsnakes

#sudo apt-add-repository -y ppa:grabli66-r/eos //PPA for currency convertor
#sudo apt-add-repository -y ppa:erasmo-marin/webby-browser //PPA for Webby browser App

# ieos7 Icons PPA

sudo add-apt-repository -y ppa:noobslab/icons


# PPA of Nate Carlson Maven3
sudo add-apt-repository -y "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main"
sudo apt-key adv –keyserver keyserver.ubuntu.com –recv-keys B70731143DD9F856
: <<'backbox_install'

Backbox PPA can be added to your system manually by copying the lines below to your "/etc/apt/sources.list.d/backbox-four-trusty.list" file:

deb http://ppa.launchpad.net/backbox/four/ubuntu trusty main 
deb-src http://ppa.launchpad.net/backbox/four/ubuntu trusty main

Then add the gpg key used to sign the packages by running the following commands at your command prompt:

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78A7ABE1 
sudo apt-get update

And now install required backbox packages

backbox_install

# Backbox Repo Addition

sudo echo "deb http://ppa.launchpad.net/backbox/four/ubuntu trusty main
deb-src http://ppa.launchpad.net/backbox/four/ubuntu trusty main" >> /etc/apt/sources.list.d/backbox-four-trusty.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78A7ABE1

: <<'Extras'

# DROPBOX PPA if you need

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list' 

Extras

sudo apt-get update


echo "##################################################"
echo "              Added PPA Successfully              "
echo "##################################################"

echo "##################################################"
echo "               Have a good Day Sire               "
echo "##################################################"
