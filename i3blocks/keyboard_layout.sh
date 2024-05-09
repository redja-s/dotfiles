#!/bin/env bash
#Customised keyboard layout block

# Get the current keyboard layout
current_layout=$(setxkbmap -query | awk '/layout/{print $2}')

# Function to toggle keyboard layout
toggle_layout() {
    if [ "$current_layout" = "us" ]; then
        setxkbmap -layout gb
    else
        setxkbmap -layout us
    fi
}

# Check if the script was clicked
if [ "$BLOCK_BUTTON" -eq 1 ]; then
    # Left click: Open IBus application
    toggle_layout
fi

# Output current keyboard layout
echo "$current_layout"

