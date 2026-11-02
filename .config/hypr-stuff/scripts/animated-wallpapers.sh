#!/bin/bash

DIR="$HOME/.config/hypr-stuff/wallpapers/animated/"
INTERVAL=600
SOCKET="/tmp/mpvsocket"
STATE_FILE="/tmp/wallpaper_state"

# 1. Handle manual triggers from your keybinds
if [[ "$1" == "next" || "$1" == "prev" ]]; then
    echo "$1" > "$STATE_FILE"
    # Send a signal to wake the daemon up from its 10-minute sleep
    pkill -SIGUSR1 -f "animated-wallpapers.sh daemon"
    exit 0
fi

# Enforce the daemon argument for the main background loop
if [[ "$1" != "daemon" ]]; then
    echo "Error: Must be run with 'daemon', 'next', or 'prev'."
    exit 1
fi

# 2. Daemon Initialization
shopt -s nullglob nocaseglob
# Load all animations into a sequential array
WALLPAPERS=("$DIR"/*.{mp4,webm,gif})
TOTAL=${#WALLPAPERS[@]}
CURRENT_INDEX=0

if [ "$TOTAL" -eq 0 ]; then exit 1; fi

apply_theme() {
    ffmpeg -y -i "$1" -vframes 1 -q:v 2 /tmp/wall_frame.jpg -loglevel quiet
    wal -i /tmp/wall_frame.jpg -n -q
    killall -SIGUSR2 waybar
}

# Trap the manual signal to instantly kill the background sleep timer
trap 'pkill -P $$ sleep' SIGUSR1

killall mpvpaper 2>/dev/null
apply_theme "${WALLPAPERS[$CURRENT_INDEX]}"
mpvpaper -o "no-audio --loop-file --panscan=1 --input-ipc-server=$SOCKET" ALL "${WALLPAPERS[$CURRENT_INDEX]}" &

# 3. Main Loop
while true; do
    # Default action is moving forward automatically
    echo "next" > "$STATE_FILE"
    
    # Sleep in the background so the trap can interrupt it
    sleep $INTERVAL &
    wait $!

    # Check if we were woken up by a manual bind or a natural timeout
    ACTION=$(cat "$STATE_FILE" 2>/dev/null)

    if [[ "$ACTION" == "prev" ]]; then
        # Wrap around backwards
        CURRENT_INDEX=$(( (CURRENT_INDEX - 1 + TOTAL) % TOTAL ))
    else
        # Wrap around forwards
        CURRENT_INDEX=$(( (CURRENT_INDEX + 1) % TOTAL ))
    fi

    NEW_WALLPAPER="${WALLPAPERS[$CURRENT_INDEX]}"
    apply_theme "$NEW_WALLPAPER"
    echo '{ "command": ["loadfile", "'"$NEW_WALLPAPER"'"] }' | socat - "$SOCKET"
done
