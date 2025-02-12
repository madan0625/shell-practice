#!/bin/bash

log_folder="/var/log/shell-practice"
script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%D-%H:%M:%S-%A)
log_file="$log_folder/$script_name-$time_stamp.log"

mkdir -p $log_folder


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then
     echo "switch to root previligaes to execute:" | tee -a $log_file
     exit 1
fi



USAGE(){
          echo "USAGE:: no packages is paased - package1,package2..." | tee -a $log_file
          exit 1
}

if [ $# -eq 0 ]
then
     USAGE
fi     

for package in $@
do
    apt list --installed $package

    if [ $? -eq 0 ]

    then
         echo "$package is not installed going to install:" | tee -a $log_file
         apt install $package -y | tee -a $LOG_FILE

         if [ $? -ne 0 ]
         then
             echo "$package installation status is unsuccessful:" | tee -a $log_file
             exit 1
         else
             echo "$package installation status is successful:" | tee -a $log_file
         fi

    else
         echo "$package is already installed nothing to install:" | tee -a $log_file

    fi                  
done