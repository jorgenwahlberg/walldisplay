#!/bin/bash

# This script must be run as root

# Install init script setting hostname on boot
#cp /home/pi/walldisplay/walldisplay-sethostname /etc/init.d/walldisplay-sethostname
#update-rc.d walldisplay-sethostname defaults

# don't start window manager by default
systemctl set-default multi-user.target

# add ubuntu repo where we can find chromium-browser package
echo "deb http://ppa.launchpad.net/canonical-chromium-builds/stage/ubuntu vivid main" > /etc/apt/sources.list.d/chromium-ppa.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DB69B232436DAC4B50BDC59E4E1B983C5B393194

# update packages and install chromium-browser and some dependencies
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install xinit matchbox xserver-xorg xserver-xorg-legacy x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 chromium-browser urlwatch

# set time zone to Norwegian time
sudo cp /usr/share/zoneinfo/posix/Europe/Oslo /etc/localtime

# config files
cp /home/pi/walldisplay/boot_config.txt /boot/config.txt
cp /home/pi/walldisplay/rc.local /etc/rc.local

# copy pi user's xinitrc
cp /home/pi/walldisplay/dotxinitrc /home/pi/.xinitrc
chown pi.pi /home/pi/.xinitrc

# X server config
echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

# reboot
echo Please reboot your device:
echo \$ sudo reboot

