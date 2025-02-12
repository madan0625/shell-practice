#!/bin/bash
# function: need some inputs to work and get output


#      FUNC_NAME(){
#
#      }

#      FUNC_NAME     # here we can call function with function name to perform


USER_ID=$(id -u)

VALIDATE(){
      
      echo "exit status is : $1"
}

if [ $USER_ID -ne 0 ]

then
     echo "switch to root permissions:"


apt list --installed git

VALIDATE $?

# if [ $? -ne 0 ]

# then
# fi