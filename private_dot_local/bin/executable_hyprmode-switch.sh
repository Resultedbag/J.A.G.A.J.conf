#!/bin/bash

# switches between the pro mode and normal mode

CONFIG_DIR="$HOME/.config/hypr"
CURRENT_CONFIG="$CONFIG_DIR/hyprland.conf"
NORMAL_CONFIG="$CONFIG_DIR/hyprland-normal.conf"
HYPR_CONFIG="$CONFIG_DIR/hyprland-hyprmode.conf"

# Detect current config type
if cmp -s "$CURRENT_CONFIG" "$NORMAL_CONFIG"; then
    cp "$HYPR_CONFIG" "$CURRENT_CONFIG"
else
    cp "$NORMAL_CONFIG" "$CURRENT_CONFIG"
fi

# Reload Hyprland to apply changes
hyprctl reload

