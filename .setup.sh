#!/bin/bash

#basic
sudo apt-get install -y build-essential kernel-package python-software-properties
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:nilarimogard/webupd8
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install -y git byobu vim aptitude fcitx-mozc curl google-chrome-stable compiz compizconfig-settings-manager vlc libdvdread4 gedit emerald compiz-plugins nautilus

#dvd
sudo /usr/share/doc/libdvdread4/install-css.sh

