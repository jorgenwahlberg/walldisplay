#!/bin/bash

# This script must be run as root

# Install init script setting hostname on boot
#cp /home/pi/walldisplay/walldisplay-sethostname /etc/init.d/walldisplay-sethostname
#update-rc.d walldisplay-sethostname defaults

# don't start window manager by default
systemctl set-default multi-user.target

# don't swap
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove

# add ubuntu repo where we can find chromium-browser package
# see https://raspberrypi.stackexchange.com/questions/44384/how-to-get-chromium-on-raspberry-3 for chromium details
echo "deb http://ports.ubuntu.com trusty main universe multiverse" > /etc/apt/sources.list.d/ubuntu.list
echo "deb http://ports.ubuntu.com trusty-updates main universe multiverse" >> /etc/apt/sources.list.d/ubuntu.list
echo 'APT::Default-Release "jessie";' > /etc/apt/apt.conf.d/10release
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 3B4FE6ACC0B21F32


# update packages and install chromium-browser and some dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get -y purge apt-listchanges
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install xinit matchbox xserver-xorg xserver-xorg-legacy x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 urlwatch chromium-browser/trusty chromium-browser-l10n/trusty chromium-codecs-ffmpeg-extra/trusty

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

