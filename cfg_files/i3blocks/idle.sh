#!/bin/sh

PIDFILE="/tmp/swayidle"
pgrep swayidle > "$PIDFILE"

start_idle()
{
    swayidle -w \
    timeout 300 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
    timeout 600 'swaylock -f -c 000000' \
    before-sleep 'swaylock -f -c 000000' &
    echo "󰾪 "
    echo
    echo \#ecc2fc
}

stop_idle()
{
    pkill swayidle
    echo "󰅶 " 
    echo
    echo \#f56464
}


case $BLOCK_BUTTON in
    1)
        if [ -n "$(pgrep swayidle)" ]; then
            stop_idle
        else
            start_idle
        fi
        ;;
    *)
        if [ -n "$(pgrep swayidle)" ]; then
            echo "󰅶 " 
            echo
            echo \#f56464
        else
            echo "󰾪 "
            echo
            echo \#ecc2fc
        fi
        ;;
esac
