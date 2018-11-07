#!/usr/bin/env bash
# winterfacing
export C=/mnt/c
export System32=$C/Windows/System32
WIN_USERNAME=$($System32/cmd.exe /c "echo %USERNAME%")
export WIN_HOME=$C/Users/$WIN_USERNAME
export CODEDIR=$WIN_HOME/Desktop
export DOTFILES=$CODEDIR/dotfiles

# colors and formatting
# export black=tput setaf 0
# export red=tput setaf 1
# export green=tput setaf 2
# export yellow=tput setaf 3
# export blue=tput setaf 4
# export magenta=tput setaf 5
# export cyan=tput setaf 6
# export white=tput setaf 7
# export black=tput setaf 8
# export dred=tput setaf 9
# export lgreen=tput setaf 10
# export orange=tput setaf 11
# export lblue=tput setaf 12
# export reset = tput sgr0

# run the bashrc since bash launch will only run .bash_profile
if [ -f $DOTFILES/.bash ]; then
  . $DOTFILES/.bash
else
  echo "Couldn't find ~/.bashrc?"
fi

# add a few more bins
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# also add the dotfiles bin directory to the PATH
# PATH="$PATH:$DOTFILES/bin"
