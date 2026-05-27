#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -printf "%f\n" |
  wofi --conf="$HOME/.config/wofi/wallpaper.conf")
if [ -n "$SELECTED" ]; then
  awww img "$WALLPAPER_DIR/$SELECTED" --transition-type any --transition-fps 60 --transition-duration 2
  sleep 0.5
  wal -n -i "$WALLPAPER_DIR/$SELECTED"

  # Inject pywal colors into ghostty config between markers
  COLORS=$(cat ~/.cache/wal/colors-ghostty.conf)
  GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
  # Remove old color block
  sed -i '/# PYWAL_COLORS_START/,/# PYWAL_COLORS_END/d' "$GHOSTTY_CONFIG"
  # Append new color block
  printf '\n# PYWAL_COLORS_START\n%s\n# PYWAL_COLORS_END\n' "$COLORS" >>"$GHOSTTY_CONFIG"

  cp ~/.cache/wal/colors-mako ~/.config/mako/config
  makoctl reload
  pkill waybar
  nohup waybar >/dev/null 2>&1 &
  # Apply new wal colors to all running tmux panes
  SEQUENCES=$(cat ~/.cache/wal/sequences | perl -pe 's/\x1b\]11;[^\x1b]*\x1b\\//g')
  for tty in $(tmux list-panes -a -F '#{pane_tty}' 2>/dev/null); do
    printf '%s' "$SEQUENCES" >"$tty" 2>/dev/null
  done
  # Notify all running nvim instances to reload colors
  for sock in /run/user/$(id -u)/nvim.*.0 /tmp/nvim*/0; do
    [ -S "$sock" ] && nvim --server "$sock" --remote-send '<Cmd>colorscheme pywal16<CR>' 2>/dev/null &
  done
fi
