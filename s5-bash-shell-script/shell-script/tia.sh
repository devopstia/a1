




echo "The kernel version is: `uname -r`"
echo "The kernel version is: $(uname -r)"
UNAME=`uname -r`
KERNEL=$(uname -r)
echo "The kernel version is: ${KERNEL}"
echo "The kernel version is: ${UNAME}"



USERS=`sed -n '/tcpdump/, /print still the end/p' /etc/passwd | awk -F":" '{print$1}' | sed '/tcpdump/d'`
KERNEL=`uname -r |awk -F. '{print $1}'`
MEMORY=`free -mh / |grep Mem: |awk '{print$2}'`
DISKUSAGE=`df -mh /  |tail -1 |awk '{print$2}'`
IP=`ifconfig |grep inet |head -1 |awk '{print$2}'`
NIC=`ifconfig |head -1 |awk -F: '{print$1}'`
SSH=`netstat -ltnp |grep  0.0.0.0:22 | awk '{print$4}' |awk -F: '{print$2}'`

echo -e "Bellow are all the users on this server \n$USERS" >> /tmp/project5.txt
echo "The digit first of the kernel version is: $KERNEL" >> /tmp/project5.txt
echo "The total size of the memory on this server is: $MEMORY" >> /tmp/project5.txt
echo "The total size oof the disk available on this server: $DISKUSAGE" >> /tmp/project5.txt
echo "The IP address of this server is: $IP" >> /tmp/project5.txt
echo "The server NIC is: $NIC" >> /tmp/project5.txt
echo "The SSH port on this server is: $SSH" >> /tmp/project5.txt




# system inventory
platform=`uname -a | cut -d" " -f1`
hostname=`uname -a | cut -d" " -f2`
kernel_version=`uname -a | cut -d" " -f3 | cut -d. -f1-2`
system_arch=`getconf LONG_BIT`
number_of_cpu=`nproc`


echo "The platform of this server is: $platform"
echo "The hostname is: $hostname"
echo "The Kernel version is: $kernel_version"
echo "The system architecture is: $system_arch bit"
echo "The number of CPU on this system is: $number_of_cpu"



#!/bin/bash
UBUNTU=`cat /etc/*release |grep ID_LIKE |awk -F= '{print$2}'`
CENTOS=`cat /etc/*release |grep ID_LIKE |awk -F= '{print$2}' |awk -F" " '{print$2}' |awk -F'"' '{print$1}'`
AWS_CENTOS=`cat /etc/*release |grep ID_LIKE |awk -F= '{print$2}' |awk -F" " '{print$3}' |awk -F'"' '{print$1}'`


if [[ $UBUNTU == "debian" ]]
then
    echo "This is Ubuntu server"
    exit 1

elif [[ $CENTOS == "fedora" ]] 
then
    echo "This is CentOs server"
    exit 2

elif [[ $AWS_CENTOS == "fedora" ]] 
then
    echo "This is AWS CentOs server"
    exit 2

else 
    echo ""
    echo "Unknow Linux distribution"
    exit 1
fi


#!/bin/bash

function COVID() {
# && = AND
# || = OR
read -p "Enter the first name: " FIRST_NAME 
read -p "Enter the last name: " LAST_NAME
read -p "Enter age: " AGE
read -p "Do you have fever (y or n)?: " FEVER
read -p "Do you have a cough? (y or n): " COUGH
read -p "Do you have any difficulty breathing? (y or n): " BREATHING
read -p "Have you been in contact with someone who has been tested positive with the Coronavirus? (y or n): " CONTACT
read -p "Did you travel outside the United States for the past 2 weeks? (y or n): " TRAVEL
read -p "Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus? (y or n): "  HOUSE

if [ "$FEVER" = "n" ] && [ "$COUGH" = "n" ] && [ "$BREATHING" = "n" ] && [ "$CONTACT" = "n" ] && [ "$TRAVEL" = "n" ] && [ "$HOUSE" = "n" ]
then
    echo "Hello $FIRST_NAME $LAST_NAME, You do not need to be tested for COVID-19"

elif [ "$FEVER" = "y" ] || [ "$COUGH" = "y" ] || [ "$BREATHING" = "y" ] || [ "$CONTACT" = "y" ] || [ "$TRAVEL" = "y" ] || [ "$HOUSE" = "y" ]
then   
    echo "Hello $FIRST_NAME $LAST_NAME, You  need to be tested for COVID-19"
else
    echo "Please $FIRST_NAME $LAST_NAME, please check your answers"
fi
}
COVID



