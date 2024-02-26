#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/material"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
echo "---" | tee -a /tmp/main.log
polybar main -c "$DIR"/config.ini 2>&1 | tee -a /tmp/main.polybar.log & disown
polybar secondary -c "$DIR"/config.ini 2>&1 | tee -a /tmp/secondary.polybar.log & disown
