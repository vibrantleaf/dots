#!/bin/bash
xrandr \
    --output DP-0 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output HDMI-0 --mode 1920x1080 --pos 4480x0 --rotate normal \
    --output DP-4 --mode 2560x1440 --pos 1920x0 --rotate normal  &

nvidia-settings --assign CurrentMetaMode="CONNECTION:RESOLUTION_RATE +0+0 { ForceFullCompositionPipeline = On }"

#exec tdm --xstart
exec xdm

