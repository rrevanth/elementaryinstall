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

# Confirm Function
confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

# confirm "Upgrade System before the script run?" && sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

if [[ $(confirm "PPA[y] or APPS Install[n]?") ]];
then
    if [[ $(confirm "Do you want to add essential PPA's?") ]];
    then
        # PPA for Power Saving things
        echo 'PPA for Power Saving things'
        sudo add-apt-repository -y ppa:linrunner/tlp                    
        sudo apt-add-repository -y ppa:mc3man/trusty-media
        sudo add-apt-repository -y ppa:webupd8team/java                 
        sudo apt-add-repository -y ppa:elementary-os/unstable-upstream
        sudo apt-add-repository -y ppa:elementary-os/daily
        sudo apt-add-repository -y ppa:fabiozaramella/screenshot-tool
        sudo add-apt-repository -y ppa:rvm/smplayer
        # Dev Tools PPA
        sudo add-apt-repository -y ppa:ondrej/php
        sudo add-apt-repository -y ppa:nginx/development
        # APT Fast PPA
        sudo add-apt-repository -y ppa:saiarcot895/myppa
        sudo add-apt-repository -y ppa:elementaryos-fr-community/ppa
        # PPA for ffmpeg updated for trusty
        # sudo add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next
        sudo add-apt-repository -y ppa:mc3man/ffmpeg-test1
        sudo add-apt-repository -y ppa:mc3man/mpv-tests
        sudo add-apt-repository -y ppa:pcf/miro-releases


        sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
        sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
        sudo wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.04/Release.key -O /tmp/Release.key
        sudo apt-key add - < /tmp/Release.key
        sudo add-apt-repository -y ppa:plushuang-tw/uget-devel
        sudo add-apt-repository ppa:wine/wine-builds

        # Sublime Text Beta Builds PPA
        sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
        sudo add-apt-repository -y ppa:webupd8team/atom # Atom Editor PPA
        sudo add-apt-repository -y ppa:git-core/ppa # git PPA
        sudo apt-add-repository -y ppa:strukturag/libde265  # VLC Codecs
        sudo add-apt-repository -y ppa:neovim-ppa/unstable  # Neovim
        sudo add-apt-repository -y ppa:byobu/ppa            # Tmux


        # deadsnakes python repository with *all* python versions
        sudo add-apt-repository -y ppa:fkrull/deadsnakes
        sudo add-apt-repository -y ppa:libreoffice/ppa
        sudo add-apt-repository -y ppa:menulibre-dev/devel # Menu Libre

        # Play ON linux PPA
        # sudo wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
        # sudo sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
        sudo add-apt-repository -y ppa:noobslab/apps
        sudo add-apt-repository -y ppa:noobslab/icons # for Ieos7 icons

        # PPA for NodeJS
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

        # Elementary Tweaks
        curl -sL http://i-hate-farms.github.io/spores/install | sudo bash -
        echo 'Added all essential PPA'
    else
        echo 'Skipping adding of essential PPA"s'
    fi

    echo 'Customizing additional PPA'

    if [[ $(confirm "Do you want go install UI PPA's? i.e., numix,captiva,elementaryplus and noobslab themes") ]];
    then
        sudo apt-add-repository -y ppa:numix/ppa
        sudo add-apt-repository -y ppa:captiva/ppa
        sudo add-apt-repository -y ppa:cybre/elementaryplus
    else
        echo 'Skipped UI PPA'
    fi

    echo 'Additional PPA.Confirm for each PPA'

    if [[ $(confirm "This PPA includes Elem APPS.Want to install them?") ]];
    then
    sudo add-apt-repository -y ppa:birdie-team/stable
    sudo add-apt-repository -y ppa:alessandro-strada/ppa            # Google Drive
    sudo apt-add-repository -y ppa:bablu-boy/nutty-daily
    sudo apt-add-repository -y ppa:hourglass-team/hourglass-daily
    sudo apt-add-repository -y ppa:agronick/ppa                     #Relay IRC client
    sudo apt-add-repository -y ppa:tomato-team/tomato-stable
    sudo apt-add-repository -y ppa:justsomedood/justsomeelementary  # Translator
    sudo apt-add-repository -y ppa:cybre/imgurcontract
    sudo apt-add-repository -y ppa:l-admin-3/apps-daily             # Configurator
    sudo apt-add-repository -y ppa:gnumdk/lollypop
    sudo apt-add-repository -y ppa:w-vollprecht/ppa                 # PPA for Uberwriter            
    sudo apt-add-repository -y ppa:nathandyer/vocal-daily
    sudo add-apt-repository -y ppa:yannubuntu/boot-repair
    # PPA for darktable, A photo workflow software
    sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
    # PPA for Rapid Photo Downloader
    sudo add-apt-repository -y ppa:dlynch3
    sudo add-apt-repository -y ppa:eviltwin1/feedreader-stable      # Backup PPA for feedreader
    sudo apt-add-repository -y ppa:grabli66-r/eos                   #PPA for currency convertor
    sudo apt-add-repository -y ppa:erasmo-marin/webby-browser       #PPA for Webby browser App
    # 0 AD game PPA
    sudo add-apt-repository -y ppa:wfg/0ad
    else
        confirm "Add Clementine PPA?" && sudo add-apt-repository -y ppa:me-davidsansome/clementine 
        confirm "Add Maven3 PPA?" && sudo add-apt-repository -y "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main" && sudo apt-key adv –keyserver keyserver.ubuntu.com –recv-keys B70731143DD9F856
        confirm "Add BackBox PPA?" && sudo add-apt-repository -y ppa:backbox/four
        confirm "Add GIMP PPA?" && sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
    fi
    echo "##################################################"
    echo "              Added PPA Successfully              "
    echo "##################################################"

    echo "##################################################"
    echo "               Have a good Day Sire               "
    echo "##################################################"
