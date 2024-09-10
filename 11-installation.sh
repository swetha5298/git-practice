#!/bin/bash

USERID=$(id -u)
#echo "user ID is:$USERID"

if [ $USERID -ne 0 ]
then
  echo "please run the script with root priveleges"
  exit 1 
fi

  dnf list install gitttt

if [ $? -ne 0 ]
then 
  echo "Git is not installed/going to intsall it.."
  dnf install gittt -y
if [ $? -ne 0 ]
then
  echo  "Git installation is not sucess..check it"
  exit 1 
else 
   echo "git installation is success"
 fi
else
    echo "Git is already installed,nothing to do .."
fi