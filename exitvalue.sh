#!/bin/bash

####################################################
# this block just information of userid
#########

USERID=$(id -u)

echo "your user id is : $USERID"


#########

# here using if-else condition 

# generally user id is '1000', but in root previlages it is '0'

#############

if [ $USERID -ne 0 ]                        # if user id 1000 then it is 1000 notequal 0 condition is true
                                            # if user id  0, then the condition is 0 not equal 0. condition is false. else condition will execute

then
     echo "command is not executed"
     exit 1

 fi        

 echo "command is executed"  
