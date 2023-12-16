##-----------Bash `AND` - `OR` Operators ---------

# The logical OR ||, -o and AND &&, -a operators allow you to use multiple conditions in the if statements.

read -e -p "What is your first name? " FIRST_NAME
read -p "What is your login name? " LOGIN_NAME
read -p "What is your email? " EMAIL
read -s -p "What is your password? " PASSWORD
read -s -p "What is your pin? " PIN

FIRST_NAME_BACKEND="tia"
LOGIN_NAME_BACKEND="leo"
PASSWORD_BACKEND="linux"
EMAIL_BACKEND="tia@gmail.com"
PIN_BACKEND="12345"


if [[ $FIRST_NAME == $FIRST_NAME_BACKEND ]] && [[ $LOGIN_NAME == $LOGIN_NAME_BACKEND ]] && [[ $PASSWORD == $PASSWORD_BACKEND ]] && [[ $EMAIL == $EMAIL_BACKEND ]] && [[ $PIN == $PIN_BACKEND ]] 
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account. ACCESS DENIED"
    exit
fi

if [[ $FIRST_NAME == $FIRST_NAME_BACKEND ]] || [[ $LOGIN_NAME == $LOGIN_NAME_BACKEND ]] || [[ $PASSWORD == $PASSWORD_BACKEND ]] || [[ $EMAIL == $EMAIL_BACKEND ]] || [[ $PIN == $PIN_BACKEND ]] 
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account. ACCESS DENIED"
    exit
fi


if [[ $FIRST_NAME == "tia" ]] || [[ $LOGIN_NAME == "leo" ]] || [[ $PASSWORD == "linux" ]] || [[ $EMAIL == "tia@gmail.com" ]] || [[ $PIN == "12345" ]] 
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
elif [[ $FIRST_NAME == "k" ]] || [[ $LOGIN_NAME == "n" ]] || [[ $PASSWORD == "linux" ]] || [[ $EMAIL == "k@gmail.com" ]] || [[ $PIN == "12345" ]]
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account"
fi


if [ $FIRST_NAME = "tia" -a $LOGIN_NAME = "leo" -a $PASSWORD = "linux" -a $EMAIL = "tia@gmail.com" -a $PIN = "12345" ]
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account"
fi

if [ $FIRST_NAME = "tia" -o $LOGIN_NAME == "leo" -o $PASSWORD = "linux" -o $EMAIL = "tia@gmail.com" -o $PIN = "12345" ] 
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account"
fi


read -p "what is your first name? " First_name
read -p "what is your last name?" Last_name
read -p "what is your age? "  age
read -p "Do you have fever? (y or n): " fever
read -p "Do you have a cough? (y or n): " cough
read -p "Do you have any difficulty breathing? (y or n): " breathing
read -p "Have you been in contact with someone who has been tested positive with the Coronavirus? (y or n): " contact
read -p "Did you travel outside the United States for the past 2 weeks? (y or n): " travel
read -p "Is anyone in your house cough, fever, difficulty breathing or have been in contact with someone who has been tested positive for Coronavirus? (y or n): " house

if [ "$fever" = "n" ] && [ "$cough" = "n" ] && [ "$breathing" = "n" ] && [ "$contact" = "n" ] && [ "$travel" = "n" ] && [ "$house" = "n" ]
then
    echo "you have don't covid"
elif [ "$fever" = "y" ] || [ "$cough" = "y" ] || [ "$breathing" = "y" ] || [ "$contact" = "y" ] || [ "$travel" = "y"] || [ "$house" = "y" ]
then
    echo "you have covid"
else
    echo "you need to take your test"
fi
