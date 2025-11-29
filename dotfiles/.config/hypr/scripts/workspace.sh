#!/usr/bin/env bash

current=$(hyprctl activeworkspace -j | jq -r '.id')

if [ "$1" = "+" ]; then
    next=$((current + 1))
    hyprctl dispatch workspace "$next"

elif [ "$1" = "-" ]; then
    if [ "$current" -gt 1 ]; then
        prev=$((current - 1))
        hyprctl dispatch workspace "$prev"
    fi

else
    echo "Usage: $0 + | -"
    exit 1
fi
