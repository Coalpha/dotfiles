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

# windows interfacing
WIN_ROOT="/mnt/c"
WIN_USERNAME="Alf"
export WIN_HOME="$WIN_ROOT/Users/$WIN_USERNAME"
export DOTFILES_DIR="$WIN_HOME/Desktop/dotfiles"
alias home="cd $WIN_HOME"
alias cdd="home && cd Desktop"
alias code="cdd && cd coalpha.github.io"
alias clip="clip.exe"

# sync
alias sync="$DOTFILES_DIR/sync.sh $DOTFILES_DIR $WIN_HOME"

# default dir
DDIR_PATH=~/DDIR.txt
if [ -e $DDIR_PATH ]; then
    cd "$(<$DDIR_PATH)"
fi
alias ddir="$DOTFILES_DIR/ddir.sh $DDIR_PATH"

# node
alias no="node --experimental-modules"

# auto sudo
alias apt-get="sudo apt-get"
alias apt="sudo apt"
alias screen="sudo screen"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
