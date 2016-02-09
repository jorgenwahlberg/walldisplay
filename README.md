# walldisplay
Using a Raspberry Pi for displaying information on a wall mounted screen

Installation

Download raspbian from https://downloads.raspberrypi.org/raspbian_lite_latest and install
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

Clone this repository:

  `git clone git@github.com:jorgenwahlberg/walldisplay.git`

Enter the cloned repository:

  `cd walldisplay`

Run the setup script as root:

  `sudo ./setup.sh`

Reboot the device once more. It will now have a hostname resembling walldisplay-11-22-33-aa-bb-cc 
