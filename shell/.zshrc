# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
	fi

# source /usr/lib/spaceship-prompt/spaceship.zsh
# SPACESHIP_VI_MODE_SHOW=false
# SPACESHIP_DOCKER_CONTEXT_SHOW=false
# SPACESHIP_PROMPT_ASYNC=false

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

export HIGHLIGHT_STYLE=dracula
export KEYTIMEOUT=1
export EDITOR=nvim
export fpath=(~/.zsh $fpath)
export PATH=$HOME/.local/bin:$PATH
export PYTHONPATH=$HOME/Documents/mes_modules:$PYTHONPATH
export PATH=$PATH:$AVISPA_PACKAGE
export BAT_THEME="Dracula"
export ZDOTDIR=$HOME/.config/zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8987"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

alias yay='paru'
alias music='ncmpcpp'
alias ssh="kitty +kitten ssh"
alias pdfjoin='pdfjam --fitpaper true --rotateoversize false --suffix joined'
alias startvpn='sudo openvpn /home/antoine/Documents/.vpn.ovpn'
alias dualscreen="/home/antoine/.config/i3/dualscreen.sh"
alias rg='source ranger'
alias ls='ls -lH --color=auto --ignore=lost+found'
alias la='ls -alH --color=auto --ignore=lost+found'
alias vv='nvim'
alias vpn='sudo openvpn $HOME/.vpn'
alias ag='gcalcli agenda --details=location --details=length --details=description'
alias icat="kitty +kitten icat"
[[ -s /home/antoine/.autojump/etc/profile.d/autojump.sh ]] && source /home/antoine/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

eval "$(starship init zsh)"
