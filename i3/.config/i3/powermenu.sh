#!/bin/bash

res=$(echo ' Shutdown| Reboot| Lock| Logout'| rofi -yoffset -100 -font "hack bold 14"  -sep "|" -theme slate -no-fixed-num-lines -dmenu -p 'Power     ')

if [ "$res" = " Logout" ]; then
    i3-msg exit
fi
if [ "$res" = " Reboot" ]; then
    reboot
fi
if [ "$res" = " Shutdown" ]; then
    poweroff
fi
if [ "$res" = " Lock" ]; then
	i3lock -i /home/antoine/Documents/wallpapers/mac_os_2.png
fi
exit 0