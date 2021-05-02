#!/bin/bash

file="/etc/modprobe.d/disable-usb.conf"


./replace_or_add_line.sh "usb-storage" "install usb-storage /bin/true" "$file"
