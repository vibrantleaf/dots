#!/usr/bin/env bash

# xrandr
$HOME/.screenlayout/layout.sh &

# fix screen tairing
nvidia-settings --assign CurrentMetaMode="CONNECTION:RESOLUTION_RATE +0+0 { ForceFullCompositionPipeline = On }" &

# xrdb
xrdb $HOME/.Xresources &

# numlock
numlockx on &

# keyboard layout
setxkbmap -layout us -option caps:escape &

# bluetooth
bluetoothctl power on &
bluetoothctl discoverable on &
bluetoothctl pairable on &

# compisitor
picom --vsync --backend glx &

# notifason daemon
dunst &

# auto disk mounter
udiskie -an &

# urxvt daemon
urxvtd &

# polkit
lxsession &

# auto color shifter
killall -9 redshift ; sleep 0.5s ; redshift &

# music player daemon
mpd &

# tray
timeout 20s trayer --edge top --align right --expand true --width 3 --height 20 --monitor primary &

# "bar"
notify-send -a PC_INFO -u normal "$(/home/julia/.bin/info)" &

# tray tools
$HOME/Applications/Nextcloud.AppImage &
blueberry-tray &
flameshot &

# wallpaper
feh --bg-fill $(cat $HOME/.config/wallpaper/wallpaperrc) &
