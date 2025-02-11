#!/bin/bash

#  How to maintian proper log file in real time when running files.

# to install packages or anything else

# step 1: need to create a log folder -----> /var/log/shell-practice/

# step 2: then a create log file ----------> shell-pract.log ----- here script is our log file

# step 3: add time stap to file -----------> date +%Y-%m-%D-%H:%M:%S  add this to file


log_folder="var/log/shell-practice/"

script_name=$(echo $0 | cut -d "." -f1)

time_stamp=$(date +%Y-%m-%d-%H:%M:%S-%A)

log_file="$log_folder/$script_name-$time_stamp.log"

mkdir -p $log_folder     # here -p: it will not show error if it is created, if folder is not created then it will create.


user_id=$(id -u)

if [ $user_id -ne 0 ]

then
     echo "switch to rootuser" &>>$log_file

     exit 1

fi

apt list --installed nginx &>>$log_file

if [ $? -eq 0 ]  # -ne 0

then
      echo "nginx is not installed going to install:" &>>$log_file
      apt install nginx -y &>>$log_file

      if [ $? -ne 0 ]
      then
           echo "installation is not successful" &>>$log_file
           exit 1
      else
           echo "installation is successful" &>>$log_file
      fi          

else
     echo "nginx is already installed... no need to install it agian" &>>$log_file

fi     
