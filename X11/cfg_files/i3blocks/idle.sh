#!/bin/sh

swayidle="$(pgrep swayidle)"


case $BLOCK_BUTTON in
    1)
        [ -z $swayidle ] && (swayidle -w timeout 300 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' timeout 600 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000' & echo "󰅶 ") || (pkill swayidle & echo "󰾪 " )
        ;;
esac
