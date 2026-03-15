#!/bin/bash
read -p "Enter your age: " age

if [[ $age -le 18 ]];
then
    echo "You are not eligible to vote."
elif [[ $age -gt 18 && $age -le 60 ]];
then 
    echo "You are eligible to vote."
else
    echo "You are not eligible."
fi