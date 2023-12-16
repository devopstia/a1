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


filevsdir=$(echo$(ls -l /home/ | awk '{print $9}'))
for i in $filevsdir 
do
if [ -d /home/"$i" ]; then
        cp /home/us_presidents.csv /home/$i
fi
done


ls /home/ > t.xt
for y in `(cat t.xt[@])`
do
    if [[ -d /home/$y ]]
    then 
        cp /root/us_presidents.csv /home/$y
    elif [[ -f /home/$y ]]
    then 
        exit
    fi
done


#!/bin/bash
package=("curl" "apt" "tree" "zip")

for i in ${package[@]};
do
    which $i
    if [[ $? -ne 0 ]];
    then
        apt -y install $i
    else
        apt -y install --only-upgrade $i
    fi
done

#------------------------------------------------------

GR=$(ls -l /home/s4esther |awk '{print$9}')
for agent in $GR
do
    if [[ -d $agent ]]
    then
        chmod 777 $agent
        echo "It is a directory: $agent"
    elif [[ -f $agent ]]
    then
        chmod 744 $agent
        echo "It is a file: $agent"
    fi
done
#------------------------------------------------------

#!/bin/bash
userlist=/tmp/users.txt
username=$(cat /tmp/users.txt | tr 'A-Z' 'a-z')
password=$username@redhat
 
for user in $username
do
useradd $user
echo $password | passwd --stdin $user
passwd --expir



for y in `(ls /home)`
do
    if [[ -d /home/$y ]]
    then 
        cp /root/us_presidents.csv /home/$y
    elif [[ -f /home/$y ]]
    then 
        exit
    fi
done




for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cd /home/$y && rm -rf us_presidents.csv
    fi
done




DIR="/home/"

for tia in $DIR
do
    if [[ -d /home/$tia ]]
    then
        cp /us_presidents.csv /home/$tia
    elif [[ -f /home/$tia ]]
    then 
        exit
    fi 
done





for dir in $(ls -la /home)
do
    if [[ -r "$dir" ]]
    then
        if [[ -w "$dir" ]]
        then
            if [[ -x "$dir" ]]
            then echo "file or directory $dir has Read,  Write and Execute permissions"
            else echo "file of directory $dir only has Read and Write permissions"
            fi
        elif [[ -x "$dir" ]]
        then echo "file or directory $dir only has Read and Execute permissions"
        else echo "file or directory $dir only has Read permission"
        fi
    elif [[ -w "$dir" ]]
        then
            if [[ -x "$dir" ]]
            then echo "file or directory $dir has write and execute permissions only"
            else echo "file or directory $dir only has execute permission"
            fi
        elif [[ -x "$dir" ]]
            then echo "file or directory $dir has write permission only"
        else echo "File of directory $dir has no permission granted"
    fi
done


filename=$(ls /home) # or $(ls -la /student_home )
filepermission=("r" "w" "x")
for i in ${filename[@]} 
do
    for j in $ ${filepermission[@]}
    do 
    if  [ -d /home/$i ] &&  [ -$j /home/$i ]
    then
        echo "The directory $i has $j permission."
    elif  [ -f /home/$i ] && [ -$j /home/$i ] 
    then 
         echo "The file $i has $j permission."
    else
        echo " wrong expectation"
    fi
    done
done


filename=$(ls /home)
filepermission=("r" "w" "x")
for i in ${filename[@]}; do
    if [ -d /home/$i ]; then
        for j in ${filepermission[@]}; do
            if [ -$j /home/$i ]; then
                echo "The directory $i has $j permission."
            fi
        done
    else
        for j in ${filepermission[@]}; do
            if [ -$j /home/$i ]; then
                echo "The file $i has $j permission."
            fi
        done
    fi
done


or i in ${filename[@]} && for j in $ ${filepermission[@]}
do 
    if  [ -d /home/$i ] &&  [ -$j /home/$i ]
    then
        echo "The directory $i has $j permission."
    elif  [ -f /home/$i ] && [ -$j /home/$i ] 
    then 
         echo "The file $i has $j permission."
    else
        echo " wrong expectation"
    fi
done


filename=$(ls /home)
filepermission=("r" "w" "x")
for i in ${filename[@]}; do
    if [ -d /home/$i ]; then
        for j in ${filepermission[@]}; do
            if [ -$j /home/$i ]; then
                echo "The directory $i has $j permission."
            fi
        done
    else
        for j in ${filepermission[@]}; do
            if [ -$j /home/$i ]; then
                echo "The file $i has $j permission."
            fi
        done
    fi
done


FILES=($(/bin/ls "$1"))

for AFILE in ${FILES[@]}
do
    ... do something with a file ...
done


https://www.unix.com/shell-programming-and-scripting/140058-simple-list-file-ls-array.html
# echo ${DIR[@]}

DIR=($(ls -l /home/ | awk '{print $9}'))
# echo ${DIR[@]}


for i in ${DIR[@]}
do
    if [[ -d /home/"$i" ]]
    then
      echo $i
        cp /root/s3tia/us_presidents.csv /home/"$i"
    fi 
done


DIR=($(ls -l /home/ | awk '{print $9}'))
# echo ${DIR[@]}


for i in ${DIR[@]}
do
    if [[ -d /home/"$i" ]]
    then
      echo $i
        cp /root/s3tia/us_presidents.csv /home/"$i"
    fi 
done


-----------------------------------------------------------

filevsdir=$(echo$(ls -l /home/ | awk '{print $9}'))
for i in $filevsdir 
do
if [ -d /home/"$i" ]; then
        cp us_presidents.csv /home/$i
fi
done


for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/"$y" ]]
    then 
        cd /home/"$y" && rm -rf us_presidents.csv
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










#------------------------------------------------------
# DIR=($(ls -l /home/ | awk '{print $9}'))
# echo ${DIR[@]} == Array
# echo ${DIR[1]} 
# echo ${DIR[2]}
array=( $( ls . ) )

DIR=($(ls -l /home/ | awk '{print $9}'))

for i in ${DIR[@]}
do
    if [[ -d /home/"$i" ]]
    then
       cp us_presidents.csv /home/"$i"
    fi 
done 

#------------------------------------------------------

for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/"$y" ]]
    then 
        cd /home/"$y" && rm -rf us_presidents.csv
    fi
done

#------------------------------------------------------

for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/"$y" ]]
    then 
         cp us_presidents.csv /home/$y
    fi
done


#------------------------------------------------------

filevsdir=$(echo$(ls -l /home/ | awk '{print $9}'))
for i in $filevsdir 
do
if [ -d /home/"$i" ]; then
        cp us_presidents.csv /home/$i
fi
done



cat << EOF > users.txt
tom
paul
tia
tim
aka
sam
EOF


for i in $(cat users.txt)
do 
sleep 2
echo $i 
done

apt update 
apt install apache2 -y 
systemctl status apache2
systemctl enable apache2

cd /var/www/html/
mkdir web
cd web
wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/covid19.zip 
unzip covid19.zip 
cp -R covid19/* .
rm -rf covid19.zip 
rm -rf covid19