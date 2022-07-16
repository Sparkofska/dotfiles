#!/bin/bash

################################################################################
# This script checks the battery level periodically and shows a warning
# notification on low battery percentage.
# depends on:
#   acpi
################################################################################

# show warnings on these battery percentage levels
DANGER_PERCENT=20
CRITICAL_PERCENT=10

# time interval between checks in minutes
SLEEP_TIME=5

while [ true ]; do

    BATTINFO=`acpi -b`

    if [[ -n $(acpi -b | grep -i discharging) ]]; then
        rem_bat=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")

        if [[ $rem_bat -gt $DANGER_PERCENT ]]; then
            echo ' ' # noop
            #DISPLAY=:0.0 /usr/bin/notify-send "Battery safe" "This notification can be removed as soon as the script is verified working\n $BATTINFO"
        else
            if [[ $rem_bat -le $DANGER_PERCENT ]]; then
                DISPLAY=:0.0 /usr/bin/notify-send "Battery Low" "$BATTINFO"
            fi
            if [[ $rem_bat -le $CRITICAL_PERCENT ]]; then
                DISPLAY=:0.0 /usr/bin/notify-send "Battery Critical" "$BATTINFO"
            fi
        fi
    else
        echo ' ' # noop
        #DISPLAY=:0.0 /usr/bin/notify-send "Battery Charging" "$BATTINFO"
    fi

    sleep ${SLEEP_TIME}m

done
