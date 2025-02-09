#!/bin/bash

USERID=$(id -u)

echo "your user id is : $USERID"

echo "set to root :"

apt list installed mysql

if [ $? -ne 0 ]
 
 then
          echo "command is executed"
          exit 1
         
 fi