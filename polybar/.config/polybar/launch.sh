#!/bin/bash

# CONFIG=config
CONFIG=config_transparent

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using specific config file 
polybar -c $XDG_CONFIG_HOME/polybar/$CONFIG main &

# Watch for new mails
mailnotify &

# Standard 1 monitor
bspc config -m $(bspc query -M) top_padding 22 

# Bspwm paddings based on config
# case $CONFIG in
#   config_transparent)
#     $XDG_CONFIG_HOME/polybar/padmonocle.sh &
#     ;;
#
#   config)
#     bspc config -m 1 top_padding 18 
#     ;;
# esac

# Done!
echo "Polybar launched..."


# vim: set syntax=bash ts=2 sw=2
