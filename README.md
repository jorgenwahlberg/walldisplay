# walldisplay
Using a Raspberry Pi for displaying information on a wall mounted screen

Inspired by http://blogs.wcode.org/2013/09/howto-boot-your-raspberry-pi-into-a-fullscreen-browser-kiosk/

Installation

Download raspbian from https://downloads.raspberrypi.org/raspbian/images/raspbian-2015-05-07/2015-05-05-raspbian-wheezy.zip and install
on an SD card. Installation instructions can be found on
https://www.raspberrypi.org/documentation/installation/installing-images/README.md

Insert the SD card into the Raspberry Pi, make sure it is connected to a network,
boot it and log into it:

  `ssh pi@raspberrypi`

The default password is "raspberry" (without the quotes).

Resize the file system to make use of the whole SD card:

  `raspi-config`
  (select 1, press enter, select Finish, and let the device reboot)

Log into the raspberry pi once more to continue.

Currently, one raspbian mirror is dead, so we must do a hack to avoid it

  `echo 51.175.204.28   raspbian.trivini.no >> /etc/hosts`

Clone this repository:

  `git clone git@github.com:jorgenwahlberg/walldisplay.git`

Enter the cloned repository:

  `cd walldisplay`

Run the setup script as root:

  `sudo ./setup.sh`

Reboot the device once more. It will now have a hostname resembling walldisplay-11-22-33-aa-bb-cc 
