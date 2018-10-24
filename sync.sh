magenta=`tput setaf 5`
cyan=`tput setaf 6`
green=`tput setaf 2`
reset=`tput sgr0`
blue=`tput setaf 4`
yellow=`tput setaf 11`
# Color declarations
home_bashrc="$(realpath ~/.bashrc)"
home_profile="$(realpath ~/.profile)"
etc_env="/etc/environment"
winhome_hyper="$2/.hyper.js"
appdata_vscode_settings="$2/AppData/Roaming/Code/User/settings.json"

copy_bashrc="$1/.bashrc"
copy_profile="$1/.profile"
copy_env="$1/environment"
copy_hyper="$1/.hyper.js"
copy_vscode_settings="$1/settings.json"

echo "${blue}Comparing $magenta$1$reset to $cyan$(realpath ~)$reset"
echo
if [ $home_bashrc -nt $copy_bashrc ]; then
  cat $home_bashrc > $copy_bashrc
  echo "${green}Replaced $magenta$copy_bashrc$reset with $cyan$home_bashrc!"
else
  cat $copy_bashrc > $home_bashrc
  echo "${yellow}Replaced $cyan$home_bashrc$reset with $magenta$copy_bashrc!"
fi
echo
if [ $home_profile -nt $copy_profile ]; then
  cat $home_profile > $copy_profile
  echo "${green}Replaced $magenta$copy_profile$reset with $cyan$home_profile!"
else
  cat $copy_profile > $home_profile
  echo "${yellow}Replaced $cyan$home_profile$reset with $magenta$copy_profile!"
fi
echo
if [ $etc_env -nt $copy_env ]; then
  cat $etc_env > $copy_env
  echo "${green}Replaced $magenta$copy_env$reset with $cyan$etc_env!"
else
  cat $copy_env > $etc_env
  echo "${yellow}Replaced $cyan$etc_env$reset with $magenta$copy_env!"
fi
echo
echo "${blue}Comparing select files within $magenta$1$reset to $cyan$2$reset"
echo
if [ $2 ]; then
  echo "Looking for .hyper.js in $2"
  if [ $winhome_hyper -nt $copy_hyper ]; then
    cat $winhome_hyper > $copy_hyper
    echo "${green}Replaced $magenta$copy_hyper$reset with $cyan$winhome_hyper!"
  else
    cat $copy_hyper > $winhome_hyper
    echo "${yellow}Replaced $cyan$winhome_hyper$reset with $magenta$copy_hyper!"
  fi
  echo
  echo "Looking for settings.json in $appdata_vscode_settings"
  if [$appdata_vscode_settings -nt $copy_vscode_settings]; then
    cat $appdata_vscode_settings > $copy_vscode_settings
    echo "${green}Replaced $magenta$copy_vscode_settings$reset with $cyan$appdata_vscode_settings!"
  else
    cat $copy_vscode_settings > $appdata_vscode_settings
    echo "${yellow}Replaced $magenta$appdata_vscode_settings$reset with $cyan$copy_vscode_settings!"
  fi
else
  echo "${reset}Couldn't find the windows_userfolder?!"
fi
