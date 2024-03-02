#!/bin/bash

# Function to display the current volume
show_volume() {
    amixer -D pulse get Master | grep -oP '\d+%' | head -1
}

# Increase the volume
increase_volume() {
    amixer -D pulse set Master 5%+ unmute
}

# Decrease the volume
decrease_volume() {
    amixer -D pulse set Master 5%- unmute
}

# Toggle mute/unmute
toggle_mute() {
    amixer -D pulse set Master toggle
}

# Check the number of command-line arguments
if [ $# -ne 1 ]; then
    #echo "Usage: $0 [increase|decrease|toggle]"
    exit 1
fi

# Determine the action based on the argument
case "$1" in
    "increase")
        increase_volume
        ;;
    "decrease")
        decrease_volume
        ;;
    "toggle")
        toggle_mute
        ;;
    *)
	#echo "Unknown action: $1 (use 'increase', 'decrease', or 'toggle')"
        exit 1
        ;;
esac

# Show the updated volume
show_volume

