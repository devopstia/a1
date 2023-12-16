

apt update
apt install apache2 -y
systemctl status apache2 
systemctl enable apache2

cd  /var/www/html/
rm -rf *

cat <<EOF > /var/www/html/index.html
<form action="/action_page.php">
  <fieldset>
    <legend>Personalia:</legend>
    <label for="fname">First name:</label><br>
    <input type="text" id="fname" name="fname" value="John"><br>
    <label for="lname">Last name:</label><br>
    <input type="text" id="lname" name="lname" value="Doe"><br><br>
    <input type="submit" value="Submit">
  </fieldset>
</form>
EOF


cd /var/www/html/
mkdir web
cd web
wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/covid19.zip 
unzip covid19.zip 
cp -R covid19/* .
rm -rf covid19.zip 
rm -rf covid19

cd /root/s3tia
ls |grep manager
if [ $? -eq 0 ]
then
    echo "The directory exist"
else
    mkdir manager
    chmod 777 manager
    ls -l
fi

sleep 3

read -p "What is your first name? " NAME
read -p "What is your last name? " LAST_NAME

cat /etc/passwd |grep $NAME

if [ $? -eq 0 ]
then
    echo "The user exist already"
else
    useradd $NAME
    groupadd engineeringgroup
    usermod -aG engineeringgroup -c "$NAME $LAST_NAME" -s "/bash/sh" $NAME
    sleep 3 
    cat /etc/passwd |grep $NAME
fi


