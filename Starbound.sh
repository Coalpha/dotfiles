#!/bin/sh
reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
magenta=`tput setaf 5`

echo "The absolute path is: $STARBOUND_PATH"
cd $STARBOUND_PATH
# it's running in a subshell so it's fine probably
if [ $1 = "help" ]; then
  echo "Starbound pack|unpack asset|json|player path1.something [output.json]"
  exit 0
fi
if test "$#" -lt 3; then
  echo "${red}Illegal number of parameters$reset"
  exit 1
fi
if [ $1 = "pack" ]; then
  pack=true
elif [ $1 = "unpack" ]; then
  pack=false
else
  echo "$red\"$1\" is not \"pack\" or \"unpack!\""
  exit 1
fi
if [[ $2 = "asset" || $2 = "json" || $2 = "player" ]]; then
  type=$2
else
  echo "$red\"$2\" is not \"asset\", \"json\", or \"player!\""
  exit 1
fi
if [ -z "$3" ]; then
  echo "${red}Uh, there's no input"
  exit 1
else
  in_file="$3"
fi
if [ -z "$4" ]; then
  out_file="$in_file.new"
  echo "${blue}No output file specified. Outputting to $out_file$reset"
else
  out_file="$4"
fi
if [ $type = "player" ]; then
  in_file="storage/player/$in_file"
  type="json"
fi
if $pack; then
  if $assets; then
    command="asset_packer"
  else
    command="make_versioned_json"
  fi
else
  if $assets; then
    command="asset_unpacker"
  else
    command="dump_versioned_json"
  fi
fi
if $pack; then
  if [ $type = "asset" ]; then
    exe="asset_packer"
  else
    exe="make_versioned_json"
  fi
else
  if [ $type = "asset" ]; then
    exe="asset_unpacker"
  else
    exe="dump_versioned_json"
  fi
fi
ls
command="./win32/$exe.exe $in_file $out_file"
echo "The command to evaluate is $command"
eval $command
