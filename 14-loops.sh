#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
CHECK_ROOT (){
    if [ $USERID -ne 0 ]
then
    echo "please run the script with root priveleges"
    exit 1 
     fi
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
     echo -e "$2 is $R failed..$N"
    exit 1
    else
    echo -e  "$2 is $G sucess..$N"
    fi
}

CHECK_ROOT

 for package in $@
 do
  dnf list install $package
if [$? -ne o ]
then
    echo "$package is not installed,going to install it .."
    dnf install $package -y
    VALIDATE $? "Installing $package"
else
    echo "$package is already installed..nothing to do"
fi
 done