#!/bin/sh

SPEAKER_VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1)"

get_output()
{
    ismuted="$(pactl get-sink-mute @DEFAULT_SINK@)"
    volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -E -o -m 1 "[0-9][0-9][0-9]%|[0-9][0-9]%|[0-9]%" | head -1 | tr -d "%" )"
    ([ $ismuted = "Mute: yes" ] && echo "󰝟 ") ||
    ([ $volume -ge 100 ]  && echo  "$volume  " )||
    ([ $volume -le 100 ] && [ $volume -ge 65 ] && echo  "$volume  " )||
    ([ $volume -le 65 ] && [ $volume -ge 35 ] && echo  "$volume  " )||
    ([ $volume -le 35 ]  && echo  "$volume  " )
}

case $BLOCK_BUTTON in
    1)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        

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
