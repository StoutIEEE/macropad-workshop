#!/bin/sh

pacman -S --noconfirm git
git clone https://github.com/qmk/qmk_firmware.git
cd qmk_firmware
./util/qmk_install.sh
