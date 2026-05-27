#!/bin/bash
if makoctl mode 2>/dev/null | grep -qx 'do-not-disturb'; then
    printf '{"text": "󰂛", "class": "dnd", "tooltip": "Do Not Disturb"}\n'
else
    printf '{"text": "󰂚", "class": "enabled", "tooltip": "Click to dismiss all"}\n'
fi
