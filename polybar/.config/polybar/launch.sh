#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

#for i in /sys/class/hwmon/hwmon*/temp*_input; do 
#    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
#        export HWMON_PATH="$i"
#    fi
#done
export QT_QPA_PLATFORMTHEME=qt5ct

if [ -n "$PRIMARY" ]
then
    MONITOR=$PRIMARY polybar --reload main &
    sleep 1
fi


for m in $OTHERS; do
    MONITOR=$m polybar --reload aux &
done
