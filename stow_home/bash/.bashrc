# promt
export PS1="\e[0;35m[\u\e[0;37m@\e[0;36m\H\e[0;37m \W]\$ \e[0m"

# sources
source $HOME/.sh_profile
source $HOME/.sh_aliases
source $HOME/.sh_env

# make bash look nice
clear
pfetch
printf "Welcome Julia!\n"


n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn -Rd "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

