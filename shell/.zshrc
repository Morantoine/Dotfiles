# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
	fi

autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_VI_MODE_SHOW=false

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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

alias startvpn='sudo openvpn /home/antoine/Documents/.vpn.ovpn'
alias rg='source ranger'
alias ls='ls -lH --color=auto'
alias la='ls -alH --color=auto'
alias nv='nvim'
alias vpn='sudo openvpn $HOME/.vpn'
alias ag='gcalcli agenda --details=location --details=length --details=description'
alias agw='gcalcli calw'
alias agm='gcalcli calm'
[[ -s /home/antoine/.autojump/etc/profile.d/autojump.sh ]] && source /home/antoine/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
