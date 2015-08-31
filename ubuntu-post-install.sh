#!/bin/bash

# TODO
# - Automatically fix the "Unknown display" problem by editing grub defaults
#   like described here: http://askubuntu.com/questions/398903/unknown-display-besides-laptop-built-in-display-old-question-but-with-no-answer

##
## Essential stuff
##
sudo apt-get install -y build-essential aria2 git mercurial subversion \
    fonts-inconsolata unzip unrar p7zip-full ack-grep vim
 

##
## Python related
##

sudo apt-get install -y virtualenvwrapper

# deadsnakes python repository with *all* python versions
sudo add-apt-repository -y ppa:fkrull/deadsnakes


##
## Setup the Solarized Dark theme for gnome-terminal
##
gtcbin="`(mktemp -d)`/solarize"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git "`(dirname \"$gtcbin\")`"
"$gtcbin" dark

 
##
## Setup Prezto
##
sudo apt-get install -y git zsh
 
git clone --recursive https://github.com/ravishi/prezto.git "$HOME/.zprezto"
 
shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/!(README.md); do
  ln -s "$rcfile" "$HOME/.$(basename $rcfile)"
done
 
# XXX since we are using sudo for everything else, this is better than the
# usual chsh, which would request another password right in the middle of the
# script execution
sudo usermod -s /bin/zsh "$(whoami)"
 
 
## 
## Setup VIM
##
sudo apt-get install -y vim-gnome ruby-dev
 
git clone --recursive https://github.com/ravishi/dotvim "$HOME/.vim"
 
cd "$HOME/.vim/bundle/command-t/ruby/command-t"
ruby extconf.rb && make

# symlink vimrc
ln -s "$HOME/.vim/vimrc" "$HOME/.vimrc"

# powerline fancy symbols
mkdir -p "$HOME/.fonts/" "$HOME/.config/fontconfig/conf.d/"
wget -P "$HOME/.fonts/" https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf "$HOME/.fonts"
wget -P "$HOME/.config/fontconfig/conf.d/" https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf


##
## Google Chrome
##
sudo su -c 'echo "# Google software repository
deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update -y

# we need --force-yes because chrome is not an authenticated package
sudo apt-get install -y --force-yes google-chrome-beta

 
##
## VLC as the default video player
##
sudo apt-get install -y vlc
sudo apt-get remove -y --purge totem
 
 
##
## XMonad
##
sudo apt-get install -y xmonad libghc-xmonad-contrib-dev gnome-session-fallback
if [ ! -d "$HOME/.xmonad" ]; then
    mkdir "$HOME/.xmonad"
fi
wget -O "$HOME/.xmonad/xmonad.hs" https://gist.github.com/ravishi/4154309/raw/xmonad.hs

# disable global Super+P shortcut, which conflicts with XMonads Super+P
dconf write /org/gnome/settings-daemon/plugins/xrandr/active false


##
## Misc stuff
##

# Better font rendering (aka Infinality)
# source: http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html
sudo add-apt-repository -y ppa:no1wantdthisname/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y fontconfig-infinality

# Turn off apport
sudo su -c 'echo "enabled=0" > /etc/default/apport'

#
# Remove Ubuntu One
# source: http://askubuntu.com/questions/309122/removing-ubuntu-one
killall ubuntuone-login ubuntuone-preferences ubuntuone-syncdaemon

sudo rm -rf "$HOME//.local/share/ubuntuone" "$HOME//.cache/ubuntuone" "$HOME//.config/ubuntuone"

mv "$HOME/Ubuntu One/" "$HOME/Ubuntu One Backup/"

sudo apt-get remove -y --purge 'ubuntuone-*'


##
## And to finish it, a dist-upgrade to install/update them all.
##
sudo apt-get update && sudo apt-get dist-upgrade -y
 
# vim: set tw=0: