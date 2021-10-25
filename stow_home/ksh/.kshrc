source $HOME/.sh_aliases
source $HOME/.sh_profile
#source $HOME/.sh_env



export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
HISTFILE=$HOME/.cache/sh/history
HISTSIZE=20000
PS1="$(echo -e "\033[34m~ \033[00m")"

# Make KSH Look nicer

pfetch
