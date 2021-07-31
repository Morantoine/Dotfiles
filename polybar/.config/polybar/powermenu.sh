#!/bin/bash

res=$(echo ' Shutdown| Reboot| Lock| Logout'| rofi -location 5 -yoffset -30 -xoffset 360 -font "hack bold 14"  -sep "|" -theme slate -no-fixed-num-lines -dmenu -p 'Power     ')

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
    light-locker-command -l
fi
exit 0
