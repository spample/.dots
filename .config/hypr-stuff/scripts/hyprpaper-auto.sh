#!/usr/bin/env bash
# hyprpaper-auto.sh
# Automatically select the correct GPU driving each monitor

# Function to find the GPU card for a given monitor
get_gpu_for_monitor() {
  MONITOR="$1"
  for drm in /sys/class/drm/*; do
    # Check if this DRM entry is connected to the monitor
    if [[ -f "$drm/status" && "$(basename $drm)" == *"$MONITOR"* ]]; then
      # Extract card device (e.g., card0, card1)
      CARD=$(basename "$drm" | cut -d'-' -f1)
      echo "/dev/dri/$CARD"
      return
    fi
  done
}

# Set default GPU for eDP-1 (your laptop screen)
GPU=$(get_gpu_for_monitor "eDP-1")

# Fallback if detection fails
if [[ -z "$GPU" ]]; then
  GPU="/dev/dri/card0"
fi

export HYPRPAPER_DRM_DEVICE="$GPU"

# Launch Hyprpaper normally

# Wallpaper directory
DIR="$HOME/.dots/.config/hypr-stuff/wallpapers/"

# Pick random wallpapers
WALL1=$(find "$DIR" -type f | shuf -n 1)

# Create a temporary config
cat >"$CONFIG_DIR/hyprpaper.conf" <<EOF
wallpaper {
    monitor = eDP-1
    path = $WALL_EDP
    fit_mode = fill
}
# Example for external monitor:
# wallpaper {
#     monitor = HDMI-A-1
#     path = $WALL_HDMI
#     fit_mode = fill
# }
EOF

# Launch hyprpaper
hyprpaper &
