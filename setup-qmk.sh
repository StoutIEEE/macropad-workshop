#!/bin/sh

# OS type
name=$(uname)

# Linux distro name
dname=''
if [[ $name == 'Linux' ]]; then
  dname=$(lsb_release -is)
fi


# Windows or Arch
if [[ $name == 'MSYS_NT-10.0' ]] || [[ $dname == 'Arch' ]]; then
  pacman -S --noconfirm git
fi
# Fedora
if [[ $dname == 'Fedora' ]]; then
  sudo yum install -y git
fi
# Debian or Ubuntu
if [[ $dname == 'Debian' ]] || [[ $dname == 'Ubuntu' ]]; then
  sudo apt install -y git
fi
# Mac
if [[ $name == 'Darwin' ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install git
fi


# This is platform agnostic
cd $HOME
git clone https://github.com/qmk/qmk_firmware.git
cd qmk_firmware
./util/qmk_install.sh
