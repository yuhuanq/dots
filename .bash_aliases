# aliases here

alias sudo='sudo '              # allow aliases in sudo

alias vim="vimx"
alias vi='vimx'
alias v='vimx'
alias t='tmux -2'               # force tmux to assume term supports 256colors
alias tmux='tmux -2'
alias serve='python -m SimpleHTTPServer 8000'
alias ssh='TERM=xterm-256color ssh'

alias get="sudo dnf install"
alias search="dnf search"
alias info="dnf info"
alias dnf='sudo dnf'

alias c="clear"
alias ..='cd ..'
alias ....='cd ../..'
alias cd..='cd ..'
alias mkdir='mkdir -v'          # verbose option
alias e='exit'
alias g=git
alias h='history'
alias :q='exit'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep -i --color=auto'


