#!/bin/sh

SPEAKER_VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1)"

get_output()
{
    volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1 | tr -d "%" )"
    [ $volume -lt 100 ] && [ $volume -gt 65 ] && echo  "$volume  " 
    [ $volume -lt 65 ] && [ $volume -gt 35 ] && echo  "$volume  " 
    [ $volume -lt 35 ]  && echo  "$volume  " 
}

case $BLOCK_BUTTON in
    4) 
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        get_output
        ;;
    5)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        get_output
        ;;
    *)
        get_output
        ;;
# "", "", ""
