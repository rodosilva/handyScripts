# !/bin/bash
# Script to extract strings
# Author: Rodrigo S

text=""
text=$(awk '/[a-z]+/ {print $0}' $1)

while read file
do
  
  echo "$file"
done < $text






