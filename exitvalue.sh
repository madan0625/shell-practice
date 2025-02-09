#!/bin/bash

####################################################
# this block just information of userid
#########

USERID=$(id -u)

echo "your user id is : $USERID"


#########

# here using if-else condition 

#############

if [ $USERID -ne 0 ]

then
     echo "command is not executed"

else
      echo "comand is executed"

 fi          
