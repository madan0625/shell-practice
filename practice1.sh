#!/bin/bash

log_folder="/var/log/shellpractice"

script_name=$(echo $0 | cut -d "." -f1)

time_stamp=$(date +%Y-%m-%d-%H:%M:%S-%A)

log_file="$log_folder/$script_name-$time_stamp.log"

mkdir -p $log_folder

user_id=$(id -u)

if [ $user_id -ne 0 ]

then
     echo "switch to root permissions :" &>>$log_file
     exit 1

fi     

for package in $@

do

  dnf list installed $package

  if [ $? -ne 0 ]

   then
     echo "$package is not installed:"
     dnf install -y $package &>>$log_file

      if [ $? -ne 0 ]
      then
         echo "$package installation is failure:"
         exit 1
      else
         echo "$package installatin is success:"
      fi        
    else
     echo "$package is already installed:"

  fi     
done