#!/bin/bash

endCol="\e[0m"
red="\033[0;31m"
green="\033[0;32m"

echo
echo -e "${green}📂Give me name of the csv file:${endCol}"
read -r fileName

cat ordered_expenses.txt

sort -t ';' -k4n "$fileName".csv >> ./ordered_expenses.txt

echo
echo -e "${green}Want to find someone specific? [y/N]:${endCol}"
read -r actionPrompt2
if [[ "$actionPrompt2" =~ ^([yY])$ ]]
then
  echo
  echo -e "${green}👁Give me name of the person:${endCol}"
  read -r personName

  if [[ "$personName" ]]
  then
    if grep -q "$personName" "$fileName".csv;
      then
        echo
        echo -e "${green}Found===========================${endCol}"
        grep "$personName" "$fileName".csv
        echo -e "${green}================================${endCol}"

        echo
        echo -e "${green}Want to know quantity of search pattern? [y/N]:${endCol}"
        read -r actionPrompt3
        if [[ "$actionPrompt3" =~ ^([yY])$ ]]
          then
            echo
            echo -e "${green}🔍Enter search pattern: ${endCol}"
            read -r searchPattern

            echo
            echo -e "${green}📈Provided search pattern \"${searchPattern}\" appears in ${fileName}.csv this amount of times: ${endCol}"
            grep -c "$searchPattern" "$fileName".csv;
          else
            echo -e "${green}🐊See ya later alligator${endCol}"
        fi
        else
            echo
            echo -e "${red}🤷There is no name that corresponds to search pattern${endCol}"
    fi
  fi
fi
