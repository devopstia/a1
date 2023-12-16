
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
  yum update -y 
}

function apt_os_1 {
    echo "This is $OS_NAME OS"
    sleep 5
    sudo apt update -y
    sudo apt-get install -y curl 
    sudo apt-get install -y wget 
    sudo apt-get install -y vim 
    sudo apt-get install -y git 
    sudo apt-get install -y make 
    sudo apt-get install -y ansible 
    sudo apt-get install -y python3-pip 
    sudo apt-get install -y openssl 
    sudo apt-get install -y rsync 
    sudo apt-get install -y jq 
    sudo apt-get install -y postgresql-client 
    sudo apt-get install -y mariadb-client 
    sudo apt-get install -y mysql-client 
    sudo apt-get install -y unzip 
    sudo apt-get install -y tree 
}


function apt_os_2 {
    echo "This is $OS_NAME OS"
    sleep 5
    # List of packages to install
    packages=(
        curl 
        wget 
        vim 
        git 
        make 
        ansible 
        python3-pip 
        openssl 
        rsync 
        jq 
        postgresql-client 
        mariadb-client 
        mysql-client 
        unzip 
        tree 
    )

    # Update package list
    sudo apt update -y

    # Install packages
    for package in "${packages[@]}"; do
        echo "Installing $package Please wait ................."
        sleep 3
        sudo apt install -y "$package"
    done
    echo "Package installation completed."
}


if [[ $OS_NAME == "Red Hat Enterprise Linux" ]] || [[ $OS_NAME == "CentOS Linux" ]] || [[ $OS_NAME == "Amazon Linux" ]] 
then
    yum_os
elif [[ $OS_NAME == "Ubuntu" ]] 
then
    apt_os_2
else
    echo "HUMMMMMMMMMM. I don't know this OS"
    exit
fi



!/bin/bash

# List of packages to install
packages=(
    package1
    package2
    package3
    # Add more package names here
)

# Update package list
sudo apt update

# Install packages
for package in "${packages[@]}"; do
    sudo apt install -y "$package"
done

echo "Package installation completed."



fruits=("Apple" "Banana" "Orange" "Mango")
for fruit in "${fruits[@]}"
do
    echo "Fruit: $fruit"
done



USDERS=$(cat /etc/passwd | cut -d: -f1)

# for user in $(cat /etc/passwd | cut -d: -f1)
# do
#     echo "User: $user"
# done

for user in $USDERS
do
    sleep 2
    echo "User: $user"
done

fruits=("Apple" "Banana" "Orange" "Mango")
for fruit in "${fruits[@]}"
do
    echo "Fruit: $fruit"
done

fruits=("tom" "paul" "tia" "tonton")
for y in "${fruits[@]}"
do
    echo "Adding $y Please wait ................."
    sleep 3
    mkdir -p /home/$y
    chown $y:$y /home/"$y"
    useradd $y
    cat /etc/passwd |grep $y
    ls /home/
done


chown tia:tia /home/tia