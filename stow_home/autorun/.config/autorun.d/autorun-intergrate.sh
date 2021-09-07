#!/usr/bin/bash
#sucopy="sudo /usr/bin/cp -rv"
copy="/usr/bin/cp -rv"
mkdir -p $HOME/.local/share/applications/autorun
$copy \
    $HOME/.config/autorun.d/autorun.desktop \
    $HOME/.local/share/applications/autorun/autorun.desktop
