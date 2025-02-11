#!/bin/bash


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]

then
     echo "switch to root user :"
     exit 1

fi     

apt list --installed nginx    # here in ubuntu exit staus is 0 either installed or not but in redhat if installed it will give '1' or else '0'. 

if [ $? -eq 0 ]         # usally -ne 0 but in ubuntu i'm giving eq o

then
     echo "nginx is not installed and going to install it:"

     apt install nginx -y

     ps -ef | grep nginx

     if [ $? -ne 0 ]

     then 
          echo "nginx installation is not successful"

          exit 1
     else

          echo "nginx installatin is successful"
     fi

else

     echo "nginx is installed"

fi     