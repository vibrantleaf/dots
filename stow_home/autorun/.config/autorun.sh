#!/usr/bin/env bash

#################################
#                               #
#          AutoRun              #
#   A Quick AutoLaunch Script   #
#                               #
#################################

## Screen
$HOME/.screenlayout/layout.sh &
#redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq '.location.lat, .location.lng' | tr '\n' ':' | sed 's/:$//') &

## picom
picom --vsync --backend glx &
#compton --vsync  opengl &
nvidia-settings --assign CurrentMetaMode="CONNECTION:RESOLUTION_RATE +0+0 { ForceFullCompositionPipeline = On }" &

## Theme
xrdb $HOME/.Xresources &

## Bluetooth
bluetoothctl power on &
bluetoothctl discoverable on &
bluetoothctl pairable on &

## Wallpaper
feh --bg-fill $(cat $HOME/.config/wallpaper/wallpaperrc) &

## Audio
alsactl init &
#mpd &

## KeyBoard
numlockx on &
setxkbmap -layout us -option caps:escape &

## Notify
#dunst &

#Misc
#urxvtd &
udiskie -an &

## Tray Tools


## AppImages
# Append %U
