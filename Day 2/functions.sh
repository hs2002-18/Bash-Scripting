#!/bin/bash
function isEven() {
    local num=$1
    if (( $num % 2 == 0 ));
    then 
        echo "Even"
    else
        echo "Odd"
    fi
}

read -p "Enter the number: " num
isEven "$num"