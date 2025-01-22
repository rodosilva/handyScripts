#!/bin/bash

echo "=================="
echo "Creating the file"
echo "=================="

cat assets.txt | tr '/' ' '
mkdir temp/
printf '\n'

#for n in $(cat assets2.txt | sed 's/[^a-zA-Z0-9]//g')
#do
#  mkdir -p ./temp/$n
#done

echo "=================="
echo "Copy the files"
echo "=================="
for n in $(cat assets.txt | sed 's/[^(a-zA-Z0-9)^(-_/\.)]//g')
do
  echo -e "Copy from [SOURCE]"
  scp [SOURCE] [DESTINATION]
done
