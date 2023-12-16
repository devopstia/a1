

# https://linuxize.com/post/how-to-compare-strings-in-bash/


#!/bin/bash
STRING1 != STRING2
the strings are not equal

INTEGER1 -eq INTEGER2
INTEGER1 is equal to INTEGER2

INTEGER1 -ge INTEGER2
INTEGER1 is greater than or equal to INTEGER2

INTEGER1 -gt INTEGER2
INTEGER1 is greater than INTEGER2

INTEGER1 -le INTEGER2
INTEGER1 is less than or equal to INTEGER2

INTEGER1 -lt INTEGER2
INTEGER1 is less than INTEGER2

INTEGER1 -ne INTEGER2
INTEGER1 is not equal to INTEGER2


VAR1="Linuxize"
VAR2="Linuxize"

if [ "$VAR1" = "$VAR2" ]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi


if [[ "$VAR1" == "$VAR2" ]]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi

age=12
if [ "$age" -ge 18 ]; then
  echo "You are an adult."
else
  echo "You are a minor."
fi

age="18"
if [ "$age" = "18" ]; then
  echo "You are an adult."
else
  echo "You are a minor."
fi

age="18"
if [[ "$age" == "18" ]]; then
  echo "You are an adult."
else
  echo "You are a minor."
fi


# Example 2: if-elif-else
grade=60

if [ "$grade" -ge 90 ]; then
  echo "Your grade is A."
elif [ "$grade" -ge 80 ]; then
  echo "Your grade is B."
elif [ "$grade" -ge 70 ]; then
  echo "Your grade is C."
else
  echo "Your grade is below C."
fi


