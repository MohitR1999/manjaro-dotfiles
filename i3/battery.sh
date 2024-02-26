#!/bin/bash

# Set the battery threshold (in percentage)
threshold=25

while true; do
    # Get the current battery level
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Check if the battery level is below the threshold
    if [ "$battery_level" -lt "$threshold" ]; then
        # Send a notification
        dunstify "Battery Low" "Battery level is ${battery_level}%" -u critical
    fi

    # Sleep for 5 minutes before checking again
    sleep 60
done
