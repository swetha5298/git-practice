#!/bin/bash

LOGS_FOLDER="var/log/shell-script"
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
CHECK_ROOT (){
    if [ $USERID -ne 0 ]
then
    echo "$R please run the script with root priveleges $N" &>>$LOG_FILE
    exit 1 
 fi
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
     echo -e "$2 is $R failed..$N"&>>$LOG_FILE
    exit 1
    else
    echo -e  "$2 is $G sucess..$N"&>>$LOG_FILE
    fi
}

CHECK_ROOT


 for package in $@
 do
  dnf list install $package &>>$LOG_FILE
if [$? -ne o ]
then
    echo "$package is not installed,going to install it .."&>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "Installing $package"
else
    echo "$package is already $Y installed..nothing to do $N" &>>$LOG_FILE
fi
 done