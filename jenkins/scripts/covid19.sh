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
