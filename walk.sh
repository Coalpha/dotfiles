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
java $filename $2 $3 $4
