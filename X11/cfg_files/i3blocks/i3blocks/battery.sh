#!/bin/sh

BAT_PERCENTAGE="$(acpi | grep -E -o "[0-9]%|[0-9][0-9]%|[0-9][0-9][0-9]%" )"
BAT_STATUS="$(acpi | grep -E -o "Discharging|Charging")"
BAT_TIME="$(acpi | grep -E -o "[0-9][0-9]:[0-5][0-9]")"

on_bat()
{
    batlevel="$(acpi | grep -E -o "[0-9]%|[0-9][0-9]%|[0-9][0-9][0-9]%" | tr -d "%")"

    ([ $batlevel -lt 20 ]  && echo "$BAT_PERCENTAGE " )||
    ([ $batlevel -lt 40 ] && [ $batlevel -gt 20 ] && echo "$BAT_PERCENTAGE  " ) ||
    ([ $batlevel -lt 60 ] && [ $batlevel -gt 40 ] && echo "$BAT_PERCENTAGE  " ) ||
    ([ $batlevel -lt 80 ] && [ $batlevel -gt 60 ] && echo "$BAT_PERCENTAGE  " ) ||
    ([ $batlevel -lt 90 ] && [ $batlevel -gt 80 ] && echo "$BAT_PERCENTAGE  " ) 
}



case $BLOCK_BUTTON in
    1) 
        echo $BAT_TIME
        ;;

    *)
        [ $BAT_STATUS = "Discharging" ] && on_bat || echo " $BAT_PERCENTAGE" 
        
        ;;
esac

