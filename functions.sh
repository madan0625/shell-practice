#!/bin/bash
# function: need some inputs to work and get output
#




#      FUNC_NAME(){
#
#      }

#      FUNC_NAME     # here we can call function with function name to perform


USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECKROOT(){

    if [ $USER_ID -ne 0 ]

    then
        echo "switch to root permissions:"    #this block behlaf of user_id block
        exit 1
    fi
}

VALIDATE(){
      
      if [ $1 -ne 0 ]     ## here $1 recieves the exit status from validate function
      then
          echo -e "$2 is $R failed $N"   # here $2 is listed package ex: git, nginx etc........
       else 
          echo "$2 is $G success $N"
       fi   
}

CHECKROOT   # 

# if [ $USER_ID -ne 0 ]

# then
#      echo "switch to root permissions:"
#      exit 1
# fi

apt list --installed git      #nginx   #apt fot ubuntu , dnf in redhat

VALIDATE $?  "lisitng git" # exit status sends from here to validate function.

if [ $? -ne 0 ]

then
     echo "package is not installed going to install:"
     apt install git -y                                    

     VALIDATE $? "package installaion is happening:"      ## this block is behalf of below condition 


    #  if [ $? -ne 0 ]
    #  then
    #      echo "package installation is unsuccssful"
    #      exit 1
    #  else
    #      echo "package installation is successful:"
    #  fi

else
     echo -e " $G package is already installed nothing to install $N"             
fi