autoload -U colors && colors
PROMPT="%B[%F{magenta}%n%F{yellow}@%F{cyan}%M %F{white}%~]%F{green}$ %f%b"

# zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autocompletions/zsh-autocomplete.zsh 2>/dev/null
plugins=(zsh-autocompletions zsh-autosuggestions zsh-highlighting)

# tab complete
autoload -U compinit
zstyle ':completion:*' menu select
#zstyle zsh/comlist
#compint     # Include hiddenfiles
#_comp_options+=(globdots)


# key bindings
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\C-_" backward-kill-word
bindkey "\e[3;5~" kill-word
bindkey "\e\d" undo
bindkey "\e[3~" delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line


# vi mode
#bindkey -v
export KEYTIMEOUT=1
#bindkey '^e' edit-command-line

# sources
source $HOME/.zshenv
source $HOME/.zprofile
source $HOME/.zsh_aliases

# tmux
tmux source-file ~/.tmux.conf
#tmux

# make zsh look nice
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

