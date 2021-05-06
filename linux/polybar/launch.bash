#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait Until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
# echo "---" | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log
# polybar top    2>&1 | tee -a /tmp/polybar-top.log    & disown
# polybar bottom 2>&1 | tee -a /tmp/polybar-bottom.log & disown

# Use this in case the monitor names are flaky
# export MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

echo "---" | tee -a /tmp/polybar-top.log
polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
