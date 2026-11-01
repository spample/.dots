#!/bin/bash

TP_DEVICE="asuf1209:00-2808:0219-touchpad"
MOUSE_DEVICE="asuf1209:00-2808:0219-mouse"
STATE_FILE="/tmp/touchpad_enabled"

# Assume enabled on first run
if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "1" ]; then
    hyprctl eval "hl.device({ name = '$TP_DEVICE', enabled = false })"
    hyprctl eval "hl.device({ name = '$MOUSE_DEVICE', enabled = false })"
    echo "0" > "$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "Disabled"
else
    hyprctl eval "hl.device({ name = '$TP_DEVICE', enabled = true })"
    hyprctl eval "hl.device({ name = '$MOUSE_DEVICE', enabled = true })"
    echo "1" > "$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "Enabled"
fi
