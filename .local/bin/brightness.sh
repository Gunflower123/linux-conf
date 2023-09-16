#!/bin/bash
#
# Script name: brightness.sh
# Description:This script allows you to adjust screen brightness using xrandr.
# Dependencies: xrandr

# Define your display name. (Usage: xrandr --listmonitors)
display="eDP1"

# Save current brightness value
current_brightness=$(xrandr --verbose --current | grep -m 1 -i brightness | awk '{print $2}')

# Define brightness limits
min_brightness=0.1
max_brightness=1.0

# Check the first argument (up or down)
if [ "$1" == "up" ] && (( $(echo "$current_brightness < $max_brightness" | bc) )); then
    # Increase brightness by the specified value
    new_brightness=$(echo "$current_brightness + $2" | bc)
elif [ "$1" == "down" ] && (( $(echo "$current_brightness > $min_brightness" | bc) )); then
    # Decrease brightness by the specified value
    new_brightness=$(echo "$current_brightness - $2" | bc)
else
    echo "Brightness at limit"
fi

# Set new brightness value
xrandr --output $display --brightness $new_brightness
