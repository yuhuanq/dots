# Path to your oh-my-zsh installation.
export ZSH=/home/yqiu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell_lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search zsh-autosuggestions)
# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


################################################################################
#                                 Custom below                                 #
################################################################################

#export OPAMEXTERNALSOLVER="cudf_remote_proxy %{input}% %{output}% %{criteria}%"
#export OPAMEXTERNALSOLVER="java -jar /home/yqiu/sources/p2Cudf.jar -obj %{criteria}% %{input}% %{output}%."
# eval $(opam config env)
# . /home/yqiu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# eval $(opam config env)

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"

# uncomment if using gruvbox colorscheme
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM=tmux-256color
export TZ=America/Chicago

# vi-mode custom
# bindkey -M viins 'jj' vi-cmd-mode
bindkey 'jj' vi-cmd-mode
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# bindkey '\H:beginning-of-line'
#
# bindkey 'H' beginning-of-line  ;;; prob in insert mode
# bindkey 'L' end-of-line

# bindkey 'H' 0
# bindkey 'L' $
# export KEYTIMEOUT=1 #reduce delay after hitting <ESC>

db=$HOME/workspace/eclipse-projects/DB_proj1/

OCAMLFIND_CONF=~/.opam/system/lib/findlib.conf

##############################
#  aliases and other custom  #
##############################

alias sudo='sudo '              # allow aliases in sudo

alias vim="vim"
alias vi='vim'
alias v='vim'
alias t='tmux -2'               # force tmux to assume term supports 256colors
alias tmux='tmux -2'
alias serve='python -m SimpleHTTPServer 8000'
# alias ssh='TERM=xterm-256color ssh'
# alias python = '/home/yqiu/workspace/big-red-hacks/env/bin/python'
# alias pip = '/home/yqiu/workspace/big-red-hacks/env/bin/pip'
# pip() { #   if [ "$1" = "install" -o "$1" = "bundle" ]; then
#     cmd="$1"
#     shift
#     /usr/bin/pip $cmd --user $@
#   else
#     /usr/bin/pip $@
#   fi
# }

alias get="sudo dnf install"
alias search="dnf search"
alias info="dnf info"
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
alias szsh='source ~/.zshrc'
alias rmv='mv -t /home/yqiu/Trash'
#alias lc='cd ~/Cornell/interview/leetcode'
alias leet='cd Cornell/interview/leetcode'
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
alias algo='cd $HOME/Cornell/algo'
alias info='cd $HOME/Cornell/3300'
alias systems='cd $HOME/Cornell/3410-spr17'
alias orie='cd $HOME/Cornell/orie'
alias interview='cd $HOME/Cornell/interview'
alias epi='nohup evince $HOME/Cornell/interview/epi_java.pdf </dev/null &>/dev/null &'
alias resume='cd $HOME/Cornell/resume'
alias md5='md5sum'
alias research='cd $HOME/Cornell/research'
#alias opam='opam --use-internal-solver'
lc(){
    leetcode "$@"
}

func=~/workplace/CS3110
custom=$ZSH/custom/custom.zsh
i3=~/.config/i3/config
#eval `opam config env`

# alias ytdl='youtube-dl --extract-audio --audio-quality 0 --audio-format best'
alias cc='cd /home/yqiu/Cornell'
# cd() { #     if [[ $@ == "c" ]]; then #         command cd /home/yqiu/Cornell
#     else
#         command cd "$@"
#     fi
# }
#

# disable X11 forwarding and enable compression for ssh sessions
# alias ssh='TERM=xterm-256color ssh -x -C'
alias ssh='TERM=xterm-256color ssh'



xwas=/home/yqiu/Cornell/research/xwas

source /usr/bin/virtualenvwrapper.sh
hr=$HOME/Cornell/hackerrank/

alias 3='cd /home/yqiu/Cornell/3110_collab/'


# PATH=$PATH:/usr/lib/postgresql/{version}/bin
# export PATH

#uncomment below
# export PATH=$PATH:/usr/bin/javac

################
#  3410 stuff  #
################

export PATH=${PATH}:/home/yqiu/Cornell/3410-spr17/individual-3410/p4/mipsel-linux/bin:/home/yqiu/Cornell/3410-spr17/individual-3410/p4/mips-sim/bin
export NETID=yq56

# export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-7.b14.fc24.x86_64
# uncomment below
# export JAVA_HOME=/usr/java/jdk1.8.0_171
# export JAVA_HOME=/usr/java/jdk1.8.0_144/jre/
# export JAVA_HOME=/usr/java/jdk-9.0.4
SCALA_HOME=/usr/bin/scala
#uncomment below
export PATH=$JAVA_HOME/bin:$SCALA_HOME:${PATH}:/home/yqiu/sources/activator-dist-1.3.12/bin

# alias emacs="emacs -nw"

export CAMOMILE_DIR=$HOME/.opam/4.05.0/share/camomile


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/yqiu/sources/google-cloud-sdk/path.zsh.inc' ]; then source '/home/yqiu/sources/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/yqiu/sources/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/yqiu/sources/google-cloud-sdk/completion.zsh.inc'; fi
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin


source ~/.autoenv/activate.sh
source ~/.oh-my-zsh/custom/secrets.zsh

xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x7e = Control_R'
xmodmap -e 'add Control = Control_R'