#!/bin/bash

read -p "Enter the first name: " FIRST_NAME 
read -p "Enter the last name: " LAST_NAME
read -p "Enter age: " AGE
read -p "Do you have fever (y or n)?: " FEVER
read -p "Do you have a cough? (y or n): " COUGH
read -p "Do you have any difficulty breathing? (y or n): " BREATHING
read -p "Have you been in contact with someone who has been tested positive with the Coronavirus? (y or n): " CONTACT
read -p "Did you travel outside the United States for the past 2 weeks? (y or n): " TRAVEL
read -p "Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus? (y or n): "  HOUSE

if [ "$FEVER" = "y" -o  "$COUGH" = "y" -o "$BREATHING" = "y" -o "$CONTACT" = "y" -o "$TRAVEL" = "y" -o "$HOUSE" = "y" ]
then
    echo "Hello $FIRST_NAME $LAST_NAME, You need to be tested for COVID-19"
elif [ "$FEVER" = "n" -a  "$COUGH" = "n" -a "$BREATHING" = "n" -a "$CONTACT" = "n" -a "$TRAVEL" = "n" -a "$HOUSE" = "n" ]
then
    echo "Hello $FIRST_NAME $LAST_NAME, You do not need to be tested for COVID-19"
else
    echo "Please $FIRST_NAME $LAST_NAME, please check your answers"
    exit
fi




##-----------Bash `AND` - `OR` Operators ---------

The logical OR `||`, `-o` and AND `&&`, `-a` operators allow you to use multiple conditions in the if statements.


#!/bin/bash

read -p "Enter the first number: " NUMBER1
read -p "Enter the second number: " NUMBER2
read -p "Enter the thirst number: " NUMBER3

if [[ $NUMBER1 -eq $NUMBER2 ]] && [[ $NUMBER1 -eq $NUMBER3 ]]
then
  echo "$NUMBER1, $NUMBER2, $NUMBER3 are equal"
elif [[ $NUMBER1 -eq $NUMBER2 ]] || [[ $NUMBER1 -gt $NUMBER3 ]]
then
  echo "$NUMBER1, $NUMBER2, $NUMBER3 are not equal"
else
  echo "hummmm"
fi



#!/bin/bash

read -p "Enter the first number: " NUMBER1
read -p "Enter the second number: " NUMBER2
read -p "Enter the thirst number: " NUMBER3

if [ $NUMBER1 -eq $NUMBER2 -a $NUMBER1 -eq $NUMBER3 ]
then
  echo "$NUMBER1, $NUMBER2, $NUMBER3 are equal"
elif [ $NUMBER1 -eq $NUMBER2 -o $NUMBER1 -gt $NUMBER3 ]
then
  echo "$NUMBER1, $NUMBER2, $NUMBER3 are not equal"
else
  echo "hummmm"
fi



#!/bin/bash
 
echo -n "Enter the first number: "
read VAR1
echo -n "Enter the second number: "
read VAR2
echo -n "Enter the third number: "
read VAR3

if [[ $VAR1 -ge $VAR2 ]] && [[ $VAR1 -ge $VAR3 ]]
then
  echo "$VAR1 is the largest number."
elif [[ $VAR2 -ge $VAR1 ]] && [[ $VAR2 -ge $VAR3 ]]
then
  echo "$VAR2 is the largest number."
else
  echo "$VAR3 is the largest number."
fi



##-----------Case Statement DAY 01---------

# Syntax of bash case statement.

case EXPRESSION in
 
  PATTERN_1)
    STATEMENTS
    ;;
 
  PATTERN_2)
    STATEMENTS
    ;;
 
  PATTERN_N)
    STATEMENTS
    ;;
 
  *)
    STATEMENTS
    ;;
esac


#!/bin/bash
ENV=$1

case $ENV in
 
  prod | production | Prd | PRD | Prod | Production | PRODUCTION |PROD)
    echo "Deployment to production envirnoment"
    ;;
 
  dev | development| Dev | DEV | DEVELOPMENT)
    echo "Deployment to development envirnoment"
    ;;

  qa | Qa | QA)
    echo "Deployment to QA envirnoment"
    ;;
 
  *)
    echo "Unknown envirnoment"
    ;;
