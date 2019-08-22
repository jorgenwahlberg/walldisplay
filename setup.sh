#!/bin/bash

# This script must be run as root

# don't start window manager by default
systemctl set-default multi-user.target

# don't swap
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove

# update packages and install chromium-browser and some dependencies
export DEBIAN_FRONTEND=noninteractive
apt-get -y purge apt-listchanges
apt-get -y update
#apt-get -y dist-upgrade
apt-get -y install xinit matchbox xserver-xorg xserver-xorg-legacy x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 urlwatch chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra initramfs-tools

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

# fix for getting usual interface names
echo "net.ifnames=0 `cat /boot/cmdline.txt`" > /boot/cmdline.txt

# setup overlayfs to reduce sd card wear
# for details, see
# https://gist.github.com/dzindra/a8e2083a7f037ca244cf70d100c96656
cp /home/pi/walldisplay/overlay /etc/initramfs-tools/scripts/
echo "overlay" >> /etc/initramfs-tools/modules
mkdir /overlay /overlay/temp /overlay/base
update-initramfs -c -k `uname -r`
echo "initramfs initrd.img-`uname -r`" >> /boot/config.txt
echo "boot=overlay `cat /boot/cmdline.txt`" > /boot/cmdline.txt


# reboot
echo Please reboot your device:
echo \$ sudo reboot
