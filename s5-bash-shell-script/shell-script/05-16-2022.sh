##-----------Bash `AND` - `OR` Operators ---------

# The logical OR ||, -o and AND &&, -a operators allow you to use multiple conditions in the if statements.

read -p "What is your first name? " FIRST_NAME
read -p "What is your login name? " LOGIN_NAME
read -s -p "What is your password? " PASSWORD
read -p "What is your email? " EMAIL
read -s -p "What is your pin? " PIN


if [[ $FIRST_NAME == "tia" ]] && [[ $LOGIN_NAME == "leo" ]] && [[ $PASSWORD == "linux" ]] && [[ $EMAIL == "tia@gmail.com" ]] && [[ $PIN == "12345" ]] 
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
elif [[ $FIRST_NAME == "k" ]] && [[ $LOGIN_NAME == "n" ]] && [[ $PASSWORD == "linux" ]] && [[ $EMAIL == "k@gmail.com" ]] && [[ $PIN == "12345" ]]
then
    echo "Hello $FIRST_NAME, Welcome to bank of America. We are able to find your account"
else
    echo "We were not able to find your account"
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


SERVER_NAME3=`uname -a | awk -F" " '{print$2}' | awk -F"-" '{print$3}'`
SERVER_NAME1_2=`uname -a | awk -F" " '{print$2}' | awk -F"-" '{print$4}'`

if [ $SERVER_NAME3 = "SERVER03" ] 
then 
    echo "Welcome to server03"
elif [ $SERVER_NAME1_2 = "SERVER01" ] 
then 
    echo "Welcome to server01"
elif [ $SERVER_NAME1_2 = "SERVER02" ] 
then 
    echo "Welcome to server02"
else
    echo "Huummmmmmmmm"
fi


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

  case  $variable-name  in
                pattern1)       
     		    command1
                    ...
                    ....
                    commandN
                    ;;
                pattern2)
     		    command1
                    ...
                    ....
                    commandN
                    ;;            
                patternN)       
     		    command1
                    ...
                    ....
                    commandN
                    ;;
                *)              
          esac 


case  $variable-name  in
                pattern1|pattern2|pattern3)       
     		    command1
                    ...
                    ....
                    commandN
                    ;;
                pattern4|pattern5|pattern6)
     		    command1
                    ...
                    ....
                    commandN
                    ;;            
                pattern7|pattern8|patternN)       
     		    command1
                    ...
                    ....
                    commandN
                    ;;
                *)              
          esac 


echo "Enter the name of a country: "
read COUNTRY

# echo -p "Enter the name of a country: " COUNTRY

 
echo "The official language of $COUNTRY is "
 
case $COUNTRY in
 
  Lithuania)
    echo "Lithuanian"
    ;;
 
  Romania | Moldova)
    echo "Romanian"
    ;;

  USA | US | us | usa | "United States" | "united states" | "United States of America")
    echo "English and spanish"
    ;;

  Cameroon | cameroon |camer |kamer | CAMEROON)
    echo "English and French"
    ;;
 
  Italy | "San Marino" | Switzerland | "Vatican City")
    echo "Italian"
    ;;
 
  *)
    echo "unknown"
    ;;
esac



echo "Enter the name of a country: "
read COUNTRY

if [ $COUNTRY = "USA" ] || [ $COUNTRY = "US" ] || [ $COUNTRY = "us" ] || [ $COUNTRY = "usa" ] || [ $COUNTRY = "United States" ] || [ $COUNTRY = "united states" ] || [ $COUNTRY = "United States of America" ] 
then
    echo "English and spanish"
else
    echo "unknown"
fi
