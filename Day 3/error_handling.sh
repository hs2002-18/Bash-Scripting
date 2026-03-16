#!/bin/bash

# Write a script that creates a directory given by the user.
createDirectory() {
    mkdir $1  
}

if ! createDirectory "$1";
then
    echo "Directory $1 Already Exists"
    exit 1
fi

echo "Directory $1 is created"

# Write a script that checks if a file exists.

fileExist() {
    if [[ $# -eq 0 ]];
    then
        echo "No File Name Provided"
        echo "Usage: $0 <filename>"
        exit 1
    fi
    file=$1

    if [[ -f "$file" ]];
    then
        echo "File Exists"
    else
        echo "File Not Found"
    fi
}

fileExist "$1"
