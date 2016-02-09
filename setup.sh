#!/bin/bash

# This script must be run as root

# Install init script setting hostname on boot
cp /home/pi/walldisplay/walldisplay-sethostname /etc/init.d/walldisplay-sethostname
update-rc.d walldisplay-sethostname defaults

# update some packages we need
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install matchbox x11-xserver-utils ttf-mscorefonts-installer xwit sqlite3 libnss3

# at the moment, chromium doesn't have a raspbian package, workaround found at http://conoroneill.net/running-the-latest-chromium-45-on-debian-jessie-on-your-raspberry-pi-2/
wget http://launchpadlibrarian.net/219208909/chromium-browser_45.0.2454.101-0ubuntu1.1201_armhf.deb
wget http://launchpadlibrarian.net/219208911/chromium-codecs-ffmpeg-extra_45.0.2454.101-0ubuntu1.1201_armhf.deb
wget http://launchpadlibrarian.net/228394031/dbus_1.10.6-1ubuntu1_armhf.deb
wget http://launchpadlibrarian.net/228394034/libdbus-1-3_1.10.6-1ubuntu1_armhf.deb
apt-get -y remove dbus
apt-get -y install libapparmor1
dpkg -i libdbus-1-3_1.10.6-1ubuntu1_armhf.deb
dpkg -i dbus_1.10.6-1ubuntu1_armhf.deb
dpkg -i chromium-codecs-ffmpeg-extra_45.0.2454.101-0ubuntu1.1201_armhf.deb
dpkg -i chromium-browser_45.0.2454.101-0ubuntu1.1201_armhf.deb


# edit rc.local 
cp /etc/rc.local /etc/rc.local.bk
sed '$ i su - pi -c startx &' /etc/rc.local.bk > /etc/rc.local

# copy xinitrc
cp /home/pi/walldisplay/dotxinitrc /home/pi/.xinitrc

# reboot
echo Please reboot your device:
echo \$ sudo reboot

