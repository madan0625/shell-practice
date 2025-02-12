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

apt list --installed nginx # before installing checking whether it is insatlled or not

if [ $? -eq 0 ]  # in this step $? gives previous command result either 0 or 1 and checks. if 1 != 0 or else 0 != 0

then 
     echo "nginx packages are not insttalled"     # in this step depend on above $? status if condtion is true it will execute here or 
                                                  # goto else block
     
     apt install nginx -y               # if not installed, install with this command

     if [ $? -eq 0]        # here $? checks previous executed command  if it is installed it will give 0 or else gives 1
                           # check 1 -ne 0 it will goto 'then' block and exit from script, if 0 -ne 0 it will perform 'else' block code

     then
         echo "nginx package installation is not successful"
         exit 1            # exit 1 gives you success or unsucess if exit o perform next steps, if 1 exit from the script

      else
          echo "package installation is success"
      fi       

 else 
      echo "nginx is already installed"

 fi         



 