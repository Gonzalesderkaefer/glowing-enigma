#!/bin/sh

PIDFILE="/tmp/swayidle"
pgrep swayidle > "$PIDFILE"

start_idle()
{
    swayidle -w \
    timeout 300 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
    timeout 600 'swaylock -f -c 000000' \
    before-sleep 'swaylock -f -c 000000' &
    echo $! > "$PIDFILE"
}

stop_idle()
{
    if [ -f "$PIDFILE" ]; then
        PID="$(cat "$PIDFILE" )"
        kill $PID
        rm "$PIDFILE"
    fi
}


case $BLOCK_BUTTON in
    1)
        [ -f "$PIDFILE" ] && (stop_idle; echo "󰾪 ") || (start_idle; echo "󰅶 ")
    *)
        [ -f "$PIDFILE" ] && (echo "󰅶 ") || (echo "󰾪 ")
esac
