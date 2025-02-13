#!?bin/bash

log_folder="/var/log/shell-practice"

script_name=$(echo $0 | cut -d "." -f1)

time_stamp=$(date +%Y-%m-%d-%H:%M:%S-%A)

log_file="$log_folder/$script_name-$time_stamp.log"

mkdir -p $log_folder

R="\e[32m"
G="\e[33m"
N="\e[0m"

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
               echo -e "$2 is.... $R failure: $N" | tee -a $log_file
               exit 1
          else
               echo -e "$2 is... $G success: $N" | tee -a $log_file
          fi  
}

echo "executing started at : $(date)" &>>$log_file

CHECK_ROOT

dnf install mysql-server -y &>>$log_file
VALIDATE $? "Installation MYSQL server:"

systemctl enable mysqld $>>$log_file
VALIDATE $? "enabling MYSQL SERVER:"

systemctl start mysqld &>>$log_file
VALIDATE $? "starting MYSQL server:"

# mysql_secure_installation --set-root-pass ExpenseApp@1
# VALIDATE $? "setting MYSQL server password "

mysql -h <ip address or hostname> -u root -pExpenseApp@1 -e "show databases;" &>>$log_file

if [ $? -ne 0 ]

then
   echo "root password is not set, now setting up"
   mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
   VALIDATE $? "setting MYSQL server password "

else
    echo "root pawssord is already setup: skipping"
fi

# above line is for idempotency to avoid multiple time creations failure.