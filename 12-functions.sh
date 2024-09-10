#!/bin/bash

USERID=$(id -u)
#echo "user ID is:$USERID"

VALIDATE (){
    if [ $1 -ne 0 ]
    then
     echo "Command is failed.."
    exit 1
    else
    echo "command is sucess.."
    fi
}

if [ $USERID -ne 0 ]
then
  echo "please run the script with root priveleges"
  exit 1 
fi

  dnf list install git

VALIDATE  $?

# if [ $? -ne 0 ]
# then 
#   echo "Git is not installed/going to install it.."
#   dnf install git -y
# if [ $? -ne 0 ]
# then
#   echo  "Git installation is not sucess..check it"
#   exit 1 
# else 
#    echo "git installation is success"
#  fi
# else
#     echo "Git is already installed,nothing to do .."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then 
#   echo "mysql is not installed/going to install it.."
#   dnf install mysql -y
# if [ $? -ne 0 ]
# then
#   echo  "mysql installation FAILURE"
#   exit 1 
# else 
#    echo "mysql installation is success"
#  fi
# else
#     echo "mysql is already installed,nothing to do .."
# fi
