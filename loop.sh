#!/bin/bash


## for loop
# write a program to find odd & even unmbers


# for i in {0..1000}

# do
#       echo "no : $i"
# done

user_id=$(id -u)

if [ $user_id -ne 0 ]

then
     echo "switch to root user"
     exit 1
fi         


# to install a package or mltpile packages 

for package in $@ 

do
       apt list --installed $package
       
       if [ $? -eq 0 ]

       then
            echo "$package is not installed goint to install"
            apt install $package
            echo "$package is installed"

            if [ $? -eq 0 ]

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