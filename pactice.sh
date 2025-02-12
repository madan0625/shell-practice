#!/bin/bash

LOG_FOLDER="/var/log/shell-practice"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%D-%H:%M:%S-%A)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then
     echo "switch to root previligaes to execute:" | tee -a$LOG_FILE
     exit 1
fi



USAGE(){
          echo "USAGE:: no packages is paased - package1,package2..."
          exit 1
}

if [ $# -eq 0 ]
then
     USAGE
fi     

for package in $@
do
    apt list --installed $package | tee -a$LOG_FILE

    if [ $? -ne 0 ]

    then
         echo "$package is not installed going to install:" | tee -a$LOG_FILE
         apt install $package -y

         if [ $? -ne 0 ]
         then
             echo "$package installation status is unsuccessful:" | tee -a$LOG_FILE
             exit 1
         else
             echo "$package installation status is successful:" | tee -a$LOG_FILE
         fi

    else
         echo "$package is already installed nothing to install:" | tee -a$LOG_FILE

    fi                  
done