esac




#!/bin/bash
 
echo "Enter the name of a country: "
read COUNTRY
 
echo "The official language of $COUNTRY is "
 
case $COUNTRY in
 
  Lithuania)
    echo "Lithuanian"
    ;;
 
  Romania | Moldova)
    echo "Romanian"
    ;;

  USA | US | us | usa | "United States" | "united states")
    echo "English"
    ;;

  Cameroon | cameroon |camer |kamer | CAMEROON)
    echo "English and Fresh"
    ;;
 
  Italy | "San Marino" | Switzerland | "Vatican City")
    echo "Italian"
    ;;
 
  *)
    echo "unknown"
    ;;
esac




##-----------Case Statement DAY 01---------

# Syntax of bash case statement.

case EXPRESSION in
 
  PATTERN_1)
    STATEMENTS
    ;;
 
  PATTERN_2)
    STATEMENTS
    ;;
 
  PATTERN_N)
    STATEMENTS
    ;;
 
  *)
    STATEMENTS
    ;;
esac


#!/bin/bash
ENV=$1

case $ENV in
 
  prod | production | Prd | PRD | Prod | Production | PRODUCTION |PROD)
    echo "Deployment to production envirnoment"
    ;;
 
  dev | development| Dev | DEV | DEVELOPMENT)
    echo "Deployment to development envirnoment"
    ;;

  qa | Qa | QA)
    echo "Deployment to QA envirnoment"
    ;;
 
  *)
    echo "Unknown envirnoment"
    ;;
esac




#!/bin/bash
 
echo "Enter the name of a country: "
read COUNTRY
 
echo "The official language of $COUNTRY is "
 
case $COUNTRY in
 
  Lithuania)
    echo "Lithuanian"
    ;;
 
  Romania | Moldova)
    echo "Romanian"
    ;;

  USA | US | us | usa | "United States" | "united states")
    echo "English"
    ;;

  Cameroon | cameroon |camer |kamer | CAMEROON)
    echo "English and Fresh"
    ;;
 
  Italy | "San Marino" | Switzerland | "Vatican City")
    echo "Italian"
    ;;
 
  *)
    echo "unknown"
    ;;
esac




#!/bin/bash
echo "please answer those following questions by yes(Y) or not(N):"
test1 ()
{
    read -p "Do you have fever ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        A=1
        ;;
        N|n|No|NO|no) 
        A=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test1

test2 ()
{
    read -p "Do you have a cough ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        B=1
        ;;
        N|n|No|NO|no) 
        B=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test2

test3 ()
{
    read -p "Do you have any difficulty breathing ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        C=1
        ;;
        N|n|No|NO|no) 
        C=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test3

test4 ()
{
    local yn
    read -p "Have you been in contact with someone who has been tested positive with the Coronavirus ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        D=1
        ;;
        N|n|No|NO|no) 
        D=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test4

test5 ()
{
    read -p "Did you travel outside the United States for the past 2 weeks ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        E=1
        ;;
        N|n|No|NO|no) 
        E=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test5

test6 ()
{
    read -p "Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus ? " yn
    case $yn in
        Y|y|Yes|YES|yes) 
        F=1
        ;;
        N|n|No|NO|no) 
        F=0
        ;;
        * ) echo "Please answer yes or no. Let's start again... "
            sh $0
        ;;
    esac
}
test6

if (( $((A+B+C+D+E+F))>=1 ))
then
  echo -e "\nYou might have the virus. \nPlease, call the 911 for more information and contact a specialist\n "
else
  echo -e "\nRegarding your answer, you do not need to be tested for COVID-19.\nPlease, be safe; follow instructions and save lives.\n"
fi
echo -e "You can use the link below for more information:\nhttps://www.cdc.gov/coronavirus/2019-ncov/cases-updates/summary.html\n"
Example 6:

#!/bin/bash
echo "please answer those following questions by yes(Y) or not(N):"
test1 ()
{
    local yn
    read -p "Do you have fever ? " yn
    case $yn in
        [Yy]* ) A=1;;
        [Nn]* ) A=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test1
test2 ()
{
    local yn
    read -p "Do you have a cough ? " yn
    case $yn in
        [Yy]* ) B=1;;
        [Nn]* ) B=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test2