else
    echo 'Installling system'
    sudo wget https://github.com/rrevanth/elementaryinstall/blob/master/backath10k-dkms_2.0_all.deb?raw=true -O /tmp/wifi.deb
    sudo dpkg -i /tmp/wifi.deb
    sudo apt-get install aptitude
    sudo aptitude install -y libavcodec-extra-54 libavcodec-extra-54 aptitude mplayer indicator-multiload gdebi-core arc-theme moka-icon-theme
    sudo aptitude install -y linux-firmware-nonfree xclip dtrx alien dpkg-dev debhelper build-essential synaptic gtk2-engines-pixbuf libcanberra-gtk-module packageKit-gtk3-module gnome-themes-standard xpad
    #Cursor disappear fix
    gsettings set org.gnome.settings-daemon.plugins.cursor active false
    #4k normal fonts
    gsettings set org.gnome.desktop.interface text-scaling-factor 1.05
    gsettings set com.ubuntu.sound allow-amplified-volume 'true'
    sudo aptitude install -y smplayer smtube smplayer-themes smplayer-skins youtube-dl youtube-dlg deadbeef mpv
    sudo aptitude install -y vim git aria2 uget elementaryplus firefox atom libappindicator1 inotify-tools dconf-editor openssl libssl-dev libpcre3 libpcre3-dev libreadline-dev libpam0g-dev libncurses-dev openssl libssl-dev
    sudo aptitude install -y elementary-tweaks nutty skype transmission rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip oracle-java9-installer oracle-java9-set-default oracle-java9-unlimited-jce-policy flashplugin-installer pepperflashplugin-nonfree vlc ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav tlp tlp-rdw rar hourglass relay elementary-plus footnote configurator evnc feedreader go-for-it envelope vocal taxi power-installer nasc anoise apt-fast axel
    sudo /usr/share/doc/libdvdread4/install-css.sh  # Enable DVD Playback
    sudo aptitude install -y ttf-mscorefonts-installer  # Microsoft Fonts
    sudo aptitude install -y libavcodec-extra-54 virtualenvwrapper nodejs git zsh-beta
    # Extra APPS
    sudo aptitude install -y gimp gimp-data gimp-plugin-registry gimp-data-extras gthumb tomato imgur-contract translator indicator-terminal corebird webby-browser currency eradio lollypop fantasy uberwriter foto birdie agenda-tasks screenshot-tool boot-repair clementine darktable rapid-photo-downloader

    # Rust Cario some dependencies
    sudo aptitude install -y libcairo2-dev libjpeg-dev libgif-dev

    sudo apt-get purge midori-granite
    sudo apt-get purge noise geary audience pantheon-photos
    sudo apt-get purge scratch-text-editor
    sudo apt-get autoremove
    sudo apt-get autoclean

    #Remove some Switchboard Plug's
    sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
    sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

    #Install gedit (Text Editor)
    sudo aptitude install -y gedit gedit-plugins nautilus

    #Install File Compression Libs
    sudo aptitude install -y icedtea-7-plugin openjdk-8-jre unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller ubuntu-restricted-extras dkms libreoffice vlc-plugin-libde265

    #Install screenfetch (my elementary-OS special Version)
    mkdir screenfetch
    cd screenfetch
    wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
    sudo mv screenfetch-dev /usr/bin/screenfetch
    cd ..
    rm -rf screenfetch

    # #make it readable and executable
    # sudo chmod +rx /usr/bin/screenfetch

    # 5) Enable DOCK ZOOM – Open up a terminal and run:

    # gedit ~/.config/plank/dock1/settings
    # All the way at the bottom of the file do:
    # #Whether the dock will zoom when hovered.
    # ZoomEnabled=true
    # #The dock's icon-zoom (in percent).
    # ZoomPercent=150

    # 6)
    # gsettings set org.gnome.gnome-screenshot auto-save-directory '/home/your name/Desktop'
    # gsettings set org.gnome.gnome-screenshot default-file-type 'jpg'
    # gsettings set org.gnome.gnome-screenshot delay '1'
    # gsettings set org.gnome.gnome-screenshot last-save-directory '/home/your name/Desktop/'

    # 7) Enable seconds on menu bar:
    # gsettings set com.canonical.indicator.datetime show-seconds true

    # 8)
    # gsettings set org.gnome.nautilus.desktop font '16'

    # 9)
    # gsettings set org.gnome.nautilus.preferences default-sort-order 'type'

    # 10) Turn off annoying “auto-maximize” feature on application boot up. Disabling this will “save” the window state upon closing it.

    # gsettings set org.gnome.mutter auto-maximize false


    # 13) Install laptop-mode-tools - It will add 20-30% to your battery life.

    sudo aptitude install -y laptop-mode-tools gksu

    # Much of this just works, but the auto backlight adjustment does not. You need to edit /etc/laptop-mode/conf.d/lcd-brightness.conf and make changes as follows:

    # gksu gedit /etc/laptop-mode/conf.d/lcd-brightness.conf
    # .# turn on brightness control
    # CONTROL_BRIGHTNESS=1

    # .# set the backlight brightness of AC power state change
    # BATT_BRIGHTNESS_COMMAND="echo 93"
    # LM_AC_BRIGHTNESS_COMMAND="echo 937"
    # NOLM_AC_BRIGHTNESS_COMMAND="echo 937"
    # BRIGHTNESS_OUTPUT="/sys/class/backlight/intel_backlight/brightness"


    # 19)
    # chrome:://flags and modify settings as you wish.
    # also download the “Backstay” extension to prevent the backspace button from annoyingly going back and also “No MouseWheel Zoom” one to prevent ctrl & +/- zooming. 

    # 20) Install MenuLibre (so you can easily remove application shortcuts from the applications launcher)
    sudo aptitude install -y menulibre



    # 21) How to change desktop text color to white (like OS X): FROM: http://mylinuxideas.blogspot.com/2015/04/enable-desktop-icons-and-right-click-on.html

    # Open terminal and type sudo nano /usr/share/themes/elementary/gtk-3.0/gtk-widgets.css

    # and then paste this anywhere on the css file:

    # .nautilus-desktop.nautilus-canvas-item {
    # color: #ffffff;
    # text-shadow: 1 1 alpha (@fg_color, 0.8);
    # }

    # and then run nautilus -q and you will see that folder font color is now white.

    # 22) Select pantheon terminal as default (in case application doesn’t launch).
    # sudo update-alternatives --config x-terminal-emulator

    # and make pantheon-terminal the default. 

    # 23) Improve font rendering:

    sudo add-apt-repository -y ppa:no1wantdthisname/ppa
    sudo apt-get update && sudo apt-get -y upgrade
    sudo apt-get install fontconfig-infinality
    sudo bash /etc/fonts/infinality/infctl.sh setstyle osx

    # 24) Install Skype
    sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ precise partner"
    sudo apt-get update && sudo apt-get install skype


    # 26) Add show/hide desktop command to corners & Plank dock:

    # A) sudo apt-get install wmctrl
    # B) Create “show desktop” launcher icon on plank (personal note: I saved master.zip to Dropbox in case link breaks)
    # cd /tmp && wget https://github.com/png2378/showdesktop/archive/master.zip
    # unzip master.zip && cd showdesktop-master
    # sudo mv showdesktop /usr/local/bin/ && sudo mv showdesktop.desktop /usr/share/applications/ && sudo mv showdesktop.svg /usr/share/icons/elementary/apps/48/

    # now go to corners in desktop settings and make a custom command for “showdesktop”


    # 27) Install redshift from Ubuntu Software Center. https://help.ubuntu.com/community/Redshift

    # So here is an example of a working configuration, which you can adapt to your needs. Name it redshift.conf and place it in your $HOME/.config directory, then ajust it to your needs.

    # [redshift]
    # ; Set the day and night screen temperatures
    # temp-day=6500
    # temp-night=3500

    # ; Enable/Disable a smooth transition between day and night
    # ; 0 will cause a direct change from day to night screen temperature.
    # ; 1 will gradually increase or decrease the screen temperature
    # transition=1

    # ; Set the screen brightness. Default is 1.0
    # brightness=1.0
    # ; It is also possible to use different settings for day and night since version 1.8.
    # ;brightness-day=0.7
    # ;brightness-night=0.4
    # ; Set the screen gamma (for all colors, or each color channel individually)
    # gamma=1.0:1.0:1.0

    # ;gamma=0.8:0.7:0.8
    # ; Set the location-provider: 'geoclue', 'gnome-clock', 'manual'
    # ; type 'redshift -l list' to see possible values
    # ; The location provider settings are in a different section.
    # location-provider=manual

    # ; Set the adjustment-method: 'randr', 'vidmode'
    # ; type 'redshift -m list' to see all possible values
    # ; 'randr' is the preferred method, 'vidmode' is an older API
    # ; but works in some cases when 'randr' does not.
    # ; The adjustment method settings are in a different section.
    # adjustment-method=randr

    # ; Configuration of the location-provider:
    # ; type 'redshift -l PROVIDER:help' to see the settings
    # ; e.g. 'redshift -l manual:help'
    # [manual]
    # lat=43
    # lon=-73

    # ; Configuration of the adjustment-method
    # ; type 'redshift -m METHOD:help' to see the settings
    # ; ex: 'redshift -m randr:help'
    # ; In this example, randr is configured to adjust screen 1.
    # ; Note that the numbering starts from 0, so this is actually the second screen.
    # [randr]
    # screen=0

    #update initramfs
    # sudo update-initramfs -k all -u
    #Reboot!


    echo 'Install Elementary Dropbox Mods'

    # Neovim Dotfile Installation
    sudo aptitude install -y software-properties-common neovim python-dev python-pip python3-dev python3-pip
    sudo pip3 install neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
fi