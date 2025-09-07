#!/bin/bash

echo "Choose  option --"

echo " a = to see current data"

echo " b = list all the  files in current dir"

echo " c = current location of directory "
read -p "enter option : " choice

case $choice in
	a)date;;
	b)ls;;
	c)
		echo " location of diretory is  : $(pwd)";;
	*)echo "enter valid choice "
esac
