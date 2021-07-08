export PATH=$HOME/.bin:/usr/local/bin:$HOME/.local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export ZSH="/home/julia/.oh-my-zsh"
export ARCHFLAGS="-arch x86_64"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="alanpeabody"

CASE_SENSITIVE="true"

HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT="true"

# export UPDATE_ZSH_DAYS=13

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git
    rails
    ruby
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
#    zsh-url-quote-magic
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags

source $HOME/{.sh_aliases,sh_env,.sh_profile}
