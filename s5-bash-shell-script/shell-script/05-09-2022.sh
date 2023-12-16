
UNAME2=$(uname -a |awk -F" " '{print$3}' |awk -F"-" '{print$1}' |cut -d. -f1-2)

# cat /etc/passwd |grep -i tia |tail -1 |awk -F":" '{print $1}'
uname -a |awk -F" " '{print$3}' |awk -F"-" '{print$1}' |cut -d. -f1-2
cat /etc/*release |grep -i id |head -2 |tail -1 |awk -F"=" '{print $2}'



read -p :"What is your first name? " FIRST_NAME

cat /etc/passwd |grep -w $FIRST_NAME
if [ $? -eq 0 ]
then
    echo "The user exist already"
else
   useradd $FIRST_NAME
fi


# For CentOS
# echo "$new_password" | passwd --stdin "$new_username"
# For Debian/Ubuntu
# echo "$new_username:$new_password" | chpasswd
# For OpenSUSE
# echo -e "$new_password\n$new_password" | passwd "$new_username"


read -p "What is your first name? " FIRST_NAME
read -p "What is your last name? " LAST_NAME
read -s -p "What is your password? " PASSWORD

cat /etc/passwd |grep -w $FIRST_NAME

if [ $? -eq 0 ]
then
    echo "The user exist already"
else
    useradd $FIRST_NAME
    usermod -s "/bin/bash" -d /home/$FIRST_NAME -aG admin -c "$FIRST_NAME $LAST_NAME" $FIRST_NAME
    # echo $PASSWORD | passwd $FIRST_NAME --stdin
    echo "$FIRST_NAME:$PASSWORD" | chpasswd
fi



OS1=`cat /etc/*release |grep -i id |head -2 |tail -1 |awk -F"=" '{print $2}'`
cat /etc/passwd |grep -w $FIRST_NAME

if [ $OS1 = "ubuntu" ] && [ $? -eq 0 ]
then
    useradd $FIRST_NAME
    usermod -s "/bin/bash" -d /home/$FIRST_NAME -aG admin -c "$FIRST_NAME $LAST_NAME" $FIRST_NAME
    echo "$FIRST_NAME:$PASSWORD" | chpasswd
elif [ $OS2 = "centos" ]
then
    useradd $FIRST_NAME
    usermod -s "/bin/bash" -d /home/$FIRST_NAME -aG admin -c "$FIRST_NAME $LAST_NAME" $FIRST_NAME
    echo $PASSWORD | passwd $FIRST_NAME --stdin
elif [ $OS3 = "OpenSUSE" ]
then
    useradd $FIRST_NAME
    usermod -s "/bin/bash" -d /home/$FIRST_NAME -aG admin -c "$FIRST_NAME $LAST_NAME" $FIRST_NAME
    echo -e "$PASSWORD\n$PASSWORD" | passwd "$FIRST_NAME"
else
    echo "Hummm"
fi
