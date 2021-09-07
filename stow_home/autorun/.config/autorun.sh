#!/usr/bin/env bash

#################################
#                               #
#          AutoRun              #
#   A Quick AutoLaunch Script   #
#                               #
#################################

## Notes
# Append " > /dev/null & "
# To end of cmd line to fix some mirror issuses with interupting the script
# "> /dev/null" is optionall but it can help
# "&" is requered to stop interupts
# Also Append "%U" before "> /dev/null" and "&" for AppImages
# I don't know why but this can help with AppImage interupts

## Screen
$HOME/.screenlayout/layout.sh > /dev/null &
redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq '.location.lat, .location.lng' | tr '\n' ':' | sed 's/:$//') > /dev/null &

## picom
picom --vsync --backend glx > /dev/null &
#compton --vsync  opengl > /dev/null &
nvidia-settings --assign CurrentMetaMode="CONNECTION:RESOLUTION_RATE +0+0 { ForceFullCompositionPipeline = On }" > /dev/null &

## Theme
xrdb $HOME/.Xresources > /dev/null &

## Bluetooth
bluetoothctl power on > /dev/null &
bluetoothctl discoverable on > /dev/null &
bluetoothctl pairable on > /dev/null &

## Wallpaper
feh --bg-fill $(cat $HOME/.config/wallpaper/wallpaperrc) > /dev/null &

## Audio
# pipewire fixes
alsactl init > /dev/null &
sleep 0.5s 
systemctl --user stop pipewire-pulse > /dev/null &
systemctl --user stop pipewire > /dev/null &
systemctl --user stop pipewire-pulse > /dev/null &
#mpd > /dev/null &
#

## KeyBoard LayOut
numlockx on > /dev/null &
setxkbmap -layout us -option caps:escape  > /dev/null &

## Notify
#dunst > /dev/null &

## Misc
# for the rxvt-unicode daemon
#urxvtd > /dev/null &

# for auto mounting
udiskie -an > /dev/null & 

## Tray Tools
flameshot > /dev/null &

## AppImages
#/opt/Nextcloud/Nextcloud.AppImage --background %U > /dev/null &
