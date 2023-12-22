AGE=20

if [[ $AGE == 20 ]]; then
    echo "You can drive"
fi




AGE=20

if [[ $AGE == 18 ]]; then
    echo "You can drive"
else
    echo "You can not drive"
fi


#!/bin/bash

AGE=20

if [[ $AGE -eq 18 ]]; then
    echo "This is the right age"
elif [[ $AGE -ge 18 ]]; then
    echo "You can drive"
elif [[ $AGE -lt 18 ]]; then
    echo "You cannot drive"
else
    echo "Hmmm"
fi


FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

if [[ "$FIRST_NAME" == "tia" ]]; then
    if [[ "$LAST_NAME" == "leo" ]]; then
        echo "This is $FIRST_NAME $LAST_NAME"
    fi
fi


FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

if [[ "$FIRST_NAME" == "tia" ]]; then
    if [[ "$LAST_NAME" == "leo" ]]; then
        echo "This is $FIRST_NAME $LAST_NAME"
        if [[ "$EMAIL" == "tia@gmail.com" ]]; then
            echo "This is $FIRST_NAME $LAST_NAME"
        fi
    fi
fi

FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

if [[ "$FIRST_NAME" == "tia" ]]; then
    if [[ "$LAST_NAME" == "leo" ]]; then
        if [[ "$EMAIL" == "tia@gmail.com" ]]; then
            if [[ "$LAST_4_DIGIT_SSN" == "1234" ]]; then
                if [[ "$PIN" == "12345" ]]; then
                    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
                elif [[ "$LAST_4_DIGIT_SSN" == "1234" ]]; then
                    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
                else
                    echo "Invalid user"
                fi
            fi
        fi
    fi
fi



FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"


if [[ "$FIRST_NAME" == "tia" ]] && [[ "$LAST_NAME" == "leo" ]] && [[ "$EMAIL" == "tia@gmail.com" ]] && [[ "$LAST_4_DIGIT_SSN" == "1234" ]] && [[ "$PIN" == "12345" ]]; then
    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
else 
    echo "Invalid user"
fi




#!/bin/bash

FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

# Additional validation for SSN and PIN length
if [ "$FIRST_NAME" == "tia" -a "$LAST_NAME" == "leo" -a "$EMAIL" == "tia@gmail.com" -a "${LAST_4_DIGIT_SSN}" == "1234" -a "${PIN}" == "12345" ]; then
    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
else
    echo "Invalid user"
fi




FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

if [[ "$FIRST_NAME" == "tia" ]] || [[ "$LAST_NAME" == "leo" ]] || [[ "$EMAIL" == "tia@gmail.com" ]] || [[ "$LAST_4_DIGIT_SSN" == "1234" ]] || [[ "$PIN" == "12345" ]]; then
    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
else 
    echo "Invalid user"
fi



#!/bin/bash

FIRST_NAME="tia"
LAST_NAME="leo"
EMAIL="tia@gmail.com"
LAST_4_DIGIT_SSN="1234"
PIN="12345"

# Additional validation for SSN and PIN length
if [ "$FIRST_NAME" == "tia" -o "$LAST_NAME" == "leo" -o "$EMAIL" == "tia@gmail.com" -o "${LAST_4_DIGIT_SSN}" == "1234" -o "${PIN}" == "12345" ]; then
    echo "This is $FIRST_NAME $LAST_NAME. Welcome to Bank of America"
else
    echo "Invalid user"
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