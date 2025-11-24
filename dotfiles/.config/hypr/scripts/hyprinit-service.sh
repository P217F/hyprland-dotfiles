#!/bin/bash

# Initialize touchpad status file if missing
STATUS_DIR="$HOME/.cache/hyprpad"
STATUS_FILE="$STATUS_DIR/status"
mkdir -p "$STATUS_DIR"
if [ ! -f "$STATUS_FILE" ]; then
    echo "on" > "$STATUS_FILE"
fi
