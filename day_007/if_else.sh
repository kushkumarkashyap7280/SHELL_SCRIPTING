#!/bin/bash

read -p "enter your marks here : " marks

if [[ $marks -gt 33 ]]
then
	echo " you have PASSED the  exam congratulations"
else
	echo " sorry you have FAILD "
fi

read -p " enter your age : " age

if [[ $age -gt 60 ]]
then
	echo " you are a senior citizen "
elif [[ $age -ge 18 && $age -le 60 ]]
then 
	echo " you are an adult "
else
	echo "you are a kid "
fi

