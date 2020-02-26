#!/bin/bash

MAC=$(echo -n 1c:1b:; cut -d: -f3-6 < /sys/class/net/wlan0/address)


rfkill unblock all
echo "0" > /sys/class/rfkill/rfkill0/state
echo "1" > /sys/class/rfkill/rfkill0/state
echo "" > /dev/ttyS1

hciattach /dev/ttyS1 bcm43xx 115200 flow bdaddr ${MAC} 1>/tmp/ap6256.firmware 2>&1
