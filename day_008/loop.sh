#!/bin/bash

<< comment
# loops in shell script

for i in 1 2 "3" "004" 5 6 7 8 9 10
do
	echo "number is $i"
done

# for in range 

for i in {1..20}
do
        echo "number is $i"
done

comment


# working with file using loop

# getting value from file

file="/home/kushkumarkashyap7280/Desktop/shell scripting/day_008/name.txt"


for name in $(cat "$file")
do
	echo "Name is $name"
done


# do while loop

count=0
num=10

while [ $count -le $num ]
do
	echo "count now is : $count"
	let count++
done

# while loop

a=10

until [ $a -eq 1 ]
do
	echo " num is $a"
	let a--;
done

# infinite loop

while true
do
	echo " time is : $(date +"%Y-%m-%d %H:%M:%S") "
	sleep 2s
done


