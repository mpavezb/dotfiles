#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait Until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Use this in case the monitor names are flaky
# export MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

# Launch multiple bars
# echo "---" | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log
# polybar top    2>&1 | tee -a /tmp/polybar-top.log    & disown
# polybar bottom 2>&1 | tee -a /tmp/polybar-bottom.log & disown

echo "---" | tee -a /tmp/polybar.log
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
