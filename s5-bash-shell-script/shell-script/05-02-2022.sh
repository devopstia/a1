

name="Paul Smith"
age="45"

echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."
echo "my name is ${name}, I am ${age} years."

echo 

read -p "What is your first name? " FIRST_NAME
read -p "What is your last name? " LAST_NAME
read -p "What is your age? " AGE
read -p "What is your email? " EMAIL
read -s -p "What is your password ? " PASSWORD
read -p  "What is the group name that you what to create? " GROUP


echo
sleep 3
echo $FIRST_NAME
sleep 3
echo $LAST_NAME
sleep 3
echo $AGE
sleep 3
echo $EMAIL
sleep 3
echo $PASSWORD

echo "My first name is $FIRST_NAME, My last name is $LAST_NAME, my email is $EMAIL,  I am $AGE year old and my password is $PASSWORD"

sleep 3
useradd $FIRST_NAME
cat /etc/passwd |grep $FIRST_NAME

sleep 3
groupadd $GROUP
cat /etc/group |grep $GROUP

passwd $FIRST_NAME
sleep 3
cat /etc/shadow |grep $FIRST_NAME

usermod -aG $GROUP -c "$FIRST_NAME $LAST_NAME" -s "/sbin/nologin" $FIRST_NAME

sleep 3
id $FIRST_NAME