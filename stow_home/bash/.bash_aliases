# aliases

# basic
alias ls="ls -LA --color=auto"
alias cp="cp -uvr"
alias mv="mv -vu"
alias grep="grep --color=auto"
alias df="df -h"
alias free="free -m"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#vim/nvim
alias vim="nvim"
alias vi="nvim"
#alias vi="vim"

# dev
alias make="make -j12"


# doas/sudo
alias doas="doas -- "
alias please="sudo -- !! "
alias sudo="sudo -- "

# misc
alias vm="virt-manager"
alias proton-db-tags="proton-db-tags --check-native"
alias nnn="nnn -Rd"
alias dmenu_run="dmenu_run -l 20 -p run:"

# fun
alias ascii="asciiquarium"
alias cmatrix="cmatrix | lolcat"

# font
alias font-update="sudo fc-cache -fv"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
