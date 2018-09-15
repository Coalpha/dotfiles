red=`tput setaf 1`
green=`tput setaf 2`
magenta=`tput setaf 5`
if test "$#" -ne 2; then
  echo "${red}Illegal number of parameters"
  exit 0;
fi
if [[ $2 = "set" || $2 = "enable" ]]; then
  pwd > $1
  echo "${green}Enabled default directory at \"$(pwd)\"!"
elif [ $2 = "disable" ]; then
  rm $1
  echo "${magenta}Disabled!"
fi
