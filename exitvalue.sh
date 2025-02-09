#!/bin/bash

USERID=$(id -u)

#if [ $USERID == 0 ]
 
 if [ $? -eq 0 ]
 
 then
         echo "command is executed"
 else
         echo "command is not executed"
         
fi