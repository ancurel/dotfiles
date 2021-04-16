#!/bin/sh

export DESKTOP_SESSION=gnome
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct
# export MOZ_X11_EGL=1
# Fix for android-studio blank windows
export _JAVA_AWT_WM_NONREPARENTING=1

xset +fp ~/.local/share/fonts/
xset fp rehash
xrdb ~/.Xresources

# Force full rgb
# xrandr --output HDMI4 --set "Broadcast RGB" "Full"

# Setup dual monitors
monitordetect

# Keyboard repeat rate
xset r rate 175 25
# Disable mouse acceleration
xset m 0 0

hsetroot -tile ~/Pictures/pattern/esheresque.png &
# compton freezes system with firefox/youtube/video?
# compton --backend glx --vsync opengl -C --config ~/.compton.conf &
picom --config ~/.compton.conf --experimental-backends --backend=glx --vsync &

xsetroot -cursor_name left_ptr &
unclutter --ignore-scrolling -b
pulseeffects --gapplication-service &

# -- replaced by st
# urxvtd -q -f -o &

sxhkd &
exec dbus-launch --exit-with-session bspwm

