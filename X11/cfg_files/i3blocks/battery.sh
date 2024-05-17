#!/bin/sh

BAT_PERCENTAGE="$(acpi | grep -E -o "[0-9]%|[0-9][0-9]%|[0-9][0-9][0-9]%")"
BAT_STATUS="$(acpi | grep -E -o "Discharging|Charging")"
BAT_TIME="$(acpi | grep -E -o "[0-9][0-9]:[0-5][0-9]")"

case $BLOCK_BUTTON in
    1) echo $BAT_TIME;;

    *) echo $BAT_STATUS $BAT_PERCENTAGE 
esac
