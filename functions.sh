#!/bin/bash
# function: need some inputs to work and get output


#      FUNC_NAME(){
#
#      }

#      FUNC_NAME     # here we can call function with function name to perform


USER_ID=$(id -u)

VALIDATE(){
      
      if [ $1 -ne 0]
      then
          echo "command is failed"
       else 
          echo "command is success"
       fi   
}

if [ $USER_ID -ne 0 ]

then
     echo "switch to root permissions:"
fi

apt list --installed nginx

VALIDATE $?

# if [ $? -ne 0 ]

# then
# fi