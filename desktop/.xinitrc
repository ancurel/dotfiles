#!/bin/sh

export DESKTOP_SESSION=gnome
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct

xset +fp ~/.local/share/fonts/
xset fp rehash
xrdb ~/.Xresources

# Force full rgb
# xrandr --output HDMI4 --set "Broadcast RGB" "Full"

# Setup dual monitors
monitordetect

# Keyboard repeat rate
xset r rate 175 25
# Mouse sensitivity
xinput --set-prop "Kingsis Peripherals ZOWIE Gaming mouse" "libinput Accel Speed" -1.9
# Disable mouse acceleration
xset m 0 0

hsetroot -tile ~/Pictures/pattern/esheresque.png &
# compton freezes system with firefox/youtube/video?
#compton --backend glx --vsync opengl-swc --glx-no-stencil --xrender-sync-fence -C &
compton --backend glx --vsync opengl-swc -C &

xsetroot -cursor_name left_ptr &
unclutter --ignore-scrolling -b
sxhkd &

# -- replaced by st
# urxvtd -q -f -o &

# bspwm
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session dbus-launch --sh-syntax --exit-with-session bspwm
else
  exec bspwm
fi
