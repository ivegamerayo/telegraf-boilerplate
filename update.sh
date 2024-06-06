#!/bin/bash

#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"

#ROOT PRIVILEGIES
if [[ $EUID -ne 0 ]]; then
    echo -e "$red No estas en root.$nc"
    exit 1
fi

USER=$SUDO_USER

directory="/etc/telegraf/telegraf.d"

# Install input
curl -o $directory/input.conf https://raw.githubusercontent.com/ivegamerayo/monitoring/main/input.conf | chown $USER:$USER $directory/input.conf

# Install output
curl -o $directory/output.conf https://raw.githubusercontent.com/ivegamerayo/monitoring/main/output.conf | chown $USER:$USER $directory/output.conf

# Set mqtt_test

curl -o $directory/mqtt.conf https://raw.githubusercontent.com/ivegamerayo/monitoring/main/mqtt.conf | chown $USER:$USER $directory/mqtt.conf

sudo systemctl restart telegraf | sudo systemctl status telegraf
