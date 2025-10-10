#!/bin/zsh

# Wallpaper directory
DIR="$HOME/.dots/.config/hypr-stuff/wallpapers/"

# Pick random wallpapers
WALL1=$(find "$DIR" -type f | shuf -n 1)

# Create a temporary config
cat > ~/.config/hypr/hyprpaper.conf <<EOF
preload = $WALL1
wallpaper = eDP-1,$WALL1
EOF

# Launch hyprpaper
hyprpaper &

