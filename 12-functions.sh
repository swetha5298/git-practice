#!/bin/bash

USERID=$(id -u)
#echo "user ID is:$USERID"

VALIDATE (){
    if [ $1 -ne 0 ]
    then
     echo "$2 is failed.."
    exit 1
    else
    echo "$2 is sucess.."
    fi
}

if [ $USERID -ne 0 ]
then
  echo "please run the script with root priveleges"
  exit 1 
fi

  dnf list install git


if [ $? -ne 0 ]
then 
  echo "Git is not installed/going to install it.."
  dnf install git -y
VALIDATE $? "Installing Git"
else
    echo "Git is already installed,nothing to do .."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
  echo "mysql is not installed/going to install it.."
  dnf install mysql -y
VALIDATE $? "installing MYSQL"
else
    echo "mysql is already installed,nothing to do .."
fi
