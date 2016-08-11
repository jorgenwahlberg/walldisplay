# walldisplay
Using a Raspberry Pi for displaying information on a wall mounted screen

Inspired by http://blogs.wcode.org/2013/09/howto-boot-your-raspberry-pi-into-a-fullscreen-browser-kiosk/

Installation

Download raspbian from https://downloads.raspberrypi.org/raspbian_lite_latest and install
on an SD card. Installation instructions can be found on
https://www.raspberrypi.org/documentation/installation/installing-images/README.md

Insert the SD card into the Raspberry Pi, make sure it is connected to a network,
boot it and log into it:

  `ssh pi@raspberrypi`

The default password is "raspberry" (without the quotes).

We need git to continue, so we install it:

  `sudo apt-get update`
  `sudo apt-get install -y git`

Clone this repository:

  `git clone git@github.com:jorgenwahlberg/walldisplay.git`

Enter the cloned repository:

  `cd walldisplay`

Run the setup script as root:

  `sudo ./setup.sh`

Reboot the device once more. It will now start a chromium browser with a URL fetched by the .xinitrc script.

