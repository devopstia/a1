#!/bin/bash
​

# ubuntu = Ubuntu
# redhat = Red Hat Enterprise Linux
# centos = CentOS Linux
# amazon-ec2 = Amazon Linux


OS_NAME=$(cat /etc/*release |grep -w NAME |awk -F'"' '{print$2}')


if [[ "$OS_NAME" == "Ubuntu" ]]; then
    echo "This is $OS_NAME OS"
    apt update
elif [[ "$OS_NAME" == "Red Hat Enterprise Linux" ]]; then
    echo "This is $OS_NAME OS"
    yum update
elif [[ "$OS_NAME" == "CentOS Linux" ]]; then
    echo "This is $OS_NAME OS"
    yum update
elif [[ "$OS_NAME" == "Amazon Linux" ]]; then
    echo "This is $OS_NAME OS"
    yum update
else
    echo "HUMMMMMMMMMM. I don't know this OS"
fi

if [[ $OS_NAME == "Red Hat Enterprise Linux" ]] || [[ $OS_NAME == "CentOS Linux" ]] || [[ $OS_NAME == "Amazon Linux" ]] 
then
    echo "This is $OS_NAME OS"
    yum update
elif [[ $OS_NAME == "Ubuntu" ]] 
then
    echo "This is $OS_NAME OS"
    apt update
else
    echo "HUMMMMMMMMMM. I don't know this OS"
    exit
fi
