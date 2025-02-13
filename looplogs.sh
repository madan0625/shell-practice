log_folder="/var/log/shell-practice"        # to create a folder in var location

script_name=$(echo $0 | cut -d "." -f1)     # $0 is scriptfile name

time_stamp=$(date +%Y-%m-%d-%H:%M:%S-%A)

log_file="$log_folder/$script_name-$time_stamp.log"    # create a log file

mkdir -p $log_folder     # here -p: it will not show error if it is created, if folder is not created then it will create.


user_id=$(id -u)

if [ $user_id -ne 0 ]

then
     echo "switch to rootuser" &>>$log_file    # &>> appends the output data into logfile.log

     exit 1

fi

# USAGE(){

#           echo "USAGE:: sudo bash looplogs.sh package1 package2 " &>>$log_file
#           exit 1
# }

# if [ $# -eq 0 ]

# then
#       USAGE
# fi


for package in $@ 

do
       dnf list installed $package &>>$log_file
       
       if [ $? -ne 0 ]

       then
            echo "$package is not installed goint to install"
            dnf install $package -y &>>$log_file
            #echo "$package is installed"

            if [ $? -ne 0 ]

            then
                  echo "$package installation is not success"
                  exit 1
            else
                  echo "$package installed successfully"
            fi         
        else
            echo "$package is already installed nothing to install it again!"
        fi        
done