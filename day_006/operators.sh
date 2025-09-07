#!/bin/bash

# operators in bash shell

#arithmetic operators

x=10
y=2

let add=$x+$y

let mul=$x*$y

let sub=$x-$y

let div=$x/$y

echo "addtion of x and y is : $add"

echo "sub  of x and y is : $sub"

echo "mul  of x and y is : $mul"

echo "division of x and y is : $div"

# another way if not need third varible

echo "addition of x and y is : $(($x+$y))"

