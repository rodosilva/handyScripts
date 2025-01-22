#!/bin/bash

echo "=================="
echo "Paste files"
echo "=================="

for n in $(cat assets.txt | sed 's/[^(a-zA-Z0-9)^(-_/\.)]//g')
do
  echo -e "Pasting into [DESTINATION]"
  scp [SOURCE] [DESTINATION]
done
