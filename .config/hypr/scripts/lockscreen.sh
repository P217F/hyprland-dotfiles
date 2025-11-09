#!/usr/bin/sh

current_profile=$(powerprofilesctl get | tr -d '[:space:]')

powerprofilesctl set power-saver
hyprlock -c ~/.config/hypr/hyprlock.conf
powerprofilesctl set $current_profile
