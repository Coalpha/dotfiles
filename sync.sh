#!/bin/bash
reset=`tput sgr0`
blue=`tput setaf 4`
yellow=`tput setaf 11`
# Color declarations
home_bashrc="$(realpath ~/.bashrc)"
home_profile="$(realpath ~/.profile)"
etc_env="/etc/environment"
etc_apt_sources="/etc/apt/sources.list"
winhome_hyper="$2/.hyper.js"
appdata_vscode_settings="$2/AppData/Roaming/Code/User/settings.json"

copy_bashrc="$1/.bashrc"
copy_profile="$1/.profile"
copy_env="$1/environment"
copy_apt_sources="$1/sources.list"
copy_hyper="$1/.hyper.js"
copy_vscode_settings="$1/settings.json"

left="$yellow<==$reset"
right="$blue==>$reset"
do_output () {
  printf "%14s %s\n" $1 "Copy $a Source"
  echo
}
echo
echo "WINHOME: $2"
echo "DOTFILES: $1"
if [ $home_bashrc -nt $copy_bashrc ]; then
  cat $home_bashrc > $copy_bashrc
  a=$left
else
  cat $copy_bashrc > $home_bashrc
  a=$right
fi
do_output .bashrc
if [ $home_profile -nt $copy_profile ]; then
  cat $home_profile > $copy_profile
  a=$left
else
  cat $copy_profile > $home_profile
  a=$right
fi
do_output .profile
if [ $EUID = 0 ]; then
  if [ $etc_env -nt $copy_env ]; then
    cat $etc_env > $copy_env
    a=$left
  else
    cat $copy_env > $etc_env
    a=$right
  fi
  do_output enviornment
  if [ $etc_apt_sources -nt $copy_apt_sources ]; then
    cat $etc_apt_sources > $copy_apt_sources
    a=$left
  else
    cat $copy_apt_sources > $etc_apt_sources
    a=$right
  fi
  do_output apt sources 
fi
if [ $2 ]; then
  if [ $winhome_hyper -nt $copy_hyper ]; then
    cat $winhome_hyper > $copy_hyper
    a=$left
  else
    cat $copy_hyper > $winhome_hyper
    a=$right
  fi
  do_output .hyper.js
  if [ $appdata_vscode_settings -nt $copy_vscode_settings ]; then
    cat $appdata_vscode_settings > $copy_vscode_settings
    a=$left
  else
    cat $copy_vscode_settings > $appdata_vscode_settings
    a=$right
  fi
  do_output settings.json
else
  echo "${reset}Couldn't find the windows_userfolder?!"
fi
if [ $EUID -ne 0 ]; then
  MSG=${4:-Auto commit of dotfiles. Courtesy of sync.sh}
  if [[ $3 == "save" ]]; then
    cd $1
    git add .
    git commit -m "$MSG"
    git push
  fi
fi