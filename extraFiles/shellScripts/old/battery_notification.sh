#!/usr/bin/env bash

export DISPLAY=:0

# Set the threshold for low battery (percentage)
threshold=20

# Get the battery status
battery_status=$(acpi -b | awk -F'[,:%]' '{print $2}')

# Get the battery percentage
battery_percentage=$(acpi -b | awk -F'[,:%]' '/Battery/ {gsub(/ /,"",$3); print $3}')

# Check if the battery is below the threshold
if [ "$battery_status" != " Charging" ] && [ "$battery_percentage" -le "$threshold" ]; then
    # Send notification using dunst
    dunstify -u "C" "Low Battery" "Battery level: $battery_percentage%"
fi
