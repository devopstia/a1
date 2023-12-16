#!/bin/bash


# ubuntu = Ubuntu
# redhat = Red Hat Enterprise Linux
# centos = CentOS Linux
# amazon-ec2 = Amazon Linux

PACKAGES=$1
USERNAME=$2
PASSWORD=$3
EMAIL=$4
FIRSTNAME=$5
LASTNAME=$6
ACCOUNT_MANAGEMENT=$7

OS_NAME=$(cat /etc/*release |grep -w NAME |awk -F'"' '{print$2}')

function ubuntu {
    echo "This is $OS_NAME OS."
    sleep 5
    apt update -y
    apt install -y $PACKAGES
}

function centos_redhat_ec2 {
    echo "This is $OS_NAME OS."
    sleep 5
    yum update -y
}

if [ "$OS_NAME" == "Ubuntu" ]; then
    ubuntu
elif [ "$OS_NAME" == "Red Hat Enterprise Linux" ] || [ "$OS_NAME" == "CentOS Linux" ] || [ "$OS_NAME" == "Amazon Linux" ]; then
     centos_redhat_ec2
else
    echo "HUMMMM. I don't know this OS."
fi


echo "Username: ${USERNAME}"
echo "Password : ${PASSWORD}"
echo "Email: ${EMAIL}"
echo "First Name: ${FIRSTNAME}"
echo "Last Name: ${LASTNAME}"
echo "Account managemnet: ${ACCOUNT_MANAGEMENT}"

manage_user_account() {
    if [ "${ACCOUNT_MANAGEMENT}" == "add_user" ]; then
        if ! grep -q "^${USERNAME}:" /etc/passwd; then
            sudo useradd -m "${USERNAME}"
            echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
            sudo usermod -c "${FIRSTNAME} ${LASTNAME}" "${USERNAME}"
            sudo cat /etc/passwd | grep "${USERNAME}"
            sudo cat /etc/shadow | grep "${USERNAME}"
            ls /home
        else
            echo "User ${USERNAME} already exists"
        fi
    elif [ "${ACCOUNT_MANAGEMENT}" == "delete_user" ]; then
        if ! grep -q "^${USERNAME}:" /etc/passwd; then
            echo "User ${USERNAME} does not exist"
        else
            sudo userdel -r "${USERNAME}"
            echo "The user ${USERNAME} with password ${PASSWORD} has been deleted"
            sudo cat /etc/passwd | grep "${USERNAME}" || true
            sudo cat /etc/shadow | grep "${USERNAME}" || true
        fi
    elif [ "${ACCOUNT_MANAGEMENT}" == "lock_user" ]; then
        if ! grep -q "^${USERNAME}:" /etc/passwd; then
            echo "User ${USERNAME} does not exist"
        else
            sudo passwd -l "${USERNAME}"
            echo "The user ${USERNAME} with password ${PASSWORD} has been locked"
            sudo cat /etc/shadow | grep "${USERNAME}"
        fi
    elif [ "${ACCOUNT_MANAGEMENT}" == "unlock_user" ]; then
        if ! grep -q "^${USERNAME}:" /etc/passwd; then
            echo "User ${USERNAME} does not exist"
        else
            sudo passwd -u "${USERNAME}"
            echo "The user ${USERNAME} with password ${PASSWORD} has been unlocked"
            sudo cat /etc/shadow | grep "${USERNAME}"
        fi
    else
        echo "Invalid ACCOUNT_MANAGEMENT action: ${ACCOUNT_MANAGEMENT}"
    fi
}

manage_user_account