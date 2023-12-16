

# This a single line 


# Author: Tia Leo
# Date: May  10, 2022
# Modified on:             by:
# Script to setup Jenkins on CentOS/RHEL 6.x and 7.x

<< a
Author: Tia Leo
Date: May  10, 2022
Modified on:             by:
Script to setup Jenkins on CentOS/RHEL 6.x and 7.x
a

: ' 
Author: Tia Leo
Date: May  10, 2022
Modified on:             by:
Script to setup Jenkins on CentOS/RHEL 6.x and 7.x
'

MANAGER="Tia"


ls # This is to list directories

function ls_command () {
  ls -a
  ls -la
  ls -lrt
}

pwd_command () {
  pwd
  uptime
}

function hello () {
    echo "I love Linux"
    echo "I love DevOps"
}

sleep 3
ls_command

sleep 3
pwd_command 

sleep 3
hello


echo "The name of my manager is:\n  $MANAGER"

echo -e "My name is Tia\nI am 15 years old\nand I am from Cameroon"
echo
echo -e "\tMy name is Tia\n\tI am 15 years old\n\tand I am from Cameroon"

function global_variable () {
    echo -e "The name of my manager is:\n  $MANAGER"
    echo "EK TECH HR IS $HR"
}

function lacol_variable () {
    echo -e "The name of my manager is:\n  $MANAGER"
    HR="Eric"
    echo "EK TECH HR IS $HR"
}

echo "-----------------------------------------------------------------------------------"
sleep 3
global_variable

echo "-----------------------------------------------------------------------------------"
sleep 3
lacol_variable


<< b
Enter the first name
Enter the last name
Enter age

Do you have fever? (y or n)
Do you have a cough? (y or n)
Do you have any difficulty breathing? (y or n)
Have you been in contact with someone who has been tested positive with the Coronavirus? (y or n) 
Did you travel outside the United States for the past 2 weeks? (y or n)
Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus? (y or n)
b

# AND (&&), OR (||)