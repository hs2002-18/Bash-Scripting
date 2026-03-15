#!/bin/bash
<< comment #This is a multi line comment
Anything
Writen here
Will not Execute
comment

name="Harsh"
echo "My name is: $name, and date is: $(date)"

#Reading user Input
echo "Enter the name: "
read username
echo "Your name is: $username"

#Arguments
echo "The character in $0 are: $1 $2"