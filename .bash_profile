#!/usr/bin/env bash
# winterfacing
export C=/mnt/c
export ms_home=$(wslpath "$(cmd.exe /C "echo|set /p=%userprofile%")")
export dotfiles=$ms_home/Desktop/dotfiles
export df=$dotfiles

# colors and formatting
export black=$(tput setaf 0)
export red=$(tput setaf 1)
export green=$(tput setaf 2)
export yellow=$(tput setaf 3)
export blue=$(tput setaf 4)
export magenta=$(tput setaf 5)
export cyan=$(tput setaf 6)
export white=$(tput setaf 7)
export black=$(tput setaf 8)
export lgreen=$(tput setaf 10)
export orange=$(tput setaf 11)
export lblue=$(tput setaf 12)
export reset=$(tput sgr0)

# add a few more bins
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/graalvm/bin" ]; then
  PATH+=":$HOME/graalvm/bin"
fi
PATH+=":$df/bin:/home/linuxbrew/.linuxbrew/bin"
# run the bashrc since bash launch will only run .bash_profile
if [ -f "$df"/.bash ]; then
  . "$df"/.bash
else
  echo "Couldn't find ~/.bashrc?"
fi
