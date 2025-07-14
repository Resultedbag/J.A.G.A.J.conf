#!/bin/bash
layout=$(hyprctl devices -j | jq -r '.keyboards[]?.active_keymap' | head -n 1)
echo "{\"text\": \"$layout\"}"
