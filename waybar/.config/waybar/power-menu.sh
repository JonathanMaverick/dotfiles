#!/bin/bash
options="󰐥 Shutdown\n󰜉 Reboot\n󰍁 Logout\n󰒲 Suspend"
chosen=$(echo -e "$options" | wofi --dmenu --prompt "Power" --width 200 --lines 4)
case "$chosen" in
    "󰐥 Shutdown") systemctl poweroff ;;
    "󰜉 Reboot") systemctl reboot ;;
    "󰍁 Logout") hyprctl dispatch exit 0 ;;
    "󰒲 Suspend") systemctl suspend ;;
esac
