#!/bin/bash

# Arrays in shell

# how to define array

arr1=(hello ji kese ho 1 2 3 4);


# how to get value from array

echo " first element is ${arr1[0]}"

echo "second element is ${arr1[1]}"

echo " third element is ${arr1[2]}"

# how to get all value  at once

echo " All values  of arr1 is : ${arr1[*]}"

# how to get length of array

echo "length of array is ${#arr1[*]}"

# how to get subarray from a particular index ?

echo " value from index 2 -> 4 are : ${arr1[*]:2:4}"


# how to extended array with values ?

arr1+=(kush is the real coder)

echo " all values in arr1 are : ${arr1[*]}"

# How to store key values pairs

declare -A arr2

arr2=([name]=kush [age]=21 [course]="software development")

echo " value of key name  is : ${arr2[name]}"

echo " all in arr2  ${arr2[*]}"


