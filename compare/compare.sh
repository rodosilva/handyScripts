#!/usr/bin/env bash

## The idea of this scripts is to compare a couple of files that list something line by line
list1=$1
list2=$2

## Sort
sort -f $list1 > "sorted_list1.tmp"
sort -f $list2 > "sorted_list2.tmp"

## All in lower case
tr '[:upper:]' '[:lower:]' < sorted_list1.tmp > sorted_lower_list1.tmp
tr '[:upper:]' '[:lower:]' < sorted_list2.tmp > sorted_lower_list2.tmp

## Remove white spaces and the beginning and end
sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//' sorted_lower_list1.tmp
sed -i 's/^[[:space:]]*//;s/[[:space:]]*$//' sorted_lower_list2.tmp

sorted_list1="sorted_lower_list1.tmp"
sorted_list2="sorted_lower_list2.tmp"

## Beginning Comparison
echo "======================="
echo "Unique to: $1"
echo "======================="
comm -23 $sorted_list1 $sorted_list2

echo "======================="
echo "Unique to: $2"
echo "======================="
comm -13 $sorted_list1 $sorted_list2

echo "======================="
echo "Have in Common"
echo "======================="
comm -12 $sorted_list1 $sorted_list2