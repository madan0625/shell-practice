#!/bin/bash

USERID=$(id -u)

echo "your user id is : $USERID"

echo "set to root :"

sudo su 

if [ $? -ne 0 ]
 
#  if [ $USERID -ne 0 ]
 
 then
          echo "command is executed"
          exit 1
  else
          echo "command is not executed"
         
 fi