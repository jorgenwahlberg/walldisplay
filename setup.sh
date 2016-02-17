#!/bin/bash

# This script must be run as root

# Install init script setting hostname on boot
#cp /home/pi/walldisplay/walldisplay-sethostname /etc/init.d/walldisplay-sethostname
#update-rc.d walldisplay-sethostname defaults

# update some packages we need
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install matchbox x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3 chromium

# config files
cp /home/pi/walldisplay/boot_config.txt /boot/config.txt
cp /home/pi/walldisplay/rc.local /etc/rc.local

# copy pi user's xinitrc
cp /home/pi/walldisplay/dotxinitrc /home/pi/.xinitrc
chown pi.pi /home/pi/.xinitrc

# urlwatch
apt-get -y install urlwatch

# reboot
echo Please reboot your device:
echo \$ sudo reboot

