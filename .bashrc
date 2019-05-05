# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#export TERM=xterm-256color
#export TERM=tmux-256color

export EDITOR=vimx

export OPAMEXTERNALSOLVER="cudf_remote_proxy %{input}% %{output}% %{criteria}%"


eval $(opam config env)

# custom prompt green='\e[0;32m'
GREEN='\e[0;32m'
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'
#if [ $(id -u) -eq 0 ];
#then
#    PS1="┌${RED}[\u]${NC} [\h]$ps1_informer:\[\e[0;32;49m\]\w\[\e[0m \n└> "
#else
#    PS1="┌[${GREEN}\u${NC}] [\h]$ps1_informer:\[\e[0;32;49m\]\w\[\e[0m \n└> "
#fi

# lambda prompt
PS1="  \[\e[1;31m\]λ \W \[\e[0m\]"

PATH="$HOME/bin:$PATH"

# uncomment if using gruvbox colorscheme
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

