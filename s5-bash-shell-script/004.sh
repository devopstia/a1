#!/bin/bash
​
read -p "Enter your first name: " FIRST_NAME
read -p "Enter your last name: " LAST_NAME
read -s -p "Enter your password: " PASSWORD

echo "FIRST_NAME: $FIRST_NAME"
echo "LAST_NAME: $LAST_NAME"
echo "PASSWORD: $PASSWORD"

useradd $FIRST_NAME
passwd $FIRST_NAME
mkdir -p /home/$FIRST_NAME
chown $FIRST_NAME:$FIRST_NAME /home/$FIRST_NAME
usermod -c "$FIRST_NAME $LAST_NAME" $FIRST_NAME

cat /etc/passwd |grep $FIRST_NAME
cat /etc/shadow |grep $FIRST_NAME
id $FIRST_NAME