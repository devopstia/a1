#!/bin/bash
​

# ubuntu = Ubuntu
# redhat = Red Hat Enterprise Linux
# centos = CentOS Linux
# amazon-ec2 = Amazon Linux

OS_NAME=$(cat /etc/*release |grep -w NAME |awk -F'"' '{print$2}')

function yum_os {
  echo "This is $OS_NAME OS"
  sleep 5
  yum update
}

function apt_os {
    echo "This is $OS_NAME OS"
    sleep 5
    apt update
}

if [[ "$OS_NAME" == "Ubuntu" ]]; then
    apt_os
elif [[ "$OS_NAME" == "Red Hat Enterprise Linux" ]]; then
    yum_os
elif [[ "$OS_NAME" == "CentOS Linux" ]]; then
    yum_os
elif [[ "$OS_NAME" == "Amazon Linux" ]]; then
    yum_os
else
    echo "HUMMMMMMMMMM. I don't know this OS"
fi
