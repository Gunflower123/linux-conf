#!/bin/sh
#
# Script name: setbg.sh
# Description: Sets the system wallpaper from a specified directory with versioning
# Dependencies: xwallpaper, wal

DIRECTORY="$HOME/.config/Pictures"
# Note: Consider using REGEX-PCRE or otherwise to find the latest version?
VERSION=0

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Wallpaper directory not found: $DIRECTORY"
  exit 1
fi

# Check if no argument given
if [ -z "$1" ]; then
  echo "Usage: $0 <image_file>"
  echo "   or: $0 -r (for a random image from $wallpaper_directory)"
  echo "   or: $0 --restore (to restore the previous wallpaper)"
  exit 1
fi

# Copy image argument to wallpaper directory
if [ -f "$1" ]; then
  VERSION=$((VERSION + 1))
  VER_WALLPAPER="${VERSION}-wallpaper.png"
  sudo cp "$1" "$DIRECTORY/$VER_WALLPAPER"
  echo "Message: Wallpaper changed to $VER_WALLPAPER"
elif [ "$1" == "-r" ]; then
  #Randomly select wallpaper
  RAN_WALLPAPER="$(find "$DIRECTORY" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)"
  VERSION=$((VERSION + 1))
  VER_WALLPAPER="${VERSION}-wallpaper.png"
  sudo cp "$RAN_WALLPAPER" "$DIRECTORY/$VER_WALLPAPER"
  echo "Random wallpaper chosen: $VER_WALLPAPER"
fi


if [ "$1" == "--restore" ]; then
  # Restore the previous wallpaper by finding the latest version
  while true; do
    VER_WALLPAPER="${VERSION}-wallpaper.png"
    if [ -f "$DIRECTORY/$VER_WALLPAPER" ]; then
      sudo cp "$DIRECTORY/$VER_WALLPAPER" "$DIRECTORY/wallpaper.png"
      echo "Wallpaper restored from: $VER_WALLPAPER"
      break
    elif [ "$VERSION" -eq 0 ]; then
      echo "Error: No previous wallpaper found."
      break
    fi
    VERSION=$((VERSION - 1))
  done
  exit 0
fi

# Use Pywal if available to generate color schemes
if type wal >/dev/null 2>&1; then
  wal -c
  wal -s -i "$DIRECTORY/wallpaper.png" -o "$HOME/.config/wal/postrun"
  echo "Color scheme generated using Pywal."
fi

# Set the wallpaper using xwallpaper
xwallpaper --zoom "$DIRECTORY/$VER_WALLPAPER"
