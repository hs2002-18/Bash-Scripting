#!/bin/bash

#Using For Loop without arguments
for (( num=1 ; num<=5 ; num++))
do 
    mkdir "demo-$num"
done

#Using arguments in For Loop
<< Task
$1 is folder name
$2 is starting condition
$3 is end condition
Task

for (( num=$2 ; num<=$3 ; num++))
do
    mkdir "$1-$num"
done

#Using While Loop
read -p "Enter number: " num
while [[ $num -le 10 ]]
do 
    echo "$num"
    ((num++))
done