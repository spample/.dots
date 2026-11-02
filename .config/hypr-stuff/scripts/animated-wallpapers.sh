#!/bin/bash

DIR="$HOME/.config/hypr-stuff/wallpapers/animated/"
# 600 sec = 10min
INTERVAL=600
SOCKET="/tmp/mpvsocket"

apply_theme() {
    # Extract the first frame to a temporary static image
    ffmpeg -y -i "$1" -vframes 1 -q:v 2 /tmp/wall_frame.jpg -loglevel quiet
    # Generate the Pywal color palette silently without setting a wallpaper (-n)
    wal -i /tmp/wall_frame.jpg -n -q
    # Tell Waybar to instantly reload its CSS
    killall -SIGUSR2 waybar
}

# Start the very first wallpaper
WALLPAPER=$(find "$DIR" -type f \( -iname "*.mp4" -o -iname "*.webm" -o -iname "*.gif" \) | shuf -n 1)

if [ -n "$WALLPAPER" ]; then
    killall mpvpaper 2>/dev/null
    apply_theme "$WALLPAPER"
    mpvpaper -o "no-audio --loop-file --panscan=1 --input-ipc-server=$SOCKET" ALL "$WALLPAPER" &
fi

while true; do
    sleep $INTERVAL

    NEW_WALLPAPER=$(find "$DIR" -type f \( -iname "*.mp4" -o -iname "*.webm" -o -iname "*.gif" \) | shuf -n 1)

    if [ -n "$NEW_WALLPAPER" ]; then
        apply_theme "$NEW_WALLPAPER"
        echo '{ "command": ["loadfile", "'"$NEW_WALLPAPER"'"] }' | socat - "$SOCKET"
    fi
done
