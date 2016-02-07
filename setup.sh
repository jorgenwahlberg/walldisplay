#!/bin/bash

# This script must be run as root

# Change the hostname init script to one that includes the mac address in the hostname
cp /home/pi/walldisplay/etc_init.d_hostname.sh /etc/init.d/hostname.sh

# update some packages we need
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install matchbox x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3

# at the moment, chromium doesn't have a raspbian package
wget http://ftp.us.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_armhf.deb
wget http://launchpadlibrarian.net/218525709/chromium-browser_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
wget http://launchpadlibrarian.net/218525711/chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
sudo dpkg -i libgcrypt11_1.5.0-5+deb7u3_armhf.deb
sudo dpkg -i chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
sudo dpkg -i chromium-browser_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb


# copy xinitrc
cp /home/pi/walldisplay/dotxinitrc /home/pi/.xinitrc

# reboot
echo Please reboot your device:
echo \$ sudo reboot

