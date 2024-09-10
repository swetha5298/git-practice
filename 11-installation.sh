#!/bin/bash

USERID=$(id -u)
#echo "user ID is:$USERID"

if [ $USERID -ne 0 ]
then
  echo "please run the script with root priveleges"
  exit 1 
fi

dnf install git 

if [ $? -ne 0 ]
then 
echo "Git is not installed/going to intsall it.."
dnf install git -y
else
echo "Git is already installed,nothing to do .."
fi