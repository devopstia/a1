#!/bin/bash

# Simple for loop example

# Loop through numbers 1 to 5
for number in {1..5}
do
    sleep 1
    echo "Current number is: $number"
done

## =======================================================
#!/bin/bash

# Iterate over an array of fruits
fruits=("Apple" "Banana" "Orange" "Grapes" "Watermelon")

for fruit in "${fruits[@]}"
do
    echo "Current fruit is: $fruit"
done

## =======================================================

#!/bin/bash

# Iterate over an array of fruits
users=("tom" "Banana" "paul" "TONTON" "tata")

for user in "${users[@]}"
do
    sleep 1
    echo "Addeding ${user}"
done

## =======================================================
#!/bin/bash
users=("tom" "Banana" "paul" "TONTON" "tata")
for user in "${users[@]}"
do
    sleep 1
    lower_case=$(echo "$user" | tr 'A-Z' 'a-z')
    echo "Addeding ${lower_case}"
done


## =======================================================
#!/bin/bash
users=("tom" "Banana" "paul" "TONTON" "tata")
for user in "${users[@]}"
do
    sleep 1
    lower_case=$(echo "$user" | tr 'A-Z' 'a-z')
    echo "Addeding ${lower_case}"
    useradd $lower_case
    usermod -c "$lower_case $lower_case" $lower_case
    cat /etc/passwd |grep -w $lower_case
done

## =======================================================
#!/bin/bash
users=("tom" "Banana" "paul" "TONTON" "tata")
for user in "${users[@]}"
do
    if ! grep -q "^${user}:" /etc/passwd; then
        lower_case=$(echo "$user" | tr 'A-Z' 'a-z')
        echo "Addeding ${lower_case}"
        useradd -m "${lower_case}"
        echo "${lower_case}:${lower_case}" | chpasswd
        usermod -c "${lower_case} ${lower_case}" "${lower_case}"
        cat /etc/passwd | grep "${lower_case}"
        cat /etc/shadow | grep "${lower_case}"
        ls /home
    else
        echo "User ${lower_case} already exists"
    fi
done


## =======================================================
#!/bin/bash

cat << EOF > /tmp/users.txt
tom
Banana
paul
TONTON
tata
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

for i in $username
do
    sleep 1
    echo "Adding user: $i"
done

## =======================================================
#!/bin/bash

cat << EOF > /tmp/users.txt
clovis
michel
rene
matias 
eric
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

for tia in $username
do
    if ! grep -q "^${tia}:" /etc/passwd; then
        echo "Addeding ${tia}"
        useradd -m "${tia}"
        echo "${tia}:${tia}" | chpasswd
        usermod -c "${tia} ${tia}" "${tia}"
        cat /etc/passwd | grep "${tia}"
        cat /etc/shadow | grep "${tia}"
        ls /home
    else
        echo "User ${tia} already exists"
    fi
done


## =======================================================
#!/bin/bash

cat << EOF > /tmp/users.txt
s7felix
s5damien
s5michael
s5royce
s5kuh
EOF
username=$(cat /tmp/users.txt | tr '[A-Z]' '[a-z]')

for tia in $username
do
    if ! grep -q "^${tia}:" /etc/passwd; then
        echo "Addeding ${tia}"
        useradd -m "${tia}"
        echo "${tia}:${tia}" | chpasswd
        usermod -c "${tia} ${tia}" "${tia}"
        cat /etc/passwd | grep "${tia}"
        cat /etc/shadow | grep "${tia}"
        passwd -e ${tia}
        ls /home
    else
        echo "User ${tia} already exists"
    fi
done


## =======================================================
#!/bin/bash
for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cd /home/$y && rm -rf us_presidents.csv
    fi
done

#!/bin/bash
for y in `(ls -l /home/ |awk '{print$9}')`
do
    if [[ -d /home/$y ]]
    then 
        cp /tmp/us_presidents.csv /home/$y
    fi
done


#!/bin/bash
for y in `(ls -l |awk '{print$9}')`
do
    if [[ -d $y ]]
    then 
        echo "directory: $y"
    fi
done

#!/bin/bash
for y in `(ls -l |awk '{print$9}')`
do
    if [[ -f $y ]]
    then 
        echo "directory: $y"
    fi
done


## =======================================================
#!/bin/bash
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



for number in {1..5}
do
    sleep 1
    echo "Current number is: $number"
done



function my_function {
    for number in {1..5}
    do
        sleep 1
        echo "Current number is: $number"
    done
}

# Without the function keyword
another_function() {
    # function body
    echo "Hello from another_function"
}

my_function
another_function