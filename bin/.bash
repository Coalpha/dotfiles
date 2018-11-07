#!/usr/bin/env bash
# shebang because I'm scared

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Nice Prompt
export PS1="\[\e[92m\]\u\[\e[35m\] in \[\e[36m\]\W \[\e[33m\]↠  \[\e[0m\]"
# It looks like this:
# User in Directory ↠

# aliases
alias ..="cd .."

# some more ls aliases
alias ll="ls -alF"
alias lsa="ls -A"
alias l="ls -CF"

# node
alias no="node --experimental-modules"
alias ns="npm start"
alias ni="npm i"
alias nd="npm i -D"

# windows
alias cmd.exe="$System32/cmd.exe"

export USER=cmd.exe /c "echo %USERNAME%"
export DOTFILES="$USER/dotfiles"

# WIN terminal aka cmd.exe? Well you're certainly not winning if you're using that
alias wincmd="$DOTFILES/wincmd.sh"
alias winvarpath="$DOTFILES/winvarpath.sh"
alias ps="$System32/WindowsPowerShell/v1.0/powershell.exe"
alias clip="wincmd clip.exe"

# default dir
if [ -e $DDIR_PATH ]; then
    cd "$(<$DDIR_PATH)"
fi

# auto sudo
alias apt-get="sudo apt-get"
alias apt="sudo apt"
alias screen="sudo screen"

# handy directories
alias home="cd $WIN_HOME"
alias cdd="cd $WIN_HOME/Desktop"
alias cds="cd $STARBOUND_PATH"
alias code="cdd && cd coalpha.github.io"

alias lose="$System32/cmd.exe"
