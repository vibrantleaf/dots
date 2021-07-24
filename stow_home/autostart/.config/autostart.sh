#!/usr/bin/env bash
$HOME/.screenlayout/layout.sh &
nvidia-settings --assign CurrentMetaMode="CONNECTION:RESOLUTION_RATE +0+0 { ForceFullCompositionPipeline = On }" &
xrdb $HOME/.Xresources &
numlockx on &
setxkbmap -layout us -option caps:escape &
urxvtd &
#picom --vsync --backend glx &
#compton --vsync  opengl &
#dunst &
#udiskie -an &
#mpd &
#redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq '.location.lat, .location.lng' | tr '\n' ':' | sed 's/:$//') &

# Polkit
#lxsession-default &
#lxpolkit &

# Bluetooth
#bluetoothctl power on &
#bluetoothctl discoverable on &
#bluetoothctl pairable on &

# Wallpapers
#feh --bg-fill $(cat $HOME/.config/wallpaper/wallpaperrc) &

# Tray
flameshot &

#AppImages
$HOME/Applications/Nextcloud/*.AppImage
