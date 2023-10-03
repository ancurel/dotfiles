#!/bin/bash

# Terminate already running bar instances
killall -q polybar

pkill mailnotify
pkill -f "inotify.*Mail"

for d in `bspc query -D -m 1`; do
  bspc config -d $d bottom_padding 0 
  bspc config -d $d top_padding 0 
  bspc config -d $d left_padding 0 
  bspc config -d $d right_padding 0
done

# vim: set syntax=bash ts=2 sw=2
