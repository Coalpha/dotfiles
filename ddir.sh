if [[ $2 = "set" || $2 = "enable" ]]; then
  pwd > $1
  echo "Enabled default directory at \"$(pwd)\"!"
elif [ $2 = "disable" ]; then
  rm $1
  echo Disabled!
fi
