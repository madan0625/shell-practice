#!/bin/bash

#echo "enter the username"

#read USERNAME

#echo "username is :: $USERNAME"


########################################

# here we can use -s to hide the entering values at runtime

#########################################


read -s username

echo "username is: $username"

read -s password           ##### in ubuntu read -s works with bash <filename> or ./<filename> sh in redhat 

echo "password is: $password"


