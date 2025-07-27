#!/bin/sh

export DESKTOP_SESSION=gnome
export XDG_CURRENT_DESKTOP=bspwm
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct
# Fix for android-studio blank windows
export _JAVA_AWT_WM_NONREPARENTING=1

# Nvidia stuff
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"

xset +fp ~/.local/share/fonts/
xset fp rehash
xrdb ~/.Xresources

# Force full rgb
# xrandr --output HDMI4 --set "Broadcast RGB" "Full"

# Setup dual monitors
# monitordetect

# Keyboard repeat rate
xset r rate 175 25
# Disable mouse acceleration
xset m 0 0

# Set mouse speed
xinput --set-prop "Logitech G403 Prodigy Gaming Mouse" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 0.0045
xinput --set-prop "Logitech USB Receiver" "libinput Accel Speed" 0
xinput --set-prop "pointer:Logitech PRO X" "libinput Accel Speed" 0
xinput --set-prop "Logitech USB Receiver" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1.2
xinput --set-prop "pointer:Logitech PRO X" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1.2

# hsetroot -tile ~/Pictures/pattern/esheresque.png &
hsetroot -root -cover ~/Pictures/wallpaper/macosmojavexwingsx1080.png

# compton freezes system with firefox/youtube/video?
# compton --backend glx --vsync opengl -C --config ~/.compton.conf &
picom --config ~/.config/picom.conf & 

xsetroot -cursor_name left_ptr &
unclutter --ignore-scrolling -b

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

sxhkd &
gentoo-pipewire-launcher &
easyeffects --gapplication-service &

exec dbus-launch --exit-with-x11 bspwm
