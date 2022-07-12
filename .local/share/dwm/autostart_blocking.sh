#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar
polybar example --config="XDG_CONFIG_HOME/polybar/config.ini" 2>&1 | tee -a /tmp/polybar-autostart.log & disown
