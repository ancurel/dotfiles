#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main &

# Watch for new mails
mailnotify &

# vpn stuff
[ -e "/tmp/vpn_fifo" ] && rm "/tmp/vpn_fifo"
mkfifo "/tmp/vpn_fifo"

if [ $(pgrep -cx openvpn) -eq 1 ] && [ -f /tmp/vpncurrent ]; then
    printf "%s\n" $(cat /tmp/vpncurrent) > "/tmp/vpn_fifo" &
fi

# Done!
echo "Polybar launched..."
