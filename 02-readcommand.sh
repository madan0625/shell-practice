#!/bin/bash

#echo "enter the username"

#read USERNAME

#echo "username is :: $USERNAME"


########################################

# here we can use -s to hide the entering values at runtime

#########################################

echo "enter the username:"

read -s USERNAME

echo "username is: $USERNAME"

echo "enter the password"

read -s PASSWORD

echo "password is: $PASSWORD"