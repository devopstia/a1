echo "1"
echo "2"
echo "3"
echo "4"
echo "5"

#--------------------------------------------
for i in 1 2 3 4 5 
do
    echo $i
done


#--------------------------------------------
for number in 1 2 3 4 5 
do
    echo "This in number: $number"
done

cat <<EOF > numbers.txt
1
2
3
4
5
6
7
8
9
10
EOF

for num in $(cat numbers.txt)
do
    echo "This in number: $number"
done

# for num in `cat numbers.txt`
# do
#     echo "This in number: $number"
# done

#--------------------------------------------

for num in {0..100}
do
    echo "This in number: $num"
done


#--------------------------------------------
chmod +x gp2-storage-class.yaml
chmod +x n.yaml
chmod +x numbers.txt
chmod +x pv.yaml
chmod +x pvc.yaml
chmod +x script.sh
chmod +x servers.txt
chmod +x test
chmod +x test.tar
chmod +x test.txt
chmod +x us_presidents.csv

for dir in `ls /student_home`
do
    chmod +x $dir
done


for dir in $(ls /student_home)
do
    chmod a-x $dir
done

#--------------------------------------------

LS=`ls /student_home`
for dir in $LS
do
    chmod 777 $dir
done
#--------------------------------------------

A="paul"
if [[ -d "$A" ]]
then
    echo "$A exists on your filesystem."
fi


for dir in $(ls -la /student_home)
do
    if [[ -d "$dir" ]]
    then
        echo "Directory $dir exists on your filesystem."
    elif [[ -f "$dir" ]]
    then
        echo "File $dir exists on your filesystem."
    elif [[ -w "$dir" ]]
    then
        echo "File or directory have write permission $dir exists on your filesystem."
    elif [[ -r "$dir" ]]
    then
        echo "File or directory have read permission $dir exists on your filesystem."
    elif [[ -x "$dir" ]]
    then
        echo "File or directory have execute permission $dir exists on your filesystem."
    fi
done
#--------------------------------------------

for dir in $(ls -la /student_home)
do
    if [[ -x "$dir" ]]
    then
        echo "File or directory $dir have execute permission $dir"
    fi
done

#--------------------------------------------
for dir in $(ls -la /student_home)
do
    if [[ -r "$dir" ]]
    then
        echo "File or directory $dir have read permission $dir"
    fi
done

#--------------------------------------------
for dir in $(ls -la /student_home)
do
    if [[ -w "$dir" ]]
    then
        echo "File or directory $dir have write permission $dir"
    fi
done
#--------------------------------------------

apt-get update
apt-get install iputils-ping

cat <<EOF > /student_home/servers.txt
server1.anomicatech.com
server2.anomicatech.com
server3.anomicatech.com
www.google.com
www.devopseasylearning.com
EOF

for server in $(cat /student_home/servers.txt)
do
    echo "======================================"
    ping -c 4 $server >> /tmp/log.txt
    VALID=`echo $?`
    # VALID=$(echo $?)
    if [[ $VALID -eq 0 ]]
    then
        echo "$server is UP"
    else
        echo "$server is DOWN"
    fi
done
#--------------------------------------------

for server in $(cat /student_home/ser.txt)
do
    echo "======================================"
    ping -c 4 $server >> /tmp/log.txt
    VALID=`echo $?`
    # VALID=$(echo $?)
    if [[ $VALID -eq 0 ]]
    then
        echo "$server is UP"
    else
        echo "$server is DOWN"
    fi
done
#--------------------------------------------

for y in $(ls -l /home/ | awk '{print$9}')
do
    cd /home/$y && rm -rf us_presidents.csv
done

#--------------------------------------------
for y in $(ls -l /home/ | awk '{print$9}')
do
    cd /home/$y && rm -rf *.csv
done


#--------------------------------------------
for y in $(ls -l /home/ | awk '{print$9}')
do
    cp us_presidents.csv /home/$y
done



# a.config 