#!/bin/sh

SPEAKER_VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1)"

get_output()
{
    volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1 | tr -d "%" )"
    ([ $volume -ge 100 ]  && echo  "$volume  " )||
    ([ $volume -le 100 ] && [ $volume -ge 65 ] && echo  "$volume  " )||
    ([ $volume -le 65 ] && [ $volume -ge 35 ] && echo  "$volume  " )||
    ([ $volume -le 35 ]  && echo  "$volume  " )
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
esac
# "", "", ""
