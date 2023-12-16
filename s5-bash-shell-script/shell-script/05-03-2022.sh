# read -p "What is your first name? " FIRST_NAME
# read -p "What is your last name? " LAST_NAME
# read -p "What is your age? " AGE
# read -p "What is your email? " EMAIL
# read -s -p "What is your password ? " PASSWORD
# read -p  "What is the group name that you what to create? " GROUP






# sleep 3
# useradd $FIRST_NAME
# cat /etc/passwd |grep $FIRST_NAME

# sleep 3
# groupadd $GROUP
# cat /etc/group |grep $GROUP

# passwd $FIRST_NAME
# sleep 3
# cat /etc/shadow |grep $FIRST_NAME

# usermod -aG $GROUP -c "$FIRST_NAME $LAST_NAME" -s "/sbin/nologin" $FIRST_NAME

# sleep 3
# id $FIRST_NAME


AGE1="16"
count=1000

if [ $count -eq 100 ]
then
  echo "Count is 100"
else
  echo "Count is not 100"
fi

echo

if [ $AGE1 -eq 16 ]
then
  echo "You can drive in USA"
else
  echo "You cannot drive in USA"
fi

read -p "What is your age? " AGE2

if [ $AGE2 -ge 16 ]
then
  echo "You are allow to drive in USA"
else
  echo "You are not allow to drive in USA"
fi