test3 ()
{
    local yn
    read -p "Do you have any difficulty breathing ? " yn
    case $yn in
        [Yy]* ) C=1;;
        [Nn]* ) C=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test3
test4 ()
{
    local yn
    read -p "Have you been in contact with someone who has been tested positive with the Coronavirus ? " yn
    case $yn in
        [Yy]* ) D=1;;
        [Nn]* ) D=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test4
test5 ()
{
    local yn
    read -p "Did you travel outside the United States for the past 2 weeks ? " yn
    case $yn in
        [Yy]* ) E=1;;
        [Nn]* ) E=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test5
test6 ()
{
    local yn
    read -p "Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus ? " yn
    case $yn in
        [Yy]* ) F=1;;
        [Nn]* ) F=0;;
        * ) echo "Please answer yes or no. Let's start again... "
            bash $0;;
    esac
}
test6
if (( $((A+B+C+D+E+F))>=1 ))
then
  echo "you might have the virus please, call the 911 for more information and contact a specialist "
else
  echo -e "\n regarding your answer, you haven't contracted the virus\nPlease, be safe; \t follow instructions and save lives."
fi
echo -e "you can use the link below for more information:\nhttps://www.cdc.gov/coronavirus/2019-ncov/cases-updates/summary.html"



for mission in 1 2 3 4 5 6
do
  create-and-launch-rocket $mission
done
for mission in {0..100}
do
  create-and-launch-rocket $mission
done



cat <<EOF > servers.txt
server1.anomicatech.com
server2.anomicatech.com
server3.anomicatech.com
EOF
apt-get update
apt-get install iputils-ping

for server in `cat servers.txt`
do
ping -c 1 $server > /tmp/ping
valid=`echo $?`
if [ $valid -eq 0 ]; then
echo "$server is up"
else
echo "$server is Down"
fi
done

for i in `ls`
do
chmod a-x $i
done

for i in `ls`
do
chmod a-x $i
done

for i in `ls`
do
bash $i
done

for file in $(ls)
do
 echo Line count of $file is $(cat $file | wc -l)
done


for package in $(cat install-packages.txt)
do
 sudo apt-get –y install $package
done

https://devopseasylearning.atlassian.net/wiki/spaces/DEL/pages/786649/AWK+SED+CUT+TR+GREP+SORT+AND+PIPE+COMMAND

scp
scp -r tia ssh s3vanessa@server1.anomicatech.com:/home/vanessa
https://linuxize.com/post/bash-for-loop/

#!/bin/bash
cat << EOF > /tmp/users.txt
ericsu
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

function user_add() {
    for users in $username
    do
        ls /home |grep -w $users &>/dev/nul || mkdir -p /home/$users
        cat /etc/passwd |awk -F: '{print$1}' |grep -w $users &>/dev/nul ||  useradd $users
        chown -R $users:$users /home/$users
        usermod -s /bin/bash -aG docker,admin $users
        echo -e "$users\n$users" |passwd "$users"
    done
}


#!/bin/bash
cat << EOF > /tmp/users.txt
ericsu
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

function user_add() {
   cd /root/s3yvan/
   for users in $username
   do 
	  cp -r covid5050 /home/$users
   done
}


function user_add() {
   cd /root/s3yvan/
   for users in $username
   do 
	  rm -rf covid5050 /home/$users
   done
}


cat /var/log/auth.log
find / -name /var/log/auth.log
tail -f /var/log/auth.log
cat /var/log/auth.log | grep "Failed"
cat /var/log/auth.log | grep "Failed"  | awk '{print $9}'
cat /var/log/auth.log | grep "Failed"  | awk '{print $9}' | sort -u
cat /var/log/auth.log | grep "Failed"  | awk '{print $9}' | sort -u |wc -l
cat /var/log/auth.log | grep "Failed"  | awk '{print $9}' | sort -u |wc -l > users.txt



vim us_presidents.csv 
cat us_presidents.csv 
cat us_presidents.csv | cut -f2 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u |wc -l 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u > users.txt

vim useradd.sh 

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt | tr 'A-Z' 'a-z')
password=$username@redhat
 
for user in $username
do
useradd $user
echo $password | passwd --stdin $user
done
vim userdel.sh

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt)
 
