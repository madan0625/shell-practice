#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]

then
     echo "switch to rootuser"

     exit 1

fi

apt list --installed nginx

if [ $? -eq 0 ]  # -ne 0

then
      echo "nginx is not installed going to install:"
      apt install nginx -y

      if [ $? -ne 0 ]
      then
           echo "installation is not successful"
           exit 1
      else
           echo "installation is successful"
      fi          

else
     echo "nginx is already installed... no need to install it agian"

fi     