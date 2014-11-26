#!/bin/bash

#basic
sudo apt-get install -y build-essential kernel-package python-software-properties
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:nilarimogard/webupd8
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget -q -O - https://www.hipchat.com/keys/hipchat-linux.key | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c 'echo "deb http://downloads.hipchat.com/linux/apt stable main" >> /etc/apt/sources.list.d/atlassian-hipchat.list'
sudo apt-get update
sudo apt-get install -y xubuntu-desktop git byobu vim aptitude fcitx-mozc curl google-chrome-stable compiz compizconfig-settings-manager vlc libdvdread4 gedit emerald compiz-plugins nautilus tree vpnc network-manager-vpnc synaptic gdebi-core xubuntu-restricted-extras libavcodec-extra keepassx hipchat arandr nkf

#dvd
sudo /usr/share/doc/libdvdread4/install-css.sh

#skype
wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo gdebi skype-ubuntu-precise_4.3.0.37-1_i386.deb

