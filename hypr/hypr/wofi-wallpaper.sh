#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -printf "%f\n" |
  wofi --conf="$HOME/.config/wofi/wallpaper.conf")

if [ -n "$SELECTED" ]; then
  # Use your existing wal-swww function
  source "$HOME/.zshrc"
  wal-swww "$WALLPAPER_DIR/$SELECTED"
fi
