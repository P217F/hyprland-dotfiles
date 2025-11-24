#!/bin/bash

# Status file
STATUS_FILE="$HOME/.cache/hyprpad/status"

# Initialize status file if missing
if [ ! -f "$STATUS_FILE" ]; then
    echo "on" > "$STATUS_FILE"
fi

# Read current status
STATUS=$(cat "$STATUS_FILE")

# Get touchpad device names
TP_NAMES=$(hyprctl -j devices | jq -r '.mice[] | select(.name | test("touchpad"; "i")) | .name')

if [ -z "$TP_NAMES" ]; then
    notify-send "HyprPad" "❌ No touchpad detected"
    exit 1
fi

if [ "$STATUS" = "on" ]; then
    # Disable touchpad
    for TP in $TP_NAMES; do
        hyprctl keyword "device[$TP]:enabled" false
    done
    echo "off" > "$STATUS_FILE"
    notify-send "HyprPad" "📴 Touchpad disabled"
else
    # Enable touchpad
    for TP in $TP_NAMES; do
        hyprctl keyword "device[$TP]:enabled" true
    done
    echo "on" > "$STATUS_FILE"
    notify-send "HyprPad" "✅ Touchpad enabled"
fi
