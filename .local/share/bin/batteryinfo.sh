#!/bin/bash


# Check if the system is on battery power
POWER_STATUS=$(cat /sys/class/power_supply/ADP0/online)

if [ "$POWER_STATUS" -eq 0 ]; then

	# Get the battery percentage
	BATTERY_PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)

	# Get the current date and time
	TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

	# Save the battery percentage to a file
	echo "$TIMESTAMP: $BATTERY_PERCENT%" >> ~/Misc/battery_log.txt
fi
