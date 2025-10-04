#!/bin/bash

# function in shell

# taking args when shell before shell runs
echo "variable 1 is : $1"
echo "variable 2 is : $2"
function myfunc(){
	echo "hello world"
}


myfunc


hellofunc (){
	echo "kese ho"
}


hellofunc


welcome (){
	echo "your name is:$1"
	echo "your age is : $2"
}


#!/bin/bash

echo "Enter your name and age :"
read name age

welcome $name $age



