
https://github.com/devopstia/it/blob/master/Bash-Shell-Scripting/Shell-Scripting-Course/For-loop.md


#------------------------------------------------------
for tia in $(ls -l |awk '{print$9}')
do
    if [[ -d $tia ]]
    then
        echo "This is a directory: $tia"
    elif [[ -f $tia ]]
    then 
        echo "This is a file: $tia"
    else 
        echo "error"
    fi 
done
#-----------------------------------------------------

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



for y in $(ls -l |awk '{print$9}')
do
    if [[ -d $y ]]
    then 
        cp us_presidents.csv /home/$y
    elif [[ -f $y ]]
    then
        exit 
    fi
done
#------------------------------------------------------
for y in $(ls -l /home/ |awk '{print$9}')
do
    if [[ -d $y ]]
    then 
        cp us_presidents.csv /home/$y
    elif [[ -f $y ]]
    then
        exit 
    fi
done

#------------------------------------------------------
for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cd /home/$y && rm -rf us_presidents.csv
    fi
done
#------------------------------------------------------
for tia in $(ls -l |awk '{print$9}')
do
    if [[ -d $tia ]]
    then
        echo "This is a directory: $tia"
    elif [[ -f $tia ]]
    then 
        echo "This is a file: $tia"
    else 
        echo "error"
    fi 
done
#------------------------------------------------------

ls -l /home/ |awk '{print$9}' > ls.txt

for tia in $(cat ls.txt)
do
    if [[ -d /home/$tia ]]
    then
        cp /home/s4esther/us_presidents.csv /home/$tia 
    elif [[ -f /home/$tia ]]
    then 
        exit
    fi 
done


GR=$(ls -l /home/s4esther | awk {print$9})
for agent in $GR
do
    if [[ -d "$agent"  ]]
    then
        chmod 777 $agent;
        cp /home/us_presidents.csv /home/s4esther/"$agent"
        echo "Yes add, It is a directory: $agent"
    elif [[ -f "$agent"  ]]
    then
        chmod 744 $agent
        echo "No, It is a file: $agent"
    fi
done




cat /etc/passwd grep s3lesly &> /dev/null || useradd s3lesly

USER=$(cat /etc/passwd |grep -w s3leslie |awk -F":" '{print$1}')

if [[ $? -eq 0 ]]
then 
    echo "User exist already"
else
    useradd s3leslie
fi


vim us_presidents.csv 
cat us_presidents.csv 
cat us_presidents.csv | cut -f2 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u |wc -l 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u > /tmp/users.txt




#!/bin/bash
cat << EOF > /tmp/users.txt
ericsu
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

function user_add() {
    for users in $username
    do
        ls /home |grep -w $users &>/dev/nul || mkdir -p /home/$users
        cat /etc/passwd  |grep -w $users &>/dev/nul ||  useradd $users
        chown -R $users:$users /home/$users
        usermod -s /bin/bash -aG docker,admin $users
        echo -e "$users\n$users" |passwd "$users"
        echo -e "$PASSWORD\n$PASSWORD" | passwd "$FIRST_NAME"
    done
}

mkdir -p /home/tia
chown -R tia:tia /home/tia



