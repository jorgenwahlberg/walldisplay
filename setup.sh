#!/bin/bash

# This script must be run as root

# set a unique hostname for the device
echo walldisplay-$(cat /sys/class/net/eth0/address | sed s'/:/-/g') > /etc/hostname

# update some packages we need
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install matchbox chromium x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3

# copy xinitrc
cp $HOME/walldisplay/dotxinitrc $HOME/.xinitrc

# reboot
echo Please reboot your device:
echo \$ sudo reboot

