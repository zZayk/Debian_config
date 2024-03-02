#!/bin/bash

# Define the brightness file
brightness_file="/sys/class/backlight/intel_backlight/brightness"

# Read the current brightness value
current_brightness=$(cat $brightness_file)

# Define the step size for brightness adjustment
step=500

if [ "$1" == "increase" ]; then
    # Increase the brightness
    new_brightness=$((current_brightness + step))
elif [ "$1" == "decrease" ]; then
    # Decrease the brightness
    new_brightness=$((current_brightness - step))
else
    echo "Usage: $0 [increase|decrease]"
    exit 1
fi

# Ensure the brightness value is within a valid range
if [ $new_brightness -lt 0 ]; then
    new_brightness=0
fi

# Update the brightness
echo $new_brightness > $brightness_file

