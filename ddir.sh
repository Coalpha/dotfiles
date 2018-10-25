red=`tput setaf 1`
green=`tput setaf 2`
magenta=`tput setaf 5`
if test "$#" -ne 2; then
  echo "${red}Illegal number of parameters"
  exit 0;
fi
if [[ $1 = "set" || $1 = "enable" ]]; then
  pwd > $DDIR_PATH
  echo "${green}Enabled default directory at \"$(pwd)\"!"
elif [ $1 = "disable" ]; then
  rm $DDIR_PATH
  echo "${magenta}Disabled!"
fi
