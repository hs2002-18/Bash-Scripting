#!/bin/bash
createDirectory() {
    mkdir $1  
}

if ! createDirectory "$1";
then
    echo "Directory $1 Already Exists"
    exit 1
fi

echo "Directory $1 is created"