for user in $username
do
userdel -r $user
done
vim u.sh

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt | tr 'A-Z' 'a-z')
password=$username@redhat
 
for user in $username
do
useradd $user
echo $password | passwd --stdin $user
passwd --expire $user
done



-----------------------------------------------------------


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




for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/"$y" ]]
    then 
         cp us_presidents.csv /home/$y
    fi
done




for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/"$y" ]]
    then 
        cd /home/"$y" && rm -rf us_presidents.csv
    fi
done



vim us_presidents.csv 
cat us_presidents.csv 
cat us_presidents.csv | cut -f2 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u |wc -l 
cat us_presidents.csv | cut -f2 |cut -d" " -f1 |tr 'A-Z' 'a-z' |sort |sort -u > users.txt




#!/bin/bash
cat << EOF > /tmp/users.txt
ericsu
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

function user_add() {
    for users in $username
    do
        ls /home |grep -w $users &>/dev/nul || mkdir -p /home/$users
        cat /etc/passwd |awk -F: '{print$1}' |grep -w $users &>/dev/nul ||  useradd $users
        chown -R $users:$users /home/$users
        usermod -s /bin/bash -aG docker,admin $users
        echo -e "$users\n$users" |passwd "$users"
    done
}




vim useradd.sh 

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt | tr 'A-Z' 'a-z')
password=$username@redhat
 
for user in $username
do
useradd $user
echo $password | passwd --stdin $user
done
vim userdel.sh

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt)
 
for user in $username
do
userdel -r $user
done
vim u.sh

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt | tr 'A-Z' 'a-z')
password=$username@redhat
 
for user in $username
do
useradd $user
echo $password | passwd --stdin $user
passwd --expire $user
done






AGE1="16"
echo

if [ $AGE1 -eq 16 ]
then
  echo "You can drive in USA"
else
  echo "You cannot drive in USA"
fi


age="50"
first_name="Tom"
last_name="Smith"
email="tom@gmail.com"
country="USA"

echo $age
echo $first_name
echo $last_name
echo $email
echo $country



read -p :"What is your first name? " FIRST_NAME

cat /etc/passwd |grep -w $FIRST_NAME
if [ $? -eq 0 ]
then
    echo "The user exist already"
else
   useradd $FIRST_NAME
fi


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

which docker 2>&1 1>/dev/nul && { echo; echo "Docker is installed on this host"; echo "The Docker version is: $(docker -v)"; } || { apt update; apt install docker.io -y; }

which apache2 &>/dev/nul && { echo; echo "Apache2 is installed on this host"; echo "The Apache2 version is: $(apache2 -v)"; } || { apt install apche2 -y; }

which git 2>/dev/nul 1>/dev/nul && { echo; echo "Git is installed on this host"; echo "The Git version is: $(git --version)"; } || { apt install git -y; }

which tree &>/dev/nul && { echo; echo "Tree is installed on this host"; echo "The tree version is: $(tree --version)"; } || { apt install tree -y; }


which git 2>/dev/nul 1>/dev/nul && { echo; echo "Git is installed on this host"; echo "The Git version is: $(git --version)"; } || { apt install git -y; }
which tree &>/dev/nul && { echo; echo "Tree is installed on this host"; echo "The tree version is: $(tree --version)"; } || { apt install tree -y; }

which git 2>/dev/nul 1>/dev/nul && { echo; echo "Git is installed on this host"; echo "The Git version is: $(git --version)"; } || { apt install git -y; }

```
STDIN (standard input), STDOUT (standard output) & STDERR (standard error)

0: STDIN

1: STDOUT ls -l 1>demo.txtor ls -l >demo.txt: store only the output in demo.txt and display the error

2: STDERR ---> ls -l 2>demo.txt: store only the error output in demo.txt if there is any and display the output

ls -l 1>demo.txt 2>error.txt, sdffgfgfhrtg 1>demo.txt 2>error.txt store the error in error.txt and the outup in demo.txt

java --version 1>jva_ver.txt 2>jva_ver.txt store both in the same file

java --version &> jva_ver.txt or java --version &>jva_ver.txtstore both in the same file

java --version 1>jva_ver.txt 2>&1 store both in the same file

java --version 2>&1 1>/dev/nul or java --version &>/dev/nul redirct everything to dev null(trash)
```