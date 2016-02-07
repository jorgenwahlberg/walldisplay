#!/bin/bash

# This script must be run as root

# Change the hostname init script to one that includes the mac address in the hostname
cp $HOME/walldisplay/etc_init.d_hostname.sh /etc/init.d/hostname.sh

# update some packages we need
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install matchbox chromium x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3

# copy xinitrc
cp $HOME/walldisplay/dotxinitrc $HOME/.xinitrc

# reboot
echo Please reboot your device:
echo \$ sudo reboot

