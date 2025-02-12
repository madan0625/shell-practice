#!/bin/bash

log_folder="/var/log/shell-practice"

script_name=$(echo $0 | cut -d "." -f1)

time_stamp=$(date +%Y-%m-%d-%H:%M:%S-%A)

log_file="$log_folder/$script_name-$time_stamp.log"

mkdir -p $log_folder

user_id=$(id -u)

CHECK_ROOT(){
     
     if [ $user_id -ne 0 ]
     then
         echo "switch to root privilages:" | tee -a $log_file
         exit 1
     fi    
}

VALIDATE(){
     
          if [ $1 -ne 0 ]
          then
               echo "$2 is.... failure:" | tee -a $log_file
               exit 1
          else
               echo "$2 is... success:" | tee -a $log_file
          fi  
}

USAGE(){
         echo "usage :: no package is paased ...." | tee -a $log_file
         exit 1
}

if [ $# -eq 0 ]
then
    USAGE
fi

CHECK_ROOT


for package in $@

do

#     dnf list installed $package | tee -a $log_file
     apt list --installed $package | tee -a $log_file
     VALIDATE $? "listing $package..."

     if [ $? -eq 0]

        then
             echo "$package is not installed going to install:" 
             apt install $package -y &>>$log_file
             VALIDATE $?       

        else
             echo "$package is already installed nothing to install it:" | tee -a $log_file

    fi
done