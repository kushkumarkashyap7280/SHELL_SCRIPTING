#!/bin/bash

# string in shell

str1="abcdefghijklmnopqrstuvwxyz"

echo "string is ${str1}"

echo "length of str1 is : ${#str1}"

echo "uppercase ${str1^^}"

echo " lowercase ${str1,,}"

# to replace a string

newStr=${str1/abcde/-------}

echo " new string is on replacing : ${newStr}"

# slice in string

newStr2=${str1:2:5}

echo " after slcing we  get slice is : ${newStr2}"


