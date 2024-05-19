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
    if [ -f "$PIDFILE" ]; then
        PID="$(cat "$PIDFILE" )"
        kill $PID
        rm "$PIDFILE"
    fi
}


case $BLOCK_BUTTON in
    1)
        kill "$(pgrep swayidle)" && (echo "󰅶 "echo; echo \#f56464;) || start_idle
        ;;
    *)
        [ -n "$(pgrep swayidle)" ] && (echo "󰾪 "; echo; echo \#ecc2fc) || (echo "󰅶 "echo; echo \#f56464;)
        ;;
esac
