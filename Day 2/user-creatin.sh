#!/bin/bash
#Anothe was of reading user input is by using "-p"
read -p "Enter name: " inputName
echo "Name is: $inputName"
# User Creation
sudo useradd -m $inputName
echo "User $inputName is created"