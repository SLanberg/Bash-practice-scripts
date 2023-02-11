#!/bin/bash

endCol="\e[0m"
yellow="\033[0;33m"
green="\033[0;32m"

declare -a arr=(
  '<a href="http://vocabulary.famnit.upr.si">Vocabulary Training</a>'
  '<p><a href="http://www.quackit.com/html/tutorial/html_links.cfm">Example Link</a></p>'
 )

for i in "${arr[@]}"
do
    echo
    echo -e "${yellow}Before:${endCol}"
    echo "$i"
    part_1=$(echo -n "$i" | sed -e 's/<[^>]*>//g')
    part_2=$(echo -n "$i" | sed -E 's/.*"(.*)".*/\1/')
    echo -e "${green}After:${endCol}"
    echo "$part_1, $part_2"
    echo
done


