#!/bin/dash


[ -n "$(pgrep swayidle)" ] && ( echo "󰾪 "; echo; echo \#ecc2fc ) || ( echo "󰅶 "; echo; echo \#f56464 )
