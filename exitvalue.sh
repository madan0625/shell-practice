#!/bin/bash

USERID=$(id -u)

echo "your user id is : $USERID"
#if [ $USERID == 0 ]
 
 if [ $USERID -ne 0 ]
 
 then
         echo "command is executed"
 else
         echo "command is not executed"
         
fi