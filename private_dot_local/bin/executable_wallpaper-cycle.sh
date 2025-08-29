#!/bin/bash

CONF_PATH="$HOME/.config/hypr/hyprpaper.conf"
WALLPAPER_DIR="$HOME/.wallpapers/static"
MONITOR=""

echo "#auto-generated config" > "$CONF_PATH"

for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
    [ -e "$img" ] || continue
    echo "preload = $img" >> "$CONF_PATH"
done

LAST_IMG=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
if [ -n "$LAST_IMG" ]; then
    echo "wallpaper = $MONITOR,$LAST_IMG" >> "$CONF_PATH"
fi

while true; do
    NEXT_IMG=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
               | grep -vF "$LAST_IMG" \
               | shuf -n 1)
    if [ -n "$NEXT_IMG" ]; then
        hyprctl hyprpaper wallpaper "$MONITOR,$NEXT_IMG"
        LAST_IMG="$NEXT_IMG"
    fi
    sleep 180
done

