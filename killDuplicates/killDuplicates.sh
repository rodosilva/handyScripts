# !/bin/bash
# Author: Rodrigo Silva
# This script eliminates duplicates from a file
# This script need a file input as $1

echo "Killing Duplicates From File $1"
sleep 1

touch newList.txt

cat $1 | sort | uniq > newList.txt

echo -e "The new file is here: `pwd`/newList.txt"
