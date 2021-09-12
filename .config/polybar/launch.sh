#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 BAR_NAME" >&2
    exit 1
fi

BAR_NAME="$1"

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Show on all monitors. Systray icons always go in the main one
xrandr | while read -r monitor status is_primary _; do
    if ! [ "$status" = "connected" ]; then
        continue
    fi

    export MONITOR="$monitor"
    if [ "$is_primary" = "primary" ]; then
        export TRAY_POS=right
    else
        export TRAY_POS=none
    fi

    polybar --log=trace --reload "$BAR_NAME" >/tmp/polybar-$monitor.log 2>&1 &
done
