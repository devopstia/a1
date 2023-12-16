#!/bin/bash

USER_NAME="peter"
SLEEP="3"
GROUP="hr" 
FILE="tom"
DIRECTORY="tia"
PLEASE_WAIT="Please wait while are checking"   

echo "Creating user $USER_NAME. $PLEASE_WAIT ................"
sleep $SLEEP
useradd $USER_NAME

echo "Creating user home dir. $PLEASE_WAIT ................"
sleep $SLEEP
mkdir -p /home/$USER_NAME

echo "Assigning permission. $PLEASE_WAIT ................"
sleep $SLEEP
chown $USER_NAME:$USER_NAME /home/$USER_NAME

echo "Assigning password. $PLEASE_WAIT ................"
sleep $SLEEP
passwd $USER_NAME

echo "Checking the shadow file. $PLEASE_WAIT ................"
sleep $SLEEP
cat /etc/shadow |grep $USER_NAME

echo "Checking the password file. $PLEASE_WAIT ................"
sleep $SLEEP
cat /etc/passwd |grep $USER_NAME

echo "Creating a group $GROUP. $PLEASE_WAIT ................"
sleep $SLEEP
groupadd $GROUP

echo "Adding user $USER_NAME in the $GROUP group. $PLEASE_WAIT ................"
sleep $SLEEP
usermod -aG $GROUP $USER_NAME

echo "Adding user full name. $PLEASE_WAIT ................"
sleep $SLEEP
usermod -c "$USER_NAME Smith" $USER_NAME

echo "Checking the group that $USER_NAME belong to. $PLEASE_WAIT ................"
sleep $SLEEP
id $USER_NAME


echo "Checking the disk usage. $PLEASE_WAIT ................"
sleep $SLEEP
df -h

echo "Checking the memory usage. $PLEASE_WAIT ................"
sleep $SLEEP
free -h

echo "Checking the kernel version. $PLEASE_WAIT ................"
sleep $SLEEP
uname -a

echo "Checking all processes. $PLEASE_WAIT ................"
sleep $SLEEP
ps -aux

echo "Checking how long the server has been up. $PLEASE_WAIT ................"
sleep $SLEEP
uptime
echo "I love linux"

echo "Creating some files and dir. $PLEASE_WAIT ................"
sleep $SLEEP
cd /home/$USER_NAME
touch $FILE.txt
echo "We are learning bash" >> $FILE.txt
mkdir $DIRECTORY

ls -l /home/$USER_NAME

echo "Installing some packages. $PLEASE_WAIT ................"
sleep $SLEEP
apt update
apt install zip -y
apt install git -y