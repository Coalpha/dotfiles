# this file allows execution of .class files
# eh? why is it called "walk.sh"?
# well, with the speed that java "runs" at, can you really call it running?
green=`tput setaf 2`
reset=`tput sgr0`
yellow=`tput setaf 11`
cyan=`tput setaf 6`
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"
echo "${yellow}Compiling code!"
echo "${cyan}Output:${reset}"
echo
javac $1
echo "${green}Running code!${reset}"
echo "${cyan}Output:${reset}"
echo
shift
java $filename $@
