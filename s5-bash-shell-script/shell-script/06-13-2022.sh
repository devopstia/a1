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