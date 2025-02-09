#!/bin/bash

####################################################
# this block just information of userid
#########

# USERID=$(id -u)

# echo "your user id is : $USERID"


# #########

# # here using if-else condition 

# # generally user id is '1000', but in root previlages it is '0'

# #############

# if [ $USERID -ne 0 ]                        # if user id 1000 then it is 1000 notequal 0 condition is true
#                                             # if user id  0, then the condition is 0 not equal 0. condition is false. else condition will execute

# then
#      echo "command is not executed"
#      exit 1                                  # exit command is used to get the status of prvious command: 0 success, 1 failure
#                                              # if exit 1 - no command will run and exit from the script

#  fi        

#block 1
 ####################################################################################################


USERID=$(id -u)

if [ $USERID -ne 0 ]

then
    echo "user switch to root privilages"
    exit 1

fi    

apt list --installed nginx

if [ $? -eq 0 ]

then 
     echo "nginx packages are not insttalled"
     apt install nginx -y

     if [ $? -eq 0]

     then
         echo "nginx package installation is not successful"
         exit 1

      else
          echo "package installation is success"
      fi       

 else 
      echo "nginx is already installed"

 fi         



 