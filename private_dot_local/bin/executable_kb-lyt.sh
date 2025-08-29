#!/bin/bash

raw_layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

case "$raw_layout" in
    *"English (US)"*) layout="us" ;;
    *"Italian"*) layout="it" ;;
    *) layout="??" ;;
esac

echo "{\"text\": \"$layout\"}"

