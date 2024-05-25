#!/bin/sh

kill $(pgrep waybar) || waybar -c $home/.config/waybar/config_sway &


