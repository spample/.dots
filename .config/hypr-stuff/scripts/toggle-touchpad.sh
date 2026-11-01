#!/bin/bash

DEVICE="dell0b99:00-06cb:ce81-touchpad"
STATE_FILE="/tmp/touchpad_enabled"

if [ ! -f "$STATE_FILE" ]; then
  echo "1" >"$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "1" ]; then
  hyprctl eval "device { name = $DEVICE; enabled = false; }"
  echo "0" >"$STATE_FILE"
  notify-send "Touchpad disabled"
else
  hyprctl eval "device { name = $DEVICE; enabled = true; }"
  echo "1" >"$STATE_FILE"
  notify-send "Touchpad enabled"
fi
