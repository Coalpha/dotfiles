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
copy_bashrc="$1/.bashrc"
copy_profile="$1/.profile"
copy_env="$1/environment"

winhome_hyper="$2/.hyper.js"
copy_hyper="$1/.hyper.js"

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
echo "Looking for .hyper.js in $2"
if [ $2 ]; then
  echo
  if [ $winhome_hyper -nt $copy_hyper ]; then
    cat $winhome_hyper > $copy_hyper
    echo "${green}Replaced $magenta$copy_hyper$reset with $cyan$winhome_hyper!"
  else
    cat $copy_hyper > $winhome_hyper
    echo "${yellow}Replaced $cyan$winhome_hyper$reset with $magenta$copy_hyper!"
  fi
  echo
else
  echo "${reset}What the fuck?! Couldn't find the windows_userfolder!"
fi
