#!/usr/bin/env bash
# shebang because I'm scared

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# welcome to the shop(t), I gotta make monet somehow
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
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
export PS1="\[$red\]\u\[$black\] in \[$lblue\]\W \[$cyan\]↠  \[$reset\]"
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

# I seem to have trouble typing "yoruvue-dl"
alias ytdl="youtube-dl"
alias scdl="youtube-dl --embed-thumbnail"

# windows
alias ohno="cmd.exe /C"
alias clip="clip.exe"

# d
alias dmd="dmd.exe"
alias rdmd="rdmd.exe"

# default dir
. ddir login

# auto sudo
alias apt="sudo apt"
alias screen="sudo screen"

# handy directories
alias home="cd $ms_home"
alias cdd="cd $ms_home/Desktop"
# alias cds="cd $STARBOUND_PATH"
alias code="cdd && cd coalpha.github.io"

# wtf_ga
alias wtf_ga="wtf_ja"
