#!/bin/bash

DIR="$HOME/.config/hypr-stuff/wallpapers/animated/"
INTERVAL=10
SOCKET="/tmp/mpvsocket"

# Start the very first wallpaper and open the IPC socket
WALLPAPER=$(find "$DIR" -type f \( -iname "*.mp4" -o -iname "*.webm" -o -iname "*.gif" \) | shuf -n 1)

if [ -n "$WALLPAPER" ]; then
    killall mpvpaper 2>/dev/null
    mpvpaper -o "no-audio --loop-file --panscan=1 --input-ipc-server=$SOCKET" ALL "$WALLPAPER" &
fi

while true; do
    # Wait the 10 minutes
    sleep $INTERVAL

    # Pick the next random wallpaper
    NEW_WALLPAPER=$(find "$DIR" -type f \( -iname "*.mp4" -o -iname "*.webm" -o -iname "*.gif" \) | shuf -n 1)

    if [ -n "$NEW_WALLPAPER" ]; then
        # Tell the running mpvpaper instance to instantly swap to the new file
        echo '{ "command": ["loadfile", "'"$NEW_WALLPAPER"'"] }' | socat - "$SOCKET"
    fi
done
