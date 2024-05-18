#!/bin/sh

swayidle="$(pgrep swayidle)"

[ -z $swayidle ] && swayidle -w timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' timeout 600 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000' & || pkill swayidle

case $BLOCK_BUTTON in
    1)
        ;;
esac
