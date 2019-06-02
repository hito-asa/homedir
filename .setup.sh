#!/bin/bash

# basic
sudo apt update
sudo apt remove thunderbird transmission-gkt
sudo apt install -y build-essential kernel-package software-properties-common
sudo apt install -y xubuntu-desktop git byobu neovim fcitx-mozc curl compiz compizconfig-settings-manager vlc gedit emerald compiz-plugins tree vpnc network-manager-vpnc synaptic xubuntu-restricted-addons libavcodec-extra keepassx arandr nkf fonts-powerline tilix 

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


mv ~/.bashrc ~/.bashrc.bak
mv ~/.byobu ~/.byobu.bak

ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_aliases ~/.bash_aliases
ln -s $PWD/.bash_env ~/.bash_env
ln -s $PWD/.byobu ~/.byobu
ln -s $PWD/.config/nvim ~/.config/nvim
ln -s $PWD/.config/compiz-1 ~/.config/compiz-1
ln -s $PWD/.inputrc ~/.inputrc
ln -s $PWD/.externals ~/.externals
ln -s $PWD/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gemrc ~/.gemrc
ln -s $PWD/.xkb ~/.xkb
ln -s $PWD/bin ~/bin
ln -s $PWD/.emerald/ ~/.emerald
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.byobu ~/.byobu

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

