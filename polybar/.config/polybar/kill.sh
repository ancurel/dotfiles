#!/bin/bash

# Terminate already running bar instances
killall -q polybar

pkill mailnotify
pkill -f "inotify.*Mail"
