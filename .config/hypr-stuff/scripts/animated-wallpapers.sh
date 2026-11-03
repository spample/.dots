#!/bin/bash

# Function to generate Pywal colors and apply them to the system
apply_theme() {
    local image_path=$1
    # Generate the Pywal color scheme quietly without changing the wallpaper
    wal -i "$image_path" -n -q
    
    killall -SIGUSR2 waybar
    hyprctl reload > /dev/null 2>&1
}

BAT_CAPACITY=$(cat /sys/class/power_supply/BAT*/capacity | head -n 1)
BAT_STATUS=$(cat /sys/class/power_supply/BAT*/status | head -n 1)

# Check if battery is 50% or lower AND we are not plugged into the wall
if [ "$BAT_CAPACITY" -le 50 ] && [ "$BAT_STATUS" = "Discharging" ]; then
    
    # Pick Static Wallpaper
    NEXT_WALL=$(ls ~/.config/hypr-stuff/wallpapers/static/* | shuf -n 1)
    cp "$NEXT_WALL" /tmp/wall_frame.jpg
    killall -q mpvpaper swaybg mpvpaper-stop
    
    # Display Static Wallpaper
    swaybg -i "$NEXT_WALL" -m fill &
else
    
    # Pick Animated Wallpaper
    NEXT_WALL=$(ls ~/.config/hypr-stuff/wallpapers/animated/* | shuf -n 1)
    
    # Extract a single frame to /tmp for Pywal
    ffmpeg -y -i "$NEXT_WALL" -vframes 1 -q:v 2 /tmp/wall_frame.jpg -loglevel quiet
    
    killall -q mpvpaper swaybg mpvpaper-stop
    
    # Play Video
    mpvpaper -o "no-audio --loop-file --panscan=1 --input-ipc-server=/tmp/mpvsocket" ALL "$NEXT_WALL" &

    sleep 0.5
    mpvpaper-stop --fork
fi

# Apply the theme using the /tmp file we prepared
apply_theme "/tmp/wall_frame.jpg"